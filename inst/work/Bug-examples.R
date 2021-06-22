##  OPEN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##
## Issue #1 -----------------------------------------------------
##
##  R will crash, nothing to do with fsdaR

## 

## Issue #2 -----------------------------------------------------
##
##  fsmult() with geyser data from MASS

##  --- Code Example A ---
library(fsdaR)
data(geyser2)

library(MASS)
data(geyser)
head(geyser)

out <- smult(geyser)        # 1. Works OK
out <- mmmult(geyser)       # 2. Works OK
out <- fsmult(geyser)       # 3. Will throw an exception.
                            #       But it can happend that it hangs, only TaskManager can help to stop it.

##  Error in .jcall("RJavaTools", "Ljava/lang/Object;", "invokeMethod", cl,  :
##    java.lang.NullPointerException

out <- fsmult(matrix(rnorm(299*2), ncol=2))     # 3. Works OK
out <- fsmult(geyser2)                          # 4. Works OK

##  --- Code Example B ---
library(fsdaR)

library(MASS)
data(geyser)
head(geyser)

out <- fsmult(matrix(rnorm(299*2), ncol=2))     # 1. Works OK
out <- fsmult(geyser)                           # 2. Will throw an exception
out <- fsmult(matrix(rnorm(299*2), ncol=2))     # 3. Works OK
out <- fsmult(geyser2)                          # 4. Works OK

## Issue #3 -----------------------------------------------------
##
##  tclust() plot: color map in MATLAB

library(fsdaR)
data(geyser2)

##  Filled contour plots with additional options:
##  contourf plot with autumn colormap
plots <- list(type="contourf", cmap="autumn")
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=plots)

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Matrix dimensions must agree.



##---------------------------------------------------------------

##
##  FIXED ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##
## Issue #1 -----------------------------------------------------
##
##  carbikeplot example #1
##
##  Empty lists in rewrapComplexNumericCellArray().
##      unlist() will return NULL and as.matrix() will crash on a NULL
##
##  FIXED: if the length of the list is 0 (unlist() returns NULL),
##      instead of calling as.matrix(0, create a matrix with zero
##      rows and zero columns:
##      matrix(NA, nrow=0, ncol=0)
##
library(fsdaR)
data(hbk)


##  alternatively, read the text file (which can also be used in MATLAB)
##  hbk <- read.table("hbk.txt")

X <- hbk[,1:3]

out <- tclustIC(X, plot=FALSE, alpha=0.1, trace = TRUE)
names(out)
outsol <- tclustICsol(out)
names(outsol)

## The element [1,4] of 'MIXMIXbs' in the returned by tclustICsol() object
##  is an empty list (with length 0). This will cause an error in carbikeplot() later:

outsol$MIXMIXbs[1,4]

carbikeplot(outsol)

##  It seems that the function rewrapComplexNumericCellArray() cannot handle
##  empty (zero-length) lists
## ##  Error in array(x, c(length(x), 1L), if (!is.null(names(x))) list(names(x),  :
## ##   'data' must be of a vector type, was 'NULL'
##
##  The error occurs in the following statement, for the element [1,4] of the
##  object MIXMIXbs, which is a empty list.
##
##      doubleJavaArray2 = .jarray(as.matrix(unlist(arr[[i, j]])), dispatch = TRUE)
##
##
## Issue #2 -----------------------------------------------------
##
##  carbikeplot example #2
##
## tclustICsol() returns in the fifth column of MIXMIXbs (or CLACLAbs, etc)
##  a character string containing "true" or "spurious". This will be converted by
##  unwrapComplexNumericCellArray() to a numeric vector containing the ASCII
##  codes of the characters, i.e. instead of "true" we have c(116, 114, 117, 101).
##  When passed back to rewrapComplexNumericCellArray() - e.g. in carbikeplot(),
##  it will not be recognized and carbikeplot() will produce an empty graph.
##
##  FIXED: I added workaround code converting the byte array back to string
##  (if the text is "true" or "spurious"), of course this will not work for
##  other texts. We need tofind a more generic solution.
##

library(fsdaR)

Y <- read.table("z1.txt", header=TRUE)

## Computation of information criterion
out <- tclustIC(Y, plots=FALSE)

##  Computation of the best solutions
##  Plot first 3 best solutions using as Information criterion CLACLA
cat("\nBest 9 solutions using CLACLA.\n")
outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE,
    NumberOfBestSolutions=9, ThreshRandIndex=0.8)

## outCLACLA$CLACLAbs[[1,5]] should have been a character string
##  containing "true" or "spurious", not numeric vector containing
##  the ASCII codes of the characters, i.e. instead of "true"
##  we have 116 114 117 101
outCLACLA$CLACLAbs
carbikeplot(outCLACLA, SpuriousSolutions=TRUE)


## Issue #4 -----------------------------------------------------
##
##  Databrush problem with runtime V9.6 - but it works fine with V9.1
##
library(fsdaR)
data(hbk)

## Monitor MM-estimates
out <- mmmult(hbk, monitoring=TRUE)

## Brush once
malfwdplot(out, conflev=0.975, fg.labstep="", datatooltip=TRUE, databrush=TRUE)
