## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(fsdaR))
suppressPackageStartupMessages(library(rrcov))

library(robustbase)                         # for ltsReg()
data(hbk, package="robustbase")

set.seed(12345)

n <- 200
p <- 3

X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
y <- matrix(data=rnorm(n*1), nrow=n, ncol=1)
(out = fsreg(X, y))
summary(out)
out$weights
out$residuals
out$fitted.values
out$mdr
out$Un
out$nout

## Now we use the formula interface:
(out1 = fsreg(y~X, control=FSR_control(plot=FALSE)))
summary(out1)
out1$weights
out1$residuals
out1$fitted.values
out1$mdr
out1$Un
out1$nout

## Or use all the variables in a data frame
(out2 = fsreg(Y~., data=hbk, control=FSR_control(plot=FALSE)))
summary(out2)
out2$weights
out2$residuals
out2$fitted.values
out2$mdr
out2$Un
out2$nout

## let us compare to the LTS solution
(out3 = ltsReg(Y~., data=hbk))

## Now compute the model without intercept
(out4 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE)))
summary(out4)
out4$weights
out4$residuals
out4$fitted.values
out4$mdr
out4$Un
out4$nout

## And compare again with the LTS solution
(out5 = ltsReg(Y~.-1, data=hbk))

## using default (optional arguments)
(out6 = fsreg(Y~.-1, data=hbk, control=FSR_control(plot=FALSE, nsamp=1500, h=50)))
summary(out6)
out6$weights
out6$residuals
out6$fitted.values
out6$mdr
out6$Un
out6$nout

## Using the controls
(out7 <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2, msg=FALSE)))
summary(out7)
out7$weights
out7$residuals
out7$fitted.values
out7$mdr
out7$Un
out7$nout

(out8 <- fsreg(Y~., data=hbk, method="LMS", control=LXS_control(h=56, nsamp=500, lms=2, msg=FALSE)))
summary(out8)
out8$weights
out8$residuals
out8$fitted.values

##  MM regression
(out9 <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99, msg=FALSE)))
summary(out9)
out9$weights
out9$residuals
out9$fitted.values

##  MM regression with specified rho function ("optimal")
(out10 <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99, rhofunc="optimal", msg=FALSE)))
summary(out10)
out10$weights
out10$residuals
out10$fitted.values
out10$rhofunc

## S regression
(out11 <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(bdp=0.25, nsamp=500, msg=FALSE)))
summary(out11)
out11$weights
out11$residuals
out11$fitted.values


##  The monitoring functions: with default arguments =============
(out_fs <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE))
out_fs$RES
out_fs$LEV
out_fs$BB
out_fs$mdr
out_fs$msr
out_fs$nor
out_fs$Bols
out_fs$S2
out_fs$coo
out_fs$Tols
out_fs$Un
out_fs$betaINT
out_fs$sigma2INT

(out_s <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE, control=Sregeda_control(msg=FALSE)))
out_s$RES
out_s$Beta
out_s$Weights
out_s$Outliers
out_s$conflev
out_s$bdp
out_s$Scale
out_s$BS
out_s$Singsub
out_s$rhofunc
out_s$rhofuncparam

##  I cannot suppress the messages reporting time for computation
##  of S estimates
if(FALSE) {
    (out_mm <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE))
    out_mm$RES
    out_mm$Beta
    out_mm$Weights
    out_mm$Outliers
    out_mm$conflev
    out_mm$eff
    out_mm$Ssingsub
    out_mm$rhofunc
    out_mm$rhofuncparam
}

## The default call to FSReda() works, but we have three mandatory parameters here
##      y, X and bsb. If missing bsb, it is set to bsb=0
##      - test with monitoring=TRUE and method="FS"
(outa <- fsreg(Y~., data=hbk, monitoring=TRUE, method="FS"))
outa$BB
(outb <- fsreg(Y~., data=hbk, bsb=c(1,3,5,10), monitoring=TRUE, method="FS"))
outb$BB
(outc <- fsreg(Y~., data=hbk, bsb=c(1,3,5,10), monitoring=TRUE, method="FS", control=FSReda_control(tstat="trad")))
outc$BB
(outd <- fsreg(Y~., data=hbk, bsb=c(1,3,5,10), monitoring=TRUE, method="FS", control=FSReda_control(tstat="scal")))
outd$BB
