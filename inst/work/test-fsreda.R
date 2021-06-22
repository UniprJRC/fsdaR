detach(name="package:fsdaR", unload=TRUE)

## --------------------------------------------
    library(fsdaR)
    n=100; p=8; state=1
    ##  randn('state', state);
    ##  The 'seed', 'state', and 'twister' inputs to the randn function are not recommended.
    ##  Use the rng function instead. For more information,
    ##  see Replace Discouraged Syntaxes of rand and randn.

    y <- rnorm(n)
    X <- matrix(rnorm(n*p), nrow=n)

    y[1:10] <- y[1:10] + 5

    ##  % Run the forward search with Exploratory Data Analysis purposes
    ##  % LMS using 10000 subsamples
    ##  [outLXS]=LXS(y,X,'nsamp',10000);
    outLTX <- fsreg(y~X, method="LTS", nsamp=10000)

    ##  % Forward Search
    ##  [out]=FSReda(y,X,outLXS.bs);
    out <- fsreg(y~X, method="FS", bsb=outLTX$bs, monitoring=TRUE)

    ##  %The monitoring residuals plot shows a set of positive residuals which
    ##  %starting from the central part of the search tend to have a residual much
    ##  %larger than that of the other units.
    resfwdplot(out)

    ##  %The minimum deletion residual from m=90 starts going above the 99% threshold.
    ##  mdrplot(out);

    ##  %The curve which monitors the normality test shows a sudden big increase with the outliers included
    oldpar <- par(mfrow=c(2,2))
    plot(out$nor[,1], out$nor[,2], xlim=c(10,100), main="Asimmetry test", type="l", xlab="", ylab="")
    abline(h=qchisq(0.99, 1), col="red")

    plot(out$nor[,1], out$nor[,3], xlim=c(10,100), main="Kurtosis test", type="l", xlab="", ylab="")
    abline(h=qchisq(0.99, 1), col="red")

    plot(out$nor[,1], out$nor[,4], xlim=c(10,100), main="Normality test", type="l", xlab="Subset of size m", ylab="")
    abline(h=qchisq(0.99, 2), col="red")
    par(oldpar)
