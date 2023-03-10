######
##  VT::2.12.2019
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
#
#'  Robust transformations for regression
#'
#' @description The transformations for negative and positive responses were determined
#'  by Yeo and Johnson (2000) by imposing the smoothness condition that the second
#'  derivative of zYJ (\eqn{\lambda}{lambda}) with respect to y be smooth at y = 0. However some authors,
#'  for example Weisberg (2005), query the physical interpretability of this constraint
#'  which is oftern violated in data analysis. Accordingly, Atkinson et al. (2019) and (2020)
#'  extend the Yeo-Johnson transformation to allow two values of the transformations
#'  parameter: \eqn{\lambda_N} for negative observations and \eqn{\lambda_P} for non-negative ones.
#'
#'  FSRfan monitors:
#'
#'  \enumerate{
#'  \item the t test associated with the constructed variable computed assuming the same transformation
#'      parameter for positive and negative observations fixed. In short we call this test,
#'      "global score test for positive observations".
#'  \item the t test associated with the constructed variable computed assuming a different
#'      transformation for positive observations keeping the value of the transformation parameter
#'      for negative observations fixed. In short we call this test, "test for positive observations".
#'  \item the t test associated with the constructed variable computed assuming a different
#'      transformation for negative observations keeping the value of the transformation parameter
#'      for positive observations fixed. In short we call this test, "test for negative observations".
#'  \item the F test for the joint presence of the two constructed variables described in points 2) and 3).
#'  \item the F likelihood ratio test based on the MLE of \eqn{\lambda_P} and \eqn{\lambda_N}.
#'      In this case the residual sum of squares of the null model bsaed on a single trasnformation
#'      parameter \eqn{\lambda} is compared with the residual sum of squares of the model based
#'      on data transformed data using MLE of \eqn{\lambda_P} and \eqn{\lambda_N}.
#'  }
#'
#' @return  An S3 object of class \code{\link{fsrfan.object}} will be returned which is basically a list
#'  containing the following elements:
#'  \enumerate{
#'  \item \code{la}: vector containing the values of lambda for which fan plot is constructed
#'  \item \code{bs}: matrix of size \code{p X length(la)} containing the units forming
#'      the initial subset for each value of lambda
#'  \item \code{Score}: a matrix containing the values of the score test for
#'      each value of the transformation parameter:
#'      \itemize{
#'      \item 1st col = fwd search index;
#'      \item 2nd col = value of the score test in each step of the fwd search for la[1]
#'      \item ...
#'      }
#'  \item \code{Scorep}: matrix containing the values of the score test for positive
#'      observations for each value of the transformation parameter.
#'
#'      Note: this output is present only if input option \code{family='YJpn'} or \code{family='YJall'}.
#'
#'  \item \code{Scoren}: matrix containing the values of the score test for negative observations
#'      for each value of the transformation parameter.
#'
#'      Note: this output is present only if input option 'family' is 'YJpn' or 'YJall'.
#'
#'  \item \code{Scoreb}: matrix containing the values of the score test for the joint
#'      presence of both constructed variables (associated with positive and negative
#'      observations) for each value of the transformation parameter. In this case
#'      the reference distribution is the \eqn{F} with 2 and \code{subset_size - p}
#'      degrees of freedom.
#'
#'      Note: this output is present only if input option \code{family='YJall'}.
#'
#'  \item \code{Un}: a three-dimensional array containing \code{length(la)} matrices of
#'      size \code{retnUn=(n-init) X retpUn=11}. Each matrix contains
#'      the unit(s) included in the subset at each step in the search associated
#'      with the corresponding element of \code{la}.
#'
#'      REMARK: at each step the new subset is compared with the old subset.
#'      \code{Un} contains the unit(s) present in the new subset but not in the old one.
#'  }
#'
#' @references
#'  Atkinson, A.C. and Riani, M. (2000), \emph{Robust Diagnostic Regression Analysis} Springer Verlag, New York.
#'
#'  Atkinson, A.C. and Riani, M. (2002), Tests in the fan plot for robust, diagnostic transformations in regression,
#'      \emph{Chemometrics and Intelligent Laboratory Systems}, \bold{60}, pp. 87--100.
#'
#'  Atkinson, A.C. Riani, M. and  Corbellini A. (2019), The analysis of transformations for profit-and-loss data,
#'      \emph{Journal of the Royal Statistical Society, Series C, "Applied Statistics"}, \bold{69}, pp. 251--275.
#'      \doi{10.1111/rssc.12389}
#'
#'  Atkinson, A.C. Riani, M. and Corbellini A. (2021), The Box-Cox Transformation: Review and Extensions,
#'      \emph{Statistical Science}, \bold{36}(2), pp. 239--255. \doi{10.1214/20-STS778}.
#'
#' @examples
#'
#' \dontrun{
#'    data(wool)
#'    XX <- wool
#'    y <- XX[, ncol(XX)]
#'    X <- XX[, 1:(ncol(XX)-1), drop=FALSE]
#'
#'    out <- fsrfan(X, y)                   # call 'fsrfan' with all default parameters
#'    out <- fsrfan(cycles~., data=wool)    # use the formula interface
#'
#'    set.seed(10)
#'    out <- fsrfan(cycles~., data=wool, plot=TRUE) # call 'fsrfan' and produce the plot
#'    plot(out)                               # use the plot method on the fsrfan object
#'    plot(out, conflev=c(0.9, 0.95, 0.99))   # change the confidence leel in the plot method
#'
#'  ##======================
#'  ##
#'  ##  fsrfan() with all default options.
#'
#'  ##  Store values of the score test statistic for the five most common
#'  ##  values of $\lambda$. Produce also a fan plot and display it on the screen.
#'  ##  Common part to all examples: load 'wool' data set.
#'  data(wool)
#'  head(wool)
#'  dim(wool)
#'  ##  The function fsrfan() stores the score test statistic.
#'  ##  In this case we use the five most common values of lambda are considered
#'
#'  out <- fsrfan(cycles~., data=wool)
#'  plot(out)
#'  ##  fanplot(out)                # Not yet implemented in fsdaR
#'
#'  ##  The fan plot shows the log transformation is diffused throughout the data
#'  ##  and does not depend on the presence of particular observations.

