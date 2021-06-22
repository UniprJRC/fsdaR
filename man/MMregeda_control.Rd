\name{MMregeda_control}
\alias{MMregeda_control}
\title{
Creates an \code{MMregeda_control} object
}
\description{
Creates an object of class \code{MMregeda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\usage{
    MMregeda_control(intercept = TRUE, InitialEst, Soptions, eff, effshape, 
    refsteps = 3, tol = 1e-07, conflev, nocheck = FALSE, plot = FALSE)
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
    subsets, the supplied option is 'Snsamp',3000 }
    
  \item{eff}{Vector defining nominal efficiency (i.e. a series of numbers 
    between 0.5 and 0.99). The default value is the sequence \code{seq(0.5, 0.99, 0.01)} }
  \item{effshape}{Location or scale efficiency. If \code{effshape=1} 
  efficiency refers to shape efficiency else (default) efficiency 
  refers to location efficiency. }
  \item{refsteps}{
    Number of refining iterations in each subsample (default is \code{refsteps=3}).
    \code{refsteps = 0} means "raw-subsampling" without iterations. }

  \item{tol}{
    Scalar controlling tolerance in the MM loop. The default value is \code{tol=1e-6}. }    
   
  \item{conflev}{Confidence level which is used to declare units as outliers. 
  Usually conflev=0.95, 0.975, 0.99 (individual alpha) or 
  conflev=1-0.05/n, 1-0.025/n, 1-0.01/n (simultaneous alpha). 
  Default value is 0.975}
  
  \item{nocheck}{
    Check input arguments, scalar. If \code{nocheck=TRUE} no check is performed 
    on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X} 
    are left unchanged. In other words the additional column of ones for the 
    intercept is not added. As default \code{nocheck=FALSE}.}

  \item{plot}{
    Plot on the screen. Scalar. If \code{plots=TRUE} the plot of minimum deletion 
    residual with envelopes based on n observations and the scatterplot matrix with 
    the outliers highlighted is produced. If \code{plots=2} the user can also monitor 
    the intermediate plots based on envelope superimposition. 
    If \code{plots=FALSE} (default) no plot is produced.}

}
\details{
Creates an object of class \code{MMregeda_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"MMregeda_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team}

\seealso{
    See Also as \code{\link{FSR_control}}, \code{\link{Sreg_control}}, \code{\link{MMreg_control}} and \code{\link{LXS_control}}
}
\examples{
\dontrun{  
(out <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE, 
    control=MMregeda_control(eff=seq(0.75, 0.99, 0.01))))
}
}
\keyword{robust}
\keyword{regression}


