\name{fsdalts.object}
\title{Description of \code{fsdalts} Objects}
\alias{fsdalts.object}
\description{
  An object of class \code{\link{fsdalts.object}} holds information about 
  the result of a call to \code{\link{fsreg}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{rew}{If \code{rew=TRUE} all subsequent output refers to reweighted else no reweighting is done.}
    \item{beta}{p-by-1 vector containing the estimated regression parameters.}
    \item{bs}{p x 1 vector containing the units forming subset associated with bLMS (bLTS).}
    \item{residuals}{residuals.}
    \item{scale}{scale estimate of the residuals.}
    \item{weights}{Vector like y containing weights. The elements of this vector are 0 or 1. 
        These weights identify the h observations which are used to compute the final 
        LTS (LMS) estimate. sum(weights)=h if there is not a perfect fit otherwise 
        sum(weights) can be greater than h}
    \item{h}{The number of observations that have determined the LTS (LMS) estimator, i.e. the value of h.}
    \item{outliers}{vector containing the list of the units declared as outliers using confidence level specified in input scalar conflev.}
    \item{conflev}{confidence level which is used to declare outliers. 
        Remark: \code{conflev} will be used to draw the horizontal lines (confidence bands) in the plots. Default value is 0.975}
    \item{singsub}{Number of subsets wihtout full rank. Notice that if this number 
        is greater than 0.1*(number of subsamples) a warning is produced}
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"fsdalts"}.
}
\examples{
\dontrun{  
    data(hbk, package="robustbase")
    (out <- fsreg(Y~., data=hbk, method="LTS"))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
