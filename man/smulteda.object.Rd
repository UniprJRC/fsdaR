\name{smulteda.object}
\title{Description of \code{smulteda.object} Objects}
\alias{smulteda.object}
\description{
  An object of class \code{\link{smulteda.object}} holds information about 
  the result of a call to \code{\link{smult}} with \code{monitoring=TRUE}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{Loc}{length(bdp)-by-p  matrix containing S estimate of location for each value of \code{bdp}.}
     \item{Shape}{p-by-p-by-length(bdp) 3D array  containing robust estimate of the shape 
        for each value of bdp. Remark: det|shape|=1.}
    \item{Scale}{length(bdp) vector containing robust estimate of the scale
        for each value of bdp.}
    \item{Cov}{p-by-p-by-length(bdp) 3D array  containing robust estimate 
        of covariance matrix for each value of \code{bdp}.
        Note that \code{scale(i)^2 * shape[,,i]} = robust estimate of 
        covariance matrix.}
    \item{Bs}{(p+1)-by-length(bdp) matrix containing the units forming best subset 
        for each value of bdp.}
    \item{MAL}{n-by-length(bdp) matrix containing the estimates of the robust 
        Mahalanobis distances (in squared units) for each value of bdp.}
    \item{Outliers}{n-by-length(bdp) matrix containing flags for the outliers. 
        Boolean matrix containing the list of the 
        units declared as outliers for each value of bdp using confidence 
        level specified in input scalar \code{conflev}}     
    \item{Weights}{n x length(bdp) matrix containing the weights for each 
        value of bdp.}     
    \item{conflev}{Confidence level that was used to declare outliers.}
    \item{singsub}{Number of subsets without full rank. Notice that 
        \code{singsub > 0.1*(number of subsamples)} produces a warning.}
    \item{bdp}{vector which contains the values of bdp which have been used.}
    \item{X}{the data matrix X.}
    
  The object has class \code{"smulteda"}.
}
\examples{
\dontrun{
    data(hbk)
    (out <- smult(hbk[,1:3], monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{multivariate}
