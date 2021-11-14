library(fsdaR)
library(fsdac)

##
##  http://rosa.unipr.it/FSDA/guide.html
##

##  Example 1: original poison data

data(poison)
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]

set.seed(10)

out0=fsrfan(y, X, intercept=FALSE)

bsb <- out0$bs
bsb <- matrix(c(5, 4, 4, 4, 7,
         9, 16, 7, 7, 11,
        13, 26, 16, 16, 16,
        17, 32, 26, 26, 23,
        29, 33, 36, 36, 33,
        45, 40, 48, 48, 48), ncol=5, byrow=TRUE)

##  out1=FSRfan(y, X, lms=bsb, intercept=FALSE)

out2=fsrfan(y, X, lms=bsb, intercept=FALSE)
out2=fsrfan(y, X, lms=bsb, intercept=FALSE, plot=TRUE, ylimy=c(-14, 3))

##  The last six observations to enter in each search
tail(out2$Un[,2,])

## The largest observations:
tail(order(y))
