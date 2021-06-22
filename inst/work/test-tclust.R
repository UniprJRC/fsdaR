##detach(name="package:fsdaR", unload=TRUE)
##unloadNamespace("fsdaR")

library(fsdaR)

## The data have been generated using the following R instructions:
library(mvtnorm)
set.seed (100)
Xmix <- rbind (rmvnorm (360, c( 0, 0), matrix(c (1, 0, 0, 1), ncol = 2)),
               rmvnorm (540, c( 5, 10), matrix(c (6, -2, -2, 6), ncol = 2)),
               rmvnorm (100, c(2.5, 5), matrix(c (50, 0, 0, 50), ncol = 2)))

x <- matrix(NA, nrow=nrow(Xmix), ncol=ncol(Xmix) + 1)
x[, 1:ncol(Xmix)] <- Xmix
x[, ncol(x)] <- rnorm(nrow(Xmix))

##---------------------------------------------------------------
## Testing tclust()

out1 <- tclustfsda(Xmix, k=3, alpha=0, trace=TRUE)
names(out1)
class(out)
out1
summary(out1)

out1 <- tclustfsda(Xmix, k=3, alpha=0, plot=TRUE, trace=TRUE)
out1 <- tclustfsda(Xmix, k=3, alpha=0, plot="contourf", trace=TRUE)
out1 <- tclustfsda(Xmix, k=3, alpha=0, plot="contour", trace=TRUE)
out1 <- tclustfsda(Xmix, k=3, alpha=0, plot="ellipse", trace=TRUE)
out1 <- tclustfsda(Xmix, k=3, alpha=0, plot="boxplotb", trace=TRUE)

out1 <- tclustfsda(x, k=3, alpha=0, plot=TRUE, trace=TRUE)

## Monitoring
out2 <- tclustfsda(Xmix, k=3, alpha=0, monitoring=TRUE, trace=TRUE)
names(out2)

##----------------------------------------------------------------
##
## Examples from the help

##  TCLUST of Gayser data with three groups (k=3), 10%% trimming (alpha=0.1)
##      and restriction factor (c=10000)
    data(geyser2)
    (out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000))

## Use the plot options to produce more complex plots

##  Plot with all default options
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=TRUE)

##  Default confidence ellipses.
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot="ellipse")

##  Confidence ellipses specified by the user: confidence ellipses set to 0.5
    plots <- list(type="ellipse", conflev=0.5)
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=plots)

##  Confidence ellipses set to 0.9
    plots <- list(type="ellipse", conflev=0.9)
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=plots)

##  Contour plots
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot="contour")

##  Filled contour plots with additional options: contourf plot with autumn colormap
    plots <- list(type="contourf", cmap="autumn")
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=plots)

##  We compare the output using three different values of restriction factor
##      nsamp is the number of subsamples which will be extracted
    data(geyser2)
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, nsamp=500, plot="ellipse")
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10, nsamp=500, refsteps=10, plot="ellipse")
    out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=1, nsamp=500, refsteps=10, plot="ellipse")

##  TCLUST applied to M5 data: A bivariate data set obtained from three normal
##  bivariate distributions with different scales and proportions 1:2:2. One of the
##  components is very overlapped with another one. A 10 per cent background noise is
##  added uniformly distributed in a rectangle containing the three normal components
##  and not very overlapped with the three mixture components. A precise description
##  of the M5 data set can be found in Garcia-Escudero et al. (2008).
##

    data(M5data)
    plot(M5data[, 1:2])

##  Scatter plot matrix
    plot(CovClassic(M5data[,1:2]), which="pairs")

    out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=1000, nsamp=100, plot=TRUE)
    out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=10, nsamp=100, plot=TRUE)
    out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1, nsamp=1000, plot=TRUE, equalweights=TRUE)
    out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1000, nsamp=100, plot=TRUE)

