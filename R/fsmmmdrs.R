######
##  VT::05.12.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Performs random start monitoring of minimum Mahalanobis distance
#'
#' @description The trajectories originate from many different random initial subsets
#'  and provide information on the presence of groups in the data. Groups are
#'  investigated by monitoring the minimum Mahalanobis distance outside
#'  the forward search subset.
#'
#' @param x An n x p data matrix (n observations and p variables).
#'  Rows of x represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param init Point where to start monitoring required diagnostics.
#'  If \code{init} is not specified it will be set equal to \code{(p+1)}.
#' @param bsbsteps A vector which specifies for which steps of the forward
#'  search it is necessary to save the units forming subset for each
#'  random start. if \code{bsbsteps = 0} for each random start we store
#'  the units forming subset in all steps. The default is store the
#'  units forming subset in all steps if \code{n <= 500} else to store
#'  the units forming subset at step init and steps which are multiple
#'  of 100. For example, if \code{n = 753} and \code{init = 6},
#'  units forming subset are stored for \code{m=init, 100, 200, 300, 400, 500 and 600}.
#'
#'  REMARK: The vector bsbsteps must contain numbers from init to n.
#'  if \code{min(bsbsteps) < init} a warning message will be issued.
#' @param nsimul Number of random starts. Default value is \code{nsimul=200}.
#' @param nocheck It controls whether to perform checks on matrix Y. If \code{nocheck=TRUE},
#'  no check is performed.
#' @param plot Plots the random starts minimum Mahalanobis distance with 1%, 50% and 99% confidence bands.
#'  If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  The scale (ylim) for the y axis is defined as follows:
#'  \itemize{
#'  \item ylim[2] is the maximum between the values of \code{mmd} in steps \code{[n*0.2 n]} and the final
#'  value of the 99 per cent envelope multiplied by 1.1.
#'  \item ylim[1] is the minimum between the values of \code{mmd} in steps \code{[n*0.2 n]} and the 1 per cent envelope multiplied by 0.9.
#'  }
#'  Remark: the plot which is produced is very simple. In order to control a series of options
#'  in this plot (including the y scale) and in order to connect it dynamically to the other
#'  forward plots it is necessary to use function \code{\link{mmdrsplot}}.
#' @param numpool If \code{numpool > 1}, the routine automatically checks if the
#'  Parallel Computing Toolbox is installed and distributes the random starts over
#'  numpool parallel processes. If \code{numpool <= 1}, the random starts are run
#'  sequentially. By default, numpool is set equal to the number of physical cores
#'  available in the CPU (this choice may be inconvenient if other applications
#'  are running concurrently). The same happens if the numpool value chosen by
#'  the user exceeds the available number of cores.
#'
#'  REMARK: up to R2013b, there was a limitation on the maximum number of cores that
#'  could be addressed by the parallel processing toolbox (8 and, more recently, 12).
#'  From R2014a, it is possible to run a local cluster of more than 12 workers.
#'
#'  REMARK: Unless you adjust the cluster profile, the default maximum number of
#'  workers is the same as the number of computational (physical) cores on the machine.
#'
#'  REMARK: In modern computers the number of logical cores is larger than the number
#'  of physical cores. By default, MATLAB is not using all logical cores because,
#'  normally, hyper-threading is enabled and some cores are reserved to this feature.
#'
#'  REMARK: It is because of Remarks 3 that we have chosen as default value for
#'  numpool the number of physical cores rather than the number of logical ones.
#'  The user can increase the number of parallel pool workers allocated to the
#'  multiple start monitoring by:
#'  \itemize{
#'  \item setting the NumWorkers option in the local cluster profile settings to
#'      the number of logical cores (Remark 2). To do so go on the menu
#'      \emph{Home|Parallel|Manage Cluster Profile} and set the desired
#'      "Number of workers to start on your local machine".
#'  \item setting numpool to the desired number of workers
#'  }
#'  Therefore, *if a parallel pool is not already open*, UserOption numpool (if set)
#'  overwrites the number of workers set in the local/current profile. Similarly,
#'  the number of workers in the local/current profile overwrites default value of
#'  \code{numpool} obtained as feature('numCores') (i.e. the number of physical cores).
#'
#' @param cleanpool Set cleanpool \code{cleanpool=TRUE} if the parallel pool has to be cleaned
#'  after the execution of the random starts. Otherwise (default) \code{cleanpool=FALSE}.
#'  Clearly this option has an effect just if previous option \code{numpool > 1}.
#' @param msg Level of output to sidplay. It controls whether to display or not messages
#'  about random start progress. More precisely, if previous option \code{numpool > 1},
#'  then a progress bar is displayed, on the other hand a message will be displayed on
#'  the screen when 10%, 25%, 50%, 75% and 90% of the random starts have been accomplished.
#'
#'  REMARK: in order to create the progress bar when \code{nparpool > 1} the program
#'  writes on a temporary .txt file in the folder where the user is working.
#'  Therefore it is necessary to work in a folder where the user has write
#'  permission. If this is not the case and the user (say) is working without
#'  write permission in folder C:/Program Files/MATLAB the following message
#'  will appear on the screen:
#'
#'  \emph{Error using ProgressBar (line 57) Do you have write permissions for C:/Program Files/MATLAB?"}
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.


