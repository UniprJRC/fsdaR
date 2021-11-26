######
##  VT::26.11.2021
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR", load_code=roxygen2:::load_installed)
##
#' Plots the fan plot for transformation in linear regression
#'
#' @description Plots the fan plot for transformation in linear regression
#'
#' @param out An object of S3 class \code{\link{fsrfan.object}} returned by
#'  \code{\link{fsrfan}} -
#'  a list containing the following elements:
#'
#'    \enumerate{
#'        \item \code{Score}: matrix of size \code{(n-init) x length(la)+1}:
#'              itemize{
#'              \item 1st col = fwd search index;
#'              \item 2nd col = value of the score test in each step of the fwd search for la(1)
#'              \item ...
#'              \item last col  =  value of the score test in each step of the fwd search for la.
#'              }
#'      \item \code{la}: vector containing the values of lambda for which fan plot is constructed.
#'      \item \code{bs}: matrix of size \code{p x length(la)} containing the units forming the initial subset for each value of lambda.
#'      \item \code{Un}: list of size \code{length(la)}. \code{Un[[i]]} is a \code{(n-init) x 11}
#'          matrix which contains the unit(s) included in the subset at each step of the fwd
#'          search (necessary only if option datatooltip or databrush are set).
#'      \item \code{y}: a vector containing the response (necessary only if option \code{databrush} is set).
#'      \item \code{X}: a matrix containing the explanatory variables (necessary only if option \code{databrush} is set).
#'   }

#' @param ylim Controls the \code{y} scale in the plot. \code{ylim} is a vector with two elements controlling
#'      minimum and maximum on the \code{y}-axis. Default is to use automatic scale.
#'
#' @param xlim Controls the \code{x} scale in the plot. \code{xlim} is a vector with two elements controlling
#'      minimum and maximum on the \code{x}-axis. Default is to use automatic scale.
#'
#' @param xlab A title for the x axis
#' @param ylab A title for the y axis
#' @param main An overall title for the plot
#' @param lwd The line width, a positive number, default is \code{lwd=1}
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
#' @param bg.thresh Numeric vector of length 1 or 2 which specifies how to define the \emph{unimmportant trajectories}.
#'    Unimmportant trajectories will be plotted using a colormap, in greysh or will be hidden.
#'    If \code{length(bg.thresh) == 1} the irrelevant units are those which always
#'    had a mahalanobis distance smaller than \code{bg.thresh}.
#'    If \code{length(bg.thresh) == 2} the irrelevant units are those which always
#'    had a mahalanobis distance greater than \code{bg.thresh[1]} and smaller than \code{bg.thresh[2]}.
#'    The default is \code{bg.thresh=2.5} if \code{n > 100} and \code{bg.thresh=-Inf} if \code{n <= 100}
#'    i.e. to treat all trajectories as important if \code{n <= 100} and, if \code{n > 100},
#'    to reduce emphasis only to trajectories having in all steps of the search a value
#'    of mahalanobis distance smaller than 2.5.
#'
#' @param bg.style Specifies how to plot the unimportant trajectories as defined in option bg.thresh.
#'    \enumerate{
#'      \item \code{bg.style="faint"}: unimportant trajectories are plotted using a colormap.
#'      \item \code{bg.style="hide"}: unimportant trajectories are hidden.
#'      \item \code{bg.style="greyish"}: unimportant trajectories are displayed in a faint grey.
#'    }
#'    When \code{n > 100} the default option is \code{bg.style='faint'}. When \code{n <= 100}
#'    and \code{bg.thresh == -Inf} option bg.style is ignored.
#'    Remark: bground='' is equivalent to -Inf that is all trajectories are considered relevant.
#'
#' @param tag Plot handle. String which identifies the handle of the plot which is about to be created.
#'    The default is to use tag 'pl_resfwd'. Notice that if the program finds a plot which has
#'    a tag equal to the one specified by the user, then the output of the new plot overwrites
#'    the existing one in the same window else a new window is created.
#'
#' @param datatooltip Interactive clicking. It is inactive if this parameter is set to FALSE.
#'    The default is \code{datatooltip=TRUE}, the user can select with the mouse an individual
#'    mahalanobis distance trajectory in order to have information about the corresponding unit, the associated
#'    label and the step of the search in which the unit enters the subset.
#'    If datatooltip is a list it may contain the following fields:
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
#'    \item LineColor: controls the color of the trajectory selected with the mouse. It can be an RGB triplet
#'        of values between 0 and 1, or character vector indicating a color name. Note that a RGB vector
#'        can be conveniently chosen with our MATLAB class FSColor, see documentation.
#'    \item SubsetLinesColor: enables to control the color of the trajectories of the units that are
#'        in the subset at a given step of the search (if \code{resfwdplot()} is applied to an
#'        object of class \code{\link{fsreda.object}}) or have a weight greater than 0.9 (if
#'        \code{resfwdplot()} is applied to an object of class \code{\link{sregeda.object}}
#'        or \code{\link{mmregeda.object}}). This can be done (repeatedly) with a left mouse
#'        click in proximity of the step of interest. A right mouse click will terminate the
#'        selection by marking with a up-arrow the step corresponding to the highlighted
#'        lines. The highlighted lines by default are in red, but a different color can be
#'        specified as RGB triplet or character of color name. Note that a RGB vector can
#'        be conveniently chosen with our MATLAB class FSColor, see documentation.
#'        By default \code{SubsetLinesColor=""}, i.e. the modality is not active.
#'        Any initialization for \code{SubsetLinesColor} which cannot be interpreted as
#'        RGB vector will be converted to blue, i.e. \code{SubsetLinesColor} will be forced to be [0 0 1].
#'        If \code{SubsetLinesColor} is not empty the previous option \code{LineColor} is ignored.
#'    }
#'
#' @param label Character vector containing the labels of the units (optional argument used when
#'    \code{datatooltip=TRUE}. If this field is not present labels
#'    row1, ..., rown will be automatically created and included
#'    in the pop up datatooltip window).
#' @param nameX Add variable labels in plot. A vector of strings of length \code{p}
#'  containing the labels of the variables in the dataset.
#'  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
#'
#' @param standard MATLAB-style arguments -  appearance of the plot in terms of xlim, ylim, axes labels
#'    and their font size style, color of the lines, etc.
#' @param fground MATLAB-style arguments - for the trajectories in foregroud.
#' @param bground  MATLAB-style arguments - for the trajectories in backgroud.
#'
#' @param databrush Interactive mouse brushing. If databrush is missing or empty (default), no brushing is done.
#'  The activation of this option (databrush is \code{TRUE} or a list) enables the user to select
#'    a set of trajectories in the current plot and to see them highlighted in the scatterplot matrix.
#'    If the scatterplot matrix does not exist it is automatically created.
#'    In addition, brushed units can be highlighted in the monitoring mahalanobis distance plot.
#'    Note that the window style of the other figures is set equal to that which contains the monitoring mahalanobis distance plot.
#'    In other words, if the monitoring mahalanobis distance plot is docked all the other figures will be docked too.
#'
#'    If \code{databrush=TRUE} the default selection tool is a rectangular brush and it is
#'    possible to brush only once (that is persist='').
#'
#'    If \code{databrush=list(...)}, it is possible to use all optional arguments of
#'    the MATLAB function \code{selectdataFS()} and the following optional arguments:
#'    \itemize{
#'    \item persist. Persist is an empty value or a character containing 'on' or 'off'.
#'        The default value is \code{persist=""}, that is brushing is allowed only once.
#'        If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as
#'        the user requires. If \code{persist='on'} then the unit(s) currently brushed are
#'        added to those previously brushed. It is possible, every time a new brushing is
#'        done, to use a different color for the brushed units. If \code{persist='off'}
#'        every time a new brush is performed units previously brushed are removed.
#'    \item \code{label}: add labels of brushed units in the monitoring plot.
#'    \item \code{labeladd}: add labels of brushed units in the scatterplot matrix.
#'        If this option is '1', we label the units of the last selected group with
#'        the unit row index in the matrix X. The default value is labeladd='',
#'        i.e. no label is added.
#'    }
#'
#' @param conflev confidence interval for the horizontal bands. It can be a vector of
#'  different confidence level values, e.g. c(0.95, 0.99, 0.999).
#'  The confidence interval is based on the $chi^2$ distribution.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none

