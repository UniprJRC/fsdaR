######
##  VT::05.12.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Plots the trajectories of minimum Mahalanobis distances from different starting points
#'
#' @description Plots the trajectories of minimum Mahalanobis distances from different starting points
#'
#' @param out An object of S3 class \code{\link{fsmmmdrs.object}} returned by
#'  \code{\link{fsmmmdrs}} -
#'  a list containing the following elements:
#'  \itemize{
#'  \item \code{mmdrs} = a matrix of size (n-ninit)-by-(nsimul+1) containing the monitoring
#'      of minimum Mahalanobis distance in each step of the forward search for each
#'      of the nsimul random starts. The first column of mmdrs must contain the forward search index.
#'      This matrix can be created using function \code{\link{fsmmmdrs}}.
#'  \item \code{BBrs} = 3D array of size n-by-n-(init)-by-nsimul containing
#'      units forming subset for rach random start. This field is necessary
#'      if datatooltip is true or databrush is not empty.
#'  \item \code{X} = n-by-v matrix containing the original data matrix. This
#'      field is necessary if datatooltip is true or databrush is not empty.
#'  }
#' @param quant Quantiles for which envelopes have to be computed.
#'  The default is to produce 1\%, 50\% and 99\% envelopes. In other
#'  words the default is \code{quant=c(0.01, 0.5, 0.99)}.
#'
#' @param envm Sample size for drawing enevlopes. Specifies the size of the sample which is
#'  used to superimpose the envelope. The default is to add an envelope based on
#'  all the observations (size \code{n} envelope).
#'
#' @param xlim Control the x scale in plot. Vector with two elements controlling
#'  minimum and maximum on the x axis. Default is to use automatic scale.
#' @param ylim Control the y scale in plot. Vector with two elements controlling
#'  minimum and maximum on the y axis. Default is to use automatic scale.
#' @param lwd Controls the linewidth of the curve which contains the monitoring
#'  of minimum deletion residual.
#' @param lwdenv line width: a scalar which controls the width of the lines associated
#'  with the envelopes. Default is \code{lwdenv=1}
#' @param tag Plot handle. String which identifies the handle of the plot which is about to be created.
#'  The default is \code{tag='pl_mmdrs'}. Notice that if the program finds a plot which has
#'  a tag equal to the one specified by the user, then the output of the new plot overwrites
#'  the existing one in the same window else a new window is created.
#'
#' @param datatooltip If datatooltip is not empty the user can use the mouse in order to have
#'  information about the unit selected, the step in which the unit enters the search and
#'  the associated label. If datatooltip is a list, it is possible to control the aspect
#'  of the data cursor (see MATLAB function \code{datacursormode()} for more details or
#'  see the examples below). The default options are \code{DisplayStyle="Window"} and \code{SnapToDataVertex="on"}.
#'
#' @param label Row labels. Character vector containing the labels of the units (optional argument used
#'  when \code{datatooltip=TRUE}. If this field is not present labels
#'  row1, ..., rown will be automatically created and included in the pop up datatooltip window).
#'
#' @param xlab A title for the x axis
#' @param ylab A title for the y axis
#' @param main An overall title for the plot
#' @param envlab wheather to label the envelopes. If \code{envlab} is true (default)
#'  labels of the confidence envelopes which are used are added on the y axis.
#' @param nameX Add variable labels in the plot. A vector of strings of length \code{p}
#'  containing the labels of the variables of the original data matrix \code{X}.
#'  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically

