library(fsdaR)

##  === FSRfan with the wool data.
##  Store values of the score test statistic
##  for the five most common values of $\lambda$.
##  Produce also a fan plot and display it on the screen.
##  Common part to all examples: load wool dataset.
data(wool)
y <- wool[,ncol(wool)]
X <- wool[, -ncol(wool)]

##  Function FSRfan stores the score test statistic.
##  In this case we use the five most common values of lambda are considered

out <- fsrfan(y, X)
fanplot(out)


##  The fan plot shows the log transformation is diffused throughout the data
##  and does not depend on the presence of particular observations.

library(fsdaR)

## === Fan plot using fidelity cards data.
##  In the example, la is the vector contanining the most common values
##  of the transformation parameter.
##  Store the score test statistics for the specified values of lambda
##  and automatically produce the fan plot

data(loyalty)
X <- loyalty[, -ncol(loyalty)]
y <- loyalty[, ncol(loyalty)]

## MATLAB does not like integer matrices - convert to doubles!
X <- apply(X, 2, as.numeric)
y <- as.numeric(y)

namey <- "Sales"
nameX <- c("Number of visits", "Age", "Number of persons in the family")

##  la = vector containing the most common values of the transformation
##  parameter
la <- c(0, 1/3, 0.4, 0.5)

##  Store the score test statistics for the specified values of lambda
##  and automatically produce the fan plot

out <- fsrfan(y, X, la=la, init=ncol(X) + 2, plot=TRUE, lwd=3)
##out <- fsrfan(y, X, plot=TRUE)

fanplot(out)

## The fan plot shows that even if the third root is the best value of the
##  transformation parameter at the end of the search in earlier steps it
##  lies very close to the upper rejection region. The best value of the
##  transformation parameter seems to be the one associated with l=0.4
##  which is always the confidence bands but at the end of search, due to
##  the presence of particular observations it goes below the lower
##  rejection line.


## === Test fsmfan() =============================================
library(fsdaR)

##  fsmfan() with all default options.
##  First example with Mussels data.
data("mussels")
out <- fsmfan(mussels, c(0.5, 0, 0.5, 0, 0))

## === Test fsmtra() =============================================
library(fsdaR)

## Swiss heads data, Example 1.
## fsmtra() based on untransformed data $H_0:\lambda=1$ for all variables
data(swissheads)

##[out]=FSMtra(Y,'plotsmle',1);

out <- fsmtra(swissheads, plot="ALL")
