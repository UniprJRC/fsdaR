\name{FSReda_control}
\alias{FSReda_control}
\title{
Creates an \code{FSReda_control} object
}
\description{
Creates an object of class \code{FSReda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\usage{
FSReda_control(intercept = TRUE, init, nocheck = FALSE, 
    tstat = c("trad", "scal"), conflev = c(0.95, 0.99))
}
\arguments{
  \item{intercept}{
    Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
  }

  \item{init}{
    Search initialization, scalar. It specifies the initial subset size to 
    start monitoring exceedances of minimum deletion residual, if init is 
    not specified it set equal to: \code{p+1}, if the sample size is smaller 
    than 40 or \code{min(3*p+1,floor(0.5*(n+p+1)))}, otherwise. For example, 
    if \code{init=100}, the procedure starts monitoring from step \code{m=100}.}

  \item{nocheck}{
    Check input arguments, scalar. If \code{nocheck=TRUE} no check is performed 
    on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X} 
    are left unchanged. In other words the additional column of ones for the 
    intercept is not added. As default \code{nocheck=FALSE}. }

  \item{tstat}{The kind of t-statistics which have to be monitored. 
  \code{tstat="trad"} implies monitoring of traditional t statistics 
  (\code{out$Tols}). In this case the estimate of s2 at step m is based 
  on s2m (notice that s2m<<s2 when m/n is small) \code{tstat="scal"} (default) 
  implies monitoring of rescaled t statistics. In this case the estimate 
  of s2 at step m is based on s2m/vartruncnorm(m/n) where vartruncnorm(m/n) 
  is the variance of the truncated normal distribution.}

  \item{conflev}{Confidence level which is used to declare units as outliers. 
  Usually conflev=0.95, 0.975, 0.99 (individual alpha) or 
  conflev=1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha). 
  Default value is 0.975.}

}

\details{
Creates an object of class \code{FSReda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"FSReda_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team}

\seealso{
    See Also as \code{\link{FSR_control}}, \code{\link{MMreg_control}} and \code{\link{LXS_control}}
}
\examples{
\dontrun{
data(hbk, package="robustbase")
(out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE, 
    control=FSReda_control(tstat="scal")))
}
}
\keyword{robust}
\keyword{regression}


