##  This is the first example from the MATLAB help
##
library(fsdaR)
data(geyser2)
out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)

## Plot first two best solutions using as Information criterion MIXMIX
print("Best solutions using MIXMIX")
outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)

print(outMIXMIX$MIXMIXbs)

carbikeplot(outMIXMIX)

carbikeplot(outMIXMIX, SpuriousSol=TRUE)
