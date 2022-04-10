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
