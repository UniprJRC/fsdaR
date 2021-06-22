\name{fsr.object}
\title{Description of \code{fsr} Objects}
\alias{fsr.object}
\description{
  An object of class \code{\link{fsr.object}} holds information about 
  the result of a call to \code{\link{fsreg}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{beta}{p-by-1 vector containing the estimated regression parameters (in step n-k).}
    \item{scale}{scalar containing the estimate of the scale (sigma).}
    \item{residuals}{residuals.}
    \item{fittedvalues}{fitted values.}
    \item{outliers}{kx1 vector containing the list of the k units declared as outliers or NULL if the sample is homogeneous.}

    \item{mdr}{(n-init) x 2 matrix 1st col = fwd search index, 2nd col = value of minimum deletion residual in each step of the fwd search}
    \item{Un}{(n-init) x 11 matrix which contains the unit(s) included
               in the subset at each step of the fwd search.
               REMARK: in every step the new subset is compared with the
               old subset. Un contains the unit(s) present in the new
               subset but not in the old one.
               Un(1,2) for example contains the unit included in step
               init+1.
               Un(end,2) contains the units included in the final step
               of the search.}
    \item{nout}{2 x 5 matrix containing the number of times mdr went out
               of particular quantiles.
               First row contains quantiles 1 99 99.9 99.99 99.999.
               Second row contains the frequency distribution.}
    \item{constr}{This output is produced only if the search found at a
               certain step is a non singular matrix X. In this case the
               search run in a constrained mode, that is including the
               units which produced a singular matrix in the last n-constr
               steps. out.constr is a vector which contains the list of
               units which produced a singular X matrix.}
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"fsr"}.
}
\examples{
\dontrun{  
    (out <- fsreg(Y~., data=hbk, method="FS"))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
