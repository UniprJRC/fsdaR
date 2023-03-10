######
##  VT::09.03.2023
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#'  Finds the tuning constant(s) associated to the supplied breakdown point or asymptotic efficiency for different psi functions
#'
#' @description Finds the tuning constant(s) associated to the supplied
#'  breakdown point or asymptotic efficiency or computes breakdown point and
#'  efficiency associated with the supplied constant(s) for the following psi functions:
#'  TB=Tukey biweight, HA=Hampel, HU=Huber, HYP=Hyperbolic, OPT=Optimal, PD=mdpd.
#'
#' @param u optional vector containing scaled residuals or Mahalanobis
#'  distances for the \code{n} units of the sample. If not provided,
#'  rho, psi, psider, psix and weights are not computed
#' @param p number of variables (\code{p=1} for regression)
#' @param fun psi function class. One of TB, HA, HU, HP, OPT or PD.
#' @param bdp requested breakdown point
#' @param eff requested asymptotic efficiency
#' @param const tuning constant c
#' @param param additional parameters
#' @param trace whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @return  A list will be returned
#'  containing the following elements:
#'  \enumerate{
#'  \item \code{class}:  link function which has be used. Possible values are
#'      'bisquare', 'optimal', 'hyperbolic', 'hampel', 'huber' or 'mdpd'
#'  \item \code{bdp}: breakdown point
#'  \item \code{eff}: asymptotic efficiency
#'  \item \code{c1}: consistency factor (and other parameters) associated
#'      to required breakdown point or nominal efficiency.
#'  \item \code{kc1}: Expectation of rho associated with \code{c1} to get a
#'      consistent estimator at the model distribution
#'      \code{kc1 = E(rho) = sup(rho)*bdp}
#'  \item \code{rho}: vector of length \code{n} which contains the rho
#'      function associated to the residuals or Mahalanobis distances
#'      for the \code{n} units of the sample. Empty if \code{u} is not provided.
#'  \item \code{psi}: vector of length \code{n} which contains the psi
#'      function associated with the residuals or Mahalanobis distances
#'      for the \code{n} units of the sample. Empty if \code{u} is not provided.
#'  \item \code{psider}: vector of length \code{n} which contains the derivative of the
#'      psi function associated with the residuals or Mahalanobis distances
#'      for the \code{n} units of the sample. Empty if \code{u} is not provided.
#'  \item \code{psix}: vector of length \code{n} which contains
#'      the psi function mutiplied by u
#'      associated with the residuals or Mahalanobis distances
#'      for the \code{n} units of the sample. Empty if \code{u} is not provided.
#'  \item \code{wei}: vector of length \code{n} which contains the weights
#'      associated with the residuals or Mahalanobis distances
#'      for the \code{n} units of the sample. Empty if \code{u} is not provided.
#'  }
#'
#' @references
#'  Hoaglin, D.C. and Mosteller, F. and Tukey, J.W. (1982), \emph{Understanding Robust and Exploratory Data Analysis}, Wiley, New York.
#'
#'  Huber, P.J. (1981), \emph{Robust Statistics}, Wiley.
#'
#'  Huber, P.J. and Ronchetti, E.M. (2009), \emph{Robust Statistics, 2nd Edition}, Wiley.
#'
#'  Hampel, F.R. and Rousseeuw, P.J. and  Ronchetti E. (1981), The Change-of-Variance Curve and Optimal Redescending M-Estimators,
#'  \emph{Journal of the American Statistical Association}, \bold{76}, pp. 643--648.
#'
#'  Maronna, R.A. and Martin D. and Yohai V.J. (2006), \emph{Robust Statistics, Theory and Methods}, Wiley, New York.
#'
#'  Riani, M. and Atkinson, A. C.  and Corbellini, A.  and Perrotta, D. (2020)
#'      Robust regression with density power divergence: Theory, comparisons,
#'      and data analysis, \emph{Entropy} \bold{22}. doi:10.3390/e22040399.
#'
#' @examples
#'
#'  \dontrun{
#'  ##  Find c for given bdp for the Tukey biweight function
#'  ##  The constant c associated to a breakdown point of
#'  ##  50 percent in regression is
#'  ##      c=1.547644980928226
#'      psifun(bdp=0.5)
#'      psifun(c=1.547644980928226)
#'
#'  ##  Find c for given bdp for the Hampel function
#'  psifun(bdp=0.5, fun="hampel")
#'
#'  ## Plot Huber rho function.
#'  x <- seq(-3, 3, 0.001)
#'  c <- 1.345;
#'
#'  HUc1 <- psifun(u=x, p=1, fun="HU", const=c)
#'  rhoHU <- HUc1$rho
#'
#'  plot(x, rhoHU, type="l", lty="solid", lwd=2, col="blue",
#'      xlab="u", ylab="rho (u,1.345)", ylim=c(0.16, 4.5))
#'  lines(x, x^2/2, type="l", lty="dotted", lwd=1.5, col="red")
#'  legend(-1, 4.6, legend=c("Huber rho function", "u^2/2"),
#'      lty=c("solid", "dotted"), lwd=c(2,1.5), col=c("blue", "red"))
#'
#'  yc <- 0.13;
#'  text(-c, yc, paste0("-c=", -c), adj=1)
#'  text(c,yc, paste0("c=",c), adj=0)
#'
#'  segments(c, 0, c, c**2/2, col="red")
#'  segments(-c, 0, -c, c**2/2, col="red")
#'  points(c, c**2/2, col="red")
#'  points(-c, c**2/2, col="red")
#'
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


psifun <- function(u=vector(mode="double", length=0), p=1,
    fun=c("TB", "bisquare", "biweight", "HA", "hampel", "HU", "huber",
        "HYP", "hyperbolic", "OPT", "optimal", "PD", "mdpd"),
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

    ## If the vector u is not missing, extract also the rho, psi, etc.
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
