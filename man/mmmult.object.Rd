\name{mmmult.object}
\title{Description of \code{mmmult.object} Objects}
\alias{mmmult.object}
\description{
  An object of class \code{\link{mmmult.object}} holds information about 
  the result of a call to \code{\link{mmmult}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{loc}{p-by-1  vector containing MM estimate of location.}
    \item{shape}{p-by-p matrix with MM estimate of the shape matrix.}
    \item{cov}{matrix with MM estimate of the covariance matrix.
        Remark: \code{covariance = auxscale^2 * shape}.}
    \item{weights}{A vector containing the estimates of the weights.}     
    \item{outliers}{A vector containing the list of the units declared 
        as outliers using confidence level specified in input scalar 
        \code{conflev}.}     
    \item{Sloc}{A vector with S estimate of location.}     
    \item{Sshape}{A matrix with S estimate of the shape matrix.}     
    \item{Scov}{A matrix with S estimate of the covariance matrix.}     
    \item{auxscale}{S estimate of the scale.}     
    \item{md}{n-by-1 vector containing the estimates of the robust 
        Mahalanobis distances (in squared units).}
    \item{conflev}{Confidence level that was used to declare outliers.}
    \item{X}{the data matrix X}
    
  The object has class \code{"mmmult"}.
}
\examples{
    \dontrun{
    data(hbk, package="robustbase")
    (out <- mmmult(hbk[,1:3]))
    class(out)
    summary(out)
    }
}
\keyword{robust}
\keyword{multivariate}
