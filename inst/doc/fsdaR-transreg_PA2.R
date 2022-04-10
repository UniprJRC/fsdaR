## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 7, fig.width = 7)
library(fsdaR)

## -----------------------------------------------------------------------------
library(fsdaR)
data(wool)
head(wool)

##  Compute the score test using the five most common values of the
##  transformation parameter lambda

## only the last two steps
out <- fsrfan(cycles~., data=wool, init=nrow(wool)-1) 
out$Score[nrow(out$Score), -1]


## -----------------------------------------------------------------------------
data(loyalty)
head(loyalty)

## la is a vector containing the values of \lambda which have to be tested

## only the last two steps
out <- fsrfan(amount_spent~., data=loyalty, la=c(0.25, 1/3, 0.4, 0.5), init=nrow(loyalty)-1)   
out$Score[nrow(out$Score), -1]


## ---- label=ex-1-compute, out.width='85%', fig.cap = "Figure 1: Fan plot for the original poison data."----
##  Example 1: original poison data
data(poison)
head(poison)
dim(poison)

set.seed(10)

##  A formula without intercept looks like this: Y~.-1
out1 <- fsrfan(Y~.-1, data=poison)    # no intercept
plot(out1, ylim=c(-14, 3))

## ---- label=ex-1-order, echo=FALSE--------------------------------------------
xtab <- out1$Un[,2,]
largest <- tail(order(poison$Y), nrow(xtab))
xtab <- cbind(as.numeric(rownames(xtab)), xtab, largest)
colnames(xtab)[1] <- "Step"
colnames(xtab)[ncol(xtab)] <- "Largest Obs."
knitr::kable(tail(xtab), caption="Table 1: The last six observations that enter the model. The last column shows the six largest observations.", row.names=FALSE)

## ---- label=ex-2-compute, out.width='85%', fig.cap = "Figure 2: Fan plot for the modified ```poison``` data (one observation changed)."----
##  Example 2: modified poison data (change y[8] from 0.23 to 0.13)
data(poison)

poison$Y[8] <- 0.13
set.seed(9999)
out2 <- fsrfan(Y~.-1, data=poison)
plot(out2, ylim=c(-11, 9))

## ---- label=ex-3-compute, out.width='85%', fig.cap = "Figure 3: Fan plot for the modified ```poison``` data (two observations changed)."----
##  Example 3: modified poison data (change y[8] from 0.23 to 0.13
##  and y[38] from 0.71 to 0.14)
data(poison)

poison$Y[8] <- 0.13
poison$Y[38] <- 0.14

out3 <- fsrfan(Y~.-1, data=poison)
plot(out3, ylim=c(-8, 11))

## ----ex-4-table, echo=FALSE, message=FALSE, warnings=FALSE, results='asis'----
tab4 <- "
| Observation | Original  | Modified |
|:-----------:|----------:|---------:|
|      6      |   0.29    |   0.14   |
|      9      |   0.22    |   0.08   |
|     10      |   0.21    |   0.07   |
|     11      |   0.18    |   0.06   |
"
cat(tab4, "Table 2: The four artificially modified observations")

## ---- label=ex-4-compute, out.width='85%', fig.cap = "Figure 4: Fan plot for the modified ```poison``` data (four observations changed)."----
##  Example 4: modified poison data (four observations are changed)
data(poison)

poison$Y[6] <- 0.14
poison$Y[9] <- 0.08
poison$Y[10] <- 0.07
poison$Y[11] <- 0.06

out4 <- fsrfan(Y~.-1, data=poison, init=10)
plot(out4, ylim=c(-10, 22))

## ---- label="ex-4a-compute"---------------------------------------------------
##  Example 4a: modified poison data (four observations 
##  are changed) with the reciprocal transformation
poison$Y <- poison$Y ^ (-1)
out4a <- fsreg(Y~.-1, data=poison, method="LMS")
out4a <- fsreg(Y~.-1, data=poison, monitoring=TRUE, 
          lms=out4a.bs)
##  Monitoring the scaled residuals: a label is written 
##  for the residuals greater than 2
resfwdplot(out4a, fg.thresh=2)

## ---- ex-4a, echo=FALSE, out.width='85%', fig.cap = "Figure 5: Residual forward plot for the modified ```poison``` data (four observations changed) with the reciprocal transformation."----
library(knitr)
include_graphics("images/ex-4a.png")

## ---- label="ex-4b-compute"---------------------------------------------------
##  Example 4b: automatic outlier detection for the 
##  modified poison data (four observations are changed) 
##  with the reciprocal transformation
out4b <- fsreg(Y~.-1, data=poison, control=FSR_control(plot=2))

## ---- ex-4b, echo=FALSE, out.width='85%', fig.cap = "Figure 6: Automatic outlier detection for the modified ```poison``` data (four observations changed) with the reciprocal transformation."----
library(knitr)
include_graphics("images/ex-4b-1.png")
include_graphics("images/ex-4b-2.png")
include_graphics("images/ex-4b-3.png")

