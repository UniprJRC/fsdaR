######
##  VT::13.06.20189
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Interactive scatterplot matrix
#'
#' @description Produces an interactive scatterplot matrix with boxplots or histograms on the main
#'  diagonal and possibly robust bivariate contours
#'
#' @param X data matrix (2D array) containing \code{n} observations on \code{p} variables
#'  or an object of S3 class \code{\link{fsmeda.object}} returned by
#'  \code{\link{fsmult}} with \code{monitoring=TRUE} - a list containing
#'  the monitoring of minimum Mahalanobis distance
#'
#' @param group grouping variable. Vector with \code{n} elements. Specifies
#'  a grouping variable defined as a categorical variable (factor), numeric, or array of strings,
#'  or string matrix, and it must have the same number of rows as \code{X}.
#'  This grouping variable determines the marker and color assigned to each point.
#'  Remark: if \code{group} is used to distinguish a set of outliers from
#'  a set of good units, the id number for the outliers should be the larger
#'  (see optional field \code{labeladd} of parameter \code{plot} for details).
#'
#' @param plot controls the names which are displayed in the margins of the
#'  scatter-plot matrix, the labels of the legend the colors and the symbols.
#'  If \code{plot} is \emph{empty} (\code{plot=FALSE} or \code{plot=0} or \code{plot=c()}
#'  or \code{plot=NULL}) empty strings are displayed and no label and no name is added
#'  to the plot. If \code{plot=TRUE} or \code{plot=1}, the names \code{Y1,..., Yp}
#'  are added to the margins of the the scatter plot matrix else nothing is added.
#'  If \code{plot} is a list, it is possible to control not only the names but also,
#'  point labels, colors and symbols. More precisely list \code{plot} may contain the following elements:
#'     \enumerate{
#'     \item \code{labeladd} - see parameter \code{labeladd}
#'     \item \code{nameY} - a character string containing the labels of
#'          the variables. As default value, the labels which are
#'          added are \code{Y1, ..., Yp}. See parameter \code{variables}.
#'     \item \code{clr} - see parameter \code{col}
#'     \item \code{sym} - see parameter \code{pch}
#'     \item \code{siz} - see parameter \code{cex}
#'     \item \code{doleg} - see parameter \code{legend}
#'     \item \code{label} - see parameter \code{label}
#'     }
#'
#' @param variables a character string with the names of the variables
#'
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
#' @param label a character vector of length \code{n} (the number of rows in the data matrix)
#'  containing the labels of the units. If this field is empty
#'  the sequence \code{1:n} will be used to label the units.
#'
#' @param legend logical, controls where a legend is shown or not.
#'
#' @param dispopt controls how to fill the diagonals in the plot (main diagonal of
#'   the scatter plot matrix). Set \code{dispopt='hist'} (default) to plot histograms,
#'  or \code{dispopt='box'} to plot boxplots. The style which is used for univariate
#'  boxplots is traditional, if the number of groups is less or equal 5, else it is
#'  'compact' (plot boxes using a smaller box style designed for plots with many groups).
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
#'    In addition, brushed units can be highlighted in the monitoring MD plot.
#'    Note that the window
#'    style of the other figures is set equal to that which contains the monitoring residual plot.
#'    In other words, if the monitoring residual plot is docked all the other figures will be docked too.
#'
#'    If \code{databrush=TRUE} the default selection tool is a rectangular brush and it is
#'    possible to brush only once (that is persist='').
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
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none

#' @examples
#'
#'  \dontrun{
#'  ##  Call of spmplot() without optional parameters.
#'  ##  Iris data: scatter plot matrix with univariate boxplots on the main
#'  ##  diagonal.
#'
#'  X <- iris[,1:4]
#'  group <- iris[,5]
#'  spmplot(X, group, variables=c('SL','SW','PL','PW'), dispopt="box")
#'
#'
#'  ##  Example of spmplot() called by routine fsmult().
#'  ##  Generate contaminated data.
#'      n <- 200; p <- 3
#'      X <- matrix(rnorm(n*p), ncol=3)
#'      Xcont <- X
#'      Xcont[1:5,] <- Xcont[1:5,] + 3
#'
#'  ##  spmplot is called automatically by all outlier detection methods, e.g. fsmult()
#'      out <- fsmult(Xcont, plot=TRUE);
#'
#'  ##  Now test the direct use of fsmult(). Set two groups, e.g. those obtained
#'  ##  from fsmult().
#'
#'      group = rep(0, n)
#'      group[out$outliers] <- 1

