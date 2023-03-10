######
##  VT::09.03.2023
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#'  Set seed for the MATLAB random number generator
#'
#' @description Initializes the MATLAB random generator
#'
#' @param seed a single value, interpreted as an integer
#'
#' @return  Integer, the seed value with which the MATLAB random number generator was initialized.

#' @examples
#'
#'  \dontrun{
#'    data(wool)
#'    XX <- wool
#'    y <- XX[, ncol(XX)]
#'    X <- XX[, 1:(ncol(XX)-1), drop=FALSE]
#'
#'    seed <- myrng()                       #i nitialized the RNG and keep the seed
#"    (out1 <- fsreg(X, y, method="LTS"))
#'
#'    myrng(seed)                           # repeat the computations with the same seed
#'    (out2 <- fsreg(X, y, method="LTS"))
#'
#'    all.equal(out1, out2)
#'
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}
#'

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
