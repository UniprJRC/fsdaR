######
##  FSR_control
##
##  Creates an object of class FSR_control to be used with the 'fsreg' function,
##  containing various control parameters.
##
##  - 'plots' should not be seen by the R user - always 0, but currently it is included.
##  - 'intercept' can be changed later by the R 'fsreg' function called - depending on the formula
##  - 'yxsave' (wheather to return x and y) will not be used - I will return it from R, if requested
##      by the model, x.ret and y.ret parameters.
##
FSR_control <- function(intercept=TRUE, h, nsamp=1000, lms=1, init,
    nocheck=FALSE, bonflev='', msg=TRUE, bsbmfullrank=TRUE,
    plot=FALSE,
    bivarfit=FALSE, multivarfit=FALSE,
    labeladd=FALSE, nameX, namey, ylim, xlim)
{
    ctrl <- list(intercept=ifelse(intercept, 1, 0), nsamp = nsamp, lms=lms,
        nocheck=ifelse(nocheck, 1, 0), bonflev=bonflev, msg=mapMessage(msg),
        bsbmfullrank=ifelse(bsbmfullrank, "1", ""),
        labeladd=ifelse(labeladd, "1", ""), outclass="fsr")

    ctrl$plots <- if(is.logical(plot)) ifelse(plot, 1, 0)
                  else if(plot == 2) 2
                  else
                  stop("Wrong value for argument 'plot': can be TRUE/FALSE or 0 or 1 or 2")

    if(bivarfit == "")
        xxx=0 # accept but do nothing
    else if(bivarfit %in% c("0", "1", "2", "i1", "i2", "i3"))
        ctrl$bivarfit <- bivarfit
    else if(is.logical(bivarfit))
    {
        if(bivarfit)
            ctrl$bivarfit <- '1'
    }
    else if(is.numeric(bivarfit))
        if(bivarfit>=0 & bivarfit<=2)
            ctrl$bivarfit <- as.character(bivarfit)
        else
            stop("Wrong value for argument 'bivarfit': can be TRUE/FALSE or 1 or 2")
    else
        stop("Wrong value for argument 'bivarfit': can be TRUE/FALSE or 1 or 2")

    if(multivarfit == "")
        xxx=0   # accept but do nothing
    else if(multivarfit %in% c("0", "1", "2"))
        ctrl$multivarfit <- multivarfit
    else if(is.logical(multivarfit))
    {
        if(multivarfit)
            ctrl$multivarfit <- '1'
    } else if(is.numeric(multivarfit))
        if(multivarfit >= 0 & multivarfit <= 2)
            ctrl$multivarfit <- as.character(multivarfit)
        else
            stop("Wrong value for argument 'multivarfit': can be TRUE/FALSE, 1 or 2")
    else
        stop("Wrong value for argument 'multivarfit': can be TRUE/FALSE, 1 or 2")

    if(!missing(h))
        ctrl$h <- h
    if(!missing(init))
        ctrl$init <- init
    if(!missing(nameX))
        ctrl$nameX <- nameX
    if(!missing(namey))
        ctrl$namey <- namey
    if(!missing(xlim))
        ctrl$xlim <- xlim
    if(!missing(ylim))
        ctrl$ylim <- ylim

    structure(ctrl, class = "FSR_control")
}

FSReda_control <- function (intercept=TRUE, init, nocheck=FALSE, tstat=c("trad", "scal"), conflev=c(0.95, 0.99))
{
    tstat <- match.arg(tstat)
    ctrl <- list(intercept=ifelse(intercept, 1, 0), nocheck=ifelse(nocheck, 1, 0), tstat=tstat, conflev=conflev,
        outclass="fsreda")

    if(!missing(init))
        ctrl$init <- init

    structure(ctrl, class = "FSReda_control")
}

