\name{swissheads}
\alias{swissheads}
\docType{data}
\title{
    Swiss heads data
}
\description{
Six dimensions in millimetres of the heads of 200 twenty year old Swiss soldiers (Flury and Riedwyl, 
1988, p. 218 and also Flury, 1997, p. 6).

The data were collected to determine the variability in size and shape
of heads of young men in order to help in the design of a new protection
mask for the Swiss army.
}
\usage{data(swissheads)}
\format{
  A data frame with 200 observations on the following 6 variables.
  \describe{
    \item{\code{minimal_frontal_breadth}}{Minimal frontal breadth, mm}
    \item{\code{breadth_angulus_mandibulae}}{Breadth of angulus mandibulae, mm}
    \item{\code{true_facial_height}}{True facial height, mm}
    \item{\code{length_glabella_nasi}}{Length from glabella to apex nasi, mm}
    \item{\code{length_tragion_nasion}}{Length from tragion to nasion, mm}
    \item{\code{length_tragion_gnathion}}{Length from tragion to gnathion, mm}
  }
}
\source{
Flury, B. and Riedwyl, H. (1988). \emph{Multivariate Statistics: A practical approach.} London: Chapman & Hall.
}
\references{
Atkinson, A. C., Riani, M. and Cerioli, A. (2004) \emph{Exploring multivariate data with the forward search}, New York: Springer-Verlag.
}
\examples{
library(rrcov)
data(swissheads)
head(swissheads)
plot(CovMcd(swissheads), which="pairs")
}
\keyword{datasets}

