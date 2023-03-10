######
##  VT::13.06.20189
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#' Monitoring of the covariance matrix
#'
#' @description Plots the trajectories of the elements of the covariance (correlation) matrix monitored
#'
#' @param out An object of S3 class \code{\link{fsmeda.object}} returned by
#'  \code{\link{fsmult}} with \code{monitoring=TRUE} -
#'  a list containing the monitoring of minimum Mahalanobis distance.
#'
#'  The needed elements of \code{out} are
#'    \enumerate{
#'        \item \code{S2cov}: matrix containing the monitoring of the elements
#'          of the covariance matrix in each step of the forward search:
#'        \item \code{Un}: matrix containing the order of entry of each unit
#'                (necessary if datatooltip or databrush is selected).
#'        \item \code{X}: The data matrix.
#'      }
#'
#' @param ylim Controls the \code{y} scale in the plot. \code{ylim} is a vector with two elements controlling
#'      minimum and maximum on the \code{y}-axis. Default is to use automatic scale.
#'
#' @param xlim Controls the \code{x} scale in the plot. \code{xlim} is a vector with two elements controlling
#'      minimum and maximum on the \code{x}-axis. Default is to use automatic scale.
#'
#' @param xlab A title for the x axis
#' @param ylab A title for the y axis
#' @param main An overall title for the plot
#' @param lwd The line width, a positive number, defaulting to 1
#' @param lty The line type. Line types can either be specified as an integer (1=solid (default), 2=dashed,
#'    3=dotted, 4=dotdash, 5=longdash, 6=twodash) or as one of the character strings "solid",
#'    "dashed", "dotted", "dotdash", "longdash", or "twodash".
#'    The latter two are not supported by Matlab.
#' @param col Colors to be used for the highlighted units
#' @param cex.lab The magnification to be used for x and y labels relative to the current setting of cex
#' @param cex.axis The magnification to be used for axis annotation relative to the current setting of cex
#' @param subsize Numeric vector containing the subset size with length equal to the number of columns of
#'      matrix of mahalanobis distances. The default value of subsize is \code{(nrow(MAL) - ncol(MAL) + 1):nrow(MAL)}
#'
#' @param fg.thresh (alternative to fg.unit) numeric vector of length 1 or 2 which specifies
#'    the highlighted trajectories.
#'    If \code{length(fg.thresh) == 1} the highlighted trajectories are those of units that throughtout
#'    the search had at leat once a mahalanobis distance greater than \code{fg.thresh}.
#'    The default value is \code{fg.thresh=2.5}. If \code{length(fg.thresh) == 2} the highlighted
#'    trajectories are those of units that throughtout the search had a mahalanobis distance at
#'    least once bigger than \code{fg.thresh[2]} or smaller than \code{fg.thresh[1]}.
#'
#' @param fg.unit (alternative to fg.thresh), vector containing the list of the units to be highlighted.
#'    If \code{fg.unit} is supplied, \code{fg.thresh} is ignored.
#'
#' @param fg.labstep numeric vector which specifies the steps of the search where to put labels for
#'    the highlighted trajectories (units). The default is to put the labels at the
#'    initial and final steps of the search. \code{fg.labstep=''} means no label.
#'
#' @param fg.lwd The line width for the highlighted trajectories (units). Default is 1.
#' @param fg.lty The line type for the highlighted trajectories (units). Line types can
#'    either be specified as an integer (1=solid (default), 2=dashed,
#'    3=dotted, 4=dotdash, 5=longdash, 6=twodash) or as one of the character strings "solid",
#'    "dashed", "dotted", "dotdash", "longdash", or "twodash".
#'    The latter two are not supported by Matlab.
#' @param fg.col colors to be used for the highlighted units.
#'
#' @param fg.mark Controlls whether to plot highlighted trajectories as symbols.
#'    if \code{fg.mark==TRUE} each line is plotted using a different
#'    symbol else no marker is used (default).
#'
#' @param fg.cex Controls the font size of the labels of the trajectories in foreground. If
#'  \code{fg.cex=0} no labels will be shown - equivalent to \code{fg.labstop=""}.
#'
#' @param standard MATLAB-style arguments -  appearance of the plot in terms of xlim, ylim, axes labels
#'    and their font size style, color of the lines, etc.
#' @param fground MATLAB-style arguments - for the trajectories in foregroud.
#'
#' @param tag Plot handle. String which identifies the handle of the plot which is about to be created.
#'  The default is \code{tag='pl_mmd'}. Notice that if the program finds a plot which has
#'  a tag equal to the one specified by the user, then the output of the new plot overwrites
#'  the existing one in the same window else a new window is created.
#'
#' @param datatooltip If datatooltip is not empty the user can use the mouse in order to have
#'  information about the unit selected, the step in which the unit enters the search and
#'  the associated label. If datatooltip is a list, it is possible to control the aspect
#'  of the data cursor (see MATLAB function \code{datacursormode()} for more details or
#'  see the examples below). The default options are \code{DisplayStyle="Window"} and \code{SnapToDataVertex="on"}.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none

