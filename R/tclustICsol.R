######
##  VT::17.12.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Extracts a set of best relevant solutions obtained by \code{\link{tclustIC}}
#'
#' @description  The function \code{tclustICsol()} takes as input an object of class
#'  \code{\link{tclustic.object}}, the output
#'  of function \code{\link{tclustIC}} (that is a series of matrices which contain
#'  the values of the information criteria BIC/ICL/CLA for different values of \code{k}
#'  and \code{c}) and extracts the first best solutions. Two solutions are considered
#'  equivalent if the value of the adjusted Rand index (or the adjusted Fowlkes and
#'  Mallows index) is above a certain threshold. For each tentative solution the program
#'  checks the adjacent values of \code{c} for which the solution is stable.
#'  A matrix with adjusted Rand indexes is given for the extracted solutions.
#'
#' @param out An S3 object of class \code{\link{tclustic.object}}
#'  (output of \code{\link{tclustIC}}) containing the values
#'  of the information criteria BIC (MIXMIX), ICL (MIXCLA) or CLA (CLACLA),
#'  for different values of k (number of groups) and different
#'  values of c (restriction factor), for a prespecified level of trimming.

#' @param plot If \code{plot=TRUE}, the best solutions which have been found are shown on the screen.

#' @param NumberOfBestSolutions Number of best solutions to extract from BIC/ICL matrix.
#'  The default value of NumberOfBestSolutions is 5

#' @param ThreshRandIndex Threshold to identify spurious solutions - the threshold
#'  of the adjusted Rand index to use to consider two solutions as equivalent.
#' The default value of ThreshRandIndex is 0.7

#' @param whichIC Specifies the information criterion to use to extract best solutions.
#'  Possible values for whichIC are:
#'
#'  \itemize{
#'    \item \code{CLACLA} = in this case best solutions are referred to the classification likelihood.
#'    \item \code{MIXMIX} = in this case in this case best solutions are referred to the mixture likelihood (BIC).
#'    \item \code{MIXCLA} = in this case in this case best solutions are referred to ICL.
#'    \item \code{ALL} = in this case best solutions both three solutions using classification
#'      and mixture likelihood are produced. In the output class \code{out} all the
#'      three matrices \code{MIXMIXbs}, \code{CLACLAbs} and \code{MIXCLAbs} are given.
#'  }
#'  The default value is \code{whichIC="ALL"}.

#' @param msg It controls whether to display or not messages (from MATLAB) on the screen. If \code{msg=TRUE}
#'      (default) messages about the progression of the search are displayed on the screen
#'      otherwise only error messages will be displayed.

#' @param Rand Index to use to compare partitions. If \code{Rand=TRUE} (default) the adjusted Rand
#'  index is used, else the adjusted Fowlkes and Mallows index is used.

#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.


#' @return  An S3 object of class \code{\link{tclusticsol.object}}

#' @references
#'      Cerioli, A., Garcia-Escudero, L.A., Mayo-Iscar, A. and Riani M. (2017).
#'      Finding the Number of Groups in Model-Based Clustering via Constrained Likelihoods,
#'      emph{Journal of Computational and Graphical Statistics}, pp. 404-416,
#'      https://doi.org/10.1080/10618600.2017.1390469.
#'
#'      Hubert L. and Arabie P. (1985), Comparing Partitions, \emph{Journal of Classification},
#'      Vol. 2, pp. 193-218.

#'
#' @seealso \code{\link{tclustIC}}, \code{\link{tclustfsda}}, \code{\link{carbikeplot}}
#' @examples
#'  \dontrun{
#'  data(geyser2)
#'  out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)
#'
#'  ## Plot first two best solutions using as Information criterion MIXMIX
#'  print("Best solutions using MIXMIX")
#'  outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)
#'
#'  print(outMIXMIX$MIXMIXbs)
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

