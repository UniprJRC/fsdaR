library(fsdaR)

##----------------------------------------------------------------
##
## Examples from the help

## The X data have been introduced by Gordaliza, Garcia-Escudero & Mayo-Iscar (2013).
## The dataset presents two parallel components without contamination.

data(X)
y1 = X[, ncol(X)]
X1 = X[,-ncol(X), drop=FALSE]

(out <- tclustreg(y1, X1, k=2, alphaLik=0.05, alphaX=0.01, restrfactor=5, plot=TRUE, trace=TRUE))
(out <- tclustreg(y1, X1, k=2, alphaLik=0.05, alphaX=0.01, restrfactor=2, mixt=2, plot=TRUE, trace=TRUE))


##  -------------------------------------------------------------

##  Examples with fishery data

data(fishery)
X <- fishery

## some jittering is necessary because duplicated units are not treated:
## this needs to be addressed
X <- X + 10^(-8) * abs(matrix(rnorm(nrow(X)*ncol(X)), ncol=2))

y1 <- X[, ncol(X)]
X1 <- X[, -ncol(X), drop=FALSE]

(out <- tclustreg(y1, X1, k=3, restrfact=50, alphaLik=0.04, alphaX=0.01, trace=TRUE))

## Example 2:

## Define some arbitrary weights for the units
    we <- sqrt(X1)/sum(sqrt(X1))

##  tclustreg required parameters
    k <- 2; restrfact <- 50; alpha1 <- 0.04; alpha2 <- 0.01

##  Now tclust is run on each combination of mixt and wtrim options

    cat("\nmixt = 0; wtrim = 0 \nStandard tclustreg, with classification likelihood and without thinning\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=0, wtrim=0, trace=TRUE))

    cat("\nmixt = 2; wtrim = 0 \nMixture likelihood, no thinning\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=2, wtrim=0, trace=TRUE))

    cat("\nmixt = 0; wtrim = 1 \nClassification likelihood, thinning based on user weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=0, we=we, wtrim=1, trace=TRUE))

    cat("\nmixt = 2; wtrim = 1 \nMixture likelihood, thinning based on user weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=2, we=we, wtrim=1, trace=TRUE))

    cat("\nmixt = 0; wtrim = 2 \nClassification likelihood, thinning based on retention probabilities\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=0, wtrim=2, trace=TRUE))

    cat("\nmixt = 2; wtrim = 2 \nMixture likelihood, thinning based on retention probabilities\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=2, wtrim=2, trace=TRUE))

    cat("\nmixt = 0; wtrim = 3 \nClassification likelihood, thinning based on bernoulli weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=0, wtrim=3, trace=TRUE))

    cat("\nmixt = 2; wtrim = 3 \nMixture likelihood, thinning based on bernoulli weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=2, wtrim=3, trace=TRUE))

    cat("\nmixt = 0; wtrim = 4 \nClassification likelihood, tandem thinning based on bernoulli weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=0, wtrim=4, trace=TRUE))

    cat("\nmixt = 2; wtrim = 4 \nMixture likelihood, tandem thinning based on bernoulli weights\n")
    (out <- tclustreg(y1, X1, k=k, restrfact=restrfact, alphaLik=alpha1, alphaX=alpha2, mixt=2, wtrim=4, trace=TRUE))

##=================================================================
library(fsdaR)

##----------------------------------------------------------------
##
## Examples from the help

## The X data have been introduced by Gordaliza, Garcia-Escudero & Mayo-Iscar (2013).
## The dataset presents two parallel components without contamination.

data(X)
y1 = X[, ncol(X)]
X1 = X[,-ncol(X), drop=FALSE]

(out <- tclustregIC(y1, X1, trace=TRUE))
tclustICplot(out, whichIC="MIXMIX")
