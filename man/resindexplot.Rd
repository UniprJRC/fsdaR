\name{resindexplot}
\alias{resindexplot}
\title{
Plots the residuals from a regression analysis versus index number or any other variable
}
\description{
The function \code{resindexplot()} plots the residuals from a regression analysis
versus index number or any other variable. The residuals come from an output
object of any of the regression fucntions or a simply a vector of values.
In order to use the databrush option, the residuals must come from one of
the fsdaR regression functions.
}
\usage{
resindexplot(out, x, xlim, ylim, xlab, ylab, main, numlab, indlab, conflev, cex.axis, 
    cex.lab, lwd, nameX, namey, tag, col, cex, databrush, ...)
}

\arguments{
  \item{out}{
    A vector containing the residuals from a regression analysis or an object returned by one of 
    the regression functions (see \code{\link{FSR_control}}, \code{\link{LXS_control}}, 
    \code{\link{Sreg_control}} and \code{\link{MMreg_control}}). The object is one of
    \code{\link{fsr.object}}, \code{\link{fsdalts.object}}, \code{\link{fsdalms.object}}, 
    \code{\link{sreg.object}} or \code{\link{mmreg.object}}. The needed elements of \code{out} are 
    at least \code{residuals}, but if the option \code{databrush} is used, also \code{X} amd \code{y} will be needed.
    }

  \item{x}{
    The vector to be plotted on the x-axis. As default the sequence 1:length(residuals) will be used
    }
  
  \item{xlim}{Control \code{x} scale in plot. Vector with two elements controlling 
  minimum and maximum on the x axis. Default is to use automatic scale.
    }   
  
  \item{ylim}{Control \code{y} scale in plot. Vector with two elements controlling 
  minimum and maximum on the y axis. Default is to use automatic scale.
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
  
  \item{numlab}{
    Number of points to be identified in plots (see also \code{indlab}) . By default the five points with largest values will be identified.
    If numlab is a single number containing scalar k, the units with the k largest residuals are labelled in the plots.
    If numlab is a vector, the units inside vector numlab are labelled in the plots. 
    The default value of \code{numlab=5} and the units with the 5 largest residuals will be labelled. If \code{numlib=0} or 
    \code{numlib=NULL} no labelling will be done.
    }
  
  \item{indlab}{
    Which points to be identified in plots (see also \code{numlab}) - the units with indexes in the vector indlab are labelled in the plots. 
    }
  
  \item{conflev}{
    Confidence interval for the horizontal bands (a numeric vector). 
    It can be a vector of different confidence level values. 
    
    Remark: confidence interval is based on the chi^2 distribution
    }
  
  \item{cex.axis}{
    The magnification to be used for axis annotation relative to the current setting of cex
    }
  
  \item{cex.lab}{
    The magnification to be used for x and y labels relative to the current setting of cex  
    }
  
  \item{lwd}{
    The line width, a positive number, defaulting to 1
    }
  
  \item{tag}{
    Figure tag (character). Tag of the figure which will host the \code{resindexplot}. 
    The default tag is \code{pl_resindex}.
    }
  
  \item{col}{
    Fill color for markers that are closed shapes (circle, square, diamond, pentagram, hexagram, and the four triangles).
    Can be \code{'none'} or \code{'auto'} or color name(string) or  RGB triplet.
    }
  
  \item{cex}{
    Size of the point symbols. The magnification to be used relative to the current setting of cex.
    }
  
  \item{nameX}{Add variable labels in plot. A vector of strings of length \code{p} 
  containing the labels of the variables of the regression dataset. 
  If it is empty (default) the sequence \code{X1, ..., Xp} will be created automatically
    }
  
  \item{namey}{Add response label. A string containing the label of the response}
  
  \item{databrush}{
    Interactive mouse brushing. If databrush is missing or empty (default) or \code{databrush=FALSE}, no brushing is done.
    The activation of this option (databrush is a scalar or a list) enables the user to select 
    a set of trajectories in the current plot and to see them highlighted in the y|X plot, 
    i.e. a matrix of scatter plots of y against each column of X, grouped according to the 
    selection(s) done by brushing. If the plot y|X does not exist it is automatically created.
    In addition, brushed units are automatically highlighted in the minimum deletion residual 
    plot if it is already open. The extension to the following plots will be available in future 
    versions of the package:
    
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
    \item \code{persist}. Persist is an empty value or a character containing 'on' or 'off'. 
        The default value is \code{persist=""}, that is brushing is allowed only once.    
    If \code{persist="on"} or \code{persis="off"} brushing can be done as many time as 
    the user requires. If \code{persist='on'} then the unit(s) currently brushed are 
    added to those previously brushed. It is possible, every time a new brushing is 
    done, to use a different color for the brushed units. If \code{persist='off'} 
    every time a new brush is performed units previously brushed are removed.
    
    \item \code{bivarfit}. This option adds one or more least square lines based on 
        SIMPLE REGRESSION to the plots of y|X, depending on the selected groups.
        The default is \code{bivarfit=FALSE}: no line is fitted. 
        If \code{bivarfit=1}, a single OLS line is fitted to all points of each bivariate 
        plot in the scatter matrix y|X. If \code{bivarfit=2}, two OLS lines are fitted: 
        one to all points and another to the group of the genuine observations. 
        The group of the potential outliers is not fitted. If \code{bivarfit=0} 
        one OLS line is fitted to each group. This is useful for the purpose of 
        fitting mixtures of regression lines. If \code{bivarfit='i1'} or 
        \code{bivarfit='i2'}, etc. an OLS line is fitted to a specific group, 
        the one with index 'i' equal to 1, 2, 3 etc. 
        Again, useful in case of mixtures.
        
    \item \code{multivarfit}.  Wheather to superimpose multivariate least square lines. 
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
    
    \item \code{labeladd}. Add outlier labels in plot. If \code{labeladd=TRUE}, we label the outliers 
        with the unit row index in matrices X and y. 
        The default value is \code{labeladd=FALSE}, i.e. no label is added.
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
out <- fsreg(stack.loss~., data=stackloss)
resindexplot(out, conflev=c(0.95,0.99), col="green")
}
}
\keyword{robust}
\keyword{regression}
