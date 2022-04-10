\name{mmreg.object}
\title{Description of mmreg Objects}
\alias{mmreg.object}
\description{
  An object of class \code{\link{mmreg.object}} holds information about 
  the result of a call to \code{\link{fsreg}} with \code{method="MM"}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{beta}{p-by-1 vector containing the MM estimate of regression coefficients.}
    \item{auxscale}{scalar, S estimate of the scale (or supplied external estimate of scale, if option InitialEst is not empty).}
    \item{residuals}{residuals.}
    \item{fittedvalues}{fitted values.}
    \item{weights}{n x 1 vector. Weights assigned to each observation.}
    \item{Sbeta}{p x 1 vector containing S estimate of regression coefficients 
        (or supplied initial external estimate of regression coefficients, 
        if option InitialEst is not empty)}
    \item{Ssingsub}{Number of subsets without full rank in the S preliminary part. 
        Notice that out.singsub > 0.1*(number of subsamples) produces a warning.}
    \item{outliers}{kx1 vector containing the list of the k units declared as outliers or NULL if the sample is homogeneous.}
    \item{conflev}{Confidence level which is used to declare units as outliers. 
        Usually \code{conflev=0.95, 0.975, 0.99} (individual alpha) or 
        \code{conflev=1-0.05/n, 1-0.025/n, 1-0.01/n} (simultaneous alpha). 
        Default value is 0.975}
    \item{rhofunc}{Specifies the rho function which has been used to weight 
        the residuals. If a different rho function is specified for S and MM 
        loop then insted of \code{rhofunc} we will have \code{rhofuncS} and 
        \code{rhofuncMM}.
    }
    \item{rhofuncparam}{Vector which contains the additional parameters for the specified 
        rho function which has been used. For hyperbolic rho function the value of k =sup CVC. 
        For Hampel rho function the parameters a, b and c. If a different rho function is 
        specified for S and MM loop then insted of \code{rhofuncparam} we will have 
        \code{rhofuncparamS} and \code{rhofuncparamMM}.
    }
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"mmreg"}.
}
\examples{
\dontrun{
    data(hbk, package="robustbase")
    (out <- fsreg(Y~., data=hbk, method="MM"))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
