levfwdplot <- function(out, xlim, ylim, xlab, ylab, main,
    lwd, lty, col, cex.lab, cex.axis, xvalues,
    fg.thresh, fg.unit, fg.labstep, fg.lwd, fg.lty, fg.col, fg.mark, fg.cex,
    bg.thresh, bg.style,
    xground=c("lev", "res"), tag, datatooltip, label, nameX, namey, msg, databrush,
    standard, fground, bground, ...)
{
    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "fsreda"))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are RES, Un, Bols, y and X. The R class name is mapped to a Matlab class name
    outStr <- list(RES=out$RES, LEV=out$LEV, Un=out$Un, y=out$y, X=out$X, Bols=out$Bols, class=getMatlabClass(class(out)))
    if(is.null(outStr$LEV) || is.null(outStr$Un) || is.null(outStr$y) || is.null(outStr$X) || is.null(outStr$Bols))
        stop("One or more required arguments are missing.")

    control = list(...)
    control$xground <- xground
    if(!missing(tag))
        control$tag <- as.character(tag)
    if(!missing(datatooltip))
        control$datatooltip <- datatooltip
    if(!missing(label))
        control$label <- label
    if(!missing(nameX))
        control$nameX <- nameX
    if(!missing(namey))
        control$namey <- namey
    if(!missing(msg))
        control$msg <- msg
    if(!missing(databrush))
        control$databrush <- databrush

    if(missing(standard))
        standard <- list()
    if(!missing(xlim))
        standard$xlim <- xlim
    if(!missing(ylim))
        standard$ylim <- ylim
    if(!missing(xlab))
        standard$labx <- xlab
    if(!missing(ylab))
        standard$laby <- ylab
    if(!missing(main))
        standard$titl <- main
    if(!missing(lwd))
        standard$LineWidth <- lwd
    if(!missing(lty))
        standard$LineStyle <- mapLineStyle(lty)
    if(!missing(col))
        standard$Color <- mapColor(col)
    if(!missing(cex.axis))
    {
        standard$SizeAxesNum <- 10  ## the default
        standard$SizeAxesNum <- cex.axis * standard$SizeAxesNum
    }
    if(!missing(cex.lab))
    {
        standard$SizeAxesLab <- 12  ## the default
        standard$SizeAxesLab <- cex.lab * standard$SizeAxesLab
    }
    if(!missing(xvalues))
    {
        ## the default:
        ## standard$xvalues <- (dim(out$RES)[1]-dim(out$RES)[2]+1):dim(out$RES)[1]
        standard$xvalues <- xvalues
    }

    if(length(standard) > 0)
        control$standard <- standard

    if(missing(fground))
        fground <- list()
    if(!missing(fg.thresh))
        fground$fthresh <- fg.thresh
    if(!missing(fg.unit))
        fground$funit <- fg.unit
    if(!missing(fg.labstep))
        fground$flabstep <- fg.labstep
    if(!missing(fg.lwd))
        fground$LineWidth <- fg.lwd
    if(!missing(fg.lty))
        fground$LineStyle <- mapLineStyle(fg.lty)
    if(!missing(fg.col))
        fground$Color <- mapColor(fg.col)
    if(!missing(fg.mark))
        fground$fmark <- ifelse(fg.mark, 1, 0)
    if(!missing(fg.cex))
    {
        fground$FontSize <- 12  ## the default
        fground$FontSize <- fg.cex * fground$FontSize
    }

    if(length(fground) > 0)
        control$fground <- fground

    if(missing(bground))
        bground <- list()
    if(!missing(bg.thresh))
        bground$bthresh <- bg.thresh
    if(!missing(bg.style))
        bground$bstyle <- bg.style

    if(length(bground) > 0)
        control$bground <- bground

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

    parlist = c(parlist, .jnew("java/lang/String", "msg"),
                .jnew("java/lang/Double", as.double(1.0)))

    matlabParams <- parlist

    matlabResult <- callFsdaFunction("levfwdplot", "[Ljava/lang/Object;", 1, matlabParams)
    if(is.null(matlabResult))
        return(NULL)

    arr1 = .jcast(matlabResult[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    # The 'arr' variable is a MATLAB struct containing all the info returned
    # by the resfwdplot() MATLAB function. Now 'arr' must be converted into an R list
    # ('ans') containing all the return info from the resfwdplot() R function

    ans = list()

    # Libera le risorse MATLAB create a runtime
    freeMatlabResources(out)

    return(invisible(ans))
}
