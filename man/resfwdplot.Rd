\name{resfwdplot}
\alias{resfwdplot}
\title{
     Plots the trajectories of the monitored scaled (squared) residuals
}
\description{
     Plots the trajectories of the monitored scaled (squared) residuals
}
\usage{
resfwdplot(out, 
    xlim, ylim, xlab, ylab, main, lwd, lty, col, cex.lab, cex.axis, 
    xvalues, 
    fg.thresh, fg.unit, fg.labstep, fg.lwd, fg.lty, fg.col, fg.mark, fg.cex, 
    bg.thresh, bg.style, 
    tag, datatooltip, label, nameX, namey, msg, databrush, 
    standard, fground, bground, ...)
}
\arguments{
  \item{out}{
    An object returned by one of the monitoring functions (see \code{\link{FSReda_control}}, 
    \code{\link{Sregeda_control}} and \code{\link{MMregeda_control}}). The object is one of
    \code{\link{fsreda.object}}, \code{\link{sregeda.object}} or \code{\link{mmregeda.object}}.
    
    The needed elements of \code{out} are 
    \enumerate{
        \item \code{RES}: matrix containing the residuals monitored in each step of the forward 
            search or any other robust procedure. Every row is associated with a residual (unit). 
            This matrix can be created using function FSReda, Sregeda, MMregeda.
        \item \code{Un}: (for FSR only) - matrix containing the order of entry in the subset of each unit 
            (required only when datatooltip is true or databrush is not empty).
        \item \code{bdp}: (for Sreg only) - vector containing a sequence of breakdown point values to monitor on.
        \item \code{eff}: (for MMreg only) - vector containing a sequence of efficiency values to monitor on.
        \item \code{y}: a vector containing the response (required only when option databrush is requested).
        \item \code{X}: a matrix containing the explanatory variables (required only when option databrush is requested).
        \item \code{Bols}: (n-init+1) x (p+1) matrix containing the estimated beta coefficients monitored in 
            each step of the robust procedure (required only when option databrush is requested and suboption multivarfit is requested).
    }
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
  \item{lwd}{
    The line width, a positive number, defaulting to 1
}
  \item{lty}{
    The line type. Line types can either be specified as an integer (1=solid (default), 2=dashed, 
    3=dotted, 4=dotdash, 5=longdash, 6=twodash) or as one of the character strings "solid", 
    "dashed", "dotted", "dotdash", "longdash", or "twodash". 
    The latter two are not supported by Matlab.
}
  \item{col}{
    colors to be used for the highlighted units
}
  \item{cex.lab}{
    The magnification to be used for x and y labels relative to the current setting of cex
}
  \item{cex.axis}{
    The magnification to be used for axis annotation relative to the current setting of cex
}
  \item{xvalues}{
    values for the x axis. Numeric vector of \code{ncol(RES)} controlling the x axis coordinates. 
    The default value of xvalues is \code{(nrow(RES) - ncol(RES) + 1):nrow(RES)}
}
  \item{fg.thresh}{
    (alternative to fg.unit) numeric vector of length 1 or 2 which specifies the highlighted trajectories.
    If \code{length(fthresh) == 1} the highlighted trajectories are those of units that throughtout 
    the search had at leat once a residual greater (in absolute value) than thresh. 
    The default value is \code{fg.thresh=2.5}. If \code{length(fthresh) == 2} the highlighted 
    trajectories are those of units that throughtout the search had a residual at 
    leat once bigger than \code{fg.thresh[2]} or smaller than \code{fg.thresh[1]}.
}
  \item{fg.unit}{
    (alternative to fg.thresh), vector containing the list of the units to be highlighted. 
    If \code{fg.unit} is supplied, \code{fg.thresh} is ignored.
}
  \item{fg.labstep}{
    numeric vector which specifies the steps of the search where to put labels for 
    the highlighted trajectories (units). The default is to put the labels at the 
    initial and final steps of the search. \code{fg.labstep=''} means no label.
}
  \item{fg.lwd}{
 The line width for the highlighted trajectories (units). Default is 1.
}
  \item{fg.lty}{
    The line type for the highlighted trajectories (units). Line types can 
    either be specified as an integer (1=solid (default), 2=dashed, 
    3=dotted, 4=dotdash, 5=longdash, 6=twodash) or as one of the character strings "solid", 
    "dashed", "dotted", "dotdash", "longdash", or "twodash". 
    The latter two are not supported by Matlab.
}
  \item{fg.col}{
    colors to be used for the highlighted units.
}
  \item{fg.mark}{
    Controlls whether to plot highlighted trajectories as symbols.
    if \code{fg.mark==TRUE} each line is plotted using a different 
    symbol else no marker is used (default).
}
  \item{fg.cex}{
    controls the font size of the labels of the trajectories in foreground.
}
  \item{bg.thresh}{
    numeric vector of length 1 or 2 which specifies how to define the unimmportant trajectories.
    Unimmportant trajectories will be plotted using a colormap, in greysh or will be hidden.
    If \code{length(thresh) == 1} the irrelevant units are those which always 
    had a residual smaller (in absolute value) than thresh.
    If \code{length(bthresh) == 2} the irrelevant units are those which always 
    had a residual greater than bthresh(1) and smaller than bthresh(2). The default is:
    \code{bg.thresh=2.5} if \code{n > 100} and \code{bg.thresh=-Inf} if \code{n <= 100} 
    i.e. to treat all trajectories as important if \code{n <= 100} and, if \code{n > 100}, 
    to reduce emphasis only to trajectories having in all steps of the search a value 
    of scaled residual smaller than 2.5.
}
  \item{bg.style}{
    specifies how to plot the unimportant trajectories as defined in option bthresh.
    \enumerate{
    \item \code{bg.style="faint"}: unimportant trajectories are plotted using a colormap.
    \item \code{bg.style="hide"}: unimportant trajectories are hidden.
    \item \code{bg.style="greyish"}: unimportant trajectories are displayed in a faint grey.
    }
    When \code{n>100} the default option is \code{bg.style='faint'}. When \code{n <= 100} 
    and \code{bg.thresh == -Inf} option bstyle is ignored.
    Remark: bground='' is equivalent to -Inf that is all trajectories are considered relevant.
}
  \item{tag}{
    Plot handle. String which identifies the handle of the plot which is about to be created. 
    The default is to use tag 'pl_resfwd'. Notice that if the program finds a plot which has 
    a tag equal to the one specified by the user, then the output of the new plot overwrites 
    the existing one in the same window else a new window is created.
}
  \item{datatooltip}{
    Interactive clicking. It is inactive if this parameter is missing or empty. 
    The default is \code{datatooltip=TRUE}, i.e. the user can select with the 
    mouse an individual residual trajectory in order to have information about 
    the corresponding unit. The information displayed depends on the estimator in use.

    For example for class \code{\link{fsreda.object}} the information concerns the 
    label and the step of the search in which the unit enters the subset. If datatooltip 
    is a list it may contain the following fields:
    \enumerate{
    \item DisplayStyle determines how the data cursor displays. Possible values are 
        \code{'datatip'} and \code{'window'} (default). \code{'datatip'} displays 
        data cursor information in a small yellow text box attached to a black 
        square marker at a data point you interactively select. \code{'window'} 
        displays data cursor information for the data point you interactively 
        select in a floating window within the figure.
    \item SnapToDataVertex: specifies whether the data cursor snaps to the nearest data value or 
        is located at the actual pointer position. 
        Possible values are \code{SnapToDataVertex='on'} (default) and \code{SnapToDataVertex='off'}.
    \item LineColor: controls the color of the trajectory selected with the mouse. It can be an RGB triplet 
        of values between 0 and 1, or character vector indicating a color name. Note that a RGB vector 
        can be conveniently chosen with our MATLAB class FSColor, see documentation.
    \item SubsetLinesColor: enables to control the color of the trajectories of the units that are 
        in the subset at a given step of the search (if \code{resfwdplot()} is applied to an 
        object of class \code{\link{fsreda.object}}) or have a weight greater than 0.9 (if 
        \code{resfwdplot()} is applied to an object of class \code{\link{sregeda.object}} 
        or \code{\link{mmregeda.object}}). This can be done (repeatedly) with a left mouse 
        click in proximity of the step of interest. A right mouse click will terminate the 
        selection by marking with a up-arrow the step corresponding to the highlighted 
        lines. The highlighted lines by default are in red, but a different color can be 
        specified as RGB triplet or character of color name. Note that a RGB vector can 
        be conveniently chosen with our MATLAB class FSColor, see documentation. 
        By default \code{SubsetLinesColor=""}, i.e. the modality is not active.
        Any initialization for \code{SubsetLinesColor} which cannot be interpreted as 
        RGB vector will be converted to blue, i.e. \code{SubsetLinesColor} will be forced to be [0 0 1].
        If \code{SubsetLinesColor} is not empty the previous option \code{LineColor} is ignored.
    }
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
  \item{msg}{
    Controls whether to display or not messages on the screen If \code{msg==1} (default) 
    messages are displayed on the screen about step in which signal took place else 
    no message is displayed on the screen.
}
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
  \item{standard}{
    (MATLAB-style arguments) appearance of the plot in terms of xlim, ylim, axes labels 
    and their font size style, color of the lines, etc.
}
  \item{fground}{
    MATLAB-style arguments for the fground trajectories in foregroud.
}
  \item{bground}{
    MATLAB-style arguments for the fground trajectories in backgroud.
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
resfwdplot(out)

}
}
\keyword{robust}
\keyword{regression}

