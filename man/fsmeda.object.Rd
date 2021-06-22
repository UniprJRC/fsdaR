\name{fsmeda.object}
\title{Description of \code{fsmeda.object} Objects}
\alias{fsmeda.object}
\description{
  An object of class \code{\link{fsmeda.object}} holds information about 
  the result of a call to \code{\link{fsmult}} when called with parameter 
  \code{monitoring=TRUE}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{MAL}{n x (n-init+1) matrix containing the monitoring of 
    Each row represents the distance Mahalanobis distance for the corresponding unit.}
    \item{BB}{n x (n-init+1) matrix containing the information about the units belonging
    to the subset at each step of the forward search. The first column contains the 
    indexes of the units forming subset in the initial step and each further column - 
    the indexes of the units forming the corresponding step. The last column contains 
    the units forming subset in the final step (all units).}
    
    \item{md}{n-by-1 vector containing the estimates of the robust 
        Mahalanobis distances (in squared units). This vector contains 
        the distances of each observation from the location of the data, 
        relative to the scatter matrix cov.}
        
    \item{mmd}{(n-init) x 3 matrix. which contains the monitoring of minimum
        MD or (m+1)th ordered MD  at each step of
        the forward search.
        \itemize{
            \item{1st column}{ = fwd search index (from init to n-1)}
            \item{2nd column}{ = minimum MD}
            \item{3rd column}{ = (m+1)th-ordered MD}
        }
        }
    \item{msr}{(n-init+1) x 3 matrix which contains the monitoring of maximum
        MD or m-th ordered MD  at each step of the forward search.
        \itemize{
            \item{1st column}{ = fwd search index (from init to n)}
            \item{2nd column}{ = maximum MD}
            \item{3rd column}{ = mth-ordered MD}
        }
        }            
    \item{gap}{(n-init+1) x 3 matrix which contains the monitoring of the gap
        (difference between minMD outside subset and max inside).
        \itemize{
            \item{1st column}{ = fwd search index (from init to n)}
            \item{2nd column}{ = min MD - max MD}
            \item{3rd column}{ = (m+1)th-ordered MD - mth ordered distance}
        }
        }
    \item{Loc}{(n-init+1) x (p+1) matrix which contains the monitoring 
        of the estimated means at each step of the fwd search.
        }
     \item{S2cov}{(n-init+1) x (p*(p+1)/2+1) matrix which contains the monitoring of the 
         of the elements of the covariance matrix in each step of the forward search.
        \itemize{
            \item{1st column}{ = fwd search index (from init to n)}
            \item{2nd column}{ = monitoring of S[1,1]}
            \item{3rd column}{ = monitoring of S[1,2]}
            \item{...}{}
            \item{last column}{ = monitoring of S[p,p]}
        }
        }
    \item{detS}{(n-init+1) x 2 matrix which contains the monitoring 
        of the determinant of the covariance matrix in each step of 
        the forward search.
        }
    \item{Un}{(n-init)-by-11 matrix which contains the unit(s) included
               in the subset at each step of the fwd search.
               REMARK: in every step the new subset is compared with the
               old subset. Un contains the unit(s) present in the new
               subset but not in the old one. Un[1 ,2] for example contains 
               the unit included in step init+1.
               Un[end, 2] contains the units included in the final step
               of the search.}               
    \item{X}{the data matrix X}
    
  The object has class \code{"fsmeda"}.
}
\examples{
\dontrun{  
    (out <- fsmult(hbk[,1:3], monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{multivariate}
