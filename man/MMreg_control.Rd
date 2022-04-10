\name{MMreg_control}
\alias{MMreg_control}
\title{
Creates an \code{MMreg_control} object
}
\description{
Creates an object of class \code{MMreg_control} to be used with the \code{fsreg()} function,
containing various control parameters for calling the MATLAB function \code{MMreg()}.
}
\usage{
MMreg_control(intercept = TRUE, InitialEst, Soptions, eff, effshape, 
    rhofunc = c("bisquare", "optimal", "hyperbolic", "hampel"), rhofuncparam, 
    refsteps = 3, tol = 1e-07, conflev, 
    msg = TRUE, nocheck = FALSE, plot = FALSE)
}
\arguments{
  \item{intercept}{
    Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
}
  \item{InitialEst}{Starting values of the MM-estimator, a list with the fiollowing
  elements: \code{loc}, a $p x 1$ vector, location vector estimate and
  \code{scale}, a scaler, estimate of the scale. If empty (default) the program 
  will use S estimators. In this last case it is possible to specify the 
  options given in function Sreg.
}
  \item{Soptions}{Options to pass to Sreg, an \code{\link{Sreg_control}} object. 
%% FIXME: these Sreg_control object has to be translated to name value pairs with names starting with 'S'
    The options are: Srhofunc, Snsamp, Srefsteps, Sreftol, Srefstepsbestr, Sreftolbestr, Sminsctol, Sbestr.
    See function \code{\link{Sreg_control}} for more details on these options. 
    
    It is necessary to add to the S options the letter S at the beginning. 
    For example, if you want to use the optimal rho function the supplied 
    option is 'Srhofunc','optimal'. For example, if you want to use 3000 
    subsets, the supplied option is 'Snsamp',3000
}
  \item{eff}{Scalar defining nominal efficiency (i.e. a number between 
    0.5 and 0.99). The default value is 0.95.
}
  \item{effshape}{Location or scale efficiency. If \code{effshape=1} 
  efficiency refers to shape efficiency else (default) efficiency 
  refers to location efficiency.
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
  \item{refsteps}{
    Number of refining iterations in each subsample (default is \code{refsteps=3}).
    \code{refsteps = 0} means "raw-subsampling" without iterations.
}
  \item{tol}{
    Scalar controlling tolerance in the MM loop. The default value is \code{tol=1e-6}
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
Creates an object of class \code{MMreg_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"MMreg_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team
}
\seealso{
    See Also as \code{\link{FSR_control}}, \code{\link{MMreg_control}} and \code{\link{LXS_control}}
}
\examples{

\dontrun{  
data(hbk, package="robustbase")
(out <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99, rhofunc="optimal")))
}
}
\keyword{robust}
\keyword{regression}

