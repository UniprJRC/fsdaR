######
##  VT::06.03.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Plots information criterion as a function of \code{c} and \code{k}, based on the solutions obtained by \code{\link{tclustIC}}
#'
#' @description The function \code{tclustICplot()} takes as input an object of class
#'  \code{\link{tclustic.object}}, the output
#'  of function \code{\link{tclustIC}} (that is a series of matrices which contain
#'  the values of the information criteria BIC/ICL/CLA for different values of \code{k}
#'  and \code{c}) and plots them as function of \code{c} or of \code{k}. The plot enables
#'  interaction in the sense that, if option \code{databrush} has been activated, it is
#'  possible to click on a point in the plot and to see the associated classification
#'  in the scatter plot matrix.
#'
#' @param out An S3 object of class \code{\link{tclustic.object}}
#'  (output of \code{\link{tclustIC}}) containing the values
#'  of the information criteria BIC (MIXMIX), ICL (MIXCLA) or CLA (CLACLA),
#'  for different values of k (number of groups) and different
#'  values of c (restriction factor), for a prespecified level of trimming.

#' @param whichIC Specifies the information criterion to use for the plot.
#'  See code{tclustIC()} for the possible values of whichIC.

#' @param tag plot handle. String which identifies the handle of the plot which is about to be created.
#'    The default is to use tag 'pl_IC'. Notice that if the program finds a plot which has
#'    a tag equal to the one specified by the user, then the output of the new plot overwrites
#'    the existing one in the same window else a new window is created.
#'
#' @param datatooltip Interactive clicking. It is inactive if this parameter is set to FALSE.
#'    The default is \code{datatooltip=TRUE}, the user can select with the mouse a solution
#'    in order to have the following information:
#'  \itemize{
#'  \item 1) value of \code{k} which has been selected
#'  \item 2) value of \code{c} which has been selected
#'  \item 3) values of the information criterion
#'  \item 4) frequency distribution of the associated classification.
#'  }
#'  If datatooltip is a list it may contain the following fields:
#'    \enumerate{
#'    \item DisplayStyle determines how the data cursor displays. Possible values are
#'        \code{'datatip'} and \code{'window'} (default). \code{'datatip'} displays
#'        data cursor information in a small yellow text box attached to a black
#'        square marker at a data point you interactively select. \code{'window'}
#'        displays data cursor information for the data point you interactively
#'        select in a floating window within the figure.
#'    \item SnapToDataVertex: specifies whether the data cursor snaps to the nearest data value or
#'        is located at the actual pointer position.
#'        Possible values are \code{SnapToDataVertex='on'} (default) and \code{SnapToDataVertex='off'}.
#'    }
#'
#' @param databrush Interactive mouse brushing. If databrush is missing or empty (default), no brushing is done.
#'  The activation of this option (databrush is \code{TRUE} or a list) enables the user to select
#'    a set of values of IC in the current plot and to see thecorresponding classification highlighted in the scatterplot matrix.
#'    If the scatterplot matrix does not exist it is automatically created.
#'    Note that the window style of the other figures is set equal to that which contains the IC plot.
#'    In other words, if the IC plot is docked all the other figures will be docked too.
#'
#'    If \code{databrush=TRUE} the default selection tool is a rectangular brush and it is
#'    possible to brush only once (that is persist='').
#'
#'    If \code{databrush=list(...)}, it is possible to use all optional arguments of
#'    the MATLAB function \code{selectdataFS()} and the following optional arguments:
#'    \itemize{
#'    \item \code{persist}: Persist is an empty value or a character containing 'on' or 'off'.
#'        The default value is \code{persist=""}, that is brushing is allowed only once.
#'        If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as
#'        the user requires. If \code{persist='on'} then the unit(s) currently brushed are
#'        added to those previously brushed. It is possible, every time a new brushing is
#'        done, to use a different color for the brushed units. If \code{persist='off'}
#'        every time a new brush is performed units previously brushed are removed.
#'    \item \code{label}: add labels of brushed units in the monitoring plot.
#'    \item \code{dispopt}: controls how to fill the diagonals in the scatterplot matrix
#'      of the brushed solutions. Set \code{dispopt="hist"} (default) to plot histograms,
#'      or \code{dispopt="box"} to plot boxplots.
#'    }
#'
#' @param nameY Add variable labels in plot. A vector of strings of length \code{p}
#'  containing the labels of the variables in the dataset.
#'  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @references
#'      Cerioli, A., Garcia-Escudero, L.A., Mayo-Iscar, A. and Riani M. (2017).
#'      Finding the Number of Groups in Model-Based Clustering via Constrained Likelihoods,
#'      emph{Journal of Computational and Graphical Statistics}, pp. 404-416,
#'      https://doi.org/10.1080/10618600.2017.1390469.
#'
#'      Hubert L. and Arabie P. (1985), Comparing Partitions, \emph{Journal of Classification},
#'      Vol. 2, pp. 193-218.

#'
#' @seealso \code{\link{tclustIC}}, \code{\link{tclustfsda}}
#' @examples
#'  \dontrun{
#'  data(geyser2)
#'  out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)
#'
#'  tclustICplot(out)
#'
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

tclustICplot <- function(out, whichIC=c("ALL", "MIXMIX", "MIXCLA", "CLACLA"),
    tag, datatooltip, databrush, nameY,
    trace=FALSE, ...)
{
    whichIC = match.arg(whichIC)

    ## Perform check on the structure of 'out'
    if(missing(out) || !inherits(out, "tclustic") &&  !inherits(out, "tclustregic"))
        stop("Function defined only for output of tclustIC() or tclustregIC().")

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
    ## Remove the call component
    outStr <- out[-which(names(out) == "call")]
    if(length(ind <- which(names(outStr) == "X")) == 1)        ## MATLAB insists to have the data called Y
        names(outStr)[ind] <- "Y"

    control = list(whichIC=whichIC)

    if(!missing(datatooltip))
    {
        if(is.logical(datatooltip))
            control$datatooltip <- ifelse(datatooltip, 1, "")
        else if(is.list(datatooltip))
            control$datatooltip <- datatooltip
        else
            stop(paste("Wrong argument 'datatooltip':", datatooltip))
    }

    if(!missing(databrush))
    {
        if(is.logical(databrush))
        {
            if(databrush)
                control$databrush <- 1
        }else if(is.list(databrush))
            control$databrush <- databrush
        else
            stop(paste("Wrong argument 'databrush':", databrush))
    }

    if(!missing(nameY))
        control$nameY <- nameY

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
    matlabResult <- callFsdaFunctionNoArgout("tclustICplot", "[Ljava/lang/Object;", matlabParams)
    ans = list()

    freeMatlabResources(matlabResult)
    return(invisible(ans))
}
