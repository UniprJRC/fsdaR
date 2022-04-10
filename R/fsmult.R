######
##  VT::18.08.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Gives an automatic outlier detection procedure in multivariate analysis
#'
#' @description Gives an automatic outlier detection procedure in multivariate analysis and
#'  performs forward search in multivariate analysis with exploratory data
#   analysis purposes (if \code{monitoring=TRUE}).
#'
#' @param x An n x p data matrix (n observations and p variables).
#'  Rows of x represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param bsb List of units forming the initial subset or size of the initial subset.
#'  If \code{monitoring=FALSE} the default is to start the search with \code{p+1}
#'  units, containing those observations
#'  which are not outlying on any scatterplot, found as the intersection of all points lying
#'  within a robust contour containing a specified portion of the data (Riani and Zani 1997)
#'  and inside the univariate boxplot.
#'
#'  Remark: if bsb is a vector, the option crit is ignored.
#'
#' @param monitoring Wheather to perform monitoring of Mahalanobis distances and other specific quantities
#'
#' @param crit If specified, the criterion to be used to initialize the search.
#'  \itemize{
#'  \item If \code{crit="md"} the units which form initial subset are those which have the
#'  smallest \code{m0} pseudo Mahalanobis distances computed using procedure \code{unibiv()} (bivariate robust ellipses).
#'  \item If \code{crit="biv"} sorting is done first in terms of times units fell outside robust bivariate ellipses
#'  and then in terms of pseudoMD. In other words, the units forming initial subset are chosen first
#'  among the set of those which never fell outside robust bivariate ellipses then among those which
#'  fell only once outside bivariate ellipses ... up to reach \code{m0}.
#'  \item If \code{crit="uni"} sorting is done first in terms of times units fell outside univariate boxplots and
#'  then in terms of pseudoMD. In other words, the units forming initial subset are chosen first among
#'  the set of those which never fell outside univariate boxplots then among those which fell only
#'  once outside univariate boxplots... up to reach \code{m0}.
#'    }
#'
#'  Remark: as the user can see the starting point of the search is not going to affect at all the results
#'  of the analysis. The user can explore this point with his own datasets.
#'
#'  Remark: if \code{crit="biv"} the user can also supply in scalar rf (see below) the confidence level of
#'  the bivariate ellipses.
#' @param rf Confidence level for bivariate ellipses. The default is 0.95. This option is useful only if \code{crit='biv'}.

#' @param init Point where to start monitoring required diagnostics. Note that if a vector \code{m0} is
#'  supplied, \code{init >= length(m0)}. If \code{init} is not specified it will be set equal to \code{floor(n*0.6)}.

#' @param plot Plots the minimum Mahalanobis distance. If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  If \code{plot=TRUE} the plot of minimum MD with envelopes based on n observations and the
#'  scatterplot matrix with the outliers highlighted is produced.
#'  If \code{plot=2} the additional plots of envelope resuperimposition are produced.
#'  If plot is a list it may contain the following fields:
#'    \itemize{
#'    \item ylim vector with two elements controlling minimum and maximum on the y axis.
#'      Default value is '' (automatic scale)
#'    \item xlim vector with two elements controlling minimum and maximum on the x axis.
#'      Default value is '' (automatic scale)
#'     \item resuper vector which specifies for which steps it is necessary to show the plots
#'          of resuperimposed envelopes if resuper is not supplied a plot of each step in which
#'          the envelope is resuperimposed is shown. Example: if \code{resuper = c(85 87)}
#'          plots of resuperimposedenvelopes are shown at steps \code{m=85} and \code{m=87}
#'      \item ncoord If \code{ncoord=1} plots are shown in normal coordinates else (default)
#'          plots are shown in traditional mmd coordinates
#'      \item labeladd If \code{labeladd=1}, the outliers in the spm are labelled with the unit
#'          row index. The default value is \code{labeladd=""}, i.e. no label is added
#'      \item nameY character vector containing the labels of the variables. As default value,
#'          the labels which are added are Y1, ...Yp.
#'      \item lwd controls line width of the curve which contains the monitoring of minimum
#'          Mahalanobis distance. Default is \code{lwd=2}.
#'      \item lwdenv Controls linewidth of the envelopes. Default is \code{lwdenv=2}.
#'      }

