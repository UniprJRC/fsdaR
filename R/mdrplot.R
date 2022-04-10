## VT::23.07.2021 -
mdrplot <- function(out, quant=c(0.01, 0.5, 0.99), sign=TRUE, mplus1=FALSE, envm,
    xlim, ylim, xlab, ylab, main,
    lwdenv, lwd, cex.lab, cex.axis,
    tag, datatooltip, label, nameX, namey, databrush,
    ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "fsreda"))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are RES, Un, Bols, y and X. The R class name is mapped to a Matlab class name
    outStr <- list(Un=out$Un, mdr=out$mdr, y=out$y, X=out$X, Bols=out$Bols, class=getMatlabClass(class(out)))
    if(is.null(outStr$Un) || is.null(outStr$mdr) || is.null(outStr$y) || is.null(outStr$X) || is.null(outStr$Bols))
        stop("One or more required arguments are missing.")

    control = list(...)

    control$quant <- quant
    control$sign <- ifelse(sign, 1, 0)
    control$mplus1 <- ifelse(mplus1, 1, 0)
    if(!missing(envm))
        control$envm <- envm

    if(!missing(xlim))
        control$xlimx <- xlim
    if(!missing(ylim))
        control$ylimy <- ylim
    if(!missing(xlab))
        control$labx <- xlab
    if(!missing(ylab))
        control$laby <- ylab
    if(!missing(main))
        control$titl <- main
    if(!missing(lwdenv))
        control$lwdenv <- lwdenv
    if(!missing(lwd))
        control$lwd <- lwd
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
    if(!missing(databrush))
        control$databrush <- databrush

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
    matlabResult <- callFsdaFunction("mdrplot", "[Ljava/lang/Object;", 1, matlabParams)

    ans = list()

    # Libera le risorse MATLAB create a runtime
    freeMatlabResources(matlabResult)

    return(invisible(ans))
}
