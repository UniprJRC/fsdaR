## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(fsdaR))
suppressPackageStartupMessages(library(rrcov))

##===============================================================
##  tclustIC(), tclustICsol(), tclustICplot(), carbike() ========

##  Plot BIC, ICL and CLA for for Geyser data with all default options.
##  Make sure (whenever possible) that units 15, 30 and 69 are inside
##  groups which have labels respectively equal to 1, 2 and 3.

data(geyser2)

(out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1,
    UnitsSameGroup=c(15, 30, 69)))
tclustICplot(out, whichIC="MIXMIX")

##  Car- bike plot with geyser2 - 1
data(geyser2)

##  alpha and restriction factor are not specified therefore for alpha
##  vector [0.10 0.05 0] is used while for the restriction factor, value c=12
##  is used
(out <- tclustIC(geyser2, plot=FALSE, alpha=0.1, trace = TRUE))
tclustICplot(out)
outsol <- tclustICsol(out)
carbikeplot(outsol)
