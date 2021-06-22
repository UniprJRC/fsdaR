######
##  VT::13.06.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Interactive scatterplot matrix for regression
#'
#' @description Produces an interactive scatterplot of the responce \code{y}
#'  against each variable of the predictor matrix \code{X}.
#'
#' @param y responce variable or an object containing the responce,
#'  the predictors and possibly other variable resulting from monitoring
#'  of regression.
#'
#'  If \code{y} is a vector, a data matrix \code{X} must be present as an argument
#'  If \code{y} is a list containing just \code{y} and \code{X}, the call is equivallent to
#'  \code{regspmplot(y, X)}. Otherwise \code{y} must be an an object of S3 class
#'  \code{\link{fsreda.object}} returned by
#'  \code{\link{fsreg}} with \code{monitoring=TRUE} - a list containing
#'  the monitoring along a search
#'
#' @param X Predictor variables. Data matrix of explanatory variables (also called 'regressors') of
#'  dimension \code{n} by \code{p} if the argument \code{y} is a vector. The rows of \code{X}
#'  represent observations, and the columns represent variables.

#' @param group grouping variable. Vector with \code{n} elements. Specifies
#'  a grouping variable defined as a categorical variable (factor), numeric, or array of strings,
#'  or string matrix, and it must have the same number of rows as \code{X}.
#'  This grouping variable determines the marker and color assigned to each point.
#'  Remark: if \code{group} is used to distinguish a set of outliers from
#'  a set of good units, the id number for the outliers should be the larger
#'  (see optional field \code{labeladd} of parameter \code{plo} for details).
#'
#' @param plot This option controls the names which are displayed in the margins
#'  of the scatterplot matrix as well as the labels of the legend.
#'  If \code{plot=FALSE}, then namey, nameX and labeladd are both set to
#'  the empty string (default), and no label and no name is added to the plot.
#'  If \code{plot=TRUE} the names y, and X1,..., Xp are added to the margins of
#'  the the scatter plot matrix else nothing is shown.
#'  If \code{plot} is a list, it is possible to control not only the names but also,
#'  point labels, colors and symbols. More precisely list \code{plot} may contain the following elements:
#'     \enumerate{
#'     \item \code{labeladd} - see parameter \code{labeladd}
#'     \item \code{namey} - a character string containing the response variable name. See parameter \code{namey}.
#'     \item \code{nameX} - a vector of character strings containing the labels of
#'          the explanatory variables. As default value, the labels which are
#'          added are \code{Y1, ..., Yp}. See parameter \code{nameX}.
#'     \item \code{clr} - see parameter \code{col}
#'     \item \code{sym} - see parameter \code{pch}
#'     \item \code{siz} - see parameter \code{cex}
#'     \item \code{doleg} - see parameter \code{legend}
#'     \item \code{xlimx} - see parameter \code{xlim}
#'     \item \code{ylimy} - see parameter \code{ylim}
#'     }
#'
#' @param namey a character string with the name of the responce variable
#' @param nameX a vector of character strings with the names of the explanatory variables
#' @param col color specification for the data point. Can be different for each group.
#'  By default, the order of the colors is \emph{blue}, \emph{red}, \emph{black},
#'  \emph{magenta}, \emph{green}, \emph{cyan} and \emph{yelow}.
#'
#' @param cex the size of the symbols used for plotting. By default \code{cex=1}
#'  the symbol size depends on the number of plots and the size of the
#'  figure window. Values larger than 1 will increase the size and
#'  values smaller than 1 will decrease the size.
#'
#' @param pch specification of the symbols to use. For example, if
#'  there are three groups, and \code{pch=c(1, 3, 4)}, the first group will be
#'  plotted with a circle, the second with a plus, and the third with a 'x' (see \code{?pch} or \code{?points} for
#'  a list of symbols. NOTE: not all symbols available in R can be mapped to the symbols in MATLAB.
#'
#' @param labeladd logical, controls wheather the elements belonging to the last group
#'  in the scatterplot matrix are labelled with their unit row index
#'  or their rowname. The rowname is taken from the parameter \code{label}
#'  or if it is missing, from the sequence \code{1:n}. The default value is
#'  \code{labeladd=FALSE}, i.e. no label is added.
#'
#' @param legend logical, controls where a legend is shown or not.
#' @param xlim x limits. A vector with two elements controlling minimum
#'  and maximum on the x axis. By defaul automatic scale is used.
#' @param ylim y limits. A vector with two elements controlling minimum
#'  and maximum on the y axis. By defaul automatic scale is used.
#'
#' @param tag Plot handle. String which identifies the handle of the plot which is about to be created.
#'  The default is \code{tag='pl_mmd'}. Notice that if the program finds a plot which has
#'  a tag equal to the one specified by the user, then the output of the new plot overwrites
#'  the existing one in the same window else a new window is created.
#'
#' @param datatooltip If datatooltip is not empty the user can use the mouse in order to have
#'  information about the unit selected, the step in which the unit enters the search and
#'  the associated label. If datatooltip is a list, it is possible to control the aspect
#'  of the data cursor (see MATLAB function \code{datacursormode()} for more details or
#'  see the examples below). The default options are \code{DisplayStyle="Window"} and \code{SnapToDataVertex="on"}.
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
#'    \itemize{
#'    \item \code{persist}: This option can be an empty value or a character containing 'on' or 'off'.
#'        The default value is \code{persist=""}, that is brushing is allowed only once.
#'        If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as
#'        the user requires. If \code{persist='on'} then the unit(s) currently brushed are
#'        added to those previously brushed. It is possible, every time a new brushing is
#'        done, to use a different color for the brushed units. If \code{persist='off'}
#'        every time a new brush is performed units previously brushed are removed.
#'    \item \code{labeladd}: add labels of brushed units in the scatterplot matrix.
#'        If this option is '1', we label the units of the last selected group with
#'        the unit row index in the matrix X. The default value is labeladd='',
#'        i.e. no label is added.
#'    }
#'
#' @param subsize x axis control, a numeric vector containing the subset size
#'  with length equal to the number of columns of matrix residuals. If it is
#'  not specified it will be set equal to \code{(nrow(residuals) - ncol(residuals) + 1) : nrow(residuals)}.
#'
#' @param selstep Text shown in selected steps, a numeric vector which specifies
#'  for which steps of the forward search textlabels are added in the monitoring
#'  residual plot after a brushing action in the yXplot. The default is to
#'  write the labels at the initial and final step. The default is
#'  \code{selstep=c(m0, n)} where \code{m0} and \code{n} are respectively
#'  the first and final step of the search.
#'
#' @param selunit Unit labelling. A vector of strings, a string, or a numeric
#'  vector for labelling units. If out is an object the threshold is associated
#'  with the trajectories of the residuals monitored along the search else it
#'  refers to the values of the response variable. If it is a vector of strings,
#'  only the lines associated with the units that in at least one step of the
#'  search had a residual smaller than \code{selunit[1]} or greater than
#'  \code{sellunit[2]} will have a textbox. If it is a string it specifies
#'  the threshold above which labels have to be put. For example \code{selunit='2.6'}
#'  means that the text labels are written only for the units which have
#'  in at least one step of the search a value of the scaled residual
#'  greater than 2.6 in absolute value. If it is a numeric vector it
#'  contains the list of the units for which it is necessary to put
#'  the text labels. The default value of selunit is string \code{'2.5'}
#'  if \code{y} is an object else it is an empty value.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none
#' @seealso \code{\link{spmplot}}, \code{\link{mdrplot}}, \code{\link{resfwdplot}}
#' @examples
#'
#'  \dontrun{
#'  ##  Example of the use of function regspmplot with all the default options
#'  ##  regsmplot() with first argument vector y and no option.
#'  ##  In the first example as input there are two matrices: y and X respectively
#'  ##  A simple plot is created
#'
#'  n <- 100
#'  p <- 3

