print.fsr <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(coef(x))) {
	   cat("Coefficients:\n")
	   print.default(format(coef(x), digits = digits), print.gap = 2, quote = FALSE)
	   cat("\nScale estimate", format(x$scale, digits = digits) ,"\n\n")
    }
    else
	   cat("No coefficients\n")

    invisible(x)
}

print.fsreda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}

print.sreg <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(coef(x))) {
	   cat("Coefficients:\n")
	   print.default(format(coef(x), digits = digits), print.gap = 2, quote = FALSE)
	   cat("\nScale estimate", format(x$scale, digits = digits) ,"\n\n")
    }
    else
	   cat("No coefficients\n")

    invisible(x)
}

print.sregeda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}

print.mmreg <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(coef(x))) {
	   cat("Coefficients:\n")
	   print.default(format(coef(x), digits = digits), print.gap = 2, quote = FALSE)
	   cat("\nScale estimate", format(x$auxscale, digits = digits) ,"\n\n")
    }
    else
	   cat("No coefficients\n")

    invisible(x)
}

print.mmregeda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}

print.fsdalms <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(coef(x))) {
	   cat("Coefficients:\n")
	   print.default(format(coef(x), digits = digits), print.gap = 2, quote = FALSE)
	   cat("\nScale estimate", format(x$scale, digits = digits) ,"\n\n")
    }
    else
	   cat("No coefficients\n")

    invisible(x)
}

summary.fsdalms <- function (object, correlation = FALSE, ...)
{
    ans <- summary.fsr(object, correlation, ...)
    class(ans) <- "summary.fsdalms"
    ans
}

print.summary.fsdalms <- function(x, digits = max(3, getOption("digits") - 3),
	     signif.stars = getOption("show.signif.stars"), ...)
{
    print.summary.fsr(x, digits, signif.stars, ...)
}

print.fsdalts <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(coef(x))) {
	   cat("Coefficients:\n")
	   print.default(format(coef(x), digits = digits), print.gap = 2, quote = FALSE)
	   cat("\nScale estimate", format(x$scale, digits = digits) ,"\n\n")
    }
    else
	   cat("No coefficients\n")

    invisible(x)
}

summary.fsdalts <- function (object, correlation = FALSE, ...)
{
    ans <- summary.fsr(object, correlation, ...)
    class(ans) <- "summary.fsdalms"
    ans
}

print.summary.fsdalts <- function(x, digits = max(3, getOption("digits") - 3),
	     signif.stars = getOption("show.signif.stars"), ...)
{
    print.summary.fsr(x, digits, signif.stars, ...)
}

summary.fsr <- function (object, correlation = FALSE, ...)
{
    z <- object

    terms <- attr(z$model, "terms")
    int <- attr(terms, "intercept")
    int <- z$intercept
    z$X <- if(int) cbind(rep(1, nrow(z$X)), z$X) else z$X

    f <- z$X %*% t(t(coef(z)))    ## z$fitted
    r <- (z$y-f)/z$scale          ## z$residuals
                                  ## int <- z$intercept
    ## w <- as.vector(z$lts.wt)
    outliers <- z$ListOut
    w <- rep(1, length(z$y))
    w[outliers] <- 0
    n <- sum(w)

    Qr <- qr(w * z$X)# 'w * z$X': more efficient than t(t(object$X) %*% diag(w))
    p <- Qr$rank
    p1 <- seq(length = p) ## even for p = 0
    rdf <- n - p
    mss <-  if(int) {
		m <- sum(w * f /sum(w))
		sum(w * (f - m)^2)
	    } else
		sum(w * f^2)
    rss <- sum(w * r^2)

    r <- sqrt(w) * r
    resvar <- rss/rdf

    R <- if (p > 0) chol2inv(Qr$qr[p1, p1, drop = FALSE]) else matrix(,p,p)
    ## no need to reorder R anymore, since 'X' already has "intercept first"
    se <- sqrt(diag(R) * resvar)

    est <- z$coefficients
    tval <- est/se

    ans <-
	c(z[c("call", "terms")],
	  ## not again attr(ans, "call") <- attr(z,"call")
	  list(residuals = r,
	       coefficients = {
		   cbind("Estimate" = est, "Std. Error" = se, "t value" = tval,
			 "Pr(>|t|)" = 2*pt(abs(tval), rdf, lower.tail = FALSE))
	       },
	       sigma = sqrt(resvar),
	       df = c(p, rdf, NCOL(Qr$qr))))

    df.int <- if(int) 1 else 0
    if(p - df.int > 0) {
	ans$r.squared <- mss/(mss + rss)
	ans$adj.r.squared <- 1 - (1 - ans$r.squared) * ((n - df.int)/rdf)
	ans$fstatistic <- c(value = (mss/(p - df.int))/resvar,
			    numdf = p - df.int, dendf = rdf)
    } else
	ans$r.squared <- ans$adj.r.squared <- 0

    ans$cov.unscaled <- R
    dimnames(ans$cov.unscaled) <- dimnames(ans$coefficients)[c(1,1)]

    if (correlation) {
	ans$correlation <- (R * resvar)/outer(se, se)
	dimnames(ans$correlation) <- dimnames(ans$cov.unscaled)
    }
    class(ans) <- "summary.fsr"
    ans

}

