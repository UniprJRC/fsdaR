## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(fsdaR))
suppressPackageStartupMessages(library(rrcov))

##  corfwdplot(), covplot(), spmplot(), regspmplot() =============
data(hbk, package="robustbase")
(out <- fsmult(hbk[,1:3], monitoring=TRUE))
corfwdplot(out)

##  takes too much time
##(out1 <- smult(hbk, monitoring=TRUE, trace=TRUE))
##corfwdplot(out1)

##  Cannot suppress the temporary messages
##(out2 <- mmmult(hbk[,1:3], monitoring=TRUE, trace=TRUE))
##corfwdplot(out2)

(out3 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="FS"))
corfwdplot(out3)

##  takes too much time
##(out4 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="S"))
##corfwdplot(out4)

##  Cannot suppress the temporary messages
##(out5 <- fsreg(hbk[,1:3], hbk[,4], monitoring=TRUE, trace=TRUE, method="MM"))
##corfwdplot(out5)


##  Produce monitoring covariances plot with all default options
out <- fsmult(hbk, monitoring=TRUE)
covplot(out)

spmplot(hbk)

## regspmplot() ==================================================
set.seed(12345)
n <- 100
p <- 3
X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)
regspmplot(y, X)

group <- rep(0, n)
group[1:(n/2)] <- rep(1, n/2)
regspmplot(y, X, group)

regspmplot(y, X, group, plot=TRUE)

regspmplot(y, X, group, xlim=c(-1,2), ylim=c(0,2), pch=c(10,11), trace=TRUE)

(out <- fsreg(y~X, method="LMS", control=LXS_control(nsamp=1000, msg=FALSE)))
(out <- fsreg(y~X, bsb=out$bs, monitoring=TRUE))

regspmplot(out, plot=0)
