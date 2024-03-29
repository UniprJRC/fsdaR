\name{loyalty}
\alias{loyalty}
\docType{data}
\title{
Loyalty data
}
\description{
The loyalty data consist of 509 observations on the behaviour of 
customers with loyalty cards from a supermarket chain in Northern 
Italy. The response \code{y} is the amount in euros spent at the 
shop over six months and the explanatory variables are: 
X1, the number of visits to the supermarket in the six month period; 
X2, the age of the customer; 
X3, the number of members of the customers' family. 
To find out more about this data set please see Atkinson and Riani (2006), JCGS
}
\usage{data("loyalty")}
\format{
  A data frame with 509 observations on the following 4 variables.
  \describe{
    \item{\code{visits}}{the number of visits to the supermarket in the six month period}
    \item{\code{age}}{the age of the customer}
    \item{\code{family}}{the number of members of the customers' family}
    \item{\code{amount_spent}}{the amount in euros spent at the shop over six months}
  }
}
\details{
To find out more about this data set please see Atkinson and Riani (2006), JCGS
}
\source{
The data are themselves a random sample from a larger database. The sample of 509
observations is available at \url{http://www.riani.it/trimmed/}.
}
\references{
Atkinson, A. and Riani, M (2006) Distribution Theory and Simulations for Tests of 
Outliers in Regression, \emph{Journal of Computational and Graphical Statistics}, \bold{15} 2, pp 460--476.
}
\examples{
data(loyalty)
}
\keyword{datasets}
