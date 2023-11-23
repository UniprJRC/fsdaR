### R code from vignette source 'fsdaR.Rnw'

###################################################
### code chunk number 1: wool (eval = FALSE)
###################################################
## library(fsdaR)
## data(wool)
## head(wool)
## 
## ##  Compute the score test using the five most common values of the
## ##  transformation parameter lambda
## 
## out <- score(cycles~., data=wool)
## out$Score
## 


###################################################
### code chunk number 2: loyalty (eval = FALSE)
###################################################
## data(loyalty)
## head(loyalty)
## 
## ## la is a vector containing the values of \lambda which have to be tested
## 
## out <- score(amount_spent~., data=loyalty,
##               la=c(0.25, 1/3, 0.4, 0.5))
## out$Score
## 


###################################################
### code chunk number 3: ex-1 (eval = FALSE)
###################################################
## 
## ##  Example 1: original poison data
## library(fsdaR)
## 
## data(poison)
## head(poison)
## dim(poison)
## 
## set.seed(10)
## 
## ##  A formula without intercept looks like this: Y~.-1
## out1 <- fsrfan(Y~.-1, data=poison)    # no intercept
## plot(out1, ylim=c(-14, 3))
## 


###################################################
### code chunk number 4: ex-1-order (eval = FALSE)
###################################################
## library(xtable)
## xtab <- out1$Un[,2,]
## largest <- tail(order(poison$Y), nrow(xtab))
## xtab <- cbind(as.numeric(rownames(xtab)), xtab, largest)
## colnames(xtab)[1] <- "Step"
## colnames(xtab)[ncol(xtab)] <- "Largest Obs."
## print(xtable(tail(xtab), digits=0,
##     caption="The last six observations that enter the model. The last column shows the six largest observations.",
##     label="tab:ex-1"), include.rownames=FALSE)
## 


###################################################
### code chunk number 5: ex-2 (eval = FALSE)
###################################################
## 
## ##  Example 2: modified poison data (change y[8] from 0.23 to 0.13)
## library(fsdaR)
## data(poison)
## 
## poison$Y[8] <- 0.13
## set.seed(9999)
## out2 <- fsrfan(Y~.-1, data=poison)
## plot(out2, ylim=c(-11, 9))


###################################################
### code chunk number 6: ex-3 (eval = FALSE)
###################################################
## 
## ##  Example 3: modified poison data (change y[8] from 0.23 to 0.13
## ##  and y[38] from 0.71 to 0.14)
## library(fsdaR)
## data(poison)
## 
## poison$Y[8] <- 0.13
## poison$Y[38] <- 0.14
## 
## out3 <- fsrfan(Y~.-1, data=poison)
## plot(out3, ylim=c(-8, 11))


###################################################
### code chunk number 7: ex-4 (eval = FALSE)
###################################################
## 
## ##  Example 4: modified poison data (four observations are changed)
## library(fsdaR)
## data(poison)
## 
## poison$Y[6] <- 0.14
## poison$Y[9] <- 0.08
## poison$Y[10] <- 0.07
## poison$Y[11] <- 0.06
## 
## out4 <- fsrfan(Y~.-1, data=poison, init=10)
## plot(out4, ylim=c(-10, 22))


###################################################
### code chunk number 8: ex-4a-compute (eval = FALSE)
###################################################
## 
## ##  Example 4a: modified poison data (four observations
## ##  are changed) with the reciprocal transformation
## poison$Y <- poison$Y ^ (-1)
## set.seed(1234)
## out4a <- fsreg(Y~.-1, data=poison, method="LMS", msg=FALSE)
## out4a <- fsreg(Y~.-1, data=poison, monitoring=TRUE,
##           lms=out4a.bs, msg=FALSE)
## 
## ##  Monitoring the scaled residuals: a label is written
## ##  for the residuals greater than 2
## resfwdplot(out4a, fg.thresh=2)


###################################################
### code chunk number 9: ex-4b-compute (eval = FALSE)
###################################################
## 
## ##  Example 4b: automatic outlier detection for the
## ##  modified poison data (four observations are changed)
## ##  with the reciprocal transformation
## 
## set.seed(1234)
## out4b <- fsreg(Y~.-1, data=poison, control=FSR_control(plot=2, msg=FALSE))