print.summary.fsr <-
    function(x, digits = max(3, getOption("digits") - 3),
	     signif.stars = getOption("show.signif.stars"), ...)
##	     signif.stars = FALSE, ...)
##			    ^^^^^ (since they are not quite correct ?)
{
    cat("\nCall:\n",
	paste(deparse(x$call), sep = "\n", collapse = "\n"), "\n\n", sep = "")
    resid <- x$residuals
    df <- x$df
    rdf <- df[2]
    cat("Residuals (summary):\n")
    ## "cut & paste" from print.summary.lm():
    if(rdf > 5) {
	nam <- c("Min", "1Q", "Median", "3Q", "Max")
	rq <-	if(length(dim(resid)) == 2)
		    structure(apply(t(resid), 1, quantile),
			      dimnames = list(nam, dimnames(resid)[[2]]))
		else
		    structure(quantile(resid), names = nam)
	print(t(rq), digits = digits, ...)
    }
    else if(rdf > 0) {
	print(resid, digits = digits, ...)
    } else { # rdf == 0 : perfect fit!
	cat("ALL", df[1], "residuals are 0: no residual degrees of freedom!\n")
    }

    if(NROW(x$coefficients)) {
	if (nsingular <- df[3] - df[1])
	    cat("\nCoefficients: (", nsingular,
		" not defined because of singularities)\n", sep = "")
	else
	    cat("\nCoefficients:\n")
	printCoefmat(x$coefficients, digits = digits,
		     signif.stars = signif.stars, ...)
    }
    else cat("\nNo coefficients\n")

    cat("\nResidual standard error:",
    format(signif(x$sigma, digits)), "on", rdf, "degrees of freedom\n")

    if(!is.null(x$fstatistic)) {
	cat("Multiple R-Squared:", formatC(x$r.squared, digits = digits))
	cat(",\tAdjusted R-squared:",formatC(x$adj.r.squared,digits = digits),
	    "\nF-statistic:", formatC(x$fstatistic[1], digits = digits),
	    "on", x$fstatistic[2], "and",
	    x$fstatistic[3], "DF,  p-value:",
	    format.pval(pf(x$fstatistic[1], x$fstatistic[2],
			   x$fstatistic[3], lower.tail = FALSE), digits = digits),
	    "\n")
    }

    correl <- x$correlation
    if(!is.null(correl)) {
	p <- NCOL(correl)
	if(p > 1) {
	    cat("\nCorrelation of Coefficients:\n")
	    correl <- format(round(correl, 2), nsmall = 2, digits = digits)
	    correl[!lower.tri(correl)] <- ""
	    print(correl[-1, -p, drop = FALSE], quote = FALSE)
	}
    }
    cat("\n")
    invisible(x)
}
