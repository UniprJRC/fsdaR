##  OPEN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##



## Issue #5 -----------------------------------------------------
##
##  fsmult() with geyser data from MASS
##  --- Code Example A ---
library(fsdaR)
data(geyser2)

library(MASS)
data(geyser)
head(geyser)

out <- smult(geyser)        # 1. Works, but a number of warnings will be issued (visible only in RStudio)
out <- mmmult(geyser)       # 2. Works, but a number of warnings will be issued (visible only in RStudio)
out <- fsmult(geyser)       # 3. Will stop with an exception (before V910)

##  Error in .jcall("RJavaTools", "Ljava/lang/Object;", "invokeMethod", cl,  :
##    java.lang.NullPointerException


##  Now, in V910 will not throw an exception but will return all matrices empty, because
##      Warning: Matrix is singular to working precision.
##      > In FSMmmd (line 575)
##        In FSM (line 389)
##
##  We catch this condition and stop with an error message. A more graceful
##  way of informing the user is necessary.



##
##  FIXED ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##
## Issue #1 -----------------------------------------------------
## Issue #2 -----------------------------------------------------
## Issue #3 -----------------------------------------------------
## Issue #4 -----------------------------------------------------
## Issue #6 -----------------------------------------------------
## Issue #7 -----------------------------------------------------

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


## Issue #3 -----------------------------------------------------
##
##  tclust() plot: colormap in MATLAB

##  Fixed: 30.07.2021 - now an error will be raised if cmap is not a matrix with three columns.
##  See below the new example

library(fsdaR)
data(geyser2)

##  Filled contour plots with additional options:
##  contourf plot with autumn colormap
plots <- list(type="contourf", cmap="autumn")
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=plots)

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Matrix dimensions must agree.

##  Exaample:
library(fsdaR)
data(geyser2)

##  Filled contour plots with additional options: contourf plot with a named colormap.
##  Here we define four MATLAB-like colormaps, but the user can define anything else,
##  presented by a matrix with three columns which are the RGB triplets.

summer <- as.matrix(data.frame(x1=seq(from=0, to=1, length=65), x2=seq(from=0.5, to=1, length=65), x3=rep(0.4,65)))
spring <- as.matrix(data.frame(x1=rep(1, 65), x2=seq(from=0, to=1, length=65), x3=seq(from=1, to=0, length=65)))
winter <- as.matrix(data.frame(x1=rep(0, 65), x2=seq(from=0, to=1, length=65), x3=seq(from=1, to=0, length=65)))
autumn <- as.matrix(data.frame(x1=rep(1, 65), x2=seq(from=0, to=1, length=65), x3=rep(0, 65)))

out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=autumn))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=winter))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=spring))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=summer))


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

## Issue #6 -----------------------------------------------------
##
##  Fixed: 15.01.2021 - It is necessary to add the following t the path:
##
##      <RUNTIME_ROOT>\bin\win64
##
##  Which most probably boils down to:
##
##      C:\Program Files\MATLAB\MATLAB Runtime\v910\bin\win64
##
##

##  In V910 only
##  This exact sequence will fail in R console, but will work in RStudio -
##  build with the JARs from 24.09.2021
##  - If the command data(hbk) - which is not necessary at all! - is removed, everything works fine
##  - However, if it throws the exception once, than many other functions will crash.
##

library('fsdaR')
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2)))
data(hbk)
(out <- fsmult(hbk[,1:3], monitoring=TRUE))


## Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##  com.mathworks.toolbox.javabuilder.MWException: Loading C:\Program Files\MATLAB\MATLAB
##Runtime\v910\bin\win64\builtins\matlab_toolbox_lang_builtins\mwcommandfuns_builtinimpl.dllfailed with error: The specified module could not be found.
##
##: not connected: not connected


## Issue #7 -----------------------------------------------------
##
##  Fixed 24.11.2021, the JARS corrected to include the function 'progbar'

## Function progbar is missing
(out <- fsmmmdrs(hbk))

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Unrecognized function or variable 'progbar'.
