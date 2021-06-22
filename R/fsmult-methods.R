print.fsm <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$cov, digits = digits), print.gap = 2, quote = FALSE)
    invisible(x)
}

summary.fsm <- function (object, ...)
{
    ans <- list(covobj=object, evals=eigen(object$cov)$values)
    class(ans) <- "summary.fsm"
    ans
}

print.summary.fsm <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n",
	paste(deparse(x$covobj$call), sep = "\n", collapse = "\n"), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$covobj$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$covobj$cov, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nEigenvalues of covariance matrix: \n")
    print.default(format(x$evals, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nMahalanobis Distances: \n")
    print.default(format(as.vector(x$covobj$md), digits = digits), print.gap = 2, quote = FALSE)
}

print.fsmeda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}

print.smult <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$cov, digits = digits), print.gap = 2, quote = FALSE)
    invisible(x)
}

summary.smult <- function (object, ...)
{
    ans <- list(covobj=object, evals=eigen(object$cov)$values)
    class(ans) <- "summary.fsm"
    ans
}

print.summary.smult <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n",
	paste(deparse(x$covobj$call), sep = "\n", collapse = "\n"), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$covobj$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$covobj$cov, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nEigenvalues of covariance matrix: \n")
    print.default(format(x$evals, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nMahalanobis Distances: \n")
    print.default(format(as.vector(x$covobj$md), digits = digits), print.gap = 2, quote = FALSE)
}

print.smulteda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}

print.mmmult <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$cov, digits = digits), print.gap = 2, quote = FALSE)
    invisible(x)
}

summary.mmmult <- function (object, ...)
{
    ans <- list(covobj=object, evals=eigen(object$cov)$values)
    class(ans) <- "summary.fsm"
    ans
}

print.summary.mmmult <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n",
	paste(deparse(x$covobj$call), sep = "\n", collapse = "\n"), "\n\n", sep = "")

    cat("\nEstimate of Location: \n")
    print.default(format(x$covobj$loc, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nEstimate of Covariance: \n")
    print.default(format(x$covobj$cov, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nEigenvalues of covariance matrix: \n")
    print.default(format(x$evals, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nMahalanobis Distances: \n")
    print.default(format(as.vector(x$covobj$md), digits = digits), print.gap = 2, quote = FALSE)
}

print.mmmulteda <- function (x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    invisible(x)
}
