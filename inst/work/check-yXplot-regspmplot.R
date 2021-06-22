library(fsdaR)

n <- 100
p <- 3
X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)


## Example 1 ====================================================

## case 0: OK - y and X1, X2, ..., Xn will be displayed on the axis
regspmplot(y, X, plot=1)
regspmplot(y, X, plot=TRUE)     # which is the same as above

## case 1: NOT OK: Nothing should be displayed on the axis
regspmplot(y, X, plot=0)
regspmplot(y, X, plot=FALSE)     # which is the same as above

## case 2: NOT OK: Nothing should be displayed on the axis
regspmplot(y, X, plot=c())

## case 3: NOT OK: Nothing should be displayed on the axis
regspmplot(y, X, plot="anything else")

## case 4: NOT OK: Nothing should be displayed on the axis
regspmplot(y, X)



## Example 2: out is a structure =================================
##
##  Example with the first input argument an S3 object.
##  In the following example the input is an object which also contains
##  information about the forward search.
(out1 <- fsreg(y~X, method="LMS", control=LXS_control(nsamp=1000)))
(out <- fsreg(y~X, bsb=out1$bs, monitoring=TRUE))

## The problem here is that MATLAB shows the labels of some of the points.
## I cannot guess which are these points that are shown.
##  However, R does not show anything.
regspmplot(out)

## Example 3: datatooltip ========================================
##
## But the following will not work ... clicking on a point
##  will write in the tooltip window "Unable to update ..."
##
##  Example of the use of option datatooltip.
##  It gives the possibility of clicking on the different points and have
##  information about the unit selected, the step of entry into the
##  subset and the associated label
(out <- fsreg(y~X, monitoring=TRUE))
regspmplot(out, datatooltip=TRUE)


## Example 4: databrush ========================================
##
##  Interactive_example
##  Example of the use of option databrush
##  (brushing is done only once using a rectangular selection tool).
(out <- fsreg(y~X, monitoring=TRUE))
regspmplot(out, databrush=TRUE)
