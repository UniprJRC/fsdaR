######
##  VT::2.12.2019
##
##
##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/R/fsdaR", load_code=roxygen2:::load_installed)
##
#'  Computes the score test for transformation in regression
#'
#' @description Computes the score test for transformation in regression
#'
#' @return  An S3 object of class \code{\link{score.object}} will be returned which is basically a list
#'  containing the following elements:
#'  \enumerate{
#'  \item \code{la}: vector containing the values of lambda for which fan plot is constructed
#'  \item \code{Score}: a vector containing the values of the score test for
#'      each value of the transformation parameter.
#'  \item \code{Lik}: value of the likelihood. This output is produced only if lik=TRUE.
#'  }
#'
#' @references
#'  Atkinson, A.C. and Riani, M. (2000), \emph{Robust Diagnostic Regression Analysis} Springer Verlag, New York.
#'
#' @examples
#'
#'  \dontrun{
#'    data(wool)
#'    XX <- wool
#'    y <- XX[, ncol(XX)]
#'    X <- XX[, 1:(ncol(XX)-1), drop=FALSE]
#'
#'    (out <- score(X, y))                          # call 'score' with all default parameters
#'    (out <- score(cycles~., data=wool))           # use the formula interface
#'    (out <- score(cycles~., data=wool, lik=TRUE)) # return the likelihood
#'
#'    data(loyalty)
#'    head(loyalty)
#'    ##    la is a vector containing the values of \lambda which have to be tested
#'    (out <- score(amount_spent~., data=loyalty, la=c(0.25, 1/3, 0.4, 0.5)))
#'    (out <- score(amount_spent~., data=loyalty, la=c(0.25, 1/3, 0.4, 0.5), lik=TRUE))
#'  }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}


score <- function(x, ...) UseMethod("score")

#' @rdname score
#' @method score formula
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
#' @param contrasts an optional list.  See the \code{contrasts.arg}
#'  of \code{\link{model.matrix.default}}.
#' @param offset this can be used to specify an \emph{a priori}
#'    known component to be included in the linear predictor
#'    during fitting.  An \code{\link{offset}} term can be included in the
#"    formula instead or as well, and if both are specified their sum is used.

score.formula <- function(formula, data, subset, weights, na.action,
			         model = TRUE,
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
	class(fit) <- "score"
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
	fit <- score.default(x, y, intercept=(xint > 0), ...)
    }

    if(is.null(fit))
        return(NULL)

    ## 3) return the na.action info
    ##fit$na.action <- attr(mf, "na.action")
    ##fit$offset <- offset

    ## 4) return the contrasts used in fitting: possibly as saved earlier.
    ##fit$contrasts <- attr(x, "contrasts")

    ##fit$xlevels <- .getXlevels(mt, mf)
    fit$call <- cl
    ##fit$terms <- mt
    ##attr(fit$terms, "intercept") <- ifelse(fit$intercept, 1, 0)

    ##if(model) fit$model <- mf

    fit
}
#'
#' @rdname score
#' @method score default
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
#' @param la values of the transformation parameter for which it is necessary
#'  to compute the score test. Default value of lambda is
#'  \code{la=c(-1, -0.5, 0, 0.5, 1)}, i.e., the five most common values of lambda.
#'
#' @param lik likelihood for the augmented model. If true the value of the likelihood
#'  for the augmented model will be calculated and returend otherwise (default) only
#'  the value of the score test will be given
#'
#' @param nocheck Whether to check input arguments. If \code{nocheck=TRUE} no check is performed
#'  on matrix \code{y} and matrix \code{X}. Notice that \code{y} and \code{X}
#'  are left unchanged. In other words the additional column of ones for the
#'  intercept is not added. The default is \code{nocheck=FALSE}.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#' @param \dots potential further arguments passed to lower level functions.
#'

score.default <- function(x, y, intercept=TRUE, la=c(-1, -0.5, 0, 0.5, 1), lik=FALSE, nocheck=FALSE, trace=FALSE, ...)
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

    control <- list()
    control$intercept <- ifelse(intercept, 1, 0)
    control$la <- la
    if(lik)
        control$Lik <- 1

    if(!is.numeric(nocheck) && !is.logical(nocheck) || length(nocheck) != 1)
        stop("'nocheck' must be logical or numeric of length 1!")
    control$nocheck <- ifelse(nocheck, 1, 0)

    outclass <- "score"

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

    out <- callFsdaFunction("Score", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB Score().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    Score <- if(as.integer(arr$hasField("Score", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Score", as.integer(1)), "[[D", simplify = TRUE))

    Lik <- if(as.integer(arr$hasField("Lik", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Lik", as.integer(1)), "[[D", simplify = TRUE))

    la_names <- c(paste0("la=", format(la, digits=2, nsmall=2)))
    if(!is.null(Score)) {
        Score <- Score[, 1]
        names(Score) <- la_names

    }

    ans <- list(call=match.call(), la=la, Score=Score)
    if(lik && !is.null(Lik)) {
        Lik <- Lik[, 1]
        names(Lik) <- la_names
        ans$Lik <- Lik
    }

    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