######
##  LXS_control
##
##  Creates an object of class LXS_control to be used with the 'LXS' function,
##  containing various control parameters. Used To call the MATLAB function 'LXS'.
##
##  - 'plots' should not be seen by the R user - always 0, but currently it is included.
##  - 'intercept' can be changed later by the R 'fsreg' function called - depending on the formula
##  - 'yxsave' (wheather to return x and y) will not be used - I will return it from R, if requested
##      by the model, x.ret and y.ret parameters.
##
LXS_control <- function(intercept=TRUE, lms, h, bdp, nsamp, rew=FALSE,
        conflev=0, msg=TRUE, nocheck=FALSE, nomes=FALSE,
        plot=FALSE)
{
    ctrl <- list(intercept=ifelse(intercept, 1, 0), rew=ifelse(rew, 1, 0),
    conflev=conflev, msg=mapMessage(msg), nocheck=ifelse(nocheck, 1, 0), nomes=ifelse(nomes, 1, 0),
    plots=ifelse(plot, 1, 0))

    if(missing(lms))
        lms <- 1
    else
    {
        if(is.character(lms))
        {
            if(toupper(lms) != "LMS" & toupper(lms) != "LTS")
                lms <- "lts"
            ctrl$lms <- ifelse(toupper(lms) == "LMS", 1, 2)
        }else if(is.numeric(lms) & lms >=1 & lms <= 2)
            ctrl$lms <- lms
        else if(is.list(lms))
            ctrl$lms <- lms
        else
            stop("Invalid parameter 'lms'! Must be one of 'lms', 'lts', 1=lms, 2=lts or a list with LTS options.")
    }
    if(!missing(h))
        ctrl$h <- h
    if(!missing(bdp))
        ctrl$bdp <- bdp
    if(!missing(nsamp))
        ctrl$nsamp <- nsamp

    ctrl$outclass <- ifelse(lms==1, "fsdalms", "fsdalts")

    structure(ctrl, class = "LTSreg_control")
}

.defaultControl <- function(monitoring=FALSE, family = c("homo", "hetero", "bayes", "mult"), method = c("FS", "S", "MM", "LTS", "LMS"), ...)
{
    family <- match.arg(family)
    method <- match.arg(method)

    res <- NULL
    if(family == "mult")
    {

##        if(method=="FS")
##        {
##                res <- if(!monitoring) FSM_control() else FSMeda_control()
##        } else if(method=="S")
##                res <- if(!monitoring) Smult_control() else Smulteda_control()
##        else if(method=="MM")
##                res <- if(!monitoring) MMmult_control() else MMmulteda_control()
##        else
##            stop(paste("Undefined method: ", method))

    } else
    {
        if(method=="FS")
        {
            if(family=="homo")
                res <- if(!monitoring) FSR_control(...) else FSReda_control(...)
            else
                stop("Families 'hetero' and 'bayes' not yet implemented")

    ##        if (family=="hetero")
    ##            res <- if(!monitoring) FSRH_control() else FSRHeda_control()
    ##        else if (family=="bayes")
    ##            res <- FSRB_control()

        } else if(method=="S")
                res <- if(!monitoring) Sreg_control() else Sregeda_control()
        else if(method=="MM")
                res <- if(!monitoring) MMreg_control() else MMregeda_control()
        else if(method=="LTS")
                res <- LXS_control(lms="lms")
        else if(method=="LMS")
                res <- LXS_control(lms="lts")
        else
            stop(paste("Undefined method: ", method))
    }
    res
}

## If the control object 'control' is not missing, add to it the parameters
##  passed on the function call (in the dots). Otherwise create a new control object
##  passing it the optional parameters.
.setControl <- function(monitoring, family, method, control, ...)
{
    ## 'mycontrol' contains all default parameters plus those that were passed on the function call (in the dots).
    mycontrol <- .defaultControl(monitoring, family, method, ...)
    if(missing(control))
        return(mycontrol)

    if(class(control) != class(mycontrol))
        stop(paste0("Wrong control object provided - if supplied, the control object must be of class ", class(mycontrol), "!"))

    ## A control object wa supplied and we want to override those element that were passed on the function call.
    ##  First delete from 'mycontrol' all elements that are default
    tempcontrol <- .defaultControl(monitoring, family, method)  # a control object with all default elements
    for(xname in names(tempcontrol))
        if(identical(tempcontrol[[xname]], mycontrol[[xname]]))
            mycontrol[[xname]] <- NULL

    ## Now copy the remaining (those passed on the fucntion call) to the control object and return it.
    for(xname in names(mycontrol))
        control[[xname]] <- mycontrol[[xname]]
    return(control)
}

mapMessage <- function(msg)
{
    if(!is.logical(msg))
    {
        if(msg == "")
            msg <- FALSE
        else if(msg == "1")
            msg <- TRUE
        else if(msg == "0")
            msg <- FALSE
        else
            stop("Argument 'msg' must be TRUE or FALSE")
    }
    ifelse(msg, 1, 0)
}
