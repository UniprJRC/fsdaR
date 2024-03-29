% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mmmult.R
\name{mmmult}
\alias{mmmult}
\title{Computes MM estimators in multivariate analysis with auxiliary S-scale}
\usage{
mmmult(
  x,
  monitoring = FALSE,
  plot = FALSE,
  eff,
  conflev = 0.975,
  nocheck = FALSE,
  trace = FALSE,
  ...
)
}
\arguments{
\item{x}{An n x p data matrix (n observations and p variables).
 Rows of x represent observations, and columns represent variables.

 Missing values (NA's) and infinite values (Inf's) are allowed,
 since observations (rows) with missing or infinite values will
 automatically be excluded from the computations.}

\item{monitoring}{Wheather to perform monitoring of Mahalanobis distances and other specific quantities}

\item{plot}{Plots the Mahalanobis distances against index number. If \code{plot=FALSE}
(default) or \code{plot=0}  no plot is produced. The confidence
level used to draw the confidence bands for the MD is given by the input option conflev.
If conflev is not specified a nominal 0.975 confidence interval will be used.
If \code{plot=2}  a scatter plot matrix with the outliers highlighted is produced.
If plot is a list it may contain the following fields:
  \itemize{
    \item labeladd If \code{labeladd=1}, the outliers in the spm are labelled with the unit
        row index. The default value is \code{labeladd=""}, i.e. no label is added
    \item nameY character vector containing the labels of the variables. As default value,
        the labels which are added are Y1, ...Yp.
    }}

\item{eff}{Defining the nominal efficiency (i.e. a number between 0.5 and 0.99). The default value is \code{eff=0.95}.}

\item{conflev}{Confidence level which is used to declare units as outliers (scalar).
Usually \code{conflev=0.95}, \code{conflev=0.975} or \code{conflev=0.99} (individual alpha)
\code{conflev=1-0.05/n}, \code{conflev=1-0.025/n} or \code{conflev=1-0.01/n} (simultaneous alpha).
Default value is \code{convlev=0.975}.}

\item{nocheck}{It controls whether to perform checks on matrix Y. If \code{nocheck=TRUE}, no check is performed.}

\item{trace}{Whether to print intermediate results. Default is \code{trace=FALSE}.}

\item{...}{potential further arguments passed to lower level functions.}
}
\value{
Depending on the input parameter \code{monitoring}, one of
   the following objects will be returned:

   \enumerate{
   \item \code{\link{mmmult.object}}
   \item \code{\link{mmmulteda.object}}
   }
}
\description{
Computes MM estimators in multivariate analysis with auxiliary S-scale
}
\details{
This function follows the lines of MATLAB/R code developed during the years by many authors.
 For more details see http://www.econ.kuleuven.be/public/NDBAE06/programs/ and
 the R package \link[rrcov]{CovMMest}
 The core of these routines, e.g. the resampling approach, however, has been
 completely redesigned, with considerable increase of the computational performance.
}
\examples{

 \dontrun{
 data(hbk, package="robustbase")
 (out <- mmmult(hbk[,1:3]))
 class(out)
 summary(out)

 ##  Generate contaminated data (200,3)
 n <- 200
 p <- 3
 set.seed(123456)
 X <- matrix(rnorm(n*p), nrow=n)
 Xcont <- X
 Xcont[1:5, ] <- Xcont[1:5,] + 3

 out1 <- mmmult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
 names(out1)

 ## plot=TRUE - generates: (1) a plot of Mahalanobis distances against
 ##    index number. The confidence level used to draw the confidence bands for
 ##    the MD is given by the input option conflev. If conflev is
 ##    not specified a nominal 0.975 confidence interval will be used and
 ##    (2) a scatter plot matrix with the outliers highlighted.

 (out1 <- mmmult(Xcont, trace=TRUE, plot=TRUE))

 ## plots is a list: the spm shows the labels of the outliers.
 (out1 <- mmmult(Xcont, trace=TRUE, plot=list(labeladd="1")))

 ## plots is a list: the spm uses the variable names provided by 'nameY'.
 (out1 <- mmmult(Xcont, trace=TRUE, plot=list(nameY=c("A", "B", "C"))))

 ## mmmult() with monitoring
 (out2 <- mmmult(Xcont, monitoring=TRUE, trace=TRUE))
 names(out2)

 ##  Forgery Swiss banknotes examples.

 data(swissbanknotes)

 (out1 <- mmmult(swissbanknotes[101:200,], plot=TRUE))

 (out1 <- mmmult(swissbanknotes[101:200,], plot=list(labeladd="1")))
 }
}
\references{
Maronna, R.A., Martin D. and Yohai V.J. (2006), Robust Statistics, Theory and Methods, Wiley, New York.
}
\author{
FSDA team, \email{valentin.todorov@chello.at}
}