#'  ##======================
#'  ##
#'  ##  Example specifying 'lambda'.
#'  ##      Produce a fan plot for each value of 'lambda' in the vector 'la'.
#'  ##      Extract in matrix 'Un' the units which entered the search in each step
#'
#'      data(wool)
#'      out <- fsrfan(cycles~., data=wool, la=c(-1, -0.5, 0, 0.5), plot=TRUE)
#'      plot(out)
#'
#'      out$Un[,2,]
#'
#'  ##======================
#'  ##  Example specifying the confidence level and the initial starting point for monitoring.
#'  ##  Construct the fan plot specifying the confidence level and the initial starting point
#'  ##  for monitoring.
#'      data(wool)
#'      out <- fsrfan(cycles~., data=wool, init=ncol(wool)+1, nsamp=0, conflev=0.95, plots=TRUE)
#'      plot(out, conflev=0.95)
#'
#'  ##=====================
#'  ##  Example with starting point based on LTS.
#'  ##  Extract all subsamples, construct a fan plot specifying the confidence level
#'  ##  and the initial starting point for monitoring based on p+2 observations,
#'  ##  strong line width for lines associated with the confidence bands.
#'      data(wool)
#'      out <- fsrfan(cycles~., data=wool, init=ncol(wool)+1, nsamp=0, lms=0,
#'          lwd.env=3, plot=TRUE)
#'      plot(out, lwd.env=3)
#'
#'  ##=====================
#'  ##  Fan plot using the loyalty cards data.
#'  ##  In this example, 'la' is the vector contanining the most common values
#'  ##  of the transformation parameter.
#'  ##  Store the score test statistics for the specified values of lambda
#'  ##  and automatically produce the fan plot
#'      data(loyalty)
#'      head(loyalty)
#'      dim(loyalty)
#'
#'  ##  la is a vector contanining the most common values of the transformation parameter
#'      out <- fsrfan(amount_spent~., data=loyalty, la=c(0, 1/3, 0.4, 0.5),
#'            init=ncol(loyalty)+1, plot=TRUE, lwd=3)
#'      plot(out, lwd=3)
#'
#'  ##  The fan plot shows that even if the third root is the best value of the transformation
#'  ##  parameter at the end of the search, in earlier steps it lies very close to the upper
#'  ##  rejection region. The best value of the transformation parameter seems to be the one
#'  ##  associated with la=0.4, which is always the confidence bands but at the end of search,
#'  ##  due to the presence of particular observations it goes below the lower rejection line.
#'
#'  ##=====================
#'  ##  Compare BoxCox with Yeo and Johnson transformation.
#'  ##  Store values of the score test statistic for the five most common
#'  ##  values of lambda. Produce also a fan plot and display it on the screen.
#'  ##  Common part to all examples: load wool dataset.
#'
#'      data(wool)
#'
#'      ##  Store the score test statistic using Box Cox transformation.
#'      outBC <- fsrfan(cycles~., data=wool, nsamp=0)
#'
#'      ##  Store the score test statistic using Yeo and Johnson transformation.
#'      outYJ <- fsrfan(cycles~., data=wool, family="YJ", nsamp=0)
#'
#'      ## Not yet fully implemented
#'      ##  fanplot(outBC, main="Box Cox")
#'      ##  fanplot(outYJ,main="Yeo and Johnson")
#'
#'      plot(outBC, main="Box Cox")
#'      plot(outYJ, main="Yeo and Johnson")
#'
#'      cat("\nMaximum difference in absolute value: ",
#'          max(max(abs(outYJ$Score - outBC$Score), na.rm=TRUE)), "\n")
#'
#'
#'
#'
#'  ##======================
#'    ## Call 'fsrfan' with Yeo-Johnson (YJ) transformation
#'    out <- fsrfan(cycles~., data=wool, family="YJ")
#'    plot(out)
#'
#' }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


