\name{mdrplot}
\alias{mdrplot}
\title{
     Plots the trajectory of minimum deletion residual (mdr)
}
\description{
     Plots the trajectory of minimum deletion residual (mdr).
}
\usage{
    mdrplot(out, quant = c(0.01, 0.5, 0.99), sign = TRUE, 
        mplus1 = FALSE, envm, 
        xlim, ylim, xlab, ylab, main, 
        lwdenv, lwd, cex.lab, cex.axis, 
        tag, datatooltip, label, nameX, namey, databrush, 
        ...)
}
\arguments{

  \item{out}{
    An object returned by FSReda() (see \code{\link{FSReda_control}}).
    
    The needed elements of \code{out} are 
    \enumerate{
        \item \code{mdr}: Minimum deletion residual. A matrix containing the monitoring of 
            minimum deletion residual in each step of the forward search. The first column 
            of mdr must contain the fwd search index. 
        \item \code{Un}: (for FSR only) - matrix containing the order of entry in the subset of each unit 
            (required only when datatooltip is true or databrush is not empty).
        \item \code{y}: a vector containing the response (required only when option databrush is requested).
        \item \code{X}: a matrix containing the explanatory variables (required only when option databrush is requested).
        \item \code{Bols}: (n-init+1) x (p+1) matrix containing the estimated beta coefficients monitored in 
            each step of the robust procedure (required only when option databrush 
            is requested and suboption multivarfit is requested).
    }
}
  \item{quant}{
    Quantiles for which envelopes have to be computed. The default is to 
    produce 1\%, 50\% and 99\% envelopes. In other words the default 
    is \code{quant=c(0.01, 0.5, 0.99)}.
}
  \item{sign}{
    Wheather to use MDR with sign: if \code{sign=TRUE} (default) we 
    distinguish steps for which minimum deletion 
    residual was associated with positive or negative value of the residual. 
    Steps associated with positive values of mdr are plotted in black, 
    while other steps are plotted in red.
}
  \item{mplus1}{
    Wheather to plot the (m+1)-th order statistic. Specifies if it is necessary to plot 
    the curve associated with (m+1)-th order statistic.
}
  \item{envm}{
    Sample size for drawing enevlopes. Specifies the size of the sample which is 
    used to superimpose the envelope. The default is to add an envelope based on 
    all the observations (size n envelope).
}
  \item{ylim}{Control \code{y} scale in plot. Vector with two elements controlling 
    minimum and maximum on the y axis. Default is to use automatic scale.
}
  \item{xlim}{Control \code{x} scale in plot. Vector with two elements controlling 
    minimum and maximum on the x axis. Default is to use automatic scale.
}   
  \item{xlab}{
    a title for the x axis
}
  \item{ylab}{
    a title for the y axis
}
  \item{main}{
    an overall title for the plot
}
  \item{lwdenv}{
    Controls the width of the lines associated with the envelopes, default is \code{lvdenv=1}.
}
  \item{lwd}{
    Controls the linewidth of the curve which contains the monitoring of minimum deletion residual.
}
  \item{cex.lab}{
    The magnification to be used for x and y labels relative to the current setting of cex
}
  \item{cex.axis}{
    The magnification to be used for axis annotation relative to the current setting of cex
}
  \item{tag}{
    Plot handle. String which identifies the handle of the plot which is about to be created. 
    The default is to use tag 'pl_mdr'. Notice that if the program finds a plot which has 
    a tag equal to the one specified by the user, then the output of the new plot overwrites 
    the existing one in the same window else a new window is created.
}
    \item{datatooltip}{If datatooltip is not empty the user can use the mouse in order to have
        information about the unit selected, the step in which the unit enters the search and
        the associated label. If datatooltip is a list, it is possible to control the aspect
        of the data cursor (see MATLAB function \code{datacursormode()} for more details or
        see the examples below). The default options are \code{DisplayStyle="Window"} and \code{SnapToDataVertex="on"}.
}
  \item{label}{
    Character vector containing the labels of the units (optional argument used when 
    \code{datatooltip=TRUE}. If this field is not present labels 
    row1, ..., rown will be automatically created and included 
    in the pop up datatooltip window).
}
  \item{nameX}{Add variable labels in plot. A vector of strings of length \code{p} 
  containing the labels of the variables of the regression dataset. 
  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
}
  \item{namey}{Add response label. A string containing the label of the response}
  \item{databrush}{
    interactive mouse brushing. If databrush is missing or empty (default), no brushing is done.
    The activation of this option (databrush is a scalar or a list) enables the user to select 
    a set of trajectories in the current plot and to see them highlighted in the y|X plot, 
    i.e. a matrix of scatter plots of y against each column of X, grouped according to the 
    selection(s) done by brushing. If the plot y|X does not exist it is automatically created.
    In addition, brushed units are automatically highlighted in the minimum deletion residual 
    plot if it is already open. The extension to the following plots will be available in future 
    versions of the toolbox:
    \enumerate{
    \item monitoring leverage plot;
    \item maximum studentized residual;
    \item s^2 and R^2;
    \item Cook distance and modified Cook distance;
    \item deletion t statistics.
    }

    Note that the window style of the other figures is set equal to that which contains the 
    monitoring residual plot. In other words, if the monitoring residual plot is docked all 
    the other figures will be docked too 
    
    If \code{databrush=TRUE} the default selection tool is a rectangular brush and 
    it is possible to brush only once (that is persist='').

    If \code{databrush=list(...)}, it is possible to use all optional arguments of 
    function \code{selectdataFS()} and the following optional argument:
    \enumerate{
    \item persist. Persist is an empty value or a character containing 'on' or 'off'. 
        The default value is \code{persist=""}, that is brushing is allowed only once.    
    If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as 
    the user requires. If \code{persist='on'} then the unit(s) currently brushed are 
    added to those previously brushed. It is possible, every time a new brushing is 
    done, to use a different color for the brushed units. If \code{persist='off'} 
    every time a new brush is performed units previously brushed are removed.
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
    }
}
\item{\dots}{
    potential further arguments passed to lower level functions.
}
}
\details{
    No details
}
\value{
    No value returned
}

\author{
FSDA team
}

\examples{
\dontrun{

n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
mdrplot(out)
}
}
\keyword{robust}
\keyword{regression}


