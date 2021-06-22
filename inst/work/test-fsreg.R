##detach(name="package:fsdaR", unload=TRUE)
##unloadNamespace("fsdaR")

library(fsdaR)

## 1. All four work with default arguments
(out <- fsreg(Y~., data=hbk, method="FS"))
(out <- fsreg(Y~., data=hbk, method="S"))
(out <- fsreg(Y~., data=hbk, method="MM"))
(out <- fsreg(Y~., data=hbk, method="LTS"))

## testing plot parameters for FSR
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, bivarfit=FALSE)))                  # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, bivarfit=TRUE)))                   # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, multivarfit=FALSE)))               # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, multivarfit=TRUE)))                # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, xlim=c(30,60))))                   # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, xlim=c(3,9))))                     # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, namey="ABCD")))                    # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, nameX=c("A1", "A2", "A3"))))       # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(plot=TRUE, labeladd=TRUE)))                   # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(msg='')))                                     # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(bsbmfullrank=FALSE)))                         # OK

## 1a. The monitoring functions: all three work with default arguments
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)               # OK
out <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE)                # OK, but it will take some time
out <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE)               # OK


## 2. All three work with any arguments provided by the user, which are scalars
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2)))         # OK
(out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(bdp=0.75, nsamp=500,  msg=2)))    # ERROR - msg must be TRUE or FALSE
(out <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99, effshape=1)))         # OK
(out <- fsreg(Y~., data=hbk, method="LTS", control=LXS_control(h=39)))                          # Ok

## 3. The default call to FSReda() works, but we have three mandatory parameters here
##      y, X and bsb. If missing bsb, it is set to bsb=0
##      - test with monitoring=TRUE and method="FS"
out <- fsreg(Y~., data=hbk, monitoring=TRUE, method="FS")                                                           # OK
out <- fsreg(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE, method="FS")                                             # OK
out <- fsreg(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE, method="FS", control=FSReda_control(tstat="trad"))       # OK
out <- fsreg(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE, method="FS", control=FSReda_control(tstat="scal"))       # OK

## 4. Test the return of a character value: rhofunc. Use the function
(out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(rhofunc="hampel")))                           # OK
(out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(rhofuncparam=5)))                             # OK
 (out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(rhofunc="hampel", rhofuncparam=c(2,4,8))))   # OK
(out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(rhofunc="hyperbolic", rhofuncparam=c(5))))    # OK
out$rhofunc
out$rhofuncparam

## 5. Some of the parameters can be (a) vectors:
##  e.g. lms=c(15,16,17) (if we have three predictors and no intercept: p initial points) or
##  lms=c(15,16,17,18) (if we have three predictors and an intercept: p+1 initial points)
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(intercept=FALSE, lms=c(15,16,17))))   # OK
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control( lms=c(15,16,17,18))))                # OK

## 6. Some of the parameters can be (b) structures/lists: e.g. lms=list(bsb=3)
##  This is necessary in the rare cases when an intial sample is passed as a parameter,
##  but this sample consists of a single number, since we have simple regression without intercept.
##   - we still do not support structues on the input parameters.
(out <- fsreg(Y~X1, data=hbk, method="FS", control=FSR_control(intercept=FALSE, lms=list(bsb=3))))  # OK


#############################################################################

(out <- fsreg(Y~., data=hbk, method="FS"))
summary(out)

(out <- fsreg(Y~., data=hbk, method="S"))
summary(out)

(out <- fsreg(Y~., data=hbk, method="MM"))
summary(out)

(out <- fsreg(Y~., data=hbk, method="LTS"))
summary(out)


class(out) <- c(class(out), "lm")
## robustbase:::predict.lmrob(out, newdata = NULL, scale = 1)


lmx <- lmrob(Y~., data=hbk)
lm <- lm(Y~., data=hbk)
ltx <- ltsReg(Y~., data=hbk)
predict(lmx)