fsrfan <- function(x, ...) UseMethod("fsrfan")

#' @rdname fsrfan
#' @method fsrfan formula
#' @param formula a \code{\link{formula}} of the form \code{y ~ x1 + x2 + ...}.
#' @param data data frame from which variables specified in
#'    \code{formula} are to be taken.
#' @param subset an optional vector specifying a subset of observations
#'    to be used in the fitting process.
#' @param weights an optional vector of weights to be used
#"    in the fitting process.
#'    %%% If specified, weighted least squares is used
#'    %%% with weights \code{weights} (that is, minimizing \code{sum(w*e^2)});
#'    %%% otherwise ordinary least squares is used.
#'   \bold{NOT USED YET}.
#'
#' @param na.action a function which indicates what should happen
#'    when the data contain \code{NA}s.  The default is set by
#'    the \code{na.action} setting of \code{\link{options}}, and is
#'    \code{\link{na.fail}} if that is unset.  The \dQuote{factory-fresh}
#'    default is \code{\link{na.omit}}.  Another possible value is
#'    \code{NULL}, no action.  Value \code{\link{na.exclude}} can be useful.
#' @param model \code{\link{logical}} indicating if the
#'  model frame, is to be returned.
#' @param x.ret \code{\link{logical}} indicating if the
#'  the model matrixis to be returned.
#' @param y.ret \code{\link{logical}} indicating if the
#'  response is to be returned.
#' @param contrasts an optional list.  See the \code{contrasts.arg}
#'  of \code{\link{model.matrix.default}}.
#' @param offset this can be used to specify an \emph{a priori}
#'    known component to be included in the linear predictor
#'    during fitting.  An \code{\link{offset}} term can be included in the
#"    formula instead or as well, and if both are specified their sum is used.

