##detach(name="package:fsdaR", unload=TRUE)
##unloadNamespace("fsdaR")

library(fsdaR)

## 1. All four work with default arguments
(out <- fsreg(Y~., data=hbk, method="FS"))
(out1 <- fsrbase(Y~., data=hbk, trace=TRUE))

## testing plot parameters for FSR
(out2 <- fsrbase(Y~., data=hbk, plot=TRUE, bivarfit=FALSE, trace=TRUE))
(out3 <- fsrbase(Y~., data=hbk, plot=TRUE, bivarfit=TRUE, trace=TRUE))
(out4 <- fsrbase(Y~., data=hbk, plot=TRUE, multivarfit=FALSE, trace=TRUE))
(out5 <- fsrbase(Y~., data=hbk, plot=TRUE, multivarfit=TRUE, trace=TRUE))
(out6 <- fsrbase(Y~., data=hbk, plot=TRUE, xlim=c(30,60)))
(out7 <- fsrbase(Y~., data=hbk, plot=TRUE, xlim=c(3,9)))
(out8 <- fsrbase(Y~., data=hbk, plot=TRUE, namey="ABCD"))
(out9 <- fsrbase(Y~., data=hbk, plot=TRUE, nameX=c("A1", "A2", "A3")))
(outA <- fsrbase(Y~., data=hbk, plot=TRUE, labeladd=TRUE))
(outB <- fsrbase(Y~., data=hbk, msg=''))
(outC <- fsrbase(Y~., data=hbk, bsbmfullrank=FALSE))

## 1a. The monitoring functions: all three work with default arguments
out <- fsreg(Y~., data=hbk, monitoring=TRUE, method="FS")
out1 <- fsrbase(Y~., data=hbk, monitoring=TRUE)

## 2. Works with any arguments provided by the user, which are scalars
(out1 <- fsrbase(Y~., data=hbk, h=56, nsamp=500, lms=2, trace=TRUE))

## 3. The default call to FSReda() works, but we have three mandatory parameters here
##      y, X and bsb. If missing bsb, it is set to bsb=0
##      - test with monitoring=TRUE and method="FS"
out1 <- fsrbase(Y~., data=hbk, monitoring=TRUE)
out2 <- fsrbase(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE)
out2a <- fsreg(Y~., data=hbk, bsb=c(1,3,5), method="FS", monitoring=TRUE)
out3 <- fsrbase(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE, tstat="trad")
out3 <- fsrbase(Y~., data=hbk, bsb=c(1,3,5), monitoring=TRUE, tstat="scal")

## 4. Test the return of a character value: rhofunc. Use the function

## 5. Some of the parameters can be (a) vectors:
##  e.g. lms=c(15,16,17) (if we have three predictors and no intercept: p initial points) or
##  lms=c(15,16,17,18) (if we have three predictors and an intercept: p+1 initial points)
(out <- fsrbase(Y~., data=hbk, lms=c(15,16,17)))        # OK
(out <- fsrbase(Y~., data=hbk, lms=c(15,16,17,18)))     # OK

## 6. Some of the parameters can be (b) structures/lists: e.g. lms=list(bsb=3)
##  This is necessary in the rare cases when an intial sample is passed as a parameter,
##  but this sample consists of a single number, since we have simple regression without intercept.
##   - we still do not support structues on the input parameters.
(out <- fsrbase(Y~X1-1, data=hbk, lms=list(bsb=3)))  # OK


#################################################################

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
ltx <- ltsReg(Y~., data=hbk)
predict(lmx)
