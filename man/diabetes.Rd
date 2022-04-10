\name{diabetes}
\alias{diabetes}
\docType{data}
\title{Diabetes data
}
\description{
The diabetes dataset, introduced by Reaven and Miller (1979),
consists of 145 observations (patients). For each patient three
measurements are reported: plasma glucose response to oral glucose,
plasma insulin response to oral glucose, degree of insulin resistance.
}
\usage{
    data("diabetes")
}

\format{
    A data frame with the following variables:
    \describe{
        \item{glucose}{Area under plasma glucose curve after a three hour oral glucose tolerance test (OGTT).}
        \item{insulin}{Area under plasma insulin curve after a three hour oral glucose tolerance test (OGTT).}
        \item{sspg}{Steady state plasma glucose.}
        \item{class}{The type of diabete: \code{Normal}, \code{Overt}, and \code{Chemical}.}
    }
}

\source{Reaven, G. M. and Miller, R. G. (1979). An attempt to define the nature of 
    chemical diabetes using a multidimensional analysis. 
    \emph{Diabetologia} 16:17-24.}

\examples{
library(rrcov)
data(diabetes)
head(diabetes)
plot(CovMcd(diabetes[, 1:3]), which="pairs", col=diabetes$class)
}
\keyword{datasets}