tclustICsol <- function(out, NumberOfBestSolutions=5, ThreshRandIndex=0.7, whichIC=c("ALL", "CLACLA", "MIXMIX", "MIXCLA"),
    Rand=TRUE, msg=TRUE, plot=FALSE,
    trace=FALSE, ...)
{

    outclass <- "tclusticsol"
    whichIC <- match.arg(whichIC)

    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "tclustic"))
        stop("Function defined only for the output of 'tclistIC()'.")

    if(out$whichIC != "ALL" & out$whichIC != whichIC)
        stop(paste0("The requested criteria (", whichIC, ") is not compatible with the input 'tclustIC.object' object (", out$whichIC, ")."))

    ## The needed elements are ...
    if((whichIC == "ALL" | whichIC == "CLACLA") & (is.null(out$CLACLA) | is.null(out$IDXCLA)))
        stop("One or more required arguments. Both 'CLACLA' and 'IDXCLA' must be present in the object 'out'.")

    if((whichIC == "ALL" | whichIC == "MIXMIX") & (is.null(out$MIXMIX) | is.null(out$IDXMIX)))
        stop("One or more required arguments. Both 'MIXMIX' and 'IDXMIX' must be present in the object 'out'.")

    if((whichIC == "ALL" | whichIC == "MIXCLA") & is.null(out$MIXCLA))
        stop("One or more required arguments. 'MIXCLA' must be present in the object 'out'.")

    ## Remove the call component
    outStr <- out[-which(names(out) == "call")]
    if(length(ind <- which(names(outStr) == "X")) == 1)        ## MATLAB insists to have the data called Y
        names(outStr)[ind] <- "Y"

    control <- list()

    if(is.logical(plot))
        xplots <- ifelse(plot, 1, 0)
    else  if(is.numeric(plot) && plot >= 0 && plot <= 1)
        xplots <- plot
    else
        stop("Invalid parameter 'plot'. Should be TRUE/FALSE or 0/1.")

    control$whichIC <- whichIC
    control$plots <- xplots

    control$NumberOfBestSolutions <- NumberOfBestSolutions
    control$ThreshRandIndex <- ThreshRandIndex
    control$msg <- ifelse(msg, 1, 0)
    if(is.logical(Rand))
        rand <- ifelse(Rand, 1, 0)
    else  if(is.numeric(Rand) && Rand >= 0 && Rand <= 1)
        rand <- Rand
    else
        stop("Invalid parameter 'Rand'. Should be TRUE/FALSE or 0/1.")
    control$Rand <- rand

    # Initialize parlist to the input values. All parameters from the control structure
    # must be added to the R list *before* converting it into a MATLAB struct

    ## VT::16.10.2017: the mandatory input parameters are all contained
    ##  in an S3 class (a list), which is the output of one of the tclustIC() fucntion.
    ##  Convert the S3 class to a Matlab structure and initialize with it the parameter list.
    ##  NOTE: this is identical to the initialization of the parameter list in fsreg()
    ##      with the mandatory X and y.
    ##
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
    ret <- callFsdaFunction("tclustICsol", "[Ljava/lang/Object;", 1, parlist)

    if(is.null(ret))
        return(NULL)

    arr1 = .jcast(ret[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB tclust().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    MIXMIXbs <- if(as.integer(arr$hasField("MIXMIXbs", as.integer(1))) != 1) NULL
              else unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("MIXMIXbs", as.integer(1)), "[[D", simplify = TRUE)))
    MIXMIXbsari <- if(as.integer(arr$hasField("MIXMIXbsari", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("MIXMIXbsari", as.integer(1)), "[[D", simplify = TRUE))
    ARIMIX <- if(as.integer(arr$hasField("ARIMIX", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("ARIMIX", as.integer(1)), "[[D", simplify = TRUE))

    MIXCLAbs <- if(as.integer(arr$hasField("MIXCLAbs", as.integer(1))) != 1) NULL
              else unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("MIXCLAbs", as.integer(1)), "[[D", simplify = TRUE)))
    MIXCLAbsari <- if(as.integer(arr$hasField("MIXCLAbsari", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("MIXCLAbsari", as.integer(1)), "[[D", simplify = TRUE))

    CLACLAbs <- if(as.integer(arr$hasField("CLACLAbs", as.integer(1))) != 1) NULL
              else unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("CLACLAbs", as.integer(1)), "[[D", simplify = TRUE)))
    CLACLAbsari <- if(as.integer(arr$hasField("CLACLAbsari", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("CLACLAbsari", as.integer(1)), "[[D", simplify = TRUE))
    ARICLA <- if(as.integer(arr$hasField("ARICLA", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("ARICLA", as.integer(1)), "[[D", simplify = TRUE))

    kk_ret <- as.vector(as.matrix(.jevalArray(arr$get("kk", as.integer(1)), "[[D", simplify = TRUE)))
    cc_ret <- as.vector(as.matrix(.jevalArray(arr$get("cc", as.integer(1)), "[[D", simplify = TRUE)))

    if(!is.null(MIXMIXbs))
        dimnames(MIXMIXbs) <- list(1:nrow(MIXMIXbs), c("k", "c", "c (uniformly better)", "c (stable)", "Solution"))
    if(!is.null(MIXCLAbs))
        dimnames(MIXCLAbs) <- list(1:nrow(MIXCLAbs), c("k", "c", "c (uniformly better)", "c (stable)", "Solution"))
    if(!is.null(CLACLAbs))
        dimnames(CLACLAbs) <- list(1:nrow(CLACLAbs), c("k", "c", "c (uniformly better)", "c (stable)", "Solution"))

    if(!is.null(MIXMIXbsari))
        dimnames(MIXMIXbsari) <- list(1:nrow(MIXMIXbsari), 1:nrow(MIXMIXbsari))
    if(!is.null(MIXCLAbsari))
        dimnames(MIXCLAbsari) <- list(1:nrow(MIXCLAbsari), 1:nrow(MIXCLAbsari))
    if(!is.null(CLACLAbsari))
        dimnames(CLACLAbsari) <- list(1:nrow(CLACLAbsari), 1:nrow(CLACLAbsari))

    xkk <- paste0("k=", kk_ret)
    xcc <- paste0("c", cc_ret[2:length(cc_ret)], "_vs_c", cc_ret[1:(length(cc_ret)-1)])

    if(!is.null(ARIMIX))
        dimnames(ARIMIX) <- list(xkk, xcc)
    if(!is.null(ARICLA))
        dimnames(ARICLA) <- list(xkk, xcc)

    ans = list(call=match.call(), MIXMIXbs=MIXMIXbs, MIXMIXbsari=MIXMIXbsari, ARIMIX=ARIMIX,
                                  MIXCLAbs=MIXCLAbs, MIXCLAbsari=MIXCLAbsari,
                                  CLACLAbs=CLACLAbs, CLACLAbsari=CLACLAbsari, ARICLA=ARICLA,
                                  kk=kk_ret, cc=cc_ret, whichIC=whichIC, alpha=out$alpha)


    freeMatlabResources(ret)

    ## Remove any NULL elements (this happens if whichIC != ALL
    if(length(del <- which(unlist(lapply(ans, FUN=is.null)))) > 0)
        ans <- ans[-del]

    if(trace)
    {
        cat("\ntclustICsol(): object 'out' after removing the NULL objects:")
        print(names(ans))
    }

    class(ans) <- outclass

    return(ans)
}
