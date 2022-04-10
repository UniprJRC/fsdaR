\name{mmregeda.object}
\title{Description of \code{mmregeda} Objects}
\alias{mmregeda.object}
\description{
  An object of class \code{\link{mmregeda.object}} holds information about 
  the result of a call to \code{\link{fsreg}} when \code{method="MM"} and 
  \code{monitoring=TRUE}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{auxscale}{scalar, S estimate of the scale (or supplied external estimate of scale, if option InitialEst is not empty).}
    \item{Beta}{p x length(eff) matrix containing MM estimate of regression coefficients for each value of eff.}
    \item{RES}{n x length(eff) matrix containing the monitoring 
        of scaled residuals for each value of \code{eff}.}
    \item{Weights}{n x length(eff) matrix containing the estimates of the weights for each value of eff}
    \item{Outliers}{Boolean matrix containing the list of the units declared as outliers for each value of eff using confidence level specified in input scalar conflev.}
    \item{conflev}{Confidence level which is used to declare units as outliers. 
        Remark: conflev will be used to draw the horizontal line (confidence band) in the plot.}
    \item{Ssingsub}{Number of subsets wihtout full rank. 
        Notice that  Notice that singsub > 0.1*(number of subsamples) produces a warning}
    \item{rhofunc}{string identifying the rho function which has been used. }
    \item{rhofuncparam}{vector which contains the additional parameters for the 
        specified rho function which have been used. For hyperbolic rho function 
        the value of k =sup CVC. For Hampel rho function the parameters a, b and c. }
    \item{eff}{vector containing the value of eff which have been used.}
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"mmregeda"}.
}
\examples{
\dontrun{
    data(hbk, package="robustbase")
    (out <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
