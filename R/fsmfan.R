######
##  VT::3.12.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Computes confirmatory likelihood ratio of a suggested transformation
#'
#' @description Computes confirmatory likelihood ratio of a suggested transformation.
#'  Uses the multivariate version of the parametric family of power transformations.
#'
#' @param x Input data matrix of size \code{n x p} (n observations and p variables).
#'  Rows of \code{x} represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#'  @param la0 Transformation parameters, vector of length \code{ncol(x)} specifying a reasonable set
#'   of transformations for the columns of the multivariate data set.
#'
#' @param plot If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  If \code{plot=TRUE} a fan plot is shown.
#'
#' @param plotslrt MATLAB-style arguments -  appearance of the plot in terms of xlim, ylim, axes labels
#'    and their font size style, color of the lines, etc.
#'
#' @param msg  Controls whether to display or not messages on the screen If \code{msg==TRUE} (default)
#'  messages are displayed on the screen. If \code{msg=2}, detailed messages are displayed,
#'  for example the information at iteration level.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.
#'
#' @return  An S3 object of class \code{\link{fsmfan.object}}
#'
#' @references
#'      Atkinson, A.C., Riani, M. and Cerioli, A. (2004), '\emph{Exploring multivariate data with the forward search}, Springer Verlag, New York.
#'
#' @examples
#'  \dontrun{
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@chello.at}

fsmfan <- function(x, la0, plot=FALSE, plotslrt,
        xlim, ylim, lwd, lwd2, conflev, tag,
        msg=TRUE,
        trace=FALSE, ...)
{
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

    if(missing(la0))
        stop("Vector 'la0' is missing!")

    control <- list(...)

    if(missing(plotslrt))
        plotslrt <- list()
    if(!missing(xlim))
        plotslrt$xlim <- xlim
    if(!missing(ylim))
        plotslrt$ylim <- ylim
    if(!missing(lwd))
        plotslrt$LineWidth <- lwd
    if(!missing(lwd2))
        plotslrt$LineWidthEnv <- lwd2
    if(!missing(conflev))
        plotslrt$conflev <- conflev
    if(!missing(tag))
        plotslrt$Tag <- tag
    if(length(plotslrt) > 0)
        control$plotslrt <- plotslrt
    else if((is.logical(plot) || is.numeric(plot)) && length(plot) == 1)
        control$plotslrt <- ifelse(plot, 1, 0)
    else
        stop("The parameter 'plot' can be TRUE/FALSE or 1/0 only!")

    xmsg <- 0
    if(is.logical(msg))
        xmsg <- ifelse(msg, 1, 0)
    else  if(is.numeric(msg) && msg >= 0 && msg <= 2)
        xmsg <- msg
    else
        stop("Invalid parameter 'msg'. Should be TRUE/FALSE or 0, 1, 2.")
    control$msg <- xmsg

    outclass <- "fsmfan"

    ## ES 27.06.2018: parameters that are mandatory to the MATLAB function
    ## cannot be put into the MATLAB function because they have to be supplied
    ## to the function individually and not in (name, value) pairs

    parlist = c(.jarray(x, dispatch=TRUE), .jarray(la0, dispatch=TRUE))

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

    out <- callFsdaFunction("FSMfan", "[Ljava/lang/Object;", 1, parlist)
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

    LRT <- unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("LRT", as.integer(1)))))
    Exflag <- unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("Exflag", as.integer(1)))))
##    Un <- unwrapComplexCellArray(as.matrix(.jevalArray(arr$get("Un", as.integer(1)))))
    Un <- NULL

    ans <- list(call=match.call(), LRT=LRT, Exflag=Exflag, Un=Un)

    freeMatlabResources(out)
    class(ans) <- outclass
    return (ans)
}
