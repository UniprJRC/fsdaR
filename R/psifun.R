
psifun <- function(u=vector(mode="double", length=0), p=1,
    fun=c("TB", "bisquare", "biweight", "HA", "hampel", "HU", "hubert", "HYP", "hyperbolic", "OPT", "optimal", "PD", "mdpd"),
    bdp, eff, const, param,
    trace=FALSE)
{
    rhofunc <- match.arg(fun)
    parlist <- c(.jarray(u, dispatch=TRUE), .jarray(p, dispatch=TRUE))
    control <- list(rhofunc=rhofunc)

    if(sum(c(!missing(bdp), !missing(eff), !missing(const))) > 1)
        stop("Wrong input arguments: only one of 'bdp', 'eff' or 'const' can be provided!")
    if(!missing(bdp))
        control$bdp <- as.double(bdp)
    if(!missing(eff))
        control$eff <- as.double(eff)
    if(!missing(const))
        control$c <- as.double(const)
    if(!missing(param)) {
        if(fun %in% c("HA", "hampel") && length(param) == 3)
            control$rhofuncparam <- as.double(param)
        else if(fun %in% c("HYP", "hyperbolic") && (length(param) == 1 || length(param) == 4))
            control$rhofuncparam <- as.double(param)
        else
            stop("Wrong input arguments: additional parameters are possible only for 'hampel' (a, b and c) and for 'hyperbolic' (only k or k, A, B and d)!")
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

    if(trace)  {
        cat("\nOptional parameters: \n")
        print(control)
    }

    matlabParams <- parlist
    out <- callFsdaFunction("RhoPsiWei", "[Ljava/lang/Object;", 1, matlabParams)
    if(is.null(out))
        return(NULL)

    arr1 <- .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr <- .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace) {
        cat("\nReturning from MATLAB RhoPsiWei().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    class <- getJavaString(arr, "class")
    c1 <- getJavaVector(arr, "c1")
    kc1 <- getJavaVector(arr, "kc1")
    bdp <- getJavaVector(arr, "bdp")
    eff <- getJavaVector(arr, "eff")

    ans = list(call=match.call(), class=class, c1=c1, kc1=kc1, bdp=bdp, eff=eff)

    ## If the vector u usa not missing, extract also the rho, psi, etc.
    if(length(u) > 0) {
        ans$rho <- getJavaVector(arr, "rho")
        ans$psi <- getJavaVector(arr, "psi")
        ans$pssider <- getJavaVector(arr, "psider")
        ans$psix <- getJavaVector(arr, "psix")
        ans$wei <- getJavaVector(arr, "psiwei")
    }

    freeMatlabResources(out)
    return(ans)
}
