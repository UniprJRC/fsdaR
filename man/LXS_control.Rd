\name{LXS_control}
\alias{LXS_control}
\title{
Creates an \code{LSX_control} object
}
\description{
Creates an object of class \code{LXS_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\usage{
    LXS_control(intercept = TRUE, lms, h, bdp, nsamp, rew = FALSE, conflev = 0, 
        msg = TRUE, nocheck = FALSE, nomes = FALSE, plot = FALSE)
}
\arguments{

  \item{intercept}{
    Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
  }
  \item{lms}{
    Criterion to use to find the initial subset to initialize the search 
    (LMS, LTS with concentration steps, LTS without concentration steps 
    or subset supplied directly by the user). The default value is 1 
    (Least Median of Squares is computed to initialize the search). 
    On the other hand, if the user wants to initialze the search with 
    LTS with all the default options for concentration steps then lms=2. 
    If the user wants to use LTS without concentration steps, lms can be 
    a scalar different from 1 or 2. If lms is a list it is possible 
    to control a series of options for concentration steps (for more 
    details see option \code{lms} inside \code{LXS_control}). 
    If, on the other hand, the user wants to initialize the search with 
    a prespecified set of units there are two possibilities: 
    \enumerate{
        \item lms can be a vector 
            with length greater than 1 which contains the list of units forming the initial 
            subset. For example, if the user wants to initialize the search with units 
            4, 6 and 10 then \code{lms=c(4, 6, 10)}; 
        \item lms is a struct which contains a field named bsb which contains the list of 
            units to initialize the search. For example, in the case of simple regression 
            through the origin with just one explanatory variable, if the user wants to 
            initialize the search with unit 3 then \code{lms=list(bsb=3)}.
    }
}
  \item{h}{
    The number of observations that have determined the least trimmed squares 
    estimator,  scalar. \code{h} is an integer greater or equal than \code{p} 
    but smaller then \code{n}. Generally if the purpose is outlier detection 
    \code{h=[0.5*(n+p+1)]} (default value). \code{h} can be smaller than this 
    threshold if the purpose is to find subgroups of homogeneous observations. 
    In this function the LTS/LMS estimator is used just to initialize the search.}  

  \item{bdp}{Breakdown point. It measures the fraction of outliers the algorithm 
  should resist. In this case any value greater than 0 but smaller or equal than 
  0.5 will do fine. If on the other hand the purpose is subgroups detection then 
  bdp can be greater than 0.5. In any case however n*(1-bdp) must be greater 
  than p. If this condition is not fulfilled an error will be given. 
  Please specify h or bdp not both.}
  
  \item{nsamp}{
    Number of subsamples which will be extracted to find the robust estimator, 
    scalar. If \code{nsamp=0} all subsets will be extracted. They will be 
    \code{(n choose p)}. If the number of all possible subset is \code{<1000} 
    the default is to extract all subsets otherwise just 1000.}
    
  \item{rew}{LXS reweighted - if rew=1 the reweighted version of LTS (LMS) is 
  used and the output quantities refer to the reweighted version else no 
  reweighting is performed (default).}

  \item{conflev}{
  Confidence level which is used to declare units as outliers, usually \code{conflev=0.95, 0.975, 0.99}
  (individual alpha) or 1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha). Default value is 0.975.}
  
  \item{msg}{
    Controls whether to display or not messages on the screen If \code{msg==1} (default) 
    messages are displayed on the screen about step in which signal took place else 
    no message is displayed on the screen.}
    
  \item{nocheck}{
    Check input arguments, scalar. If \code{nocheck=TRUE} no check is performed 
    on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X} 
    are left unchanged. In other words the additional column of ones for the 
    intercept is not added. As default \code{nocheck=FALSE}. }

  \item{nomes}{It controls whether to display or not on the screen messages 
  about estimated time to compute LMS (LTS). If nomes is equal to 1 no message 
  about estimated time to compute LMS (LTS) is displayed, else if nomes is 
  equal to 0 (default), a message about estimated time is displayed.}
  
  \item{plot}{
    Plot on the screen. Scalar. If \code{plots=TRUE} the plot of minimum deletion 
    residual with envelopes based on n observations and the scatterplot matrix with 
    the outliers highlighted is produced. If \code{plots=2} the user can also monitor 
    the intermediate plots based on envelope superimposition. 
    If \code{plots=FALSE} (default) no plot is produced.}

}
\details{
Creates an object of class \code{FSR_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"LXS_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team}

\seealso{
    See Also as \code{\link{Sreg_control}}, \code{\link{MMreg_control}} and \code{\link{FSR_control}}
}

\examples{
\dontrun{  
(out <- fsreg(Y~., data=hbk, method="LMS", control=LXS_control(h=56, nsamp=500, lms=2)))
}
}
\keyword{robust}
\keyword{regression}