#' @examples
#'
#'  \dontrun{
#'  X <- iris[,1:4]
#'  out <- fsmult(X, monitoring=TRUE)
#'
#'  ##  Produce monitoring covariances plot with all the default options
#'  covplot(out)
#'
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


covplot <- function(out, xlim, ylim, xlab, ylab, main,
            lwd, lty, col, cex.lab, cex.axis, subsize,
            fg.thresh, fg.unit, fg.labstep, fg.lwd, fg.lty, fg.col, fg.mark, fg.cex,
            standard, fground,
            tag, datatooltip,
            trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) || (!inherits(out, "fsmeda") && !inherits(out, "smeda") && !inherits(out, "mmmeda")))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are Y=X, S2cov, and Un.
    ## The R class name is mapped to a Matlab class name
    outStr <- list(Un=out$Un, Loc=out$Loc, S2cov=out$S2cov, Y=out$X, class=getMatlabClass(class(out)))

    control = list(...)

    if(missing(standard))
        standard <- list()
    if(!missing(xlim))
        standard$xlim <- xlim
    if(!missing(ylim))
        standard$ylim <- ylim
    if(!missing(xlab))
        standard$labx <- xlab
    if(!missing(ylab))
        standard$laby <- ylab
    if(!missing(main))
        standard$titl <- main
    if(!missing(lwd))
        standard$LineWidth <- lwd
    if(!missing(lty))
        standard$LineStyle <- mapLineStyle(lty)
    if(!missing(col))
        standard$Color <- mapColor(col)
    if(!missing(cex.axis))
    {
        standard$SizeAxesNum <- 10  ## the default
        standard$SizeAxesNum <- cex.axis * standard$SizeAxesNum
    }
    if(!missing(cex.lab))
    {
        standard$SizeAxesLab <- 12  ## the default
        standard$SizeAxesLab <- cex.lab * standard$SizeAxesLab
    }
    if(!missing(subsize))
    {
        ## the default:
        ## standard$xvalues <- (dim(out$MAL)[1]-dim(out$MAL)[2]+1):dim(out$MAL)[1]
        standard$subsize <- subsize
    }

    if(length(standard) > 0)
        control$standard <- standard

    if(missing(fground))
        fground <- list()
    if(!missing(fg.thresh))
        fground$fthresh <- fg.thresh
    if(!missing(fg.unit))
        fground$funit <- fg.unit
    if(!missing(fg.labstep))
        fground$flabstep <- fg.labstep
    if(!missing(fg.lwd))
        fground$LineWidth <- fg.lwd
    if(!missing(fg.lty))
        fground$LineStyle <- mapLineStyle(fg.lty)
    if(!missing(fg.col))
        fground$Color <- mapColor(fg.col)
    if(!missing(fg.mark))
        fground$fmark <- ifelse(fg.mark, 1, 0)
    if(!missing(fg.cex))
    {
        ## MATLAB will not allow fontsize equal to 0 - therefore,
        ##  put some small number
        if(fg.cex == 0)
            fg.cex <- 0.001
        fground$FontSize <- 12  ## the default
        fground$FontSize <- fg.cex * fground$FontSize
    }

    if(length(fground) > 0)
        control$fground <- fground

    if(!missing(datatooltip))
    {
        if(is.logical(datatooltip))
        {
            control$datatooltip <- ifelse(datatooltip, 1, "")
        }else if(is.list(datatooltip))
            control$datatooltip <- datatooltip
        else
            stop(paste("Wrong argument 'datatooltip':", datatooltip))
    } else
        control$datatooltip <- ""

    if(!missing(tag))
        control$tag <- as.character(tag)

    if(trace)
    {
        cat("\nOptional parameters to covplot(): \n")
        print(control)
    }

    parlist <- list(list2MatlabStruct(outStr))
    paramNames = names(control)

    if (length(paramNames) > 0) {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i];
            paramValue = control[[i]];
            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    matlabParams <- parlist
    matlabResult <- callFsdaFunctionNoArgout("covplot", "[Ljava/lang/Object;", matlabParams)
    ans = list()
    freeMatlabResources(matlabResult)

    return(invisible(ans))
}
