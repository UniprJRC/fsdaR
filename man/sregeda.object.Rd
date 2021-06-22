\name{sregeda.object}
\title{Description of \code{sregeda} Objects}
\alias{sregeda.object}
\description{
  An object of class \code{\link{sregeda.object}} holds information about 
  the result of a call to \code{\link{fsreg}} when \code{method="S"} and 
  \code{monitoring=TRUE}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{Beta}{matrix containing the S estimator of regression coefficients for each value of bdp.}
    \item{Scale}{vector containing the estimate of the scale (sigma) for each value of bdp. This is the value of the objective function.}
    \item{BS}{p x 1 vector containing the units forming best subset associated with S estimate of regression coefficient.}
    \item{RES}{n x length(bdp) matrix containing the monitoring 
        of scaled residuals for each value of \code{bdp}.}
    \item{Weights}{n x length(bdp) matrix containing the estimates of the weights for each value of bdp}
    \item{Outliers}{Boolean matrix containing the list of the units declared as outliers for each value of bdp using confidence level specified in input scalar conflev.}
    \item{conflev}{Confidence level which is used to declare units as outliers. 
        Remark: conflev will be used to draw the horizontal line (confidence band) in the plot.}
    \item{Singsub}{Number of subsets wihtout full rank. 
        Notice that singsub[bdp[jj]] > 0.1*(number of subsamples) produces a warning}
    \item{rhofunc}{Specifies the rho function which has been used to weight 
        the residuals. }
    \item{rhofuncparam}{Vector which contains the additional parameters for the specified 
        rho function which has been used. For hyperbolic rho function the value of k =sup CVC. 
        For Hampel rho function the parameters a, b and c. }
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"sregeda"}.
}
\examples{
\dontrun{
    (out <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
