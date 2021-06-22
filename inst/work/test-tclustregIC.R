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

out <- tclustregIC(y1, X1, alphaLik=0.05, alphaX=0.01, whichIC="MIXCLA", trace=TRUE)
str(out)
tclustICplot(out, whichIC="MIXCLA")


##  Impose classification likelihood and five per cent likelihood trimming
out <- tclustregIC(y1, X1, whichIC="CLACLA", alphaLik=0.05)
tclustICplot(out, whichIC="CLACLA")
