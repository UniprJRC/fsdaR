######
##  VT::18.08.2018
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#' Computes  S estimators in multivariate analysis
#'
#' @description Computes  S estimators in multivariate analysis
#' @details This function follows the lines of MATLAB/R code developed during the years by many authors.
#'  For more details see http://www.econ.kuleuven.be/public/NDBAE06/programs/ and
#'  the R package \link[rrcov]{CovSest}
#'  The core of these routines, e.g. the resampling approach, however, has been
#'  completely redesigned, with considerable increase of the computational performance.
#'
#' @param x An n x p data matrix (n observations and p variables).
#'  Rows of x represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param monitoring Wheather to perform monitoring of Mahalanobis distances and other specific quantities
#'
#' @param bdp Measures the fraction of outliers the algorithm should resist.
#'  In this case any value greater than 0 but smaller or equal than 0.5 will do fine (default is \code{bdp=0.5}).
#'  Note that given bdp nominal efficiency is automatically determined.
#'
#' @param nsamp Number of subsamples which will be extracted to find the robust estimator.
#'  If \code{nsamp=0} all subsets will be extracted. They will be
#'    \code{(n choose p)}. If the number of all possible subset is \code{<1000}
#'    the default is to extract all subsets otherwise just 1000.

#' @param plot Plots the Mahalanobis distances against index number. If \code{plot=FALSE}
#'  (default) or \code{plot=0}  no plot is produced. The confidence
#'  level used to draw the confidence bands for the MD is given by the input option conflev.
#'  If conflev is not specified a nominal 0.975 confidence interval will be used.
#'  If \code{plot=2}  a scatter plot matrix with the outliers highlighted is produced.
#'  If plot is a list it may contain the following fields:
#'    \itemize{
#'      \item labeladd If \code{labeladd=1}, the outliers in the spm are labelled with the unit
#'          row index. The default value is \code{labeladd=""}, i.e. no label is added
#'      \item nameY character vector containing the labels of the variables. As default value,
#'          the labels which are added are Y1, ...Yp.
#'      }
#'
#' @param conflev Confidence level which is used to declare units as outliers (scalar).
#'  Usually \code{conflev=0.95}, \code{conflev=0.975} or \code{conflev=0.99} (individual alpha)
#'  \code{conflev=1-0.05/n}, \code{conflev=1-0.025/n} or \code{conflev=1-0.01/n} (simultaneous alpha).
#'  Default value is \code{convlev=0.975}.
#'
#' @param nocheck It controls whether to perform checks on matrix Y. If \code{nocheck=TRUE}, no check is performed.

#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.


#' @return  Depending on the input parameter \code{monitoring}, one of
#'    the following objects will be returned:
#'
#'    \enumerate{
#'    \item \code{\link{smult.object}}
#'    \item \code{\link{smulteda.object}}
#'    }

#' @references
#'       Maronna, R.A., Martin D. and Yohai V.J. (2006), Robust Statistics, Theory and Methods, Wiley, New York.
#'

#' @examples
#'
#'  \dontrun{
#'  data(hbk, package="robustbase")
#'  (out <- smult(hbk[,1:3]))
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
#'  out1 <- smult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
#'  names(out1)
#'
#'  ## plot=TRUE - generates: (1) a plot of Mahalanobis distances against
#'  ##    index number. The confidence level used to draw the confidence bands for
#'  ##    the MD is given by the input option conflev. If conflev is
#'  ##    not specified a nominal 0.975 confidence interval will be used and
#'  ##    (2) a scatter plot matrix with the outliers highlighted.
#'
#'  (out1 <- smult(Xcont, trace=TRUE, plot=TRUE))
#'
#'  ## plots is a list: the spm shows the labels of the outliers.
#'  (out1 <- smult(Xcont, trace=TRUE, plot=list(labeladd="1")))
#'
#'  ## plots is a list: the spm uses the variable names provided by 'nameY'.
#'  (out1 <- smult(Xcont, trace=TRUE, plot=list(nameY=c("A", "B", "C"))))
#'
#'  ## smult() with monitoring
#'  (out2 <- smult(Xcont, monitoring=TRUE, trace=TRUE))
#'  names(out2)
#'
#'  ##  Forgery Swiss banknotes examples.
#'
#'  data(swissbanknotes)
#'
#'  (out1 <- smult(swissbanknotes[101:200,], plot=TRUE))
#'
#'  (out1 <- smult(swissbanknotes[101:200,], plot=list(labeladd="1")))
#'  }

#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

smult <- function(x, monitoring = FALSE, plot=FALSE, bdp, nsamp,
            conflev=0.975, nocheck=FALSE,
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
        cx <- c("labeladd", "nameY")
        if(all(names(plot) %in% cx))
            xplots <- plot
        else
            stop("Invalid parameter 'plot'. If it is a list, it should contain one or more of the following: ",  paste0(cx, collapse=","))
    }else
        stop("Invalid parameter 'plot'. Should be TRUE/FALSE or 0, 1, 2 or a list with graphical parameters")

    control$plots <- xplots

    if(!missing(bdp))
        control$bdp <- bdp
    if(!missing(nsamp))
        control$nsamp <- nsamp

    control$nocheck <- ifelse(nocheck, 1, 0)
    if(length(conflev) != 1)
        stop("Argument 'conflev' must be a scalar!")
    control$conflev <- conflev

    outclass <- if(monitoring) "smulteda" else "smult"
    ##  control$outclass
    ##  control$outclass <- NULL

    ## Check if the control corresponds to the parameter supplied: monitoring, family and method:
