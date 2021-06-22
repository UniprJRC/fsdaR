library(fsdaR)

n <- 200
p <- 3
set.seed(123456)
X <- matrix(rnorm(n * p), nrow=n)
Xcont <- X
Xcont[1:5, ] <- Xcont[1:5,] + 3

## --------------------------------------------------------------
## Testing smult()
out1 <- smult(Xcont, trace=TRUE)               # no plots (plot defaults to FALSE)
names(out1)

(out1 <- smult(Xcont, trace=TRUE, plot=TRUE))    # identical to plots=1

## plot=1 - minimum MD with envelopes based on n observations
##  and the scatterplot matrix with the outliers highlighted
(out1 <- smult(Xcont, trace=TRUE, plot=1))

## plot=2 - additional plots of envelope resuperimposition
(out1 <- smult(Xcont, trace=TRUE, plot=2))

## plots is a list: with labeladd=1 or labeladd=TRUE the outliers in the spm are
##  labelled with their unit row index.
(out1 <- smult(Xcont, trace=TRUE, plot=list(labeladd=TRUE)))


## smult() with monitoring
out2 <- smult(Xcont, monitoring=TRUE, trace=TRUE)
names(out2)


##  Forgery Swiss banknotes examples.

data(swissbanknotes)

## Monitor the exceedances of Minimum Mahalanobis Distance
(out1 <- smult(swissbanknotes[101:200,], plot=1))

##  Control minimum and maximum on the x axis
(out1 <- smult(swissbanknotes[101:200,], plot=list(labeladd=1)))


malfwdplot(out2)
##mmdplot(out2)

malindexplot(out1)
malindexplot(rnorm(100), p=5)
