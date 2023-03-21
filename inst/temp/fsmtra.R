######
##  VT::3.12.2019
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#' Computes MLE of transformation parameters
#'
#' @description Computes MLE of transformation parameters. It uses the multivariate
#'  version of the parametric family of power transformations.
#'
#' @param x Input data matrix of size \code{n x p} (n observations and p variables).
#'  Rows of \code{x} represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param plot If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  If \code{plot=TRUE} a fan plot is shown.
#'
#' @param plotslrt MATLAB-style arguments -  appearance of the plot of the likelihood
#'  ratio tests in terms of xlim, ylim, axes labels and their font size style, color of the lines, etc.
#'
#' @param plotsmle MATLAB-style arguments -  appearance of the plot of  maximum
#'  likelihood estimates of the transformation parameters in terms of xlim, ylim, axes labels
#'  and their font size style, color of the lines, etc.
#'
#' @param msg  Controls whether to display or not messages on the screen If \code{msg==TRUE} (default)
#'  messages are displayed on the screen. If \code{msg=2}, detailed messages are displayed,
#'  for example the information at iteration level.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.
#'
#' @return  An S3 object of class \code{\link{fsmtra.object}}
#'
#' @references
#'      Atkinson, A.C., Riani, M. and Cerioli, A. (2004), '\emph{Exploring multivariate data with the forward search}, Springer Verlag, New York.
#'
#' @examples
#'  \dontrun{
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@chello.at}

fsmtra <- function(x, plot=c("none", "LRT", "MLE", "ALL"), plotslrt, plotsmle,
        plotslrt.xlim, plotslrt.ylim, plotslrt.lwd, plotslrt.lwd2, plotslrt.conflev, plotslrt.tag,
        plotsmle.xlim, plotsmle.ylim, plotsmle.lwd, plotsmle.lwd2, plotsmle.lty, plotsmle.cex, plotsmle.tag,
        msg=TRUE,
        trace=FALSE, ...)
{
    plot <- match.arg(plot)

    if(is.data.frame(x))
      x <- data.matrix(x)
    else if(!is.matrix(x))
      x <- matrix(x, length(x), 1,
                  dimnames = list(names(x), deparse(substitute(x))))
    if(!is.numeric(x)) stop("x is not a numeric")

    dx <- dim(x)
    xn <- (dnx <- dimnames(x))[[2]]
    xn <- if (!is.null(xn))
        xn
    else if (dx[2] > 1)
        paste("X", 1:dx[2], sep = "")
    else if(dx[2])
        "X"
    dimnames(x) <- list(dnx[[1]], xn)

    n <- nrow(x)
    p <- ncol(x)

    control <- list(...)

    if(missing(plotslrt))
        plotslrt <- list()
    if(!missing(plotslrt.xlim))
        plotslrt$xlim <- plotslrt.xlim
    if(!missing(plotslrt.ylim))
        plotslrt$ylim <- plotslrt.ylim
    if(!missing(plotslrt.lwd))
        plotslrt$LineWidth <- plotslrt.lwd
    if(!missing(plotslrt.lwd2))
        plotslrt$LineWidthEnv <- plotslrt.lwd2
    if(!missing(plotslrt.conflev))
        plotslrt$conflev <- plotslrt.conflev
    if(!missing(plotslrt.tag))
        plotslrt$Tag <- plotslrt.tag
    if(length(plotslrt) > 0)
        control$plotslrt <- plotslrt
    else if(plot == "LRT" || plot == "ALL")
        control$plotslrt <- 1

    if(missing(plotsmle))
        plotsmle <- list()
    if(!missing(plotsmle.xlim))
        plotsmle$xlim <- plotsmle.xlim
    if(!missing(plotsmle.ylim))
        plotsmle$ylim <- plotsmle.ylim
    if(!missing(plotsmle.lwd))
        plotsmle$LineWidth <- plotsmle.lwd
    if(!missing(plotsmle.lwd2))
        plotsmle$LineWidthEnv <- plotsmle.lwd2
    if(!missing(plotsmle.lty))
        plotsmle$LineStyle <- plotsmle.lty
    if(!missing(plotsmle.tag))
        plotsmle$Tag <- plotsmle.tag
    if(!missing(plotsmle.cex))
    {
        plotsmle$FontSize <- 12  ## the default
        plotsmle$FontSize <- plotsmle.cex * plotsmle$FontSize
    }
    if(length(plotsmle) > 0)
        control$plotsmle <- plotsmle
    else if(plot == "MLE" || plot == "ALL")
        control$plotsmle <- 1


    xmsg <- 0
    if(is.logical(msg))
        xmsg <- ifelse(msg, 1, 0)
    else  if(is.numeric(msg) && msg >= 0 && msg <= 2)
        xmsg <- msg
    else
        stop("Invalid parameter 'msg'. Should be TRUE/FALSE or 0, 1, 2.")
    control$msg <- xmsg

    outclass <- "fsmtra"

    ## ES 27.06.2018: parameters that are mandatory to the MATLAB function
    ## cannot be put into the MATLAB function because they have to be supplied
    ## to the function individually and not in (name, value) pairs

    parlist = c(.jarray(x, dispatch=TRUE))

    paramNames = names(control)
    if(trace)
        print(control)

    if(length(paramNames) > 0)
    {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i]
            paramValue = control[[i]]

            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    out <- callFsdaFunction("FSMtra", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    ## The 'arr' variable is a MATLAB struct containing all the info returned
    ## by the resfwdplot() MATLAB function. Now 'arr' must be converted into an R list
    ## ('ans') containing all the return info from the resfwdplot() R function

    if(trace)
    {
        cat("\nReturning from MATLAB FSMfan().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    MLEtra <- as.matrix(.jevalArray(arr$get("MLEtra", as.integer(1))))
    LIKrat <- as.matrix(.jevalArray(arr$get("LIKrat", as.integer(1))))
    Exflag <- as.matrix(.jevalArray(arr$get("Exflag", as.integer(1))))
    Un <- as.matrix(.jevalArray(arr$get("Un", as.integer(1))))

    ans <- list(call=match.call(), MLEtra=MLEtra, LIKrat=LIKrat, Exflag=Exflag, Un=Un)

    freeMatlabResources(out)
    class(ans) <- outclass
    return (ans)
}
