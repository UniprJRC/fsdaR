\name{FSR_control}
\alias{FSR_control}
\title{
Creates an \code{FSR_control} object
}
\description{
Creates an object of class \code{FSR_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\usage{
FSR_control(intercept = TRUE, h, nsamp = 1000, lms = 1, init, nocheck = FALSE, 
    bonflev = "", msg = TRUE, bsbmfullrank = TRUE, 
    plot = FALSE, bivarfit = FALSE, multivarfit = FALSE, 
    labeladd = FALSE, nameX, namey, ylim, xlim)
}
\arguments{
  \item{intercept}{
    Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
  }
  \item{h}{
    The number of observations that have determined the least trimmed squares 
    estimator,  scalar. \code{h} is an integer greater or equal than \code{p} 
    but smaller then \code{n}. Generally if the purpose is outlier detection 
    \code{h=[0.5*(n+p+1)]} (default value). \code{h} can be smaller than this 
    threshold if the purpose is to find subgroups of homogeneous observations. 
    In this function the LTS/LMS estimator is used just to initialize the search.
    }  
  \item{nsamp}{
    Number of subsamples which will be extracted to find the robust estimator, 
    scalar. If \code{nsamp=0} all subsets will be extracted. They will be 
    \code{(n choose p)}. If the number of all possible subset is \code{<1000} 
    the default is to extract all subsets otherwise just 1000.
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
  \item{init}{
    Search initialization, scalar. It specifies the initial subset size to 
    start monitoring exceedances of minimum deletion residual, if init is 
    not specified it set equal to: \code{p+1}, if the sample size is smaller 
    than 40 or \code{min(3*p+1,floor(0.5*(n+p+1)))}, otherwise. For example, 
    if \code{init=100}, the procedure starts monitoring from step \code{m=100}.
    }
  \item{nocheck}{
    Check input arguments, scalar. If \code{nocheck=TRUE} no check is performed 
    on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X} 
    are left unchanged. In other words the additional column of ones for the 
    intercept is not added. As default \code{nocheck=FALSE}. }
  \item{bonflev}{
    Option to be used if the distribution of the data is strongly non normal and, 
    thus, the general signal detection rule based on consecutive exceedances 
    cannot be used. In this case bonflev can be:
    \enumerate{
    \item a scalar smaller than 1 which specifies the confidence level for a signal 
        and a stopping rule based on the comparison of the minimum MD with a Bonferroni 
        bound. For example if bonflev=0.99 the procedure stops when the trajectory 
        exceeds for the first time the 99\% bonferroni bound.
    \item A scalar value greater than 1. In this case the procedure stops when 
        the residual trajectory exceeds for the first time this value.
    }
    Default value is '', which means to rely on general rules based on consecutive exceedances.
}
  \item{msg}{
    Controls whether to display or not messages on the screen If \code{msg==1} (default) 
    messages are displayed on the screen about step in which signal took place else 
    no message is displayed on the screen.
}
  \item{bsbmfullrank}{
    How to behave in case subset at step m (say bsbm) produces a singular X. 
    In other words, this options controls what to do when \code{rank(X[bsbm, ])} is 
    smaller then number of explanatory variables. If \code{bsbmfullrank=1} (default) 
    these units (whose number is say mnofullrank) are constrained to enter 
    the search in the final n-mnofullrank steps else the search continues using 
    as estimate of beta at step m the estimate of beta found in the previous step.
}
  \item{plot}{
    Plot on the screen. Scalar. If \code{plot=TRUE} the plot of minimum deletion 
    residual with envelopes based on n observations and the scatterplot matrix with 
    the outliers highlighted is produced. If \code{plot=2} the user can also monitor 
    the intermediate plots based on envelope superimposition. 
    If \code{plot=FALSE} (default) no plot is produced.
}
  \item{bivarfit}{Wheather to superimpose bivariate least square lines on the plot (if \code{plot=TRUE}.
    This option adds one or more least squares lines, based on SIMPLE REGRESSION of y on Xi, 
    to the plots of y|Xi. The default is \code{bivarfit=FALSE}: no line is fitted. 
    If \code{bivarfit=1}, a single OLS line is fitted to all points of each bivariate 
    plot in the scatter matrix y|X. If \code{bivarfit=2}, two OLS lines are fitted: 
    one to all points and another to the group of the genuine observations. 
    The group of the potential outliers is not fitted. If \code{bivarfit=0} 
    one OLS line is fitted to each group. This is useful for the purpose of 
    fitting mixtures of regression lines. If \code{bivarfit='i1'} or 
    \code{bivarfit='i2'}, etc. an OLS line is fitted to a specific group, 
    the one with index 'i' equal to 1, 2, 3 etc. 
    Again, useful in case of mixtures.
}
  \item{multivarfit}{Wheather to superimpose multivariate least square lines. 
  This option adds one or more least square lines, based on MULTIVARIATE REGRESSION 
  of y on X, to the plots of y|Xi. 
    The default is \code{multivarfit=FALSE}: no line is fitted. 
    If \code{bivarfit=1}, a single OLS line is fitted to all points of each bivariate 
    plot in the scatter matrix y|X. The line added to the scatter plot y|Xi is 
    avconst + Ci*Xi, where Ci is the coefficient of Xi in the multivariate regression 
    and avconst is the effect of all the other explanatory variables different 
    from Xi evaluated at their centroid (that is overline(y)'C)). 
    If \code{multivarfit=2}, same action as with \code{multivarfit=1} but this time 
    we also add the line based on the group of unselected observations 
    (i.e. the normal units).
}
  \item{labeladd}{Add outlier labels in plot. If \code{labeladd=TRUE}, we label the outliers 
  with the unit row index in matrices X and y. 
  The default value is \code{labeladd=FALSE}, i.e. no label is added.
}
  \item{nameX}{Add variable labels in plot. A vector of strings of length \code{p} 
  containing the labels of the variables of the regression dataset. 
  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
}
  \item{namey}{Add response label. A string containing the label of the response
}
  \item{ylim}{Control \code{y} scale in plot. Vector with two elements controlling 
  minimum and maximum on the y axis. Default is to use automatic scale.
}
  \item{xlim}{Control \code{x} scale in plot. Vector with two elements controlling 
  minimum and maximum on the x axis. Default is to use automatic scale.
}   
}
\details{
Creates an object of class \code{FSR_control} to be used with the \code{fsreg()} function,
containing various control parameters.
}
\value{
  An object of class \code{"FSR_control"} which is basically a
  \code{\link{list}} with components the input arguments of 
  the function mapped accordingly to the corresponding Matlab function. 
}
\author{
FSDA team}

\seealso{
    See Also \code{\link{Sreg_control}}, \code{\link{MMreg_control}}, \code{\link{LXS_control}},
    \code{\link{FSReda_control}}, \code{\link{Sregeda_control}} and \code{\link{MMregeda_control}}.
}
\examples{
\dontrun{
data(hbk, package="robustbase")
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2)))
summary(out)
}
}
\keyword{robust}
\keyword{regression}

