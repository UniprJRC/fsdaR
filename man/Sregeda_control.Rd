\name{Sregeda_control}
\alias{Sregeda_control}
\title{
Creates an \code{Sregeda_control} object
}
\description{
Creates an object of class \code{Sregeda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\usage{
Sregeda_control(intercept = TRUE, bdp = seq(0.5, 0.01, -0.01), 
    rhofunc = c("bisquare", "optimal", "hyperbolic", "hampel"), rhofuncparam, 
    nsamp = 1000, refsteps = 3, reftol = 1e-06, refstepsbestr = 50, reftolbestr = 1e-08, 
    minsctol = 1e-07, bestr = 5, 
    conflev, msg = TRUE, nocheck = FALSE, plot = FALSE)
}

\arguments{
  \item{intercept}{
    Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
}
  \item{bdp}{
    Breakdown point. It measures the fraction of outliers the algorithm 
    should resist. In this case any value greater than 0 but smaller 
    or equal than 0.5 will do fine. 

    The default value of bdp is a sequence from 0.5 to 0.01 with step 0.01    
}
  \item{rhofunc}{
    Specifies the rho function which must be used to weight 
    the residuals. Possible values are 'bisquare' 'optimal' 'hyperbolic' 'hampel'.
    \enumerate{
        \item 'bisquare' uses Tukey's rho and psi functions. See TBrho and TBpsi.
        \item 'optimal' uses optimal rho and psi functions. See OPTrho and OPTpsi.
        \item 'hyperbolic' uses hyperbolic rho and psi functions. See HYPrho and HYPpsi.
        \item 'hampel' uses Hampel rho and psi functions. See HArho and HApsi.
    }
    The default is 'bisquare'.
}
  \item{rhofuncparam}{
    Additional parameters for the specified rho function. 
    For hyperbolic rho function it is possible to set up the 
    value of k = sup CVC (the default value of k is 4.5).
    
    For Hampel rho function it is possible to define parameters 
    a, b and c (the default values are a=2, b=4, c=8)
}
  \item{nsamp}{
    Number of subsamples which will be extracted to find the robust estimator, 
    scalar. If \code{nsamp=0} all subsets will be extracted. They will be 
    \code{(n choose p)}. If the number of all possible subset is \code{<1000} 
    the default is to extract all subsets otherwise just 1000.
}
  \item{refsteps}{
    Number of refining iterations in each subsample (default is \code{refsteps=3}).
    \code{refsteps = 0} means "raw-subsampling" without iterations.
}
  \item{reftol}{
    Tolerance for the refining steps. The default value is 1e-6
}    
  \item{refstepsbestr}{
    Scalar defining number of refining iterations for each best subset (default = 50).
}
  \item{reftolbestr}{
    Tolerance for the refining steps for each of the best subsets. The default value is \code{reftolbestr=1e-8}.
}
  \item{minsctol}{
    Value of tolerance for the iterative procedure for finding the minimum 
    value of the scale for each subset and each of the best subsets 
    (It is used by subroutine \code{minscale.m}).
     The default value is \code{minsctol=1e-7}.
}
  \item{bestr}{
    Defins the number of "best betas" to remember from the subsamples. 
    These will be later iterated until convergence (default is \code{bestr=5}).
}
  \item{conflev}{Confidence level which is used to declare units as outliers. 
  Usually conflev=0.95, 0.975, 0.99 (individual alpha) or 
  conflev=1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha). 
  Default value is 0.975
}
  \item{msg}{
    Controls whether to display or not messages on the screen If \code{msg==1} (default) 
    messages are displayed on the screen about step in which signal took place else 
    no message is displayed on the screen.
}
  \item{nocheck}{
    Check input arguments, scalar. If \code{nocheck=TRUE} no check is performed 
    on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X} 
    are left unchanged. In other words the additional column of ones for the 
    intercept is not added. As default \code{nocheck=FALSE}.
}

  \item{plot}{
    Plot on the screen. Scalar. If \code{plots=TRUE} the plot of minimum deletion 
    residual with envelopes based on n observations and the scatterplot matrix with 
    the outliers highlighted is produced. If \code{plots=2} the user can also monitor 
    the intermediate plots based on envelope superimposition. 
    If \code{plots=FALSE} (default) no plot is produced.
}
}
\details{
Creates an object of class \code{Sregeda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"Sregeda_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team}

\seealso{
    See Also as \code{\link{FSR_control}}, \code{\link{MMreg_control}} and \code{\link{LXS_control}}
}
\examples{
\dontrun{

(out <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE, 
    control=Sregeda_control(nsamp=500, rhofunc='hyperbolic')))
}

}
\keyword{robust}
\keyword{regression}

