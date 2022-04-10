##  carbikeplot {fsdaR} -- Produces the carbike plot to find best relevant clustering solutions obtained by tclustICsol
 data(geyser2)
 out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)

 ## Plot first two best solutions using as Information criterion MIXMIX
 print("Best solutions using MIXMIX")
 outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)

 print(outMIXMIX$MIXMIXbs)

 carbikeplot(outMIXMIX)


##  corfwdplot {fsdaR}	-- Monitoring the correlations between consecutive distances or residuals

 data(hbk, package="robustbase")
 (out <- fsmult(hbk[,1:3], monitoring=TRUE))
 corfwdplot(out)


##  fsdalms.object {fsdaR}	-- Description of fsdalms Objects
##  fsdalts.object {fsdaR}	-- Description of fsdalts Objects
##  fsmeda.object {fsdaR}	-- Description of fsmeda Objects
##  fsmmmdrs {fsdaR}	    -- Performs random start monitoring of minimum Mahalanobis distance
##  fsmmmdrs.object {fsdaR} -- Description of fsmmmdrs.object Objects
##  fsmult {fsdaR}	        -- Gives an automatic outlier detection procedure in multivariate analysis
##  fsmult.object {fsdaR}	-- Description of fsmult.object Objects
##  fsr.object {fsdaR}	    -- Description of fsr Objects
##  fsreda.object {fsdaR}	-- Description of fsreda Objects

##  FSReda_control {fsdaR}	-- Creates an FSReda_control object
##  fsreg {fsdaR}	        -- fsreg: an automatic outlier detection procedure in linear regression
##  FSR_control {fsdaR}     -- Creates an FSR_control object

##  levfwdplot {fsdaR}	    -- Plots the trajectories of the monitored scaled (squared) residuals
    n <- 100
    y <- rnorm(n)
    X <- matrix(rnorm(n*4), nrow=n)

    out <- fsreg(y~X, method="LTS")
    out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
    levfwdplot(out)

##  LXS_control {fsdaR}     -- Creates an LSX_control object

##  malfwdplot {fsdaR}	    -- Plots the trajectories of scaled Mahalanobis distances along the search
     ## Produce monitoring MD plot with all the default options.
     ##  Generate input structure for malfwdplot
     n <- 100
     p <- 4
     Y <- matrix(rnorm(n*p), ncol=p)
     Y[1:10,] <- Y[1:10,] + 4

     out <- fsmult(Y, monitoring=TRUE, init=30)

     ##  Produce monitoring MD plot with all the default options
     malfwdplot(out, fg.cex=0)

##  malindexplot {fsdaR}	-- Plots the trajectory of minimum Mahalanobis distance (mmd)

    ##  Mahalanobis distance plot of 100 random numbers.
    ##  Numbers are from from the chisq with 5 degrees of freedom

    malindexplot(rchisq(100, 5), 5)

##  mdrplot {fsdaR}         -- Plots the trajectory of minimum deletion residual (mdr)
    n <- 100
    y <- rnorm(n)
    X <- matrix(rnorm(n*4), nrow=n)

    out <- fsreg(y~X, method="LTS")
    out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
    mdrplot(out)

##  mmdplot {fsdaR}         -- Plots the trajectory of minimum Mahalanobis distance (mmd)
    data(hbk)
    (out <- fsmult(hbk[,1:3], monitoring=TRUE))
    mmdplot(out)

##  mmdrsplot {fsdaR}	    -- Plots the trajectories of minimum Mahalanobis distances from different starting points
    data(hbk)
    out <- fsmmmdrs(hbk[,1:3])
    mmdrsplot(out)

##  mmmult {fsdaR}	        -- Computes MM estimators in multivariate analysis with auxiliary S-scale
    data(hbk)
    (out <- mmmult(hbk[,1:3]))
    class(out)
    summary(out)

    ##  Generate contaminated data (200,3)
    n <- 200
    p <- 3
    set.seed(123456)
    X <- matrix(rnorm(n*p), nrow=n)
    Xcont <- X
    Xcont[1:5, ] <- Xcont[1:5,] + 3

    out1 <- mmmult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
    names(out1)

    ## plot=TRUE - generates: (1) a plot of Mahalanobis distances against
    ##    index number. The confidence level used to draw the confidence bands for
    ##    the MD is given by the input option conflev. If conflev is
    ##    not specified a nominal 0.975 confidence interval will be used and
    ##    (2) a scatter plot matrix with the outliers highlighted.

    (out1 <- mmmult(Xcont, trace=TRUE, plot=TRUE))

    ## plots is a list: the spm shows the labels of the outliers.
    (out1 <- mmmult(Xcont, trace=TRUE, plot=list(labeladd="1")))

    ## plots is a list: the spm uses the variable names provided by 'nameY'.
    (out1 <- mmmult(Xcont, trace=TRUE, plot=list(nameY=c("A", "B", "C"))))

    ## mmmult() with monitoring
    (out2 <- mmmult(Xcont, monitoring=TRUE, trace=TRUE))
    names(out2)

    ##  Forgery Swiss banknotes examples.

    data(swissbanknotes)

    (out1 <- mmmult(swissbanknotes[101:200,], plot=TRUE))

    (out1 <- mmmult(swissbanknotes[101:200,], plot=list(labeladd="1")))

##  mmmult.object {fsdaR}	  -- Description of mmmult.object Objects
    data(hbk)
    (out <- mmmult(hbk[,1:3]))
    class(out)
    summary(out)

##---------------------------------------------------------------------------
##
##  DATA SETS
##
