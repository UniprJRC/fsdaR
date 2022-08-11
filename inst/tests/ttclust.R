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

##  Plot with all default options
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=TRUE))

## IGNORE_RDIFF_BEGIN

## Use the plot options to produce more complex plots ----------

##  Plot with default confidence ellipses.
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot="ellipse"))

##  Plot with confidence ellipses specified by the user.
myplot <- list(type="ellipse", conflev=0.5)
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=myplot))

##  Contour plots
(out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot="contour"))

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
pch=c(3, 1, 8, 4)
col <- c("blue", "red", "black", "magenta")
plot(M5data[, 1:2], col=col[M5data[,3]+1], pch=pch[M5data[,3]+1])

##  Scatter plot matrix
library(rrcov)
plot(CovClassic(M5data[,1:2]), which="pairs", col=col[M5data[,3]+1], pch=pch[M5data[,3]+1])
plot(CovMcd(M5data[,1:2]), which="pairs", col=col[M5data[,3]+1], pch=pch[M5data[,3]+1])

out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=1000, nsamp=100, plot=TRUE)
out <- tclustfsda(M5data[,1:2], k=3, alpha=0, restrfactor=10, nsamp=100, plot=TRUE)
out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1, nsamp=1000,
     plot=TRUE, equalweights=TRUE)
out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1000, nsamp=100, plot=TRUE)


##  tclust in presence of structured noise.
set.seed (0)
library(MASS)
v <- runif (100, -2 * pi, 2 * pi)
noise <- cbind (100 + 25 * sin (v), 10 + 5 * v)
x <- rbind (mvrnorm (360, mu=c(0.0,  0), Sigma=matrix(c(1,  0,  0, 1), ncol = 2)),
            mvrnorm (540, mu=c(5.0, 10), Sigma=matrix(c(6, -2, -2, 6), ncol = 2)),
            noise)
(out <- tclustfsda(x, k=2, alpha=0.1, restrfactor=100, plot=1))
(out <- tclustfsda(x, k=55, alpha=0.15, restrfactor=1, plot=1))


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

## IGNORE_RDIFF_END
