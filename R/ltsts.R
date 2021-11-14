######
##  VT::2.12.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#'  Extends LTS estimator to time series
#'
#' @description It is possible to set a model with a trend (up to third order),
#'  a seasonality (constant or of varying amplitude and with a different number
#'  of harmonics) and a level shift (in this last case it is possible to specify
#'  the window in which level shift has to be searched for).
#'
#' @param y Time series to analyze. A vector with \code{T} elements that
#'  contains the time series.
#'
#' @param intercept wheather to use constant term (default is \code{intercept=TRUE}
#'
#' @param msg  Controls whether to display or not messages on the screen If \code{msg==TRUE} (default)
#'  messages are displayed on the screen.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.
#'
#' @return  An S3 object of class \code{\link{ltsts.object}}
#'
#' @references
#'      Rousseeuw, P.J., Perrotta D., Riani M. and Hubert, M. (2019). TRobust Monitoring of Many
#'      Time Series with Application to Fraud Detection,
#'      "Econometrics and Statistics", Vol. 9, pp. 108--121, <doi:10.1016/j.ecosta.2018.05.001>.
#'
#' @examples
#'  \dontrun{
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

ltsts <- function(y, intercept=TRUE, plot=FALSE, msg=TRUE,
        trace=FALSE, ...)
{
    if(is.data.frame(y))
      y <- data.matrix(y)
    else if(!is.matrix(y))
      y <- matrix(y, length(y), 1,
                  dimnames = list(names(y), deparse(substitute(y))))
    if(!is.numeric(y)) stop("y is not a numeric")

    n <- nrow(y)

    control <- list(...)
    control$intercept <- ifelse(intercept, 1, 0)
    control$plots <- ifelse(plot, 1, 0)

    xmsg <- 0
    if(is.logical(msg))
        xmsg <- ifelse(msg, 1, 0)
    else  if(is.numeric(msg) && msg >= 0 && msg <= 2)
        xmsg <- msg
    else
        stop("Invalid parameter 'msg'. Should be TRUE/FALSE or 0, 1, 2.")
    control$msg <- xmsg

    outclass <- "ltsts"

    ## ES 27.06.2018: parameters that are mandatory to the MATLAB function
    ## cannot be put into the MATLAB function because they have to be supplied
    ## to the function individually and not in (name, value) pairs

    parlist = c(.jarray(y, dispatch=TRUE))

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

    out <- callFsdaFunction("LTSts", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB tclustreg().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    ans <- list(call=match.call())

    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