#' @return  Returns an object of class \code{\link{fsmmmdrs.object}}.
#' @references
#'  Atkinson, A.C., Riani, M., and Cerioli, A. (2006), Random Start Forward
#'  Searches with Envelopes for Detecting Clusters in Multivariate Data,
#'  in: Zani S., Cerioli A., Riani M., Vichi M., Eds., \emph{Data Analysis,
#'  Classification and the Forward Search}, pp. 163-172, Springer Verlag.
#'
#'  Atkinson, A.C. and Riani, M., (2007), Exploratory Tools for Clustering
#'  Multivariate Data, \emph{Computational Statistics and Data Analysis},
#'  Vol. 52, pp. 272-285, doi:10.1016/j.csda.2006.12.034
#'
#'  Riani, M., Cerioli, A., Atkinson, A.C., Perrotta, D. and Torti, F. (2008),
#'  Fitting Mixtures of Regression Lines with the Forward Search, in:
#'  \emph{Mining Massive Data Sets for Security}, F. Fogelman-Soulie
#'  et al. Eds., pp. 271-286, IOS Press.

#' @examples
#'  \dontrun{
#'  data(hbk)
#'  out <- fsmmmdrs(hbk[,1:3])
#'  class(out)
#'  summary(out)
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

fsmmmdrs <- function(x, plot=FALSE,
        init, bsbsteps, nsimul=200, nocheck=FALSE,
        numpool, cleanpool=FALSE, msg=FALSE,
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

    ## We do not need a 'control' argument for now
    ##  if(missing(control))
    ##      control <- list(...)
    control <- list(...)

    if(!missing(init))
        control$init <- init
    if(!missing(bsbsteps))
        control$bsbsteps <- bsbsteps
    control$nsimul <- nsimul
    control$plots <- ifelse(plot, 1, 0)
    if(!missing(numpool))
        control$numpool <- numpool
    control$cleanpool <- ifelse(cleanpool, 1, 0)
    control$msg <- ifelse(msg, 1, 0)
    control$nocheck <- ifelse(nocheck, 1, 0)

    outclass <- "fsmmmdrs"

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

    out <- callFsdaFunction("FSMmmdrs", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)
    if(trace)
    {
        cat("\nReturning from FSMmmdrs().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    mmdrs = as.matrix(.jevalArray(arr$get("mmdrs", as.integer(1)), "[[D", simplify = TRUE))
    BBrs = .jevalArray(arr$get("BBrs", as.integer(1)), "[[D", simplify = TRUE)
    Y <- if(as.integer(arr$hasField("Y", as.integer(1))) != 1) NULL
         else as.matrix(.jevalArray(arr$get("Y", as.integer(1)), "[[D", simplify = TRUE))
    ans = list(call=match.call(), mmdrs=mmdrs, BBrs=BBrs, X=Y)

    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
