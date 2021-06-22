fsreg <- function(x, ...) UseMethod("fsreg")

fsreg.formula <- function(formula, data, subset, weights, na.action,
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
	class(fit) <- "fsreg"
    }
    else {
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
	fit <- fsreg.default(x, y, intercept = (xint > 0), ...)
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

fsreg.default <- function(x, y, bsb, intercept = TRUE,
        family = c("homo", "hetero", "bayes"),
		method = c("FS", "S", "MM", "LTS", "LMS"),
        monitoring = FALSE,
        control, trace=FALSE, ...)
{
    family <- match.arg(family)
    method <- match.arg(method)

    ## If 'control' not supplied, create a default control, according to
    ##  'monitoring', 'family' and 'method'. Use as a switch for calling the Matlab functions
    ##  the 'outclass' element of the control object.
    ##  Remove 'outclass' from the control object - not to disturb the mapping to Java.
    if(missing(control))
        control <- .defaultControl(monitoring, family, method)
    outclass <- control$outclass
    control$outclass <- NULL

    if(!is.null(control$intercept) && control$intercept == 0)
        intercept <- FALSE

    ## Check if the control corresponds to the parameter supplied: monitoring, family and method:
    defc <- .defaultControl(monitoring=monitoring, family=family, method=method)
    if(class(defc) != class(control))
        stop(paste0("Wrong control object provided: '", class(control), "'. Must be ", class(defc), "."))

	if(is.data.frame(y)){
	    y <- data.matrix(y)
	}else if(!is.matrix(y))
        y <- matrix(y, length(y), 1, dimnames = list(names(y), deparse(substitute(y))))

    if(!is.numeric(y)) stop("y is not a numeric")
    ##    if (dim(y)[2] != 1) stop("y is not onedimensional")

	if(is.data.frame(x))
	    x <- data.matrix(x)
	else if(!is.matrix(x))
	    x <- matrix(x, length(x), 1,
			dimnames = list(names(x), deparse(substitute(x))))

    dx <- dim(x)
    xn <- (dnx <- dimnames(x))[[2]]
    xn <- if (!is.null(xn))
        xn
    else if (dx[2] > 1)
        paste("X", 1:dx[2], sep = "")
    else if (dx[2])
        "X"
    dimnames(x) <- list(dnx[[1]], xn)


    if(nrow(x) != nrow(y))
	   stop("Number of observations in x and y not equal")

    n <- nrow(x)
    p <- ncol(x)

    if((missing(bsb) || is.null(bsb)) && monitoring)
        bsb <- 0

##
##  We do not set the default arguments here - let Matlab do this.
##
##    if(missing(h))
##        h <- 0.5*(n+p+1)
##
##  if(missing(nsamp))
##        nsamp <- 1000

    # Richiamo del riferimento alle librerie di MATLAB compilate in Java
    # fsdaEngine = get("fsdaEngine", envir = .GlobalEnv)

    # Add monitoring parameters
    if(!monitoring) {
        parlist <- c(.jarray(y, dispatch=TRUE), .jarray(x, dispatch=TRUE))
    }
    else {
        parlist  <- if(outclass=="sregeda" | outclass=="mmregeda")
                        c(.jarray(y, dispatch=TRUE), .jarray(x, dispatch=TRUE))
                    else
                        c(.jarray(y, dispatch=TRUE), .jarray(x, dispatch=TRUE), .jarray(bsb, dispatch=TRUE))
    }


    if(trace)
    {
        cat("\nOptional parameters: \n")
        print(control)
    }

  # Conversione e controllo dei parametri opzionali:
  # 1) Controllo esistenza del parametro opzionale
  # 2) Conversione del valore del parametro in oggetto Java
  # 3) Aggiunta dell'oggetto Java alla lista di parametri da passare
  #    al codice generato da MATLAB
  #
  # Nota: in caso di tipi particolari MATLAB (es. cell array, struct)
  # BISOGNA scrivere la funzione specifica che converte quel parametro
  # e passarla come terzo argomento a checkOptArg.R. La convenzione
  # di denominazione per queste funzioni
  #
  # check<FunzioneMatlab><NomeParametro>
  #
  # Es. per il parametro "lms" di FSR diventa:
  # checkFSRlms
  #

  #  parlist <- c(parlist, list(.jnew("java/lang/String", "intercept"), .jnew("java/lang/Double", ifelse(intercept, 1, 0))))
    paramNames = names(control)
    for (i in 1:length(paramNames)) {
        paramName = paramNames[i]
        paramValue = control[[i]]
        matlabValue = rType2MatlabType(paramName, paramValue)
        parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
    }

    if(!monitoring)
    {
        out <- if(outclass == "fsr")        callFsdaFunction("FSR", "[Ljava/lang/Object;", 1, parlist)
                else if(outclass=="fsrh")   callFsdaFunction("FSRH", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="fsrb")           callFsdaFunction("FSRB", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="sreg")           callFsdaFunction("Sreg", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="mmreg")          callFsdaFunction("MMreg", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="fsdalms" || outclass=="fsdalts") callFsdaFunction("LXS", "[Ljava/lang/Object;", 1, parlist)
        else
            stop(paste("Undefined method: ", method))

        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

        if(trace)
        {
            cat("\nReturning from MATLAB - Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        # Conversione dei risultati da oggetti Java a tipi di dati R
        # Gli struct di MATLAB vengono convertiti in "list" di R
        #

        residuals = as.vector(as.matrix(.jevalArray(arr$get("residuals", as.integer(1)), "[[D", simplify = TRUE)))

        fitted.values <- if(as.integer(arr$hasField("fittedvalues", as.integer(1))) != 1) NULL
                        else as.vector(as.matrix(.jevalArray(arr$get("fittedvalues", as.integer(1)), "[[D", simplify = TRUE)))
        outliers = as.vector(as.matrix(.jevalArray(arr$get("outliers", as.integer(1)), "[[D", simplify = TRUE)))
        beta = as.vector(as.matrix(.jevalArray(arr$get("beta", as.integer(1)), "[[D", simplify = TRUE)))
            dnames <- if(intercept) c("(Intercept)") else c()
            names(beta) <- c(dnames, colnames(x))

        scale <- if(as.integer(arr$hasField("scale", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("scale", as.integer(1)), "[[D", simplify = TRUE))[1,1]

        auxscale <- if(as.integer(arr$hasField("auxscale", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("auxscale", as.integer(1)), "[[D", simplify = TRUE))[1,1]

        if(as.integer(arr$hasField("weights", as.integer(1))) == 1) {
            weights = as.matrix(.jevalArray(arr$get("weights", as.integer(1)), "[[D", simplify = TRUE))
        }else
        {
            ## if weights are not returned (e.g. in FSR, use 'outliers' to generate 0-1 weights
                weights <- rep(1, length(y))
                weights[outliers] <- 0
        }
        weights = as.vector(weights)

        # Costruzione del risultato finale compatibile con R
        fvNames = NULL
        if (!is.null(fitted.values)) {
          fvNames = names(fitted.values);
        }
        names(residuals) <- fvNames <- names(weights) <- rownames(x)

        ans = list(call=match.call(), outliers=outliers, coefficients=beta, scale=scale, auxscale=auxscale, intercept=intercept,
            residuals=residuals, weights=weights, y=y, X=x)
        if (!is.null(fitted.values)) {
          ans$fitted.values = fitted.values;
        }

        ## follow several fields for S, MM and LXS: bs, conflev,  singsub and Ssingsub
        rhofunc <- if(as.integer(arr$hasField("rhofunc", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("rhofunc", as.integer(1)), "[[D", simplify = TRUE))
        ans$rhofunc <- intToUtf8(rhofunc)

        rhofuncparam <- if(as.integer(arr$hasField("rhofuncparam", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("rhofuncparam", as.integer(1)), "[[D", simplify = TRUE))
        ans$rhofuncparam <- as.vector(rhofuncparam)

        bs <- if(as.integer(arr$hasField("bs", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("bs", as.integer(1)), "[[D", simplify = TRUE))
        ans$bs <- as.vector(bs)

        conflev <- if(as.integer(arr$hasField("conflev", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("conflev", as.integer(1)), "[[D", simplify = TRUE))
        ans$conflev <- as.vector(conflev)[1]

        singsub <- if(as.integer(arr$hasField("singsub", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("singsub", as.integer(1)), "[[D", simplify = TRUE))
        ans$singsub <- as.vector(singsub)[1]
        Ssingsub <- if(as.integer(arr$hasField("Ssingsub", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("Ssingsub", as.integer(1)), "[[D", simplify = TRUE))
        ans$singsub <- as.vector(Ssingsub)[1]

        if(outclass == "fsr")
        {
            mdr = as.matrix(.jevalArray(arr$get("mdr", as.integer(1)), "[[D", simplify = TRUE))
            Un = as.matrix(.jevalArray(arr$get("Un", as.integer(1)), "[[D", simplify = TRUE))
            nout = as.matrix(.jevalArray(arr$get("nout", as.integer(1)), "[[D", simplify = TRUE))

            ans$mdr <- mdr
            ans$Un <- Un
            ans$nout <- nout

            # Verifica di eventuali campi opzionali nell'output della funzione
            if(as.integer(arr$hasField("constr", as.integer(1))) == 1) {
                constr = as.matrix(.jevalArray(arr$get("constr", as.integer(1)), "[[D", simplify = TRUE))
                ans$constr = constr
            }
        }
    } else
    {
        out <- if(outclass =="fsreda")          callFsdaFunction("FSReda", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="fsrheda")            callFsdaFunction("FSRHeda", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="sregeda")            callFsdaFunction("Sregeda", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="mmregeda")           callFsdaFunction("MMregeda", "[Ljava/lang/Object;", 1, parlist)
        else if(outclass=="fsdalms" || outclass=="fsdalts")
            stop("Methods 'LMS' and 'LTS' are not defined with monitoring option")
        else
            stop(paste("Undefined method: ", method))

        if(is.null(out))
            return(NULL)

        arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
        arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

        if(trace)
        {
            cat("\nReturning from MATLAB - Fields returned by MATLAB: \n")
            print(arr$fieldNames())
        }

        RES = as.matrix(.jevalArray(arr$get("RES", as.integer(1)), "[[D", simplify = TRUE))
        ans = list(call=match.call(), intercept=intercept, RES=RES,
            y=y, X=x)

        ## follow several fields for  S and MM:
        ##      Beta, Scale, BS, Weights, Outliers, bdp, eff,
        ##      rhofunc, rhofuncparam, bs, conflev, singsub and Ssingsub
        ##

        ans$Beta <- if(as.integer(arr$hasField("Beta", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("Beta", as.integer(1)), "[[D", simplify = TRUE))
        ans$Weights <- if(as.integer(arr$hasField("Weights", as.integer(1))) != 1) NULL
                       else as.matrix(.jevalArray(arr$get("Weights", as.integer(1)), "[[D", simplify = TRUE))
        ans$Outliers <- if(as.integer(arr$hasField("Outliers", as.integer(1))) != 1) NULL
                        else as.matrix(.jevalArray(arr$get("Outliers", as.integer(1)), "[[D", simplify = TRUE))
        rhofunc <- if(as.integer(arr$hasField("rhofunc", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("rhofunc", as.integer(1)), "[[D", simplify = TRUE))
        ans$rhofunc <- intToUtf8(rhofunc)
        rhofuncparam <- if(as.integer(arr$hasField("rhofuncparam", as.integer(1))) != 1) NULL
              else as.matrix(.jevalArray(arr$get("rhofuncparam", as.integer(1)), "[[D", simplify = TRUE))
        ans$rhofuncparam <- as.vector(rhofuncparam)

        conflev <- if(as.integer(arr$hasField("conflev", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("conflev", as.integer(1)), "[[D", simplify = TRUE))
        ans$conflev <- as.vector(conflev)[1]

        ## Only Sregeda --------------
        ans$bdp <- if(as.integer(arr$hasField("bdp", as.integer(1))) != 1) NULL
                   else as.vector(as.matrix(.jevalArray(arr$get("bdp", as.integer(1)), "[[D", simplify = TRUE)))
        ans$Scale <- if(as.integer(arr$hasField("Scale", as.integer(1))) != 1) NULL
                     else as.vector(as.matrix(.jevalArray(arr$get("Scale", as.integer(1)), "[[D", simplify = TRUE)))
        ans$BS <- if(as.integer(arr$hasField("BS", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("BS", as.integer(1)), "[[D", simplify = TRUE))
        ans$Singsub <- if(as.integer(arr$hasField("Singsub", as.integer(1))) != 1) NULL
                   else as.vector(as.matrix(.jevalArray(arr$get("Singsub", as.integer(1)), "[[D", simplify = TRUE)))

        ## Only MMregeda --------------
        ans$eff <- if(as.integer(arr$hasField("eff", as.integer(1))) != 1) NULL
                   else as.vector(as.matrix(.jevalArray(arr$get("eff", as.integer(1)), "[[D", simplify = TRUE)))
        ans$Ssingsub <- if(as.integer(arr$hasField("Ssingsub", as.integer(1))) != 1) NULL
                   else as.vector(as.matrix(.jevalArray(arr$get("Ssingsub", as.integer(1)), "[[D", simplify = TRUE)))
        auxscale <- if(as.integer(arr$hasField("auxscale", as.integer(1))) != 1) NULL
                    else as.matrix(.jevalArray(arr$get("auxscale", as.integer(1)), "[[D", simplify = TRUE))[1,1]


        if(outclass == "fsreda")
        {
            LEV = as.matrix(.jevalArray(arr$get("LEV", as.integer(1)), "[[D", simplify = TRUE))
            Un = as.matrix(.jevalArray(arr$get("Un", as.integer(1)), "[[D", simplify = TRUE))
            BB = as.matrix(.jevalArray(arr$get("BB", as.integer(1)), "[[D", simplify = TRUE))
            mdr = as.matrix(.jevalArray(arr$get("mdr", as.integer(1)), "[[D", simplify = TRUE))
            msr = as.matrix(.jevalArray(arr$get("msr", as.integer(1)), "[[D", simplify = TRUE))
            nor = as.matrix(.jevalArray(arr$get("nor", as.integer(1)), "[[D", simplify = TRUE))
            Bols = as.matrix(.jevalArray(arr$get("Bols", as.integer(1)), "[[D", simplify = TRUE))
            S2 = as.matrix(.jevalArray(arr$get("S2", as.integer(1)), "[[D", simplify = TRUE))
            coo = as.matrix(.jevalArray(arr$get("coo", as.integer(1)), "[[D", simplify = TRUE))
            Tols = as.matrix(.jevalArray(arr$get("Tols", as.integer(1)), "[[D", simplify = TRUE))
            betaINT = as.matrix(.jevalArray(arr$get("betaINT", as.integer(1)), "[[D", simplify = TRUE))
            sigma2INT = as.matrix(.jevalArray(arr$get("sigma2INT", as.integer(1)), "[[D", simplify = TRUE))

            ans = list(call=match.call(), intercept=intercept, RES=RES, y=y, X=x,
                LEV=LEV, BB=BB, mdr=mdr, msr=msr, nor=nor, Bols=Bols,
                S2=S2, coo=coo, Tols=Tols, Un=Un, betaINT=betaINT, sigma2INT=sigma2INT)
        }
    }

    # Libera le risorse MATLAB create a runtime
    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