#'  ##  option 'labeladd' is used to label the outliers
#'  ##  By default, the legend identifies the groups with the identifiers
#'  ##  given in vector 'group'.
#'  ##  Set the colors for the two groups to blue and red.
#'
#'      spmplot(Xcont, group, col=c("blue", "red"), labeladd=1, dispopt="box")
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


spmplot <- function(X, group, plot,
        variables, col, cex, pch, labeladd, label, legend, dispopt=c("hist", "box"),
        tag,
##      overlay, selunit,
##      undock,             # currently not supported from R
        datatooltip, databrush,
        trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(X) | !(inherits(X, "data.frame") | inherits(X, "matrix") | inherits(X, "fsmeda")))
        stop("Function defined only for monitoring type output from forward search or a data matrix.")

    if(inherits(X, "fsmeda"))
    {
        outStr <- list(Un=out$Un, MAL=out$MAL, mmd=out$mmd, Y=out$X, class=getMatlabClass(class(out)))
        if(is.null(outStr$Y))
            stop("One or more required arguments are missing.")

        parlist <- list(list2MatlabStruct(outStr))
    } else {
        X <- as.matrix(X)
        outStr <- list(Y=X)

        parlist <- c(.jarray(outStr$Y, dispatch=TRUE))
    }

    control = list(...)

    if(!missing(group))
    {
        errmsg <- "The parameter 'group' must be a factor or a character or numeric vecotr with the same length as the number of rows of the data matrix."
        if(length(group) != nrow(outStr$Y))
            stop(errmsg)
        control$group <- if(is.factor(group))  as.character(group)
                         else if(is.numeric(group) | is.character(group)) group
                         else
                            stop(errmsg)
    }

    if(!missing(plot))
    {
        control$plo <- plot
    }

    if(!missing(variables))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$nameY <- as.character(variables)
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
    if(!missing(label))
    {
        errmsg <- "The parameter 'group' must be a factor or a character or numeric vecotr with the same length as the number of rows of the data matrix."
        if(length(label) != nrow(outStr$Y))
            stop("The parameter 'label' must be a character or numeric vecotr with the same length as the number of rows of the data matrix.")

        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()

        control$plo$label <- if(!is.character(label))  as.character(label) else label
    }
    if(!missing(legend))
    {
        if(length(which(names(control) == "plo")) == 0)
            control$plo <- list()
        control$plo$doleg <- if(is.logical(legend) && legend |
                                   is.character(legend) & legend =="on" |
                                   is.numeric(legend) & legend != 0) "on" else "off"
    }

    control$dispopt <- match.arg(dispopt)


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

    if(!missing(tag))
        control$tag <- as.character(tag)

    if(trace)
    {
        cat("\nOptional parameters to spmplot(): \n")
        print(control)
    }


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
    out <- callFsdaFunction("spmplot", "[Ljava/lang/Object;", 1, parlist)
    ans = list()
    freeMatlabResources(out)

    return(invisible(ans))
}


## Map R symbols to Matlab symbols
.map_pch <- function(pch)
{

    ##  R
    df <- data.frame(Matlab=c("square", "o", "^", "+", "x", "diamond", "v", ".", "*", "<", ">", "hexagram","<", ">", "pentagram",
                             "square", "o", "^", "diamond", "o", "o", "o", "square", "diamond", "^", "v"),
            Rnumber=c(0:25), stringsAsFactors=FALSE)

    if(length(ind <- which(pch == df$Rnumber)) > 0)
    {
        ret <- df[ind, "Matlab"]
    }else        {
        warning(paste0("Character ", df$Rnumber[ind], " not suported by Matlab. Will be replaced by 'o'."))
        ret <- "o"
    }

    ret
}

map_pch <- function(pch)
{
    pch <- sapply(pch, .map_pch)
    if(length(pch) == 1 && nchar(pch) > 1)
        pch[[2]] <- pch[[1]]

    pch
}
