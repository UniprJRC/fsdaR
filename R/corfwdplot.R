######
##  VT::05.12.2018
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#' Monitoring the correlations between consecutive distances or residuals
#'
#' @description Provides a method for obtaining the maximum empirical efficiency
#'  (in case of MM estimates) or maximum empirical breakdownplot (in case of S estimates) or
#'  maximum subset size (in case of forward search),
#'  using various measures of correlation between the \code{n} Mahalanobis distances or residuals at
#'  adjacent values of efficiecy, breakdown point or subset size.
#'
#' @param out An object of S3 class returned by one of the estimation functions with the
#'  monitoring option selected (\code{monitoring=TRUE}):
#'  \code{\link{fsreda.object}}, \code{\link{sregeda.object}}, \code{\link{mmregeda.object}},
#'  \code{\link{fsmeda.object}}, \code{\link{smulteda.object}} or \code{\link{mmmulteda.object}}.
#'  This is a list containing the monitoring of minimum Mahalanobis distance in case of
#'  multivariate analysis or the monitoring of residuals in case of regression.
#'
#'  The needed elements of \code{out} are
#'    \enumerate{
#'        \item \code{MAL}: matrix containing the squared Mahalanobis distances monitored in each
#'          step of the forward search. Every row is associated with a unit (row of data matrix Y).
#'          This matrix can be created using one of the functions \code{\link{fsmult}},
#'          \code{\link{smult}} or \code{\link{mmmult}} with the monitoring option selected, i.e. \code{monitoring=TRUE}.
#'        \item \code{RES}: matrix containing the residuals monitored in each
#'          step of the forward search. Every row is associated with a unit (row of data matrix Y).
#'          This matrix can be created using the function \code{\link{fsreg}}  with
#'          the monitoring option selected, i.e. \code{monitoring=TRUE} .
#'        \item \code{bdp}: a vector containing breakdown point values that have been used, in case of S estimates.
#'        \item \code{eff}: a vector containing efficiency values that have been used, in case of MM estimates.
#'   }
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.


#' @return  A \code{ggplot} plot object which can be printed on screen or to a file.

#' @examples
#'  \dontrun{
#'
#'  data(hbk, package="robustbase")
#'  (out <- fsmult(hbk[,1:3], monitoring=TRUE))
#'  corfwdplot(out)
#'
#'  (out1 <- smult(hbk, monitoring=TRUE, trace=TRUE))
#'  corfwdplot(out1)
#'
#'  (out2 <- mmmult(hbk[,1:3], monitoring=TRUE, trace=TRUE))
#'  corfwdplot(out2)
#'
#'  (out3 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="FS"))
#'  corfwdplot(out3)
#'
#'  (out4 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="S"))
#'  corfwdplot(out4)
#'
#'  (out5 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="MM"))
#'  corfwdplot(out5)
#'
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

corfwdplot <- function(out, trace=FALSE, ...)
{

## Change the color of the strips to a lighter one, otherwise
##  labels are not enough visible
theme_mybw <- function(base_size = 11, base_family = "sans")
{
    theme_bw(base_size = base_size, base_family = base_family) %+replace%
        theme(strip.background = element_rect(fill = "grey96", colour = "grey20"),
              complete = TRUE)
}


    ## Perform check on the structure of 'out'
    if(missing(out) | !(inherits(out, "fsmeda") | inherits(out, "smulteda") | inherits(out, "mmmulteda") |
                        inherits(out, "fsreda") | inherits(out, "sregeda") | inherits(out, "mmregeda")))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are MAL (for multivariate) or RES (for regression).
    residuals <- if(!is.null(out$MAL)) out$MAL else if(!is.null(out$RES)) out$RES else NULL
    if(is.null(residuals))
        stop("Necessary input variable (Mahalanobis distances or residuals) is missing!")

    y <- NULL
    n <- nrow(residuals)
    nsteps <- ncol(residuals)

    if(inherits(out, "smulteda") | inherits(out, "sregeda"))
        x <- out$bdp[1:(nsteps-1)]
    else if(inherits(out, "mmmulteda") | inherits(out, "mmregeda"))
        x <- out$eff[1:(nsteps-1)]
    else
        x <- (nrow(residuals) - ncol(residuals) + 1):(nrow(residuals) - 1)

    ##  default values for fg.thresh, bg.thresh, bg.style, labx and laby.
    if(is(out, "smulteda") | is(out, "sregeda"))
    {
        xlab <- "Breakdown point"
        x <- out$bdp[1:(nsteps-1)]
    } else if(is(out, "mmmulteda") | is(out, "mmregeda"))
    {
        xlab <- "Efficiency"
        x <- out$eff[1:(nsteps-1)]
    } else
    {
        xlab <- "Subset size m"
        x <- (nrow(residuals) - ncol(residuals) + 1):(nrow(residuals) - 1)
    }

    RHO = matrix(NA, nrow=nsteps-1, ncol=3)
    colnames(RHO) <- c("Spearman", "Kendall", "Pearson")

    for(i in 1:(nsteps-1))
    {
        RHO[i, 1] = cor(residuals[,i], residuals[, i+1], method="spearman")
        RHO[i, 2] = cor(residuals[,i], residuals[, i+1], method="kendall")
        RHO[i, 3] = cor(residuals[,i], residuals[, i+1], method="pearson")
    }

    minc <- min(RHO)
    maxc <- max(RHO)
    ylimits <- c(min(minc)*0.8, max(maxc)*1.1)

##  VT::09.01.2020 - avoid melt() and thus the dependence on 'rshape2'
##      repalce melt() by reshape() from 'stats'

##    rho <- melt(RHO)
##    rho[,1] <- rep(x,3)
##    colnames(rho) <- c("x", "z", "y")

##    RHO <- cbind.data.frame(x=x, RHO)
##    rho <- melt(RHO, id.vars="x", variable.name = "z", value.name="y")

    RHO <- cbind.data.frame(x=x, RHO)
    lvl <- c("Spearman", "Kendall", "Pearson")
    rho <- reshape(RHO, varying=lvl, v.names = "y", idvar="x", timevar = "z", times = lvl,
        new.row.names=1:(length(lvl) * nrow(RHO)), direction = "long")
    rho$z <- factor(rho$z, levels=lvl)

    p <- ggplot(data=rho, aes(x=x, y=y)) +
         geom_line() + facet_grid(z~., scales="free") +
         labs(x=xlab, y="Correlation") +
         theme_mybw(base_family="sans")

         if(is(out, "smulteda") | is(out, "sregeda")){
            p <- p + scale_x_reverse() + ylim(ylimits)
        }
    p
}
