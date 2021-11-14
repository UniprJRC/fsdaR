######
##  VT::4.12.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#'  Simulate a time series with trend, time varying seasonal, level shift and irregular component
#'
#' @description Simulates a time series with trend (up to third order), seasonality
#'  (constant or of varying amplitude) with a different number of harmonics
#'  and a level shift. Moreover, it is possible to add to the series the effect
#'  of explanatory variables.
#'
#' @param n defines the length of the simulated time series
#'
#' @param plot If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  If \code{plot=TRUE} a fan plot is shown.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.
#'
#' @return  An S3 object of class \code{\link{ts.object}}
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

simulate_ts <- function(n, plot=FALSE,
        trace=FALSE, ...)
{
    control <- list(...)
    control$plots <- ifelse(plot, 1, 0)

    outclass <- "ts"

    ## ES 27.06.2018: parameters that are mandatory to the MATLAB function
    ## cannot be put into the MATLAB function because they have to be supplied
    ## to the function individually and not in (name, value) pairs

    parlist = c(.jnew("java/lang/Double", n))

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

    out <- callFsdaFunction("simulateTS", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB FSRfan().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    y <- as.vector(.jevalArray(arr$get("y", as.integer(1)), "[[D", simplify = TRUE))
    signal <- as.vector(.jevalArray(arr$get("signal", as.integer(1)), "[[D", simplify = TRUE))
    trend <- as.vector(.jevalArray(arr$get("trend", as.integer(1)), "[[D", simplify = TRUE))
    seasonal <- as.vector(.jevalArray(arr$get("seasonal", as.integer(1)), "[[D", simplify = TRUE))

    ans <- list(call=match.call(), y=y, signal=signal, trend=trend, seasonal=seasonal)

    freeMatlabResources(out)
    class(ans) <- outclass
    return (ans)
}
