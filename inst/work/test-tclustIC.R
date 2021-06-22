##  %% Plot BIC, ICL and CLA for for Geyser data with all default options.
##  Y=load('geyser2.txt');
##  % Make sure (whenever possible) that units 15, 30 and 69 are inside
##  % groups which have labels respectively equal to 1, 2 and 3.
##  UnitsSameGroup=[15 30 69];
##  out=tclustIC(Y,'cleanpool',false,'plots',0,'alpha',0.1,'UnitsSameGroup',UnitsSameGroup);
##  tclustICplot(out)

library(fsdaR)
data(geyser2)

##  alpha and restriction factor are not specified therefore for alpha
##  vector [0.10 0.05 0] is used while for the restriction factor, value c=12
##  used

out <- tclustIC(geyser2, plot=FALSE, alpha=0.1, trace = TRUE)

tclustICplot(out)

outsol<- tclustICsol(out)

carbikeplot(outsol)

## --------------------------------------------------------------
##
##  HBK example 1

library(fsdaR)
data(hbk)
X <- hbk[,1:3]

out <- tclustIC(X, plot=FALSE, alpha=0.1, whichIC="CLACLA", trace = TRUE)
names(out)
outsol<- tclustICsol(out)

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
##
##  HBK example 2

library(fsdaR)
data(hbk)
X <- hbk[,1:3]

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

##---------------------------------------------------------------
##
## Car-bike plot for simulated data.
##

library(fsdaR)

Y <- read.table("z1.txt", header=TRUE)

## Computation of information criterion

out <- tclustIC(Y, plots=FALSE)

##  Computation of the best solutions
##  Plot first 3 best solutions using as Information criterion CLACLA

cat("\nBest 9 solutions using CLACLA.\n")
ThreshRandIndex <- 0.8
NumberOfBestSolutions <- 9
outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE, NumberOfBestSolutions=9, ThreshRandIndex=0.8)

## This should have been a logical value true/false, not vector
outCLACLA$CLACLAbs[[1,5]]

carbikeplot(outCLACLA)


##---------------------------------------------------------------
##
## Car-bike plot for simulated data.
##

library(fsdaR)

Y <- read.table("z1.txt", header=TRUE)

## Computation of information criterion

out <- tclustIC(Y, plots=FALSE, whichIC="CLACLA")
outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE)

## This should have been a logical value true/false, not vector
outCLACLA$CLACLAbs[[1,5]]

carbikeplot(outCLACLA)
