
myrng <- function(seed)
{
    if(missing(seed)) {
        eff_seed <- floor(2^15*runif(1)) + 1
        print(sprintf("Seed for session: %s", eff_seed))
        seed <- eff_seed
    }

    parlist <- c(.jarray(as.double(seed), dispatch=TRUE))

    matlabParams <- parlist
    out <- callFsdaFunction("myrng", "[Ljava/lang/Object;", 1, matlabParams)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)
    ret <- arr1$getInt()
    freeMatlabResources(out)
    return(ret)
}
