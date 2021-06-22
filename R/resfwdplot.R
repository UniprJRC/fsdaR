resfwdplot <- function(out, xlim, ylim, xlab, ylab, main,
    lwd, lty, col, cex.lab, cex.axis, xvalues,
    fg.thresh, fg.unit, fg.labstep, fg.lwd, fg.lty, fg.col, fg.mark, fg.cex,
    bg.thresh, bg.style,
    tag, datatooltip, label, nameX, namey, msg, databrush,
    standard, fground, bground, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) | !(inherits(out, "fsreda") | inherits(out, "sregeda") | inherits(out, "mmregeda")))
        stop("Function defined only for monitoring type output.")

    ## The needed elements are RES, X, y, and Un (FS) or bdp (S) or eff (MM).
    ## The R class name is mapped to a Matlab class name
    outStr <- list(RES=out$RES, y=out$y, X=out$X, class=getMatlabClass(class(out)))

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

    control <- list(...)

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

        ## VT::11.08.2020 - MATLAB wants doubles
        standard$xvalues <- as.double(xvalues)
   }

    if(length(standard) > 0)
    {
        ## VT::11.08.2020 - MATLAB wants doubles
         if(!is.null(standard$xvalues))
            standard$xvalues <- as.double(standard$xvalues)

        control$standard <- standard
    }
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

    # Hard-wire msg parameter to 1, thereby forcing the underlying MATLAB function
    # to return the plotpopt struct
    control$msg = 1

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

            matlabValue = rType2MatlabType(paramName, paramValue, forceStringsToCellArray = TRUE)

            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    ## VT::16.10.2017 - comment out the convertion of the list to a Matlab structure - this
    ##  will not work, because the optional paramaters are without names and list2MatlabStruct() will
    ##  skip them. This is actually not necessary, since the mandatory parameters are already a structure,
    ##  and any of the optional parameters, which is an R list was already converted to a matlab structure.
    ##
    ##    matlabParams = list2MatlabStruct(parlist)
    matlabParams <- parlist

    matlabResult <- callFsdaFunction("resfwdplot", "[Ljava/lang/Object;", 1, matlabParams)
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

getMatlabClass <- function(class)
{
  matlabClass = "unknown"
  switch(class,
         fsreda = {
           matlabClass = "FSReda"
         },
         fsrheda = {
           matlabClass = "FSRHeda"
         },
         sregeda = {
           matlabClass = "Sregeda"
         },
         mmregeda = {
           matlabClass = "MMregeda"
         },
         fsr = {
           matlabClass = "FSR"
         },
         fshr = {
           matlabClass = "FSRH"
         },
         fsrb = {
           matlabClass = "FSRB"
         },
         sreg = {
           matlabClass = "Sreg"
         },
         mmreg = {
           matlabClass = "MMreg"
         },
         fsdalts = {
           matlabClass = "LTS"
         },
         fsdalms = {
           matlabClass = "LMS"
         },
         fsmult = {
           matlabClass = "FSM"
         },
         smult = {
           matlabClass = "Smult"
         },
         mmmult = {
           matlabClass = "MMmult"
         },
         fsmeda = {
           matlabClass = "FSMeda"
         },
         smulteda = {
           matlabClass = "Smulteda"
         },
         mmmulteda = {
           matlabClass = "MMmulteda"
         },
         fsmmmdrs = {
           matlabClass = "FSMmmdrs"
         }
         )

    if(matlabClass == "unknown")
        stop(paste0("Object of unknown class: ", class, "!"))

    return(matlabClass)
}

## Map R line types to Matlab line styles
mapLineStyle <- function(lty)
{
    .mapLineStyle <- function(lty=c("solid", "dashed", "dotted", "dotdash", "longdash", "twodash", "1", "2", "3", "4", "5", "6"))
    {
        ##  Matlab:
        ##  '-'     Solid line          1   "solid"
        ##  '--'	Dashed line         2   "dashed"
        ##  ':'     Dotted line         3   "dotted"
        ##  '-.'    Dash-dot line       4   "dotdash"

        ##  R
        ##  (0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash)
        ##  "blank", "solid", "dashed", "dotted", "dotdash", "longdash", or "twodash", where "blank" uses ?invisible lines?

        if(is.numeric(lty))
            lty <- as.character(lty)
        lty <- match.arg(lty)
        df <- data.frame(Matlab=c("-", "--", ":", "-.", NA, NA), Rname=c("solid", "dashed", "dotted", "dotdash", "longdash", "twodash"), Rnumber=1:6, stringsAsFactors=FALSE)

        if(length(ind <- which(lty == df$Rname | lty == df$Rnumber)) > 0)
        {
            ret <- df[ind, "Matlab"]
            if(is.na(ret))
            {
                warning(paste0("Line type ", df$Rname[ind], " not suported by Matlab. Will be replaced by '", df$Rname[1]), "'.")
                ret <- df$Matlab[1]
            }
        }
        ret
    }

    lty <- sapply(lty, .mapLineStyle)
    if(length(lty) == 1)
        lty[[2]] <- lty[[1]]

    lty
}

## Map R line colors to Matlab line colors
.mapColor <- function(col=c("none", "auto", "red", "green", "blue", "cyan", "magenta", "yellow", "black", "white", "0", "1", "2", "3", "4", "5", "6", "7"))
{
    ##  Matlab:
    ##  r	Red
    ##  g	Green
    ##  b	Blue
    ##  c	Cyan
    ##  m	Magenta
    ##  y	Yellow
    ##  k	Black
    ##  w	White

    ##  R
    ##  (1=black, 2=red, 3=green, 4=blue, 5=cyan, 6=magenta, 7=yellow, 8=)
    df <- data.frame(Matlab=c("r", "g", "b", "c", "m", "y", "k", "w"), Rname=c("red", "green", "blue", "cyan", "magenta", "yellow", "black", "white"), Rnumber=c(2:7, 1, 0), stringsAsFactors=FALSE)

    if(length(col) == 1 && is.numeric(col))
        col <- as.character(col)

    if(length(col) == 1 && (col == "none" | col == "auto"))
        ret <- col
    else if(is.numeric(col) & length(col) == 3)
        ret <- col
    else
    {
        col <- match.arg(col)
        if(length(ind <- which(col == df$Rname | col == df$Rnumber)) > 0)
        {
            ret <- df[ind, "Matlab"]
            if(is.na(ret))
            {
                warning(paste0("Color ", df$Rname[ind], " not suported by Matlab. Will be replaced by '", df$Rname[1]), "'.")
                ret <- df$Matlab[1]
            }
        }
    }
    ret
}

mapColor <- function(col)
{
    col <- sapply(col, .mapColor)
    if(length(col) == 1 && col != "none" && col != "auto")
        col[[2]] <- col[[1]]

    col
}
