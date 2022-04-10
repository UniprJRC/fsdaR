\name{fsmmmdrs.object}
\title{Description of \code{fsmmmdrs.object} Objects}
\alias{fsmmmdrs.object}
\description{
  An object of class \code{\link{fsmmmdrs.object}} holds information about 
  the result of a call to \code{\link{fsmmmdrs}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{mmdrs}{Minimum Mahalanobis distance, (n-init) by (nsimul+1) matrix which contains the monitoring of minimum
        Mahalanobis distance at each step of the forward search.
        \itemize{
            \item{1st column}{ = fwd search index (from init to n-1)}
            \item{2nd column}{ = minimum Mahalanobis distance for random start 1}
            \item{3rd column}{...}
            \item{nsimul+1 column}{minimum Mahalanobis distance for random start nsimul}
        }
        }

    \item{BBrs}{Units belonging to the subset at the steps specified by input option bsbsteps. 
        If \code{bsbsteps=0} \code{BBrs} has size \code{n-by-(n-init+1)-by-nsimul}. In this 
        case \code{BBrs[,,j]} with j=1, 2, ..., nsimul has the following structure:
        \itemize{
            \item{1st row}{ = has number 1 in correspondence of the steps in which unit 1 is included inside subset and a missing value for the other steps}
            \item{...}{}
            \item{(n-1)-th row}{= has number n-1 in correspondence of the steps in which unit n-1 is included inside subset and a missing value for the other steps}
            \item{n-th row}{= has the number n in correspondence of the steps in which unit n is included inside subset and a missing value for the other steps}
        }
        If, on the other hand, bsbsteps is a vector which specifies the steps of the search in which 
        it is necessary to store subset, BBrs has size \code{n-by-length(bsbsteps)-by-nsimul}.
        In other words, \code{BBrs[,,j]} with j=1, 2, ..., nsimul has the same structure as before, but now contains just \code{length(bsbsteps)} columns.
    }
    \item{X}{the data matrix X}
    
  The object has class \code{"fsmmmdrs"}.
}
\examples{
\dontrun{
    data(hbk, package="robustbase")
    out <- fsmmmdrs(hbk[,1:3])
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{multivariate}