##  TCLUST with simulated data: 5 groups and 5 variables --------------------------------
##
    n1 <- 100
    n2 <- 80
    n3 <- 50
    n4 <- 80
    n5 <- 70
    p <- 5
    Y1 <- matrix(rnorm(n1 * p) + 5, ncol=p)
    Y2 <- matrix(rnorm(n2 * p) + 3, ncol=p)
    Y3 <- matrix(rnorm(n3 * p) - 2, ncol=p)
    Y4 <- matrix(rnorm(n4 * p) + 2, ncol=p)
    Y5 <- matrix(rnorm(n5 * p), ncol=p)

    group <- c(rep(1, n1), rep(2, n2), rep(3, n3), rep(4, n4), rep(5, n5))
    Y <- Y1
    Y <- rbind(Y, Y2)
    Y <- rbind(Y, Y3)
    Y <- rbind(Y, Y4)
    Y <- rbind(Y, Y5)
    dim(Y)
    table(group)
    out <- tclustfsda(Y, k=5, alpha=0.05, restrfactor=1.3, refsteps=20, plot=TRUE)

##  Automatic choice of best number of groups for Geyser data ------------------------
##
    data(geyser2)
    maxk <- 6
    CLACLA <- matrix(0, nrow=maxk, ncol=2)
    CLACLA[,1] <- 1:maxk
    MIXCLA <- MIXMIX <- CLACLA

    for(j in 1:maxk) {
        out <- tclustfsda(geyser2, k=j, alpha=0.1, restrfactor=5, msg=FALSE)
        CLACLA[j, 2] <- out$CLACLA
    }

    for(j in 1:maxk) {
        out <- tclustfsda(geyser2, k=j, alpha=0.1, restrfactor=5, mixt=2, msg=FALSE)
        MIXMIX[j ,2] <- out$MIXMIX
        MIXCLA[j, 2] <- out$MIXCLA
    }

    oldpar <- par(mfrow=c(1,3))
    plot(CLACLA[,1:2], type="l", xlim=c(1, maxk), xlab="Number of groups", ylab="CLACLA")
    plot(MIXMIX[,1:2], type="l", xlim=c(1, maxk), xlab="Number of groups", ylab="MIXMIX")
    plot(MIXCLA[,1:2], type="l", xlim=c(1, maxk), xlab="Number of groups", ylab="MIXCLA")
    par(oldpar)

##  --------------------------------------------------------------
##  Monitoring examples ------------------------------------------

##  Monitoring using Geyser data (all default options).
##  alpha and restriction factor are not specified therefore alpha=c(0.10, 0.05, 0)
##  is used while the restriction factor is set to c=12

## Load Geyser data
library(fsdaR)
data(geyser2)
head(geyser2)
dim(geyser2)

out <- tclustfsda(geyser2, k=3, monitoring=TRUE, trace=TRUE, plot=FALSE)

##  Monitoring using Geyser data with alpha and c specified.
out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.10, 0, by=-0.01), monitoring=TRUE, trace=TRUE)

##  Monitoring using Geyser data with plot argument specified as a list.
##      The trimming levels to consider in this case are 31 values of alpha
##
    out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.30, 0, by=-0.01), monitoring=TRUE, plot=list(alphasel=c(0.2, 0.10, 0.05, 0.01)), trace=TRUE)

##  Monitoring using Geyser data with argument UnitsSameGroup
##
##      Make sure that group containing unit 10 is in a group which is labelled "group 1"
##      and group containing unit 12 is in group which is labelled "group 2"
##
##      Mixture model is used (mixt=2)
##
out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.30, 0, by=-0.01), monitoring=TRUE, mixt=2, UnitsSameGroup=c(10, 12), trace=TRUE)

##  Monitoring using M5 data
    data(M5data)

##  alphavec=vector which contains the trimming levels to consider
##  in this case 31 values of alpha are considered
    alphavec <- seq(0.10, 0, by=-0.02)
    out <- tclustfsda(M5data[, 1:2], 3, alpha=alphavec, restrfac=1000, monitoring=TRUE, nsamp=1000, plots=TRUE)
