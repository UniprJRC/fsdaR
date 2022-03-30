library(fsdaR)

##  Call of spmplot() without optional parameters.
##  Iris data: scatter plot matrix with univariate boxplots on the main
##  diagonal.

X <- iris[,1:4]
group <- iris[,5]
spmplot(X, group, variables=c('SL','SW','PL','PW'), dispopt="box")

##  Example of spmplot() called by routine fsmult().
##  Generate contaminated data.
    n <- 200; p <- 3
    X <- matrix(rnorm(n*p), ncol=3)
    Xcont <- X
    Xcont[1:5,] <- Xcont[1:5,] + 3

##  spmplot is called automatically by all outlier detection methods, e.g. fsmult()
    out <- fsmult(Xcont, plot=TRUE)

##  Now test the direct use of fsmult(). Set two groups, e.g. those obtained
##  from fsmult().

    group = rep(0, n)
    group[out$outliers] <- 1

##  option 'labeladd' is used to label the outliers
##  By default, the legend identifies the groups with the identifiers
##  given in vector 'group'.

    spmplot(Xcont, group, col=c("blue", "red"), labeladd=1, dispopt="box")
