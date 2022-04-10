resindexplot <- function(out, x, xlim, ylim, xlab, ylab, main, numlab, indlab,
    conflev, cex.axis, cex.lab, lwd, nameX, namey, tag, col, cex, databrush, ...)
{
    ## Perform check on the structure of 'out'
    if(missing(out))
        stop("Input residuals missing.")
    if(is.list(out))
    {
        ## The needed elements are residuals, y and X. The R class name is mapped to a Matlab class name
        ##  (y and X are needed only if the option databrush is specified)
        outStr <- list(residuals=out$residuals, y=out$y, X=out$X, class=getMatlabClass(class(out)))
        if(is.null(outStr$residuals) || is.null(outStr$y) || is.null(outStr$X))
            stop("One or more required arguments are missing.")
    }else
        outStr <- list(residuals=as.vector(out))

    control = list(...)
    if(!missing(tag))
        control$tag <- as.character(tag)
    if(!missing(x))
    {
        if(length(x) != length(outStr$residuals))
            stop("Vectors must be the same length.")
        control$x <- as.double(x)
    }
    if(!missing(nameX))
        control$nameX <- nameX
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
    if(!missing(xlab))
        control$labx <- xlab
    if(!missing(ylab))
        control$laby <- ylab
    if(!missing(main))
        control$title <- main
    if(!missing(lwd))
    {
        if(lwd <= 0)
            stop("Value of 'lwd'should be greater than 0!")
        control$lwdenv <- lwd
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
    if(!missing(indlab)) {
        if(!missing(numlab))
            warning("Both 'numlab' and 'indlab' are specified. The latter will be ignored.")
        else{
            control$numlab <- as.numeric(indlab)
            if(any(control$numlab <= 0))
                stop("Index in 'indlab' cannot be negative or 0!")
        }
    }

    if(!missing(conflev))
        control$conflev <- conflev

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
            matlabValue = if(paramName == "numlab" && length(paramValue) == 1 && is.numeric(paramValue) && paramValue < 0)
                                rType2MatlabType(paramName, abs(paramValue), asCellArray=TRUE)
                          else  rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    matlabParams <- parlist
    matlabResult <- callFsdaFunctionNoArgout("resindexplot", "[Ljava/lang/Object;", matlabParams)
    if(is.null(matlabResult))
        return(NULL)

    ans = list()

    # Libera le risorse MATLAB create a runtime
    freeMatlabResources(matlabResult)

    return(invisible(ans))
}
