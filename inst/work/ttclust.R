## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(fsdaR))
suppressPackageStartupMessages(library(rrcov))

##  A simple example of TCLUST with the 'hbk' data and all default
##  parameters
data(hbk, package="robustbase")
(out <- tclustfsda(hbk[, 1:3], k=2))
class(out)
summary(out)

##  TCLUST of Gayser data with three groups (k=3), 10%% trimming (alpha=0.1)
##      and restriction factor (c=10000)
data(geyser2)
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000))

## Use the plot options to produce more complex plots ----------

##  Plot with all default options
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=TRUE))

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

##  Filled contour plots with additional options: contourf plot with a named colormap.
##  Here we define four MATLAB-like colormaps, but the user can define anything else,
##  presented by a matrix with three columns which are the RGB triplets.

summer <- as.matrix(data.frame(x1=seq(from=0, to=1, length=65),
                            x2=seq(from=0.5, to=1, length=65),
                            x3=rep(0.4, 65)))
spring <- as.matrix(data.frame(x1=rep(1, 65),
                            x2=seq(from=0, to=1, length=65),
                            x3=seq(from=1, to=0, length=65)))
winter <- as.matrix(data.frame(x1=rep(0, 65),
                            x2=seq(from=0, to=1, length=65),
                            x3=seq(from=1, to=0, length=65)))
autumn <- as.matrix(data.frame(x1=rep(1, 65),
                            x2=seq(from=0, to=1, length=65),
                            x3=rep(0, 65)))

out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000,
   plot=list(type="contourf", cmap=autumn))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000,
   plot=list(type="contourf", cmap=winter))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000,
   plot=list(type="contourf", cmap=spring))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000,
   plot=list(type="contourf", cmap=summer))

##  We compare the output using three different values of restriction factor
##      nsamp is the number of subsamples which will be extracted
data(geyser2)
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, nsamp=500, plot="ellipse"))
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10, nsamp=500, refsteps=10, plot="ellipse"))
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=1, nsamp=500, refsteps=10, plot="ellipse"))

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

(out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=1000, nsamp=100, plot=TRUE))
(out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=10, nsamp=100, plot=TRUE))
(out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1, nsamp=1000,
     plot=TRUE, equalweights=TRUE))
(out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1000, nsamp=100, plot=TRUE))


##  TCLUST with simulated data: 5 groups and 5 variables
##
set.seed(1234)
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
(out <- tclustfsda(Y, k=5, alpha=0.05, restrfactor=1.3, refsteps=20, plot=TRUE))

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


##  Monitoring examples ------------------------------------------

##  Monitoring using Geyser data

##  Monitoring using Geyser data (all default options)
##  alpha and restriction factor are not specified therefore alpha=c(0.10, 0.05, 0)
##  is used while the restriction factor is set to c=12
(out <- tclustfsda(geyser2, k=3, monitoring=TRUE))

##  Monitoring using Geyser data with alpha and c specified.
out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.10, 0, by=-0.01), monitoring=TRUE)

##  Monitoring using Geyser data with plot argument specified as a list.
##      The trimming levels to consider in this case are 31 values of alpha
##
(out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.30, 0, by=-0.01), monitoring=TRUE,
     plot=list(alphasel=c(0.2, 0.10, 0.05, 0.01)), trace=TRUE))

##  Monitoring using Geyser data with argument UnitsSameGroup
##
##      Make sure that group containing unit 10 is in a group which is labelled "group 1"
##      and group containing unit 12 is in group which is labelled "group 2"
##
##      Mixture model is used (mixt=2)
##
(out <- tclustfsda(geyser2, k=3, restrfac=100, alpha=seq(0.30, 0, by=-0.01), monitoring=TRUE,
     mixt=2, UnitsSameGroup=c(10, 12), trace=TRUE))

##  Monitoring using M5 data
 data(M5data)

##  alphavec: a vector which contains the trimming levels to consider.
##  In this case 31 values of alpha are considered
alphavec <- seq(0.10, 0, by=-0.02)
(out <- tclustfsda(M5data[, 1:2], 3, alpha=alphavec, restrfac=1000, monitoring=TRUE,
 nsamp=1000, plots=TRUE))

##===============================================================
##  tclustIC(), tclustICsol(), tclustICplot(), carbike() ========

##  Plot BIC, ICL and CLA for for Geyser data with all default options.
##  Make sure (whenever possible) that units 15, 30 and 69 are inside
##  groups which have labels respectively equal to 1, 2 and 3.

data(geyser2)

(out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1,
    UnitsSameGroup=c(15, 30, 69)))
tclustICplot(out, whichIC="MIXMIX")

##  Car- bike plot with geyser2
data(geyser2)

##  alpha and restriction factor are not specified therefore for alpha
##  vector [0.10 0.05 0] is used while for the restriction factor, value c=12
##  is used
(out <- tclustIC(geyser2, plot=FALSE, alpha=0.1, trace = TRUE))
tclustICplot(out)
(outsol <- tclustICsol(out))
carbikeplot(outsol)
