\name{fsmult.object}
\title{Description of \code{fsmult.object} Objects}
\alias{fsmult.object}
\description{
  An object of class \code{\link{fsmult.object}} holds information about 
  the result of a call to \code{\link{fsmult}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{outliers}{kx1 vector containing the list of the k units declared as outliers or NULL if the sample is homogeneous.}
    \item{loc}{p-by-1  vector containing location of the data.}
    \item{cov}{p-by-p robust estimate of covariance matrix.}
    \item{md}{n-by-1 vector containing the estimates of the robust 
        Mahalanobis distances (in squared units). This vector contains 
        the distances of each observation from the location of the data, 
        relative to the scatter matrix cov.}
    \item{mmd}{(n-init)-by-2 matrix. 1st col is the forward search index; 
        2nd col is the value of minimum Mahalanobis Distance in each step of the fwd search.}
    \item{Un}{(n-init)-by-11 matrix which contains the unit(s) included
               in the subset at each step of the fwd search.
               REMARK: in every step the new subset is compared with the
               old subset. Un contains the unit(s) present in the new
               subset but not in the old one. Un[1 ,2] for example contains 
               the unit included in step init+1.
               Un[end, 2] contains the units included in the final step
               of the search.}
     \item{nout}{2 x 5 matrix containing the number of times mdr went out
               of particular quantiles.
               First row contains quantiles 1 99 99.9 99.99 99.999.
               Second row contains the frequency distribution.
               It is NULL if bonflev threshold is used.}
 
     \item{constr}{This output is produced only if the search found at a
               certain step is a non singular matrix X. In this case the
               search run in a constrained mode, that is including the
               units which produced a singular matrix in the last n-constr
               steps. out.constr is a vector which contains the list of
               units which produced a singular X matrix.}
    \item{X}{the data matrix X}
    
  The object has class \code{"fsmult"}.
}
\examples{
\dontrun{  
    data(hbk, package="robustbase")
    (out <- fsmult(hbk[,1:3]))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{multivariate}