#' @param bonflev Option that might be used to identify extreme outliers when the distribution of
#'  the data is strongly non normal. In these circumstances, the general signal detection rule
#'  based on consecutive exceedances cannot be used. In this case \code{bonflev} can be:
#'
#'    \enumerate{
#'    \item a scalar smaller than 1, which specifies the confidence level for a signal and a stopping rule
#'            based on the comparison of the minimum deletion residual with a Bonferroni bound.
#'            For example if \code{bonflev=0.99} the procedure stops when the trajectory exceeds
#'            for the first time the 99 per cent bonferroni bound.
#'     \item a scalar value greater than 1. In this case the procedure stops when the
#'          residual trajectory exceeds for the first time this value.
#'    }
#'    Default value is empty, which means to rely on general rules based on consecutive exceedances.

#' @param msg It controls whether to display or not messages on the screen. If \code{msg=TRUE}
#'      (default) messages about the progression of the search are displayed on the screen
#'      otherwise only error messages will be displayed.

#' @param nocheck It controls whether to perform checks on matrix Y. If \code{nocheck=TRUE}, no check is performed.

#' @param scaled Controls whether to monitor scaled Mahalanobis distances (only if \code{monitoring=TRUE}). If \code{scaled=TRUE}
#'  Mahalanobis distances monitored during the search are scaled using ratio of determinant.
#'  If \code{scaled=2} Mahalanobis distances monitored during the search are scaled using
#'  asymptotic consistency factor. The default is \code{scaled=FALSE}, that is Mahalanobis distances are not scaled.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.


#' @return  Depending on the input parameter \code{monitoring}, one of
#'    the following objects will be returned:
#'
#'    \enumerate{
#'    \item \code{\link{fsmult.object}}
#'    \item \code{\link{fsmeda.object}}
#'    }

#' @references
#'       Riani, M., Atkinson A.C., Cerioli A. (2009). Finding an unknown
#'       number of multivariate outliers. Journal of the Royal Statistical
#'       Society Series B, Vol. 71, pp. 201-221.
#'
#'       Cerioli A., Farcomeni A., Riani M., (2014). Strong consistency and robustness
#'       of the Forward Search estimator of multivariate location and scatter,
#'       Journal of Multivariate Analysis, Vol. 126, pp. 167-183,
#'       http://dx.doi.org/10.1016/j.jmva.2013.12.010.
#'
#'       Atkinson Riani and Cerioli (2004), \emph{Exploring multivariate data with the
#'       forward search} Springer Verlag, New York.
#'
#' @examples
#'  \dontrun{
#'
#'  data(hbk, package="robustbase")
#'  (out <- fsmult(hbk[,1:3]))
#'  class(out)
#'  summary(out)
#'
#'  ##  Generate contaminated data (200,3)
#'  n <- 200
#'  p <- 3
#'  set.seed(123456)
#'  X <- matrix(rnorm(n*p), nrow=n)
#'  Xcont <- X
#'  Xcont[1:5, ] <- Xcont[1:5,] + 3
#'
#'  out1 <- fsmult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
#'  names(out1)
#'
#'  (out1 <- fsmult(Xcont, trace=TRUE, plot=TRUE))    # identical to plot=1
#'
#'  ## plot=1 - minimum MD with envelopes based on n observations
#'  ##  and the scatterplot matrix with the outliers highlighted
#'  (out1 <- fsmult(Xcont, trace=TRUE, plot=1))
#'
#'  ## plot=2 - additional plots of envelope resuperimposition
#'  (out1 <- fsmult(Xcont, trace=TRUE, plot=2))
#'
#'  ## plots is a list: plots showing envelope superimposition in normal coordinates.
#'  (out1 <- fsmult(Xcont, trace=TRUE, plot=list(ncoord=1)))
#'
#'  ##  Choosing an initial subset formed by the three observations with
#'  ##  the smallest Mahalanobis Distance.
#'
#'  (out1 <- fsmult(Xcont, m0=5, crit="md", trace=TRUE))
#'
#'  ## fsmult() with monitoring
#'  (out2 <- fsmult(Xcont, monitoring=TRUE, trace=TRUE))
#'  names(out2)
#'
#'  ## Monitor the exceedances from m=200 without showing plots.
#'  n <- 1000
#'  p <- 10
#'  Y <- matrix(rnorm(10000), ncol=10)
#'  (out <- fsmult(Y, init=200))
#'
#'  ##  Forgery Swiss banknotes examples.
#'
#'  data(swissbanknotes)
#'
#'  ## Monitor the exceedances of Minimum Mahalanobis Distance
#'  (out1 <- fsmult(swissbanknotes[101:200,], plot=1))
#'
#'  ##  Control minimum and maximum on the x axis
#'  (out1 <- fsmult(swissbanknotes[101:200,], plot=list(xlim=c(60,90))))
#'
#'  ##  Monitor the exceedances of Minimum Mahalanobis Distance using
#'  ##  normal coordinates for mmd.
#'  (out1 <- fsmult(swissbanknotes[101:200,], plot=list(ncoord=1)))
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

