library(fsdaR)

data(poison)

##  We do not need these, since the formula interface can be used
y <- poison[, ncol(poison)]
X <- poison[, -ncol(poison)]

##  out <- fsrfan(Y~.-1, data=poison)           # formula, intercept=FALSE
##  out <- fsrfan(X, y, intercept=FALSE)
##  out <- fsrfan(X, y, intercept=FALSE, family="YJall", plot=TRUE, ylim=c(-14, 3))
##  out <- fsrfan(X, y, intercept=FALSE, plot=TRUE, ylim=c(-14, 3))

## All default parameters, use the native MCR plot
out <- fsrfan(Y~.-1, data=poison, plot=TRUE, ylim=c(-14, 3))

##  The R plots
plot(out)
plot(out, conflev=c(0.9, 0.95, 0.99))

##================================================================

##  fsrfan() with all default options.
##
##  Store values of the score test statistic for the five most common
##  values of $\lambda$. Produce also a fan plot and display it on the screen.
##  Common part to all examples: load 'wool' data set.
data(wool)
head(wool)
dim(wool)
##  Function FSRfan stores the score test statistic.
##  In this case we use the five most common values of lambda are considered

out <- fsrfan(cycles~., data=wool)
##  fanplot(out)

##  The fan plot shows the log transformation is diffused throughout the data
##  and does not depend on the presence of particular observations.

##======================
##  fsrfan() with optional arguments.
##  Produce a personalized fan plot with required font sizes for labels and axes.
##  !!! actually these parameters do not work also in MATLAB !!!
##  [out]=FSRfan(y,X,'plots',1,'FontSize',16,'SizeAxesNum',16);

    data(wool)
    out <- fsrfan(cycles~., data=wool, plot=TRUE)
    plot(put)

##======================
##
##  Example specifying 'lambda'.
##      Produce a fan plot for each value of 'lambda' in the vector 'la'.
##      Extract in matrix 'Un' the units which entered the search in each step

    data(wool)
    out <- fsrfan(cycles~., data=wool, la=c(-1, -0.5, 0, 0.5), plot=TRUE)
    plot(out)

    out$Un[,2,]

##======================
##  Example specifying the confidence level and the initial starting point for monitoring.
##  Construct the fan plot specifying the confidence level and the initial starting point
##  for monitoring.
    data(wool)
    out <- fsrfan(cycles~., data=wool, init=ncol(wool)+1, nsamp=0, conflev=0.95, plots=TRUE)
    plot(out, conflev=0.95)

##=====================
##  Example with starting point based on LTS.
##  Extract all subsamples, construct a fan plot specifying the confidence level
##  and the initial starting point for monitoring based on p+2 observations,
##  strong line width for lines associated with the confidence bands.
    data(wool)
    out <- fsrfan(cycles~., data=wool, init=ncol(wool)+1, nsamp=0, lms=0, lwd.env=3, plot=TRUE)
    plot(out, lwd.env=3)

##=====================
##  Fan plot using the loyalty cards data.
##  In this example, 'la' is the vector contanining the most common values
##  of the transformation parameter.
##  Store the score test statistics for the specified values of lambda
##  and automatically produce the fan plot
    data(loyalty)
    head(loyalty)
    dim(loyalty)

##  la is a vector contanining the most common values of the transformation parameter
    out <- fsrfan(amount_spent~., data=loyalty, la=c(0, 1/3, 0.4, 0.5), init=ncol(loyalty)+1, plot=TRUE, lwd=3)
    plot(out, lwd=3)

##  The fan plot shows that even if the third root is the best value of the transformation
##  parameter at the end of the search, in earlier steps it lies very close to the upper
##  rejection region. The best value of the transformation parameter seems to be the one
##  associated with la=0.4, which is always the confidence bands but at the end of search,
##  due to the presence of particular observations it goes below the lower rejection line.

##=====================
##  Compare BoxCox with Yeo and Johnson transformation.
##  Store values of the score test statistic for the five most common
##  values of lambda. Produce also a fan plot and display it on the screen.
##  Common part to all examples: load wool dataset.

    data(wool)

    ##  Store the score test statistic using Box Cox transformation.
    outBC <- fsrfan(cycles~., data=wool, nsamp=0)

    ##  Store the score test statistic using Yeo and Johnson transformation.
    outYJ <- fsrfan(cycles~., data=wool, family="YJ", nsamp=0)

    ## Not yet fully implemented
    ##  fanplot(outBC, main="Box Cox")
    ##  fanplot(outYJ,main="Yeo and Johnson")

    plot(outBC, main="Box Cox")
    plot(outYJ, main="Yeo and Johnson")

    cat("\nMaximum difference in absolute value: ",
        max(max(abs(outYJ$Score - outBC$Score), na.rm=TRUE)), "\n")

##=====================
##  This and the following two examples from the FSDA Help of GSRfan()
##  cannot be translated from MATLAB because we do not have yet
##  the function normYJ() in fsdaR.
##
##  Example of monitoring of score test for positive and negative obseravations.
    set.seed(10)
    n <- 200

    X <- matrix(rnorm(n * 3), nrow=n, ncol=3)
    beta <- c(1, 1, 1)
    sig <- 0.5
    y <- X %*% beta + sig * rnorm(n)

    outlmori <- lm(y~X)
    cat("Fit in the true scale\nR2 of the model in the true scale:",
        summary(outlmori)$r.squared, "\n")

    regspmplot(y, X)
    ##[~,~,BigAx]=yXplot(y,X,'tag','ori');
    ##title(BigAx,'Data in the original scale')

    ##  Find the data to transform
    la <- -0.25
    ##ytra <- normYJ(y, [], la, 'inverse', true);
    ##if any(isnan(ytra))
    ##    disp('response with missing values')

    ##disp('Fit in the transformed scale')
    ##disp('R2 of the model in the wrong (inverse) scale')

    ##outlmtra=fitlm(X,ytra);
    ##disp(outlmtra.Rsquared.Ordinary)

    ##[~,~,BigAx]=yXplot(ytra,X,'tag','tra','namey','Data to transform (zoom of y [0 500])','ylimy',[0 500]);
    ##title(BigAx,'Data in the inverse scale')

    ##  out <- fsrfan(ytra~X, la=c(-0.5, -0.25, 0),family="YJpn", plot=TRUE, init=round(n/2))
    ##title('Extended fan plot')

##=====================
