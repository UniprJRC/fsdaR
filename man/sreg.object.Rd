\name{sreg.object}
\title{Description of sreg Objects}
\alias{sreg.object}
\description{
  An object of class \code{\link{sreg.object}} holds information about 
  the result of a call to \code{\link{fsreg}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{beta}{p-by-1 vector containing the estimated regression parameters (in step n-k).}
    \item{scale}{scalar containing the estimate of the scale (sigma).}
    \item{bs}{p x 1 vector containing the units forming best subset associated with S estimate of regression coefficient.}
    \item{residuals}{residuals.}
    \item{fittedvalues}{fitted values.}
    \item{outliers}{kx1 vector containing the list of the k units declared as outliers or NULL if the sample is homogeneous.}
    \item{conflev}{Confidence level which is used to declare units as outliers. 
        Usually \code{conflev=0.95, 0.975, 0.99} (individual alpha) or 
        \code{conflev=1-0.05/n, 1-0.025/n, 1-0.01/n} (simultaneous alpha). 
        Default value is 0.975}
    \item{singsub}{Number of subsets wihtout full rank. Notice that 
        \code{singsub > 0.1*(number of subsamples)} produces a warning}
    \item{weights}{n x 1 vector containing the estimates of the weights}
    \item{rhofunc}{Specifies the rho function which has been used to weight 
        the residuals. }
    \item{rhofuncparam}{Vector which contains the additional parameters for the specified 
        rho function which has been used. For hyperbolic rho function the value of k =sup CVC. 
        For Hampel rho function the parameters a, b and c. }
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"sreg"}.
}
\examples{
\dontrun{
    (out <- fsreg(Y~., data=hbk, method="S"))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