#' @references
#'  Atkinson, A.C. and Riani, M. (2000), \emph{Robust Diagnostic Regression Analysis} Springer Verlag, New York.
#'
#'  Atkinson, A.C. and Riani, M. (2002), Tests in the fan plot for robust, diagnostic transformations in regression,
#'      \emph{Chemometrics and Intelligent Laboratory Systems}, \bold{60}, pp. 87--100.
#'
#'  Atkinson, A.C. Riani, M. and  Corbellini A. (2019), The analysis of transformations for profit-and-loss data,
#'      \emph{Journal of the Royal Statistical Society, Series C, "Applied Statistics"}, \bold{69}, pp. 251--275.
#'      \doi{10.1111/rssc.12389}
#'
#'  Atkinson, A.C. Riani, M. and Corbellini A. (2021), The Box-Cox Transformation: Review and Extensions,
#'      \emph{Statistical Science}, \bold{36}(2), pp. 239--255. \doi{10.1214/20-STS778}.
#'
#' @examples
#'
#'  \dontrun{
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


fanplot <- function(out,
##            xlim, ylim, xlab, ylab, main,
##            lwd, lty, col, cex.lab, cex.axis, subsize,
##            fg.thresh, fg.unit, fg.labstep, fg.lwd, fg.lty, fg.col, fg.mark, fg.cex,
##            bg.thresh, bg.style,
##            standard, fground, bground,
            tag, datatooltip, label, nameX, databrush, conflev,
            trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "fsrfan"))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are MAL and Y=X, and Un (FS) or bdp (S) or eff (MM).
    ## The R class name is mapped to a Matlab class name
    ## outStr <- list(MAL=out$MAL, Loc=out$Loc, Y=out$X, class=getMatlabClass(class(out)))
    outStr <- out

    control <- list(...)


    if(!missing(tag))
        control$tag <- as.character(tag)

    if(!missing(datatooltip))
    {
        if(is.logical(datatooltip))
            control$datatooltip <- ifelse(datatooltip, 1, "")
        else if(is.list(datatooltip))
            control$datatooltip <- datatooltip
        else
            stop(paste("Wrong argument 'datatooltip':", datatooltip))
    }
    if(!missing(label))
        control$label <- label
    if(!missing(nameX))
        control$nameX <- nameX

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

    if(!missing(conflev)) {
        control$conflev <- conflev
    } else {
        control$conflev <- 0.975
    }

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

            ##matlabValue = rType2MatlabType(paramName, paramValue, forceStringsToCellArray = TRUE)
            matlabValue = rType2MatlabType(paramName, paramValue, forceStringsToCellArray = FALSE)

            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    callFsdaFunctionNoArgout("fanplot", "[Ljava/lang/Object;", parlist)
    return(invisible(NULL))
}
