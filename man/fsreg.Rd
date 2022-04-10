\name{fsreg}
\alias{fsreg}
\alias{fsreg.default}
\alias{fsreg.formula}
\alias{print.fsr} 
\alias{print.sreg} 
\alias{print.mmreg} 
\alias{print.fsdalms} 
\alias{print.fsdalts} 
\alias{print.fsreda} 
\alias{print.sregeda} 
\alias{print.mmregeda} 
\title{
    fsreg: an automatic outlier detection procedure in linear regression
}
\description{
    An automatic outlier detection procedure in linear regression
}
\usage{

fsreg(x, \dots) 

\method{fsreg}{formula}(formula, data, subset, weights, na.action,
       model = TRUE, x.ret = FALSE, y.ret = FALSE,
       contrasts = NULL, offset, \dots)

\method{fsreg}{default}(x, y, bsb, intercept = TRUE, 
        family = c("homo", "hetero", "bayes"),
		method = c("FS", "S", "MM", "LTS", "LMS"),
        monitoring = FALSE, control, trace = FALSE,
        \dots) 
}

\arguments{

  \item{formula}{a \code{\link{formula}} of the form \code{y ~ x1 + x2 + ...}.}
  \item{data}{data frame from which variables specified in
    \code{formula} are to be taken.}
  \item{subset}{an optional vector specifying a subset of observations
    to be used in the fitting process.}
  \item{weights}{an optional vector of weights to be used
    in the fitting process. \bold{NOT USED YET}.
    %%% If specified, weighted least squares is used
    %%% with weights \code{weights} (that is, minimizing \code{sum(w*e^2)});
    %%% otherwise ordinary least squares is used.
    }
  \item{na.action}{a function which indicates what should happen
    when the data contain \code{NA}s.  The default is set by
    the \code{na.action} setting of \code{\link{options}}, and is
    \code{\link{na.fail}} if that is unset.  The \dQuote{factory-fresh}
    default is \code{\link{na.omit}}.  Another possible value is
    \code{NULL}, no action.  Value \code{\link{na.exclude}} can be useful.}

  \item{model, x.ret, y.ret}{\code{\link{logical}}s indicating if the
    model frame, the model matrix and the response are to be returned,
    respectively.}

  \item{contrasts}{an optional list.  See the \code{contrasts.arg}
    of \code{\link{model.matrix.default}}.}

  \item{offset}{this can be used to specify an \emph{a priori}
    known component to be included in the linear predictor
    during fitting.  An \code{\link{offset}} term can be included in the
    formula instead or as well, and if both are specified their sum is used.} 

  \item{family}{family of robust regression models, can be 'homo' for 
    homoscedastic (same variance) regression model, 'hetero' for 
    heteroskedastic regression model or 'bayes' Bayesian 
    linear regression.  The default is \code{family='homo'} for homoscedastic 
    regression model.} 

  \item{method}{robust regression estimation model, can be 'FS' for 
    Forward search, 'S' for S regression, 'MM' for MM regression, 'LMS' or 'LTS'.  
    The default is \code{method='FS'} for forward search estimation.} 
    
  \item{monitoring}{wheather to perform monitoring for several quantities 
    in each step of the forward search or for series of values of the 
    breakdown point in case of S estimates or for series of values of the 
    efficiency in case of MM estimates. Deafault is \code{monitoring=FALSE}.} 
    
  \item{y}{
               Response variable. Vector. Response variable, specified as
               a vector of length n, where n is the number of
               observations. Each entry in y is the response for the
               corresponding row of X.
               Missing values (NA's) and infinite values (Inf's) are
               allowed, since observations (rows) with missing or infinite
               values will automatically be excluded from the
               computations.
}
  \item{x}{
               Predictor variables. Matrix. Matrix of explanatory
               variables (also called 'regressors') of dimension n x (p-1)
               where p denotes the number of explanatory variables
               including the intercept.
               Rows of X represent observations, and columns represent
               variables. By default, there is a constant term in the
               model, unless you explicitly remove it using input option
               \code{intercept=FALSE}, so do not include a column of 1s in X. Missing
               values (NA's) and infinite values (Inf's) are allowed,
               since observations (rows) with missing or infinite values
               will automatically be excluded from the computations.
}
  \item{bsb}{Initial subset - vector of indices. If \code{bsb=0} (default) then 
    the procedure starts with p units randomly chosen. If bsb is not 0 the search 
    will start with \code{m0=length(bsb)}.
}
  \item{intercept}{Indicator for constant term. Scalar. If \code{intercept=TRUE}, 
    a model with constant term will be fitted (default), else, 
    no constant term will be included.
}
  \item{control}{ A control object (S3) containing estimation options. If the 
    control object is supplied, the parameters from it
    will be used. If parameters are passed also in the invocation statement, 
    they will override the corresponding elements of the control object.}
\item{trace}{Whether to print intermediate results. Default is \code{trace=FALSE}.}
\item{\dots}{
    potential further arguments passed to lower level functions.
}

}
\value{
    Depending on the input parameters \code{family} and \code{method}, one of 
    the following objects will be returned: 
    
    \enumerate{
    \item \code{\link{fsr.object}}
    \item \code{\link{sreg.object}}
    \item \code{\link{mmreg.object}}
    \item \code{\link{fsdalms.object}}
    \item \code{\link{fsdalts.object}}
    \item \code{\link{fsreda.object}}
    \item \code{\link{sregeda.object}}
    \item \code{\link{mmregeda.object}}
    }
}
\references{
       Riani, M., Atkinson A.C., Cerioli A. (2009). Finding an unknown
       number of multivariate outliers. Journal of the Royal Statistical
       Society Series B, Vol. 71, pp. 201-221.
}
\author{
    FSDA team
}

\examples{
    \dontrun{

    library(robustbase)
    
    n <- 200
    p <- 3
    
    X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
    y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)
    (out = fsreg(X, y))

    ## Now we use the formula interface:
    (out1 = fsreg(y~X, control=FSR_control(plot=FALSE)))

    ## Or use the variables in a data frame
    (out2 = fsreg(Y~., data=hbk, control=FSR_control(plot=FALSE)))

    ## let us compare to the LTS solution
    library(robustbase)
    (out3 = ltsReg(Y~., data=hbk))
    
    ## Now compute the model without intercept
    (out4 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE)))
    
    ## And compare again with the LTS solution
    (out5 = ltsReg(Y~.-1, data=hbk))

    ## using default (optional arguments)        
    (out6 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE, nsamp=1500, h=50)))
    }
}
\keyword{robust}
\keyword{regression}