fsrfan.formula <- function(formula, data, subset, weights, na.action,
			         model = TRUE, x.ret = FALSE, y.ret = FALSE,
                     contrasts = NULL, offset, ...)
{
    cl <- match.call()

    ## keep only the arguments which should go into the model frame
    mf <- match.call(expand.dots = FALSE)
    m <- match(c("formula", "data", "subset", "weights", "na.action",
                 "offset"), names(mf), 0)
    mf <- mf[c(1, m)]
    mf$drop.unused.levels <- TRUE
    mf[[1]] <- as.name("model.frame")
    mf <- eval.parent(mf)
    ##	  if (method == "model.frame") return(mf)

    mt <- attr(mf, "terms")
    y <- model.response(mf, "numeric") ## was model.extract(mf, "response")

    if (is.empty.model(mt)) { # "y ~ 0" : no coefficients
	x <- offset <- NULL
	fit <- list(coefficients = numeric(0), residuals = y,
		    fitted.values = 0 * y, intercept = TRUE, df.residual = length(y))

	## alpha = alpha from "..."
	class(fit) <- "fsrfan"
    }
    else {
        w <- model.weights(mf)
        offset <- model.offset(mf)

	x <- model.matrix(mt, mf, contrasts)

	## Check if there is an intercept in the model.
	## A formula without intercept looks like this: Y ~ . -1
	## If so, remove the corresponding column and use intercept=FALSE;
    ## by default, intercept=TRUE.
	xint <- match("(Intercept)", colnames(x), nomatch = 0)
	if(xint)
	    x <- x[, -xint, drop = FALSE]
	fit <- fsrfan.default(x, y, intercept=(xint > 0), ...)
    }

    if(is.null(fit))
        return(NULL)

    ## 3) return the na.action info
    fit$na.action <- attr(mf, "na.action")
    fit$offset <- offset

    ## 4) return the contrasts used in fitting: possibly as saved earlier.
    fit$contrasts <- attr(x, "contrasts")

    fit$xlevels <- .getXlevels(mt, mf)
    fit$call <- cl
    fit$terms <- mt
    attr(fit$terms, "intercept") <- ifelse(fit$intercept, 1, 0)

    if(model) fit$model <- mf
    if(x.ret) fit$x <- x # or? if(xint == 0) x else  x[, c(2:p,1), drop=FALSE]
    if(y.ret) fit$y <- y

    fit
}

#' @rdname fsrfan
#' @method fsrfan default
#'
#' @param y Response variable. A vector with \code{n} elements that
#'  contains the response variable.
#'
#' @param x An \code{n x p} data matrix (\code{n} observations and \code{p} variables).
#'  Rows of \code{x} represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param intercept wheather to use constant term (default is \code{intercept=TRUE}
#'
#' @param family string which identifies the family of transformations which must be used. Possible values are
#'  \code{c('BoxCox', 'YJ', 'YJpn', 'YJall')}. Default is \code{'BoxCox'}. The Box-Cox family of power
#'  transformations equals \eqn{(y^{\lambda}-1)/\lambda} for \eqn{\lambda} not equal to zero, and \eqn{\log(y)}
#'  if \eqn{\lambda = 0}.
#'  The Yeo-Johnson (YJ) transformation is the Box-Cox transformation of \eqn{y+1} for nonnegative values, and of
#'  \eqn{|y|+1} with parameter \eqn{2-\lambda} for \eqn{y} negative. Remember that BoxCox can be used only
#'  if input y is positive. Yeo-Johnson family of transformations does not have this limitation.
#'  If \code{family='YJpn'} Yeo-Johnson family is applied but in this case it is also possible
#'  to monitor (in the output arguments \code{Scorep} and \code{Scoren}) the score test for
#'  positive and negative observations respectively. If \code{family='YJall'}, it is also
#'  possible to monitor the joint F test for the presence of the two constructed variables
#'  for positive and negative observations.
#'
#' @param la values of the transformation parameter for which it is necessary
#'  to compute the score test. Default value of lambda is
#'  \code{la=c(-1, -0.5, 0, 0.5, 1)}, i.e., the five most common values of lambda.
#'
#' @param lms how to find the initlal subset to initialize the search. If \code{lms=1} (default)
#'  Least Median of Squares (LMS) is computed, else Least Trimmed Squares (LTS) is computed.
#'  If, \code{lms} is matrix of size \code{p - 1 + intercept X length(la)} it contains in column
#'  \code{j=1,..., lenght(la)} the list of units forming the initial subset for the search
#'  associated with \code{la(j)}. In this case the input option \code{nsamp} is ignored.
#' @param alpha the percentage (roughly) of squared residuals whose sum will be minimized,
#'  by default \code{alpha=0.5}. In general, alpha must between 0.5 and 1.
#' @param h The number of observations that have determined the least trimmed squares
#'  estimator,  scalar. \code{h} is an integer greater or equal than \code{p} but smaller
#'  then \code{n}. Generally \code{h=[0.5*(n+p+1)]} (default value).
#'
#' @param init Search initialization. It specifies the initial subset size to start
#'  monitoring the value of the score test. If \code{init} is not specified it will
#'  be set equal to: \code{p+1}, if the sample size is smaller than 40 or
#'  \code{min(3 * p + 1, floor(0.5 * (n+p+1)))}, otherwise.
#'
#' @param plot If \code{plot=FALSE} (default) no plot is produced.
#'  If \code{plot=TRUE} a fan plot is shown.
#'
#' @param msg  Controls whether to display or not messages on the screen. If \code{msg==TRUE}
#'  messages are displayed on the screen. If \code{msg=2}, detailed messages are displayed,
#'  for example the information at iteration level.
#'
#' @param nocheck Whether to check input arguments. If \code{nocheck=TRUE} no check is performed
#'  on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X}
#'  are left unchanged. In other words the additional column of ones for the
#'  intercept is not added. The default is \code{nocheck=FALSE}.
#'
#' @param nsamp number of subsamples which will be extracted to find the robust estimator. If \code{nsamp=0}
#'  all subsets will be extracted. They will be \code{n choose p}.
#'
#'  Remark: if the number of all possible subset is <1000 the default is to extract all subsets
#'  otherwise just 1000. If \code{nsamp} is a matrix of size \code{r-by-p}, it contains in the rows
#'  the subsets which sill have to be extracted. For example, if \code{p=3} and \code{nsamp=c(2,4,9; 23, 45, 49; 90, 34, 1)}
#'  the first subset is made up of units \code{c(2, 4, 9)}, the second subset of units \code{c(23, 45, 49)}
#'  and the third subset of units \code{c(90 34 1)}.
#'
#' @param conflev Confidence level for the bands (default is 0.99, that is we plot two horizontal lines corresponding to values -2.58 and 2.58).
#' @param xlab A label for the X-axis, default is 'Subset size m'
#' @param ylab A label for the Y-axis, default is 'Score test statistic'
#' @param main A label for the title, default is 'Fan plot'
#' @param xlim Minimum and maximum for the X-axis
#' @param ylim Minimum and maximum for the Y-axis
#' @param lwd The line width of the curves which contain the score test, a positive number, default is \code{lwd=2}
#' @param lwd.env The line width of the lines associated with the envelopes, a positive number, default is \code{lwd.env=1}
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#' @param \dots potential further arguments passed to lower level functions.
#'