fsmult <- function(x, bsb, monitoring = FALSE, crit=c("md", "biv","uni"), rf=0.95, init, plot=FALSE, bonflev,
        msg=TRUE, nocheck=FALSE, scaled=FALSE,
        trace=FALSE, ...)
{

	if(is.data.frame(x))
	    x <- data.matrix(x)
	else if(!is.matrix(x))
	    x <- matrix(x, length(x), 1,
			dimnames = list(names(x), deparse(substitute(x))))
    if(!is.numeric(x)) stop("x is not a numeric")
    storage.mode(x) <- "double"

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


    ## We do not need a 'control' argument for now
    ##  if(missing(control))
    ##      control <- list(...)
    control <- list(...)

    if(is.logical(plot))
        xplots <- ifelse(plot, 1, 0)
    else  if(is.numeric(plot) && plot >= 0 && plot <= 2)
        xplots <- plot
    else  if(is.list(plot))
    {
        cx <- c("xlim", "ylim", "resuper", "ncoord", "labeladd", "nameY", "lwd", "lwdenv")
        if(all(names(plot) %in% cx))
            xplots <- plot
        else
            stop("Invalid parameter 'plot'. If it is a list, it should contain one or more of the following: ",  paste0(cx, collapse=","))
    }else
        stop("Invalid parameter 'plot'. Should be TRUE/FALSE or 0, 1, 2 or a list with graphical parameters")

    control$plots <- xplots

    ## If monitoring, bsb is mandatory (in FSMeda()) and bsb=0 if bsb is missing
    bsb <- if(!missing(bsb)) bsb else if(monitoring) 0 else p+1
    if(monitoring)
    {
        control$scaled <- as.numeric(scaled)
    }
    else
    {
        control$crit <- match.arg(crit)
        control$rf <- rf
    }

    if(!missing(init))
        control$init <- init
    if(!missing(bonflev))
        control$bonflev <- bonflev
    control$msg <- ifelse(msg, 1, 0)
    control$nocheck <- ifelse(nocheck, 1, 0)

    outclass <- if(monitoring) "fsmeda" else "fsm"


    ## Check if the control corresponds to the parameter supplied: monitoring, family and method:
##    defc <- .defaultControl(monitoring=monitoring, family=family, method=method)
##    if(class(defc) != class(control))
##        stop(paste0("Wrong control object provided: '", class(control), "'. Must be ", class(defc), "."))

    if(trace)
    {
        cat("\nOptional parameters to FSM(): \n")
        print(control)
    }

    # Add monitoring parameters
    if(!monitoring) {
        parlist = c(.jarray(x, dispatch=TRUE))
    } else {
        parlist = c(.jarray(x, dispatch=TRUE), .jarray(bsb, dispatch=TRUE))
    }

    paramNames = names(control)
    if(length(paramNames) > 0)
    {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i]
            paramValue = control[[i]]

            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    if(!monitoring)
    {
        out <- callFsdaFunction("FSM", "[Ljava/lang/Object;", 1, parlist)
        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)
        if(trace)
        {
            cat("\nReturning from FSM().  Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        outliers = as.vector(as.matrix(.jevalArray(arr$get("outliers", as.integer(1)), "[[D", simplify = TRUE)))
        loc = as.vector(as.matrix(.jevalArray(arr$get("loc", as.integer(1)), "[[D", simplify = TRUE)))
        cov = as.matrix(.jevalArray(arr$get("cov", as.integer(1)), "[[D", simplify = TRUE))
        md = as.vector(as.matrix(.jevalArray(arr$get("md", as.integer(1)), "[[D", simplify = TRUE)))

        if(length(loc) == 0)
            stop("Matrix is singular!")

        if(as.integer(arr$hasField("weights", as.integer(1))) == 1) {
            weights = as.matrix(.jevalArray(arr$get("weights", as.integer(1)), "[[D", simplify = TRUE))
        }else
        {
                ## if weights are not returned (e.g. in FSM, use 'outliers' to generate 0-1 weights
                weights <- rep(1, n)
                weights[outliers] <- 0
        }
        weights = as.vector(weights)

        names(md) <- names(weights) <- rownames(x)
        ans = list(call=match.call(), outliers=outliers, loc=loc, cov=cov, md=md, X=x)

        mmd = as.matrix(.jevalArray(arr$get("mmd", as.integer(1)), "[[D", simplify = TRUE))
        Un = as.matrix(.jevalArray(arr$get("Un", as.integer(1)), "[[D", simplify = TRUE))
        nout = as.matrix(.jevalArray(arr$get("nout", as.integer(1)), "[[D", simplify = TRUE))

        ans$mmd <- mmd
        ans$Un <- Un
        ans$nout <- nout

    } else
    {
        out <- callFsdaFunction("FSMeda", "[Ljava/lang/Object;", 1, parlist)
        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

        if(trace)
        {
            cat("\nReturning from FSMeda().  Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        MAL = as.matrix(.jevalArray(arr$get("MAL", as.integer(1)), "[[D", simplify = TRUE))
        Loc = as.matrix(.jevalArray(arr$get("Loc", as.integer(1)), "[[D", simplify = TRUE))

        Un = as.matrix(.jevalArray(arr$get("Un", as.integer(1)), "[[D", simplify = TRUE))
        BB = as.matrix(.jevalArray(arr$get("BB", as.integer(1)), "[[D", simplify = TRUE))
        mmd = as.matrix(.jevalArray(arr$get("mmd", as.integer(1)), "[[D", simplify = TRUE))
        msr = as.matrix(.jevalArray(arr$get("msr", as.integer(1)), "[[D", simplify = TRUE))
        gap = as.matrix(.jevalArray(arr$get("gap", as.integer(1)), "[[D", simplify = TRUE))
        S2cov = as.matrix(.jevalArray(arr$get("S2cov", as.integer(1)), "[[D", simplify = TRUE))
        detS = as.matrix(.jevalArray(arr$get("detS", as.integer(1)), "[[D", simplify = TRUE))

        ans = list(call=match.call(), MAL=MAL, X=x, BB=BB, mmd=mmd, msr=msr, Un=Un, gap=gap,
                Loc=Loc, S2cov=S2cov, detS=detS)
    }
    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
