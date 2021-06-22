print.tclustfsda <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    cat("\nResults for TCLUST algorithm:\n", paste0("trim = ", x$alpha, ", k = ", x$k))
    cat("\nClassification (trimmed points are indicated by 0 ):\n")
    print.default(format(x$idx, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nMeans: \n")
    print.default(format(x$muopt, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nTrimmed objective function: ", x$obj, "\n")

    invisible(x)
}

summary.tclustfsda <- function (object, ...)
{
    ans <- list(tclustobj=object)
    class(ans) <- "summary.tclustfsda"
    ans
}

print.summary.tclustfsda <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n",
	paste(deparse(x$tclustobj$call), sep = "\n", collapse = "\n"), "\n\n", sep = "")

    cat("\nResults for TCLUST algorithm:\n", paste0("trim = ", x$alpha, ", k = ", x$k))
    cat("\nMeans: \n")
    print.default(format(x$tclustobj$muopt, digits = digits), print.gap = 2, quote = FALSE)
    cat("\nVariances: \n")
    print.default(format(x$tclustobj$sigmaopt, digits = digits), print.gap = 2, quote = FALSE)

    cat("\nClassification: \n")
    print.default(x$tclustobj$idx)

    invisible(x)
}

print.tclusteda <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n", sep = "")
    cat("\nMonitoring the results for TCLUST algorithm:\n\n", paste0("Number of groups (k) = ", x$k, ", restriction factor (c) = ", x$restrfact))
    cat("\n\n Triming levels:", x$alpha)

    cat("\n\nAlpha monitoring:\n")
    print.default(format(x$Amon, digits = digits), print.gap = 2, quote = FALSE)
    cat("\n")

    invisible(x)
}

summary.tclusteda <- function (object, ...)
{
    ans <- list(tclustobj=object)
    class(ans) <- "summary.tclusteda"
    ans
}

print.summary.tclusteda <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$tclustobj$call), "\n", sep = "")
    cat("\nSummary of the monitoring results for TCLUST algorithm:\n\n", paste0("Number of groups (k) = ", x$tclustobj$k, ", restriction factor (c) = ", x$tclustobj$restrfact))
    cat("\n\n Triming levels:", x$tclustobj$alpha)

    cat("\n\nAlpha monitoring:\n")
    print.default(format(x$tclustobj$Amon, digits = digits), print.gap = 2, quote = FALSE)
    cat("\n")

    invisible(x)
}

print.tclustic <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n", deparse(x$call), "\n", sep = "")
    cat("\nInformation criteria for TCLUST:", x$whichIC, "\n", paste0("Trimming = ", x$alpha))
    cat("\nNumber of mixture components (clusters):", x$kk)
    cat("\nvalues of the restriction factor:", x$cc, "\n")
    if(!is.null(x$MIXMIX))
    {
        cat("\n\nPenalized mixture likelihood:\n")
        print.default(format(x$MIXMIX, digits = digits), print.gap = 2, quote = FALSE)
    }
    if(!is.null(x$CLACLA))
    {
        cat("\n\nPenalized classification likelihood:\n")
        print.default(format(x$CLACLA, digits = digits), print.gap = 2, quote = FALSE)
    }
    if(!is.null(x$MIXCLA))
    {
        cat("\n\nICL criterion:\n")
        print.default(format(x$MIXCLA, digits = digits), print.gap = 2, quote = FALSE)
    }

     invisible(x)
}

summary.tclustic <- function (object, ...)
{
    ans <- list(tclustobj=object)
    class(ans) <- "summary.tclustic"
    ans
}

print.summary.tclustic <- function(x, digits = max(3, getOption("digits") - 3), ...)
{
    cat("\nCall:\n",
	paste(deparse(x$tclustobj$call), sep = "\n", collapse = "\n"), "\n", sep = "")

    cat("\nInformation criteria for TCLUST:", x$tclustobj$whichIC, "\n", paste0("Trimming = ", x$tclustobj$alpha))
    cat("\nNumber of mixture components (clusters):", x$tclustobj$kk)
    cat("\nvalues of the restriction factor:", x$tclustobj$cc, "\n")

    invisible(x)
}
