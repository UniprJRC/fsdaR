library(fsdaR)

n <- 200
v <- 3
set.seed(123456)
X <- matrix(rnorm(n*v), nrow=n)

Xcont <- X
Xcont[1:5, ] <- Xcont[1:5, ] + 3

## --------------------------------------------------------------
## Testing fsmult()
out1 <- fsmult(Xcont, trace=TRUE)               # no plots (plot defaults to FALSE)
names(out1)

out1 <- fsmult(Xcont, trace=TRUE, plot=TRUE)    # identical to plots=1
out1 <- fsmult(Xcont, trace=TRUE, plot=1)       # plots=1 - minimum MD with envelopes based on n observations and the scatterplot matrix with the outliers highlighted
out1 <- fsmult(Xcont, trace=TRUE, plot=2)       # plots=2 - additional plots of envelope resuperimposition

## plots is a list: plots showing envelope superimposition in normal coordinates.
out1 <- fsmult(Xcont, trace=TRUE, plot=list(ncoord=1))


##  Choosing an initial subset formed by the three observations with
##  the smallest Mahalanobis Distance.

out1 <- fsmult(Xcont, m0=5, crit="md", trace=TRUE)

## fsmult() with monitoring
out2 <- fsmult(Xcont, monitoring=TRUE, trace=TRUE)
names(out2)


## Monitor the exceedances from m=200 without showing plots.
n <- 1000
p <- 10
X <- matrix(rnorm(10000), ncol=10)
out <- fsmult(X, init=200)


##  Forgery Swiss banknotes examples.

data(swissbanknotes)

## Monitor the exceedances of Minimum Mahalanobis Distance
(out1 <- fsmult(swissbanknotes[101:200,], plot=1))

##  Control minimum and maximum on the x axis
(out1 <- fsmult(swissbanknotes[101:200,], plots=list(xlim=c(60,90))))

##  Monitor the exceedances of Minimum Mahalanobis Distance using
##  normal coordinates for mmd.
out1 <- fsmult(swissbanknotes[101:200,], plot=list(ncoord=1))


malfwdplot(out2)
mmdplot(out2)

malindexplot(out1)
malindexplot(rnorm(100), p=5)

#################################################################
## Produce monitoring MD plot with all the default options.
##  Generate input structure for malfwdplot
n <- 100
p <- 4
Y <- matrix(rnorm(n*p), ncol=p)
Y[1:10,] <- Y[1:10,] + 4

out <- fsmult(Y, monitoring=TRUE, init=30)

##  Produce monitoring MD plot with all the default options
malfwdplot(out)

#################################################################
##
##  Mahalanobis distance plot of 100 random numbers.
##  Numbers are from from the chisq with 5 degrees of freedom
##
malindexplot(rchisq(100, 5), 5)