##    defc <- .defaultControl(monitoring=monitoring, family=family, method=method)
##    if(class(defc) != class(control))
##        stop(paste0("Wrong control object provided: '", class(control), "'. Must be ", class(defc), "."))

    parlist = c(.jarray(x, dispatch=TRUE))

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
        out <- callFsdaFunction("Smult", "[Ljava/lang/Object;", 1, parlist)
        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

        if(trace)
        {
            cat("\nReturning from Smult().  Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        outliers = as.vector(as.matrix(.jevalArray(arr$get("outliers", as.integer(1)), "[[D", simplify = TRUE)))

        loc = as.vector(as.matrix(.jevalArray(arr$get("loc", as.integer(1)), "[[D", simplify = TRUE)))
        shape = as.vector(as.matrix(.jevalArray(arr$get("shape", as.integer(1)), "[[D", simplify = TRUE)))
        scale = as.vector(as.matrix(.jevalArray(arr$get("scale", as.integer(1)), "[[D", simplify = TRUE)))
        cov = as.matrix(.jevalArray(arr$get("cov", as.integer(1)), "[[D", simplify = TRUE))
        bs = as.vector(as.matrix(.jevalArray(arr$get("bs", as.integer(1)), "[[D", simplify = TRUE)))
        md = as.vector(as.matrix(.jevalArray(arr$get("md", as.integer(1)), "[[D", simplify = TRUE)))

        if(as.integer(arr$hasField("weights", as.integer(1))) == 1) {
            weights = as.matrix(.jevalArray(arr$get("weights", as.integer(1)), "[[D", simplify = TRUE))
        }else
        {
                ## if weights are not returned (e.g. in FSM, use 'outliers' to generate 0-1 weights
                weights <- rep(1, n)
                weights[outliers] <- 0
        }
        weights = as.vector(weights)
        conflev <- if(as.integer(arr$hasField("conflev", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("conflev", as.integer(1)), "[[D", simplify = TRUE))
        singsub <- if(as.integer(arr$hasField("singsub", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("singsub", as.integer(1)), "[[D", simplify = TRUE))

        names(md) <- names(weights) <- rownames(x)
        ans = list(call=match.call(), outliers=outliers, loc=loc, shape=shape, scale=scale, cov=cov,
            bs=bs, md=md, weights=weights, conflev=as.vector(conflev)[1], singsub=singsub, X=x)

    } else
    {
        out <- callFsdaFunction("Smulteda", "[Ljava/lang/Object;", 1, parlist)
        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

        if(trace)
        {
            cat("\nReturning from Smulteda().  Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        BS <- as.matrix(.jevalArray(arr$get("BS", as.integer(1)), "[[D", simplify = TRUE))
        MAL = as.matrix(.jevalArray(arr$get("MAL", as.integer(1)), "[[D", simplify = TRUE))
        Loc = as.matrix(.jevalArray(arr$get("Loc", as.integer(1)), "[[D", simplify = TRUE))
        Shape <- if(as.integer(arr$hasField("Shape", as.integer(1))) != 1) NULL
                     else as.vector(as.matrix(.jevalArray(arr$get("Shape", as.integer(1)), "[[D", simplify = TRUE)))
        Scale <- if(as.integer(arr$hasField("Scale", as.integer(1))) != 1) NULL
                     else as.vector(as.matrix(.jevalArray(arr$get("Scale", as.integer(1)), "[[D", simplify = TRUE)))
        Cov <- if(as.integer(arr$hasField("cov", as.integer(1))) != 1) NULL
                     else as.vector(as.matrix(.jevalArray(arr$get("cov", as.integer(1)), "[[D", simplify = TRUE)))

        Weights <- if(as.integer(arr$hasField("Weights", as.integer(1))) != 1) NULL
                       else as.matrix(.jevalArray(arr$get("Weights", as.integer(1)), "[[D", simplify = TRUE))

        Outliers <- if(as.integer(arr$hasField("Outliers", as.integer(1))) != 1) NULL
                        else as.matrix(.jevalArray(arr$get("Outliers", as.integer(1)), "[[D", simplify = TRUE))
        ans = list(call=match.call(), Loc=Loc, Shape=Shape, Scale=Scale, cov=cov, Weights=Weights, Outliers=Outliers, BS=BS, MAL=MAL, X=x)


        ans$bdp <- if(as.integer(arr$hasField("bdp", as.integer(1))) != 1) NULL
                   else as.vector(as.matrix(.jevalArray(arr$get("bdp", as.integer(1)), "[[D", simplify = TRUE)))
        singsub <- if(as.integer(arr$hasField("singsub", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("singsub", as.integer(1)), "[[D", simplify = TRUE))
        ans$singsub <- as.vector(singsub)[1]
        conflev <- if(as.integer(arr$hasField("conflev", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("conflev", as.integer(1)), "[[D", simplify = TRUE))
        ans$conflev <- as.vector(conflev)[1]
    }
    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
