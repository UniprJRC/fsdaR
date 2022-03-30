##
##  VT:: Bug examples in fsdaR as of 28.06.2021
##

##  ***** FIXED ******
##
## 1. Test case 1: General issue with TCLUST -
##
##  Reported by Domenico.
##  According to Domenico, this happened after they wrote a function in C, see the file DfM.C
##  Please check with Domenico about the details of the C function
##
## The following error will be thrown:
##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Invalid MEX-file 'C:\Users\valen\AppData\Local\Temp\valen\mcrCache9.6\fsda4j0\fsda4java\FSDA-src\utilities_stat\DfM.mexw64':
##      Missing dependent shared libraries:
##      'icudt61.dll' required by 'C:\Program Files\MATLAB\MATLAB Runtime\v96/bin/win64\icuuc61.dll->C:\Program Files\MATLAB\MATLAB Runtime\v96/bin/win64\icuin61.dll->C:\Program
##      Files\MATLAB\MATLAB Runtime\v96/bin/win64\libmwi18n.dll->C:\Program Files\MATLAB\MATLAB
##      Runtime\v96/bin/win64\libmx.dll->C:\Users\valen\AppData\Local\Temp\valen\mcrCache9.6\fsda4j0\fsda4java\FSDA-src\utilities_stat\DfM.mexw64'
##      'MSVCR100.dll' required by 'C:\Users\valen\AppData\Local\Temp\valen\mcrCache9.6\fsda4j0\fsda4java\FSDA-src\utilities_stat\DfM.mexw64'

library(fsdaR)

## The data have been generated using the following R instructions:
library(mvtnorm)
set.seed (100)
Xmix <- rbind (rmvnorm (360, c( 0, 0), matrix(c (1, 0, 0, 1), ncol = 2)),
               rmvnorm (540, c( 5, 10), matrix(c (6, -2, -2, 6), ncol = 2)),
               rmvnorm (100, c(2.5, 5), matrix(c (50, 0, 0, 50), ncol = 2)))

x <- matrix(NA, nrow=nrow(Xmix), ncol=ncol(Xmix) + 1)
x[, 1:ncol(Xmix)] <- Xmix
x[, ncol(x)] <- rnorm(nrow(Xmix))

(out <- tclustfsda(Xmix, k=3, alpha=0))



##  ****** OPEN ******
##
## 2. Test case 2: Issue with too slow plotting in FSM()
##      Reported by Andrea Cappuzzo. He says that R freezes (on Mac).
##      Actually, my observation (on Windows) is that it takes too long to show the plot.

library(fsdaR)
library(tictoc)

n <- 200
v <- 3
set.seed(123456)
X <- matrix(rnorm(n*v), nrow=n)
Xcont <- X
Xcont[1:5, ] <- Xcont[1:5,] + 3
tic()
(out <- fsmult(Xcont))               # no plots, works fine
toc()

## With plots, it will take v-e-e-e-ry long to complete.
##  It was not like this in an older version of FSDA.
tic()
out <- fsmult(Xcont, plot=TRUE)
toc()
