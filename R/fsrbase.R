fsrbase <- function(x, ...) UseMethod("fsrbase")

fsrbase.formula <- function(formula, data, subset, weights, na.action,
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

    if(is.empty.model(mt)) { # "y ~ 0" : no coefficients
    	x <- offset <- NULL
    	fit <- list(coefficients = numeric(0), residuals = y,
    		    fitted.values = 0 * y, intercept = TRUE, df.residual = length(y))

    	class(fit) <- "fsrbase"
    } else {
        w <- model.weights(mf)
        offset <- model.offset(mf)

        x <- model.matrix(mt, mf, contrasts)

        ## Check if there is an intercept in the model.
        ## A formula without intercept looks like this: Y ~ . -1
        ## If so, remove the corresponding column and use intercept=TRUE;
        ## by default, intercept=TRUE.
        xint <- match("(Intercept)", colnames(x), nomatch = 0)
        if(xint)
            x <- x[, -xint, drop = FALSE]
        fit <- fsrbase.default(x, y, intercept = (xint > 0), ...)
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

fsrbase.default <- function(x, y, bsb, intercept = TRUE,
        monitoring = FALSE, control, trace=FALSE, ...)
{
    family <- "homo"
    method <- "FS"

    ## If 'control' not supplied, create a default control, according to
    ##  'monitoring', 'family' and 'method' and add to it all optional
    ##  parameters passed on the function call. Use as a switch for calling
    ##  the Matlab functions the 'outclass' element of the control object.
    control <- .setControl(monitoring, family, method, control, ...)

    if(!is.null(control$intercept) && control$intercept == 0)
        intercept <- FALSE

    return(fsreg(x, y, bsb, intercept=intercept, family=family, monitoring=monitoring, method=method, control=control, trace=trace))
}