#'  X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
#'  y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)
#'  regspmplot(y, X)
#'
#'  ##  Example of the use of function regspmplot with first argument
#'  ##  vector y and third argument group.
#'  ##  Different groups are shown in the yXplot
#'
#'  group <- rep(0, n)
#'  group[1:(n/2)] <- rep(1, n/2)
#'  regspmplot(y, X, group)
#'
#'  ##  Example of the use of function regspmplot with first argument
#'  ##  vector y, third argument group and fourth argument plot
#'  ##  (Ex1) plot=TRUE
#'
#'  regspmplot(y, X, group, plot=TRUE)
#'
#'  ##  (Ex1) Set the scale for the x axes, the y axis and control symbol type
#'  regspmplot(y, X, group, xlim=c(-1,2), ylim=c(0,2), pch=c(10,11), trace=TRUE)
#'
#'  ##  When the first input argument is an object.
#'  ##  In the following example the input is an object which also contains
#'  ##  information about the forward search.
#'      (out <- fsreg(y~X, method="LMS", control=LXS_control(nsamp=1000)))
#'      (out <- fsreg(y~X, bsb=out$bs, monitoring=TRUE))
#'
#'      regspmplot(out, plot=0)
#'
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


regspmplot <- function(y, X, group, plot,
        namey, nameX, col, cex, pch, labeladd, legend, xlim, ylim,
        tag, datatooltip, databrush, subsize, selstep, selunit,
        trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(y) | !(inherits(y, "data.frame") | inherits(y, "matrix") | inherits(y, "fsreda") | inherits(y, "sregeda") | inherits(y, "mmregeda")))
        stop("Function defined only for monitoring type output from forward search or a data matrix.")

    if(inherits(y, "fsreda") || inherits(y, "sregeda") || inherits(y, "mmregeda"))
    {
        ## The needed elements are RES, X, y, and Un (FS) or bdp (S) or eff (MM).
        ## The R class name is mapped to a Matlab class name
        outStr <- list(RES=out$RES, Un=out$Un, y=out$y, X=out$X, class=getMatlabClass(class(out)))

        ## The following are only in FSR
        if(!is.null(out$Un))
            outStr$Un <- out$Un
        if(!is.null(out$Bols))
            outStr$Bols <- out$Bols

        ## The following are only in S and MM
        if(!is.null(out$bdp))
            outStr$bdp <- out$bdp
        if(!is.null(out$eff))
            outStr$eff <- out$eff
        if(!is.null(out$Weights))
            outStr$Weights <- out$Weights

        if(is.null(outStr$RES) || is.null(outStr$y) || is.null(outStr$X))
           stop("One or more required arguments are missing.")
    } else
    {
        ## make sure that y is a vector
        if(is.vector(y) || nrow(y) == 1 || ncol(y) == 1)
        {
            y <- as.vector(y)
            if(missing(X))
                stop("If 'y' is a vector, a predictor data matrix X must be provided.")
            X <- as.data.frame(X)
            outStr <- list(y=y, X=X)
        } else
            stop("'y' must be a vector or can be coerced to a vector and a predictor data matrix X must be provided.")
    }

    control = list(...)
    if(!missing(group))
    {
        if(length(group) != length(outStr$y))
            stop("Parameter 'group', if provided must be the same length as 'y'")
        control$group <- group
    }

    if(!missing(plot))
        control$plo <- plot

    if(!missing(namey))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$namey <- as.character(namey)
    }

    if(!missing(nameX))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$nameX <- as.character(nameX)
    }

    if(!missing(col))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$clr <- paste(mapColor(col), collapse="")
    }
    if(!missing(cex))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$siz <- 6    ## the default
        control$plo$siz <- cex * control$plo$siz
    }

    if(!missing(pch))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$sym <- map_pch(pch)
    }

    if(!missing(labeladd))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$labeladd <- if(is.logical(labeladd) && labeladd |
                                   is.character(labeladd) & labeladd =="1" |
                                   is.numeric(labeladd) & labeladd != 0) "1" else ""
    }

    if(!missing(legend))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$doleg <- if(is.logical(legend) && legend |
                                   is.character(legend) & legend =="on" |
                                   is.numeric(legend) & legend != 0) "on" else "off"
    }

    if(!missing(xlim))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$xlimx <- xlim
    }

    if(!missing(ylim))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$ylimy <- ylim
    }

    ## Do some validation on the plot structure
    if(length(which(names(control) == "plo")) > 0)
    {
        if(is.logical(control$plo))
            control$plo <- if(plot) 1 else 0
        else if(is.list(control$plo))
        {
            if("namey" %in% names(control$plo) && length(control$plo$namey) != 1)
                stop("'namey' can be only a simple string!")
            if("nameX" %in% names(control$plo) && length(control$plo$nameX) != ncol(outStr$X))
                stop(paste("'nameX' must be of vector of ", ncol(outStr$X), "strings!"))
            if("xlimx" %in% names(control$plo))
            {
                if(length(control$plo$xlimx) != 2)
                    stop(paste0("'xlim' must be of vector of 2 numbers!"))
                else control$plo$xlimx <- as.numeric(control$plo$xlimx)
            }
            if("ylimy" %in% names(control$plo))
            {
                if(length(control$plo$ylimy) != 2)
                    stop(paste0("'xlimy' must be of vector of 2 numbers!"))
                else control$plo$ylimy <- as.numeric(control$plo$ylimy)
            }
            if("doleg" %in% names(control$plo) && length(control$plo$doleg) != 1)
                stop("'legend' can be one of 'on' (default) or 'off'!")
        }
    }

    if(!missing(datatooltip))
    {
        if(is.logical(datatooltip))
        {
            if(datatooltip)
                control$datatooltip <- 1
        }else if(is.list(datatooltip))
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
    }

    if(!missing(selunit))
        control$selunit <- selunit

    if(!missing(selstep))
    {
        if(!is.numeric(selstep))
            stop("'selstep' must be a numeric vector!")
        control$selstep <- selstep
    }

    if(!missing(subsize))
        control$subsize <- subsize

    if(!missing(tag))
        control$tag <- as.character(tag)

    if(trace)
    {
        cat("\nOptional parameters to regspmplot(): \n")
        print(control)
    }

    parlist <- c(.jarray(as.matrix(outStr$y), dispatch=TRUE),
                 .jarray(as.matrix(outStr$X), dispatch=TRUE))
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
    out <- callFsdaFunction("yXplot", "[Ljava/lang/Object;", 1, parlist)
    ans = list()
    freeMatlabResources(out)

    return(invisible(ans))
}
