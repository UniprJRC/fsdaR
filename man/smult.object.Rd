\name{smult.object}
\title{Description of \code{smult.object} Objects}
\alias{smult.object}
\description{
  An object of class \code{\link{smult.object}} holds information about 
  the result of a call to \code{\link{smult}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{loc}{p-by-1  vector containing S estimate of location.}
    \item{shape}{p-by-p matrix containing robust estimate of the shape
        matrix. Remark: det|shape|=1.}
    \item{scale}{robust estimate of the scale.}
    \item{cov}{\code{scale^2 * shape}: robust estimate of 
        covariance matrix.}
    \item{bs}{a (p+1) vector containing the units forming best subset 
        associated with S estimate of location.}
    \item{md}{n-by-1 vector containing the estimates of the robust 
        Mahalanobis distances (in squared units). This vector contains 
        the distances of each observation from the location of the data, 
        relative to the scatter matrix cov.}
    \item{outliers}{A vector containing the list of the units declared 
        as outliers using confidence level specified in input scalar 
        \code{conflev}.}     
    \item{conflev}{Confidence level that was used to declare outliers.}
    \item{singsub}{Number of subsets without full rank. Notice that 
        \code{singsub > 0.1*(number of subsamples)} produces a warning.}
    \item{weights}{n x 1 vector containing the estimates of the weights.}     
    \item{X}{the data matrix X}
    
  The object has class \code{"smult"}.
}
\examples{
    \dontrun{
    data(hbk)
    (out <- smult(hbk[,1:3]))
    class(out)
    summary(out)
    }
}
\keyword{robust}
\keyword{multivariate}