fsrfan.default <- function(x, y, intercept=TRUE, plot=FALSE,
        family=c("BoxCox", "YJ", "YJpn", "YJall"), la=c(-1, -0.5, 0, 0.5, 1), lms, alpha=0.75, h, init,
        msg=FALSE, nocheck=FALSE, nsamp=1000, conflev=0.99,
        xlab, ylab, main, xlim, ylim,
        lwd=2, lwd.env=1, trace=FALSE, ...)
{
    if(is.data.frame(x))
      x <- data.matrix(x)
    else if(!is.matrix(x))
      x <- matrix(x, length(x), 1,
                  dimnames = list(names(x), deparse(substitute(x))))
    if(!is.numeric(x)) stop("x is not a numeric")

    if(is.data.frame(y))
      y <- data.matrix(y)
    else if(!is.matrix(y))
      y <- matrix(y, length(y), 1,
                  dimnames = list(names(y), deparse(substitute(y))))
    if(!is.numeric(y)) stop("y is not a numeric")

    storage.mode(x) <- "double"
    storage.mode(y) <- "double"

    dx <- dim(x)
    xn <- (dnx <- dimnames(x))[[2]]
    xn <- if (!is.null(xn))
        xn
    else if (dx[2] > 1)
        paste("X", 1:dx[2], sep = "")
    else if(dx[2])
        "X"
    dimnames(x) <- list(dnx[[1]], xn)

    n <- nrow(x)
    p <- ncol(x)

    family <- match.arg(family)

    control <- list()
    control$intercept <- ifelse(intercept, 1, 0)
    control$la <- la
    control$plots <- ifelse(plot, 1, 0)
    control$family <- family

    ## If lms is 1 (default) LMS is computed, else LTS is computed.
    ##  If, lms is matrix with size  p - 1 + intercept - by - length(la)
    ##  it contains in column j=1,..., lenght(la) the list of units forming
    ##  the initial subset for the search associated with la(j). In this last
    ##  case input option nsamp is ignored.
    p1 <- p + ifelse(nocheck, 0, intercept)
    if(missing(lms))
        lms <- matrix(1., ncol=1, nrow=1)
    else if(length(lms) == 1)
        lms <- matrix(lms, ncol=1, nrow=1)
    else {
        lms <- if(!is.matrix(lms)) as.matrix(lms) else lms
        if(ncol(lms) != length(la))
            stop("The number of columns of the input parameter 'lms' must be equal to the length of'la'!")
        if(nrow(lms) != p1)
            stop(paste("The number of rows of the input parameter 'lms' must be equal to p+intercept=", p1,"!"))
    }
    if(!is.numeric(lms))
        stop("The input parameter 'lms' must be either a number or a numeric matrix!")
    control$lms <- lms

    if(!missing(h))          alpha <- h/n
    else                     h <- ceiling(alpha*n)
    if(alpha < 1/2 | alpha > 1)
        stop("'alpha' must be between 0.5 and 1.0!")
    control$h <- h

    if(!missing(init))
        control$init <- init

##  Graphical parameters
    if(!missing(xlab))
        control$labx <- xlab
    if(!missing(ylab))
        control$laby <- ylab
    if(!missing(main))
        control$titl <- main
    if(!missing(xlim))
        control$xlimx <- xlim
    if(!missing(ylim))
        control$ylimy <- ylim

    control$lwd <- lwd
    control$lwdenv <- lwd.env

    xmsg <- 0
    if(is.logical(msg))
        xmsg <- ifelse(msg, 1, 0)
    else  if(is.numeric(msg) && msg >= 0 && msg <= 2)
        xmsg <- msg
    else
        stop("Invalid parameter 'msg'. Should be TRUE/FALSE or 0, 1, 2.")
    control$msg <- xmsg

    if(!is.numeric(nocheck) && !is.logical(nocheck) || length(nocheck) != 1)
        stop("'nocheck' must be logical or numeric of length 1!")
    control$nocheck <- ifelse(nocheck, 1, 0)

    if(!is.numeric(nsamp) || length(nsamp) != 1)
        stop("'nsamp' must be numeric of length 1!")
    control$nsamp <- nsamp

    if(!is.numeric(conflev))
        stop("'conflev' must be numeric!")
    control$conflev <- conflev

    outclass <- "fsrfan"

    parlist = c(.jarray(y, dispatch=TRUE), .jarray(x, dispatch=TRUE))
    paramNames = names(control)
    if(trace)
        print(control)

    if(length(paramNames) > 0)
    {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i]
            paramValue = control[[i]]

            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    out <- callFsdaFunction("FSRfan", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB FSRfan().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    Score <- if(as.integer(arr$hasField("Score", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Score", as.integer(1)), "[[D", simplify = TRUE))

    Scorep <- if(as.integer(arr$hasField("Scorep", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scorep", as.integer(1)), "[[D", simplify = TRUE))

    Scoren <- if(as.integer(arr$hasField("Scoren", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scoren", as.integer(1)), "[[D", simplify = TRUE))

    Scoreb <- if(as.integer(arr$hasField("Scoreb", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scoreb", as.integer(1)), "[[D", simplify = TRUE))

    la <- as.matrix(.jevalArray(arr$get("la", as.integer(1)), "[[D", simplify = TRUE))
    bs <- as.matrix(.jevalArray(arr$get("bs", as.integer(1)), "[[D", simplify = TRUE))

    ## Un is returned as a cell array (a list of matrices). Convert it to
    ##  a tri-dimensional array
    Un <- unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("Un", as.integer(1)))))

    ## VT::29.03.2022 - return the Un array as NULL, if init=nrow(X), i.e.
    ##  only one step is conducted
    if(!is.null(dim(Un[[1]])[2]) && !is.null(dim(Un[[1]])[1])) {
        aUn <- array(dim=c(dim(Un[[1]])[2], dim(Un[[1]])[1], length(Un)))
        for(ix in 1:length(Un))
            aUn[,,ix] <- t(Un[[ix]])
        dimnames(aUn) <- list(aUn[,1,1], c("Step", 1:10), la)
    } else aUn <- NULL

    X <- if(as.integer(arr$hasField("X", as.integer(1))) != 1) NULL
                else as.matrix(.jevalArray(arr$get("X", as.integer(1)), "[[D", simplify = TRUE))
    y <- if(as.integer(arr$hasField("y", as.integer(1))) != 1) NULL
                else as.matrix(.jevalArray(arr$get("y", as.integer(1)), "[[D", simplify = TRUE))

    if(!is.null(Score)) {
        rownames(Score) <- 1:nrow(Score)
        colnames(Score) <- c("Step", paste0("la=", la))
    }
    ans <- list(call=match.call(), la=la, bs=bs, Score=Score, Un=aUn, X=X, y=y)

    if(family %in% c("YJpn", "YJall")) {
        ans$Scorep <- Scorep
        ans$Scoren <- Scoren

        if(family == "YJall") {
            ans$Scoreb <- Scoreb
        }
    }

    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}

#' @rdname fsrfan
#' @method plot fsrfan
#' @title FSR fan plots (robust transformations for regression)
#'
#' @param conflev Confidence level for the bands (default is 0.99, that is,
#'  we plot two horizontal lines corresponding to values -2.58 and 2.58).
#' @param col a vector specifying the colors for the lines, each
#'  one corresponding to a \code{la} value. if \code{length(col) < length(la)},
#'  the colors will be recycled.
#' @param lty a vector specifying the line types for the lines, each
#'  one corresponding to a \code{la} value. if \code{length(col) < length(la)},
#'  the colors will be recycled.
#' @param xlab A label for the X-axis, default is 'Subset size m'
#' @param ylab A label for the Y-axis, default is 'Score test statistic'
#' @param main A label for the title, default is 'Fan plot'
#' @param xlim Minimum and maximum for the X-axis
#' @param ylim Minimum and maximum for the Y-axis
#' @param lwd The line width of the curves which contain the score test, a positive number, default is \code{lwd=2}
#' @param lwd.env The line width of the lines associated with the envelopes, a positive number, default is \code{lwd.env=1}
#'
#' @param \dots potential further arguments passed to lower level functions.
#'
plot.fsrfan <- function(x, conflev=0.99, xlim, ylim,
    xlab="Subset of size m", ylab="Score test statistic", main="Fan plot",
    col, lty, lwd=2.5, lwd.env=1, ...) {

    if(missing(ylim))
        ylim <- c(min(x$Score[, -1], na.rm=TRUE), max(x$Score[, -1], na.rm=TRUE))
    if(missing(xlim))
        xlim <- c(x$Score[1,1]-1, x$Score[nrow(x$Score), 1]+1)

    if(missing(col)) {
        r <- c(0, 1, 1, 1, 0, 0)
        g <- c(0, 0, 0, 1, 1, 1)
        b <- c(1, 0, 1, 0, 0, 1)
        col <- rgb(r, g, b, names=c("blue", "red", "magenta", "yellow", "green", "cyan"))
    }
    col <- rep(col, ceiling(length(x$la)/length(col)))
    if(missing(lty))
        lty <- c(1:3, 5)
    lty <- rep(lty, ceiling(length(x$la)/length(lty)))

    plot(x$Score[, 1], x$Score[, 2], type="n", xlab=xlab, ylab=ylab,
        main=main, xlim=xlim, ylim=ylim, yaxt="n", ...)
    axis(2, pretty(x$Score[,-1], 10))
    for (i in 2:ncol(x$Score)){
        lines(x$Score[,1], x$Score[, i], type = 'l', col=col[i-1], lty=lty[i-1], lwd=lwd)
    }
    text(rep(x$Score[nrow(x$Score), 1], length(x$la)), x$Score[nrow(x$Score), -1], x$la, adj=c(0,0.5))

    quant <- sqrt(qchisq(conflev, 1))
    abline(h=quant, col="red", lwd=lwd.env)
    abline(h=-quant, col="red", lwd=lwd.env)

    invisible(x)
}
