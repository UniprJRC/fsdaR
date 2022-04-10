\name{summary.fsdalts}
\alias{summary.fsdalts}
\alias{print.summary.fsdalts}
\title{Summary Method for \code{fsdalts} objects}
\usage{
\method{summary}{fsdalts}(object, correlation = FALSE, \dots)
\method{print}{summary.fsdalts}(x, digits = max(3, getOption("digits") - 3),
     signif.stars = getOption("show.signif.stars"), \dots)
}
\arguments{
  \item{object, x}{an object of class \code{"fsdalts"} (or \code{"summary.fsdalts"});
    usually, a result of a call to \code{\link{fsreg}}.}
  \item{correlation}{logical; if \code{TRUE}, the correlation matrix of the estimated parameters is returned and printed.}
  \item{digits}{the number of significant digits to use when printing.}
  \item{signif.stars}{logical indicating if \dQuote{significance stars}
    should be printer, see \code{\link{printCoefmat}}.}
  \item{\dots}{further arguments passed to or from other methods.}
}
\description{
  \code{\link{summary}} method for class \code{"fsdalts"}.
}
\details{
  \code{summary.fsdalts()}, the S3 method, simply returns an (S3) object of class \code{"\link[=summary.fsdalts]{summary.fsdalts}"}
  for which there's a \code{\link{print}} method:

  \code{print.summary.fsdalts} prints summary statistics for the forward search (FS) regression estimates.
  While the function \code{\link{print.fsdalts}} prints only the robust estimates
  of the coefficients, \code{print.summary.fsdalts} will print also the regression table.
}
\value{
  \code{summary.fsdalts} returns an \code{summary.fsdalts} object, whereas the
  \code{print} methods returns its first argument via
  \code{\link{invisible}}, as all \code{print} methods do.
}
\seealso{
  \code{\link{fsreg}}, \code{\link{summary}}
}
\examples{
\dontrun{

    data(Animals, package = "MASS")
    brain <- Animals[c(1:24, 26:25, 27:28),]
    lbrain <- log(brain)
    (fs <- fsreg(brain~body, data=lbrain, method="LTS"))
    summary(fs)

    ## compare to the result of ltsReg() from 'robustbase'
    library(robustbase)
    (lts <- ltsReg(brain~body, data=lbrain))
    summary(lts)
}    
}
\keyword{multivariate}
\keyword{robust}
