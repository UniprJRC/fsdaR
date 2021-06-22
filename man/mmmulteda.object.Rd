\name{mmmulteda.object}
\title{Description of \code{mmmulteda.object} Objects}
\alias{mmmulteda.object}
\description{
  An object of class \code{\link{mmmulteda.object}} holds information about 
  the result of a call to \code{\link{mmmult}} with \code{monitoring=TRUE}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{Loc}{length(eff)-by-p  matrix containing MM estimate of location 
        for each value of \code{eff}.}
     \item{Shape}{p-by-p-by-length(eff) 3D array  containing robust estimate 
        of the shape for each value of eff. Remark: det|shape|=1.}
    \item{Scale}{length(eff) vector containing robust estimate of the scale
        for each value of eff.}
    \item{Cov}{p-by-p-by-length(eff) 3D array  containing robust estimate 
        of covariance matrix for each value of \code{eff}.
        Note that \code{scale(i)^2 * shape[,,i]} = robust estimate of 
        covariance matrix.}
    \item{Bs}{(p+1)-by-length(eff) matrix containing the units forming best subset 
        for each value of eff.}
    \item{MAL}{n-by-length(eff) matrix containing the estimates of the robust 
        Mahalanobis distances (in squared units) for each value of eff.}
    \item{Outliers}{n-by-length(eff) matrix containing flags for the outliers. 
        Boolean matrix containing the list of the 
        units declared as outliers for each value of eff using confidence 
        level specified in input scalar \code{conflev}}     
    \item{Weights}{n x length(eff) matrix containing the weights for each 
        value of eff.}     
    \item{conflev}{Confidence level that was used to declare outliers.}
    \item{singsub}{Number of subsets without full rank. Notice that 
        \code{singsub > 0.1*(number of subsamples)} produces a warning.}
    \item{eff}{vector which contains the values of eff which have been used.}
    \item{X}{the data matrix X.}
    
  The object has class \code{"mmmulteda"}.
}
\examples{
\dontrun{
    data(hbk)
    (out <- mmmult(hbk[,1:3], monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{multivariate}
