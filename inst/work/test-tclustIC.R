library(fsdaR)
data(hbk, package="robustbase")

##  Plot BIC, ICL and CLA for for Geyser data with all default options.
##  Make sure (whenever possible) that units 15, 30 and 69 are inside
##  groups which have labels respectively equal to 1, 2 and 3.

data(geyser2)

(out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1,
    UnitsSameGroup=c(15, 30, 69)))
tclustICplot(out)


##  Car-bike plot with geyser2 - 1
data(geyser2)

##  alpha and restriction factor are not specified therefore for alpha
##  vector [0.10 0.05 0] is used while for the restriction factor, value c=12
##  is used
out <- tclustIC(geyser2, plot=FALSE, alpha=0.1, trace = TRUE)
tclustICplot(out)
outsol <- tclustICsol(out)
carbikeplot(outsol)

##  Car-bike plot with geyser2 - 2
data(geyser2)

(out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1))

## Plot first two best solutions using as Information criterion MIXMIX
print("Best solutions using MIXMIX")
outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)
print(outMIXMIX$MIXMIXbs)
carbikeplot(outMIXMIX)
carbikeplot(outMIXMIX, SpuriousSol=TRUE)

## --------------------------------------------------------------
##  HBK example 1
data(hbk)
X <- hbk[, 1:3]
out <- tclustIC(X, plot=FALSE, alpha=0.1, whichIC="CLACLA", trace = TRUE)
names(out)
outsol <- tclustICsol(out, whichIC="CLACLA")

##  - Since whichIC="CLACLA", some of the objects in the returned object are NULL (and I remove them).
##      Then tclustICsol() complains that IDXMIX does not exist.
##      ! Check MATLAB
##  - I would have expected that calling tclustIC() with whichIC="CLACLA" will be faster
##      than when called with the default whichIC="ALL", but it is not.
##      ! Check MATLAB
##
##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Reference to non-existent field 'IDXMIX'.
carbikeplot(outsol)

## --------------------------------------------------------------
##  HBK example 2
library(fsdaR)
data(hbk)
X <- hbk[, 1:3]

out <- tclustIC(X, plot=FALSE, alpha=0.1, trace = TRUE)
names(out)
outsol<- tclustICsol(out)
names(outsol)
carbikeplot(outsol)

##  It seems that the function rewrapComplexNumericCellArray() cannot handle empty (zero-length) lists
##
##  Error in array(x, c(length(x), 1L), if (!is.null(names(x))) list(names(x),  :
##    'data' must be of a vector type, was 'NULL'
##  The error occurs in the following statement, for the element [1,4] of the object MIXMIXbs, which is a empty ist.
##
##      doubleJavaArray2 = .jarray(as.matrix(unlist(arr[[i, j]])), dispatch = TRUE)

##----------------------------------------------------------------
## Car-bike plot for simulated data 1
##
data(z1)

## Computation of information criterion
(out <- tclustIC(z1, plots=FALSE))

##  Computation of the best solutions
##  Plot first 3 best solutions using as Information criterion CLACLA
cat("\nBest 9 solutions using CLACLA.\n")
ThreshRandIndex <- 0.8
NumberOfBestSolutions <- 9
(outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE,
    NumberOfBestSolutions=9, ThreshRandIndex=0.8))

## This should have been a logical value true/false, not vector
outCLACLA$CLACLAbs[[1,5]]
carbikeplot(outCLACLA)

##----------------------------------------------------------------
## Car-bike plot for simulated data.
data(z1)

## Computation of information criterion
(out <- tclustIC(z1, plots=FALSE, whichIC="CLACLA"))
(outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE))
## This should have been a logical value true/false, not vector
outCLACLA$CLACLAbs[[1,5]]
carbikeplot(outCLACLA)

##  Car-bike plot for the flea data ==========================
data(flea)
Y <- as.matrix(flea[, 1:(ncol(flea)-1)])    # select only the numeric variables
rownames(Y) <- 1:nrow(Y)
head(Y)

out <- tclustIC(Y, whichIC="CLACLA", plot=FALSE, alpha=0.1, nsamp=100)

##  Find the best solutions using as Information criterion CLACLA
print("Best solutions using CLACLA")
outCLACLA <- tclustICsol(out,whichIC="CLACLA", plot=FALSE, NumberOfBestSolutions=66)
##  Produce the car-bike plot
carbikeplot(outCLACLA)
