######
##  Sreg_control
##
##  Creates an object of class Sreg_control to be used with the 'fsreg' function,
##  containing various control parameters. Used o call the MATLAB function 'Sreg'.
##
##  - 'plots' should not be seen by the R user - always 0, but currently it is included.
##  - 'intercept' can be changed later by the R 'fsreg' function called - depending on the formula
##  - 'yxsave' (wheather to return x and y) will not be used - I will return it from R, if requested
##      by the model, x.ret and y.ret parameters.
##
Sreg_control <- function(intercept=TRUE, bdp=0.5,
        rhofunc=c('bisquare', 'optimal', 'hyperbolic', 'hampel'), rhofuncparam, nsamp=1000,
        refsteps=3, reftol=1e-6, refstepsbestr=50, reftolbestr=1e-8, minsctol=1e-7, bestr=5,
        conflev, msg=TRUE, nocheck=FALSE, plot=FALSE)
{
    rhofunc <- match.arg(rhofunc)
    ctrl <- list(intercept=ifelse(intercept, 1, 0), bdp=bdp, rhofunc=rhofunc, nsamp = nsamp,
        refsteps=refsteps, reftol=reftol, refstepsbestr=refstepsbestr, reftolbestr=reftolbestr, minsctol=minsctol, bestr=bestr,
        msg=mapMessage(msg), nocheck=ifelse(nocheck, 1, 0),
        plots=ifelse(plot, 1, 0), outclass="sreg")

    if(!missing(rhofuncparam))
        ctrl$rhofuncparam <- rhofuncparam
    if(!missing(conflev))
        ctrl$conflev <- conflev

    structure(ctrl, class = "Sreg_control")
}

Sregeda_control <- function(intercept=TRUE, bdp=seq(0.5, 0.01, -0.01),
        rhofunc=c('bisquare', 'optimal', 'hyperbolic', 'hampel'), rhofuncparam, nsamp=1000,
        refsteps=3, reftol=1e-6, refstepsbestr=50, reftolbestr=1e-8, minsctol=1e-7, bestr=5,
        conflev, msg=TRUE, nocheck=FALSE,
        plot=FALSE)
{
    rhofunc <- match.arg(rhofunc)
    ctrl <- list(intercept=ifelse(intercept, 1, 0), bdp=bdp, rhofunc=rhofunc, nsamp = nsamp,
        refsteps=refsteps, reftol=reftol, refstepsbestr=refstepsbestr, reftolbestr=reftolbestr, minsctol=minsctol, bestr=bestr,
        msg=mapMessage(msg), nocheck=ifelse(nocheck, 1, 0),
        plots=ifelse(plot, 1, 0), outclass="sregeda")

    if(!missing(rhofuncparam))
        ctrl$rhofuncparam <- rhofuncparam
    if(!missing(conflev))
        ctrl$conflev <- conflev

    structure(ctrl, class = "Sregeda_control")
}



######
##  MMreg_control
##
##  Creates an object of class MMreg_control to be used with the 'MMreg' function,
##  containing various control parameters. Used to call the MATLAB function 'MMreg'.
##
##  - 'plots' should not be seen by the R user - always 0, but currently it is included.
##  - 'intercept' can be changed later by the R 'fsreg' function called - depending on the formula
##  - 'yxsave' (wheather to return x and y) will not be used - I will return it from R, if requested
##      by the model, x.ret and y.ret parameters.
##
MMreg_control <- function(intercept=TRUE, InitialEst, Soptions, eff, effshape,
        rhofunc=c('bisquare', 'optimal', 'hyperbolic', 'hampel'), rhofuncparam,
        refsteps=3, tol=1e-7,
        conflev, msg=TRUE, nocheck=FALSE,
        plot=FALSE)
{
    rhofunc <- match.arg(rhofunc)
    ctrl <- list(intercept=ifelse(intercept, 1, 0), rhofunc=rhofunc,
        refsteps=refsteps, tol=tol,
        msg=mapMessage(msg), nocheck=ifelse(nocheck, 1, 0),
        plots=ifelse(plot, 1, 0), outclass="mmreg")

    if(!missing(rhofuncparam))
        ctrl$rhofuncparam <- rhofuncparam
    if(!missing(InitialEst))
        ctrl$InitialEst <- InitialEst
    if(!missing(Soptions))
        ctrl$Soptions <- Soptions
    if(!missing(eff))
        ctrl$eff <- eff
    if(!missing(effshape))
        ctrl$effshape <- effshape
    if(!missing(conflev))
        ctrl$conflev <- conflev

    structure(ctrl, class = "MMreg_control")
}

######
##  MMregeda_control
##
##  Creates an object of class MMregeda_control to be used with the 'MMregeda' function,
##  containing various control parameters. Used To call the MATLAB function 'MMregeda'.
##
##  - 'plots' should not be seen by the R user - always 0, but currently it is included.
##  - 'intercept' can be changed later by the R 'fsreg' function called - depending on the formula
##  - 'yxsave' (wheather to return x and y) will not be used - I will return it from R, if requested
##      by the model, x.ret and y.ret parameters.
##
MMregeda_control <- function(intercept=TRUE, InitialEst, Soptions, eff, effshape,
        refsteps=3, tol=1e-7,
        conflev, nocheck=FALSE,
        plot=FALSE)
{
    ctrl <- list(intercept=ifelse(intercept, 1, 0),
        refsteps=refsteps, tol=tol,
        nocheck=ifelse(nocheck, 1, 0),
        plots=ifelse(plot, 1, 0), outclass="mmregeda")

    if(!missing(InitialEst))
        ctrl$InitialEst <- InitialEst
    if(!missing(Soptions))
        ctrl$Soptions <- Soptions
    if(!missing(eff))
        ctrl$eff <- eff
    if(!missing(effshape))
        ctrl$effshape <- effshape
    if(!missing(conflev))
        ctrl$conflev <- conflev

    structure(ctrl, class = "MMregeda_control")
}
