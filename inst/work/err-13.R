##  ISSUE 13 - 28.07.2022
##
##  When the number of clusters estimated is less than the number
##  of clusters requested, emp is not a double (emp=0) but is a structure.
##  This happens only once in a while because the initialization is random.
##
##  Fixed 18.08.2022:
##
##  - use the function unwrapComplexNumericCellArray() to unpack
##      the content of the structure emp.

library(fsdaR)

## Generate data with structured noise
set.seed (0)
library(MASS)
v <- runif (100, -2 * pi, 2 * pi)
noise <- cbind (100 + 25 * sin (v), 10 + 5 * v)
x <- rbind (mvrnorm (360, mu=c(0.0,  0), Sigma=matrix(c(1,  0,  0, 1), ncol = 2)),
            mvrnorm (540, mu=c(5.0, 10), Sigma=matrix(c(6, -2, -2, 6), ncol = 2)),
            noise)

## Set the random seed for MATLAB
myrng(32695)
out <- tclustfsda(x, k=5, alpha=0.15, restrfactor=1, plot=FALSE)
out$emp

##===============================================================

Normally you should get:

    > out$emp
    [1] 0

But in some cases, like in the above, you will get the
following:

    > out$emp
    [[1]]
    [1] "Java-Array-Object[[Ljava/lang/Object;:[[Ljava.lang.Object;@3d012ddd"

    [[2]]
    [1] "Java-Array-Object[[Ljava/lang/Object;:[[Ljava.lang.Object;@6f2b958e"

    [[3]]
    [1] "Java-Array-Object[[Ljava/lang/Object;:[[Ljava.lang.Object;@1eb44e46"

    [[4]]
    [1] "Java-Array-Object[[Ljava/lang/Object;:[[Ljava.lang.Object;@6504e3b2"


This is the case when the number of clusters estimated is less than the number
of clusters requested. This happens only once in a while because the
initialization is random.

My problem is that I cannot extract the information from these Java classes.
There should be the following elements in them:
1. idxemp (n-by-1 vector)
2. muemp (k-by-v matrix)
3. sigmaemp (v-by-v-by-k array)
4. sizemp (Matrix of size (k+1)-by-3)
