######
##  VT::18.08.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Plots the trajectory of minimum Mahalanobis distance (mmd)
#'
#' @description Plots the trajectory of minimum Mahalanobis distance (mmd)
#'
#' @param out a numeric vector or an object of S3 class (one of \code{\link{fsmult.object}},
#'  \code{\link{smult.object}} or \code{\link{mmmult.object}}) returned by
#'  one of the functions
#'  \code{\link{fsmult}} or \code{\link{smult}} or \code{\link{mmmult}} -
#'  a list containing the monitoring of minimum Mahalanobis distance
#'
#' @param p If \code{out} is a vector, p is the number of variables of the
#'  original data matrix which have been used to compute md.
#'
#' @param xlab A title for the x axis
#' @param ylab A title for the y axis
#' @param main An overall title for the plot
#' @param nameX Add variable labels in the plot. A vector of strings of length \code{p}
#'  containing the labels of the variables of the original data matrix \code{X}.
#'  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
#'
#' @param conflev confidence interval for the horizontal bands. It can be a vector of
#'  different confidence level values, e.g. c(0.95, 0.99, 0.999).
#'  The confidence interval is based on the chi^2 distribution.
#'
#' @param numlab Number of points to be labeled in the plot. If \code{numlab} is a
#'  single number, e.g. \code{numlab]k}, the units with the \code{k} largest
#'  md are labelled in the plots. If \code{numlab} is a vector, the units indexed
#'  by the vector are labelled in the plot. Default is \code{numlab=5}, i.e. the 5 units
#'  units with the largest md are labelled. Use \code{numlab=""} for no labelling.
#'
#' @param tag Tag of the figure which will host the malindexplot. The default tag is \code{tag="pl_malindex"}.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#'
#' @param ... potential further arguments passed to lower level functions.

#' @return  none

#' @references
#'       Atkinson and Riani (2000), Robust Diagnostic Regression Analysis, Springer Verlag, New York.
#'

#' @examples
#'
#'  \dontrun{
#'  ##  Mahalanobis distance plot of 100 random numbers.
#'  ##  Numbers are from from the chisq with 5 degrees of freedom
#'
#'  malindexplot(rchisq(100, 5), 5)
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

malindexplot <- function(out, p, xlab, ylab, main, nameX, conflev,
##  xlim, ylim,
        numlab,
##  cex.axis, cex.lab, lwd,
        tag,
##  col, cex, databrush,

        trace=FALSE, ...)
{
    md <- NULL
    v <- NULL

    ## Perform check on the structure of 'out'
    if(missing(out))
        stop("Input distances missing.")

    if(is.list(out))
    {
        if(class(out) == "fsm" | class(out) == "smult" | class(out) == "mmmult")
        {
            ## The needed elements are mahalanobis distances, md and number of variables p.
            ##  The R class name is mapped to a Matlab class name
            ##  (X is needed only if the option databrush is specified)
            md <- out$md
            v <- ncol(out$X)
        } else
            stop(paste("Unexpected class as input to malindexplot(): ", class(out)))
    }else
    {
        md <- as.vector(out)
        if(!missing(p))
            v <- p
    }
    if(is.null(md) || is.null(v))
        stop("One or more required arguments are missing.")

    control = list(...)

    if(!missing(xlab))
        control$labx <- xlab
    if(!missing(ylab))
        control$laby <- ylab
    if(!missing(main))
        control$title <- main
    if(!missing(nameX))
        control$nameY <- nameX

    if(!missing(conflev)) {
        control$conflev <- conflev
    } else {
        control$conflev <- 0.975
    }

    if(!missing(numlab))
    {

        if(is.null(numlab))
            numlab <- ""
        if(length(numlab) == 1 && numlab == 0)
            numlab <- ""
        if(length(numlab) > 1 || numlab != "")
            numlab <- as.numeric(numlab)
        if(numlab != "" && any(numlab <= 0))
            stop("Index in 'numlab' cannot be negative or 0!")
        if(length(numlab) == 1 && is.numeric(numlab))       ## number of labels, set it as negative
            numlab <- -numlab

        control$numlab <- numlab
    }

    if(!missing(tag))
        control$tag <- as.character(tag)

if(FALSE)
{
    if(!missing(x))
    {
        if(length(x) != length(outStr$residuals))
            stop("Vectors must be the same length.")
        control$x <- as.double(x)
    }
    if(!missing(namey))
        control$namey <- namey
    if(!missing(xlim))
    {
        if(!is.numeric(xlim) || length(xlim) != 2 || xlim[2] <= xlim[1])
            stop("The value of 'xlim' must be a numeric vector with length 2 in which the second element is larger than the first and may be Inf.")
        control$xlimx <- xlim
    }
    if(!missing(ylim))
    {
        if(!is.numeric(ylim) || length(ylim) != 2 || ylim[2] <= ylim[1])
            stop("The value of 'ylim' must be a numeric vector with length 2 in which the second element is larger than the first and may be Inf.")
        control$ylimy <- ylim
    }
    if(!missing(lwd))
    {
        if(lwd <= 0)
            stop("Value of 'lwd'should be greater than 0!")
        control$lwdenv <- lwd
    }


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
    if(!missing(col))
    {
        control$MarkerFaceColor <- mapColor(col)[1]
    }
    if(!missing(cex))
    {
        control$MarkerSize <- 6  ## the default
        control$MarkerSize <- cex * control$MarkerSize
    }
    if(!missing(databrush))
    {
        if(is.logical(databrush) && !databrush)     # FALSE is no brushing, set databrush to empty
            databrush <- ""
        if((is.list(databrush) || length(databrush) == 1 && databrush != "") && (length(which(names(outStr) == "y")) != 1 | length(which(names(outStr) == "X")) != 1))
            stop("With databrush option, this function requires an input list including two elements 'y' and 'X' containing the original data.")

        control$databrush <- databrush
    }
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
    parlist = c(.jarray(md, dispatch=TRUE), .jnew("java/lang/Double", as.double(v)))

    paramNames = names(control)

    if (length(paramNames) > 0) {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i];
            paramValue = control[[i]];
            matlabValue = if(paramName == "numlab" && length(paramValue) == 1 && is.numeric(paramValue) && paramValue < 0)
                                rType2MatlabType(paramName, abs(paramValue), asCellArray=TRUE)
                          else  rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    matlabParams <- parlist
    callFsdaFunction("malindexplot", "[Ljava/lang/Object;", 1, matlabParams)
    # if(is.null(matlabResult))
    #     return(NULL)

    ans = list()

    # Libera le risorse MATLAB create a runtime
    freeMatlabResources(out)

    return(invisible(ans))
}
