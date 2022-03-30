library(fsdaR)
library(fsdac)

##
##  http://rosa.unipr.it/FSDA/guide.html
##

##================================================================
##
##  Score test for transformation
##

##  Example 1: wool data
library(fsdaR)
data(wool)
y <- wool[, ncol(wool)]
X <- wool[, -ncol(wool)]

##  Compute the score test using the five most common values of the
##  transformation parameter lambda
out <- fsrfan(y, X, init=length(y)-1)           # only the last two steps
out$Score[nrow(out$Score), -1]

## Example 2: loyalty cards data
library(fsdaR)
data(loyalty)
y <- loyalty[, ncol(loyalty)]
X <- loyalty[, -ncol(loyalty)]

## la: a vector containing the values of \lambda which have to be tested
la <- c(0.25, 1/3, 0.4, 0.5)
out <- fsrfan(y, X, la=la, init=length(y)-1)        # only the last two steps
out$Score[nrow(out$Score), -1]


##================================================================
##
##  Forward score test for transformation
##

##  Example 1: original poison data

data(poison)
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]

set.seed(10)

out0 <- fsrfan(y, X, intercept=FALSE)
out1 <- fsrfan(y, X, intercept=FALSE, plot=TRUE, ylim=c(-14, 3))
tail(out1$Un[,2,])

## fsrfan has not yet a formula interface
##  out1 <- fsrfan(y~., data=poison, intercept=FALSE, plot=TRUE, ylim=c(-14, 3))

## Reproduce the Table (attach the largest observations umbers as a last column)
xtab <- out1$Un[,2,]
largest <- tail(order(y), nrow(xtab))
xtab <- cbind(as.numeric(rownames(xtab)), xtab, largest)
colnames(xtab)[1] <- "Step"
colnames(xtab)[ncol(xtab)] <- "Largest_Obs."
tail(xtab)

## Example 2: repalce observation 8 (replace y=0.23 by y=0.13)
data(poison)
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]
y[8] <- 0.13
out2 <- fsrfan(y, X, intercept=FALSE, plot=TRUE, ylim=c(-11, 9))


## Example 3: repalce observation 8 (replace y=0.23 by y=0.13) and
##  observation 38 (replace y=0.71 by y=0.14)
data(poison)
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]
y[8] <- 0.13
y[38] <- 0.14
out3 <- fsrfan(y, X, intercept=FALSE, plot=TRUE, ylim=c(-8, 11))

## Example 4: repalce four observations
data(poison)
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]
y[6] <- 0.14
y[9] <- 0.08
y[10] <- 0.07
y[11] <- 0.06
out4 <- fsrfan(y, X, intercept=FALSE, init=10, nsamp=10000, plot=TRUE, ylim=c(-10, 22))


y1 <- y ^ (-1)
out4a <- fsreg(X, y1, method="LMS", intercept=FALSE)
out4a <- fsreg(X, y1, monitoring=TRUE, lms=out4a.bs, intercept=FALSE)

##  Monitoring the scaled residuals: a label is written for the residuals
##  greater than 2
##  resfwdplot(out4a, fg.unit=c(6, 9, 10, 11))
resfwdplot(out4a, fg.thresh=2)

out4b <- fsreg(X, y1, intercept=FALSE, control=FSR_control(plot=2))

##  Example 1a: original poison data, exactly reproduced the MATLAB results

bsb <- out0$bs
bsb <- matrix(c(5, 4, 4, 4, 7,
         9, 16, 7, 7, 11,
        13, 26, 16, 16, 16,
        17, 32, 26, 26, 23,
        29, 33, 36, 36, 33,
        45, 40, 48, 48, 48), ncol=5, byrow=TRUE)

##  out1=FSRfan(y, X, lms=bsb, intercept=FALSE)

out2=fsrfan(y, X, lms=bsb, intercept=FALSE)
out2=fsrfan(y, X, lms=bsb, intercept=FALSE, plot=TRUE, ylim=c(-14, 3))

##  The last six observations to enter in each search
tail(out2$Un[,2,])

## The largest observations:
tail(order(y))