#' @param cex.lab The magnification to be used for x and y labels relative to the current setting of cex
#' @param cex.axis The magnification to be used for axis annotation relative to the current setting of cex
#'
#' @param databrush Interactive mouse brushing. If databrush is missing or empty (default), no brushing is done.
#'  The activation of this option (databrush is TRUE or a list) enables the user to select
#'    a set of trajectories in the current plot and to see them highlighted in the scatterplot matrix.
#'    If the scatterplot matrix does not exist it is automatically created.
#'    In addition, brushed units can be highlighted in the monitoring MD plot. Note that the window
#'    style of the other figures is set equal to that which contains the monitoring residual plot.
#'    In other words, if the monitoring residual plot is docked all the other figures will be docked too.
#'
#'    If \code{databrush=TRUE} the default selection tool is a rectangular brush and it is
#'    possible to brush only once (that is persist='').
#'
#'    Note that the window style of the other figures is set equal to that which contains the
#'    monitoring residual plot. In other words, if the monitoring residual plot is docked all
#'    the other figures will be docked too
#'
#'    If \code{databrush=TRUE} the default selection tool is a rectangular brush and
#'    it is possible to brush only once (that is persist='').
#'
#'    If \code{databrush=list(...)}, it is possible to use all optional arguments of
#'    the MATLAB function \code{selectdataFS()} and the following optional arguments:
#'    \enumerate{
#'    \item persist. Persist is an empty value or a character containing 'on' or 'off'.
#'        The default value is \code{persist=""}, that is brushing is allowed only once.
#'    If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as
#'    the user requires. If \code{persist='on'} then the unit(s) currently brushed are
#'    added to those previously brushed. It is possible, every time a new brushing is
#'    done, to use a different color for the brushed units. If \code{persist='off'}
#'    every time a new brush is performed units previously brushed are removed.
#'    }
#'
#' @param scaled Wheather to use scaled or unscaled envelopes. If \code{scaled=TRUE}
#'  the envelopes are produced for scaled Mahalanobis distances (no consistency factor
#'  is applied) else the traditional consistency factor is applied.
#'  Default is \code{scaled=FALSE}
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none

#' @references
#'      Atkinson, A.C., Riani, M. and Cerioli, A. (2004), '\emph{Exploring multivariate data with the forward search}, Springer Verlag, New York.
#'

#' @examples
#'  \dontrun{
#'  data(hbk)
#'  out <- fsmmmdrs(hbk[,1:3])
#'  mmdrsplot(out)
#'  }
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

mmdrsplot <- function(out,
        quant=c(0.01, 0.5, 0.99), envm, lwd, lwdenv,
        xlim, ylim, tag, datatooltip, label, xlab, ylab, envlab=TRUE, main, nameX,
        cex.lab, cex.axis,
        databrush, scaled=FALSE,
        trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "fsmmmdrs"))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are MAL, Un, Bols, y and X. The R class name is mapped to a Matlab class name
    outStr <- list(mmdrs=out$mmdrs, BBrs=out$BBrs, Y=out$X, class=getMatlabClass(class(out)))
    if(is.null(outStr$mmdrs) || is.null(outStr$BBrs) || is.null(outStr$Y))
        stop("One or more required arguments are missing.")

    control = list(...)
    control$quant <- quant
    if(!missing(envm))
        control$envm <- envm
    if(!missing(xlim))
        control$xlimx <- as.double(xlim)    # MATLAB does not want them as integer
    if(!missing(ylim))
        control$ylimy <- as.double(ylim)    # MATLAB does not want them as integer
    if(!missing(lwd))
        control$lwd <- lwd
    if(!missing(lwdenv))
        control$lwdenv <- lwdenv
    if(!missing(datatooltip))
    if(is.logical(datatooltip))
    {
        if(datatooltip)
            control$datatooltip <- 1
    }else if(is.list(datatooltip))
        control$datatooltip <- datatooltip
    else
        stop(paste("Wrong argument 'datatooltip':", datatooltip))

    if(!missing(label))
        control$label <- label
    if(!missing(xlab))
        control$labx <- xlab
    if(!missing(ylab))
        control$laby <- ylab
    control$labenv <- ifelse(envlab, 1, 0)
    if(!missing(main))
        control$titl <- main
    if(!missing(nameX))
        control$nameY <- nameX

    if(!missing(cex.axis))
    {
        control$SizeAxesNum <- 10  ## the default
        control$SizeAxesNum <- cex.axis * control$SizeAxesNum
    }
    if(!missing(cex.lab))
    {
        control$FontSize <- 12  ## the default
        control$FontSize <- cex.lab * control$FontSize
    }

    if(!missing(databrush))
    {
        if(is.logical(databrush))
        {
            if(databrush)
                control$databrush <- 1
        }else if(is.list(databrush))
            control$databrush <- databrush
    }

    if(!missing(tag))
        control$tag <- as.character(tag)

    control$scaled <- ifelse(scaled, 1, 0)

    if(trace)
    {
        cat("\nOptional parameters to FSM(): \n")
        print(control)
    }


    # Initialize parlist to the input values. All parameters from the control structure
    # must be added to the R list *before* converting it into a MATLAB struct

    ## VT::16.10.2017: the mandatory input parameters are all contained
    ##  in an S3 class (a list), which is the output of one of the XXXeda() fucntions.
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
    matlabResult <- callFsdaFunctionNoArgout("mmdrsplot", "[Ljava/lang/Object;", matlabParams)
    ans = list()

    freeMatlabResources(out)
    return(invisible(ans))
}
