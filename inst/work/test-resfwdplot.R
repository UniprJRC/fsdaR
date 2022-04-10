library(fsdaR)
data(hbk, package="robustbase")

## 1. Exactly as in Matlab, no optional parameters
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out)

## 2. No optional parameters, no initial subset from LTS
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)
out <- fsreg(y~X, method="FS", monitoring=TRUE)
resfwdplot(out)

## 3. Example with HBK, no optional parameters, no initial subset from LTS
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)
resfwdplot(out)


## 4. Example with HBK, optional parameters in the 'standard' structure
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

## Single scalars - OK
resfwdplot(out, standard=list(LineWidth=2))             ## lwd      - OK
resfwdplot(out, standard=list(SizeAxesNum=20))          ## cex.axis - OK
resfwdplot(out, standard=list(SizeAxesLab=20))          ## cex.lab  - no error, but has no effect

## Numerical vector - OK
resfwdplot(out, standard=list(xlim=c(30,100)))          ## xlim     - OK
resfwdplot(out, standard=list(ylim=c(-10,10)))          ## ylim     - OK

## Does it really work ????
## Numeric vector of length(size(out.RES, 2)) controlling the x axis coordinates.
##  The default value of xvalues is size(out.RES, 1) - size(out.RES, 2) + 1:size(out.RES, 1)
xvec <- (dim(out$RES)[1] - dim(out$RES)[2] + 1):dim(out$RES)[1]
resfwdplot(out, standard=list(xvalues=xvec))                ## xvalues (the default) - OK (xvalues is converted internally to double)
resfwdplot(out, standard=list(xvalues=1:dim(out$RES)[2]))   ## xvalues (another valid value) - OK

## Single strings - OK
resfwdplot(out, standard=list(titl="My test title"))    ## main     - OK
resfwdplot(out, standard=list(labx="My test X-label"))  ## xlab     - OK
resfwdplot(out, standard=list(laby="My test y-label"))  ## xlab     - OK

resfwdplot(out, standard=list(LineStyle=c("--", "-.")))  ## cell array in the structure, OK
resfwdplot(out, standard=list(Color=c("red", "blue")))   ## cell array in the structure, OK

## 5. Example with HBK, optional parameters in the 'databrush' structure
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

resfwdplot(out, databrush=1)                        ## databrush is activated: OK
resfwdplot(out, databrush=list(persist="on"))       ## persist=on/off   OK
resfwdplot(out, databrush=list(persist="off"))      ## persist=on/off   OK
resfwdplot(out, databrush=list(bivarfit='1'))       ## bivarfit='0', '1', '2', 'i1', 'i2', ...   OK
resfwdplot(out, databrush=list(multivarfit='1'))    ## multivarfit ='1', '2'   OK
resfwdplot(out, databrush=list(labeladd='1'))       ## labeladd ='1'   OK

## 6. Example with HBK, optional parameters nameX, namey, tag, label, msg
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

## None of these seems to work ????
resfwdplot(out, namey="My test Y name")                 ## namey: OK
resfwdplot(out, nameX=c("Name 1", "NAme 2", "Name 3"))  ## nameX: string vector == matlab Cell array not yet supported !!!
resfwdplot(out, datatooltip=1, label=c("Name 1", "Name 2", "Name 3"))  ## label: string vector == matlab Cell array not yet supported !!!
resfwdplot(out, tag="x_window")                         ## tag: I do not know how it should work    OK
resfwdplot(out, msg=1)                                  ## msg: I cannot see the result in the returned output, OK

## 7. Example with HBK, optional parameters in the 'datatooltip' structure
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

## Errors ???? none of these works
resfwdplot(out, datatooltip=list(DisplayStyle="window"))        ## DisplayStyle - default OK
resfwdplot(out, datatooltip=list(DisplayStyle="datatip"))       ## DisplayStyle - OK
resfwdplot(out, datatooltip=list(SnapToDataVertex="on"))        ## SnapToDataVertex=on/off - OK
resfwdplot(out, datatooltip=list(LineColor=c(0, 1, 0)))         ## LineColor as a numeric triplet - OK
resfwdplot(out, datatooltip=list(LineColor=c(0, 1, 1)))         ## LineColor as a numeric triplet - OK

## Here a character vector is expected, not a character string
resfwdplot(out, datatooltip=list(LineColor=c("green")))         ## LineColor as a charater string - no error, but no effect
resfwdplot(out, datatooltip=list(LineColor=c("g")))             ## LineColor as a charater string - no error, but no effect

resfwdplot(out, datatooltip=list(SubsetLinesColor=c(0,1,0)))    ## SubsetLinesColor - seems not to work!!!

## Exceptions - none of these works ????
## 8. Example with HBK, optional parameters in the 'bground' structure
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

resfwdplot(out, bground=list(bthresh=c(0,2), bstyle="faint"))     ## bthresh OK
resfwdplot(out, bground=list(bthresh=2.5, bstyle="faint"))        ## bthresh OK
resfwdplot(out, bground=list(bthresh=2.5, bstyle="hide"))         ## bthresh OK
resfwdplot(out, bground=list(bthresh=2.5, bstyle="greysh"))       ## bthresh OK

## 9. Example with HBK, optional parameters in the 'fground' structure
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

resfwdplot(out, fground=list(fthresh=c(0,2)))                     ## fthresh OK
resfwdplot(out, fground=list(fthresh=c(2.5)))                     ## fthresh OK
resfwdplot(out, fground=list(flabstep=c(30, 50)))                 ## flabstep OK
resfwdplot(out, fground=list(LineWidth=2.5))                      ## LineWidth OK
resfwdplot(out, fground=list(Color=c("red", "green")))            ## Color - cell array !!!
resfwdplot(out, fground=list(LineStyle=c("--", "-.")))            ## LineStyle - cell array !!!
resfwdplot(out, fground=list(fmark=1))                            ## fmark OK
resfwdplot(out, fground=list(FontSize=20))                        ## FontSize OK

## 10. Example with HBK, different XXXeda functions
library(fsdaR)
out <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE)
resfwdplot(out)

## 11. Test with HBK, optional parameters in the 'standard' structure
library(fsdaR)
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)

resfwdplot(out, xlim=c(30,100), ylim=c(-10,10), main="My title", xlab="my X label", ylab="my Y label")
resfwdplot(out, lwd=2)
resfwdplot(out, lty=c("dashed", "dotted"), col=c("green", "red"))

## cex.axis works, but cex.lab - not
## To test it in Matlab use the following
##    n=100;
##    y=randn(n,1);
##    X=randn(n,4);
##    [out]=LXS(y,X,'nsamp',1000);
##    [out]=FSReda(y,X,out.bs);

##    standard=struct;
##    standard.SizeAxesLab = 24;
##    resfwdplot(out,'standard',standard)

resfwdplot(out, cex.lab=2, cex.axis=2)

## Alternatively, one can use the fllowing
resfwdplot(out, standard=list(SizeAxesNum=20))          ## cex.axis - OK
resfwdplot(out, standard=list(SizeAxesLab=20))          ## cex.lab  - no error, but has no effect

resfwdplot(out, lty=c("dotted", "dotdash"))     # OK
resfwdplot(out, lty=3)                          # workaround - only one elemenet    ????
resfwdplot(out, lty=c(3, 4, 5))                 # warning

## testing the fground options
resfwdplot(out, fg.thresh=1, fg.col="red", fg.lty=c("dotted", "dashed"), fg.lwd=2, fg.mark=TRUE)

## ---------------------------------------------------------------
## 12. Test with wool
data(wool)
names(wool)[1:3] <- paste0("X", 1:3)
names(wool)[4] <- "Y"
out <- fsreg(Y~., data=wool, method="FS", monitoring=TRUE)
resfwdplot(out)


## ---------------------------------------------------------------
library(fsdaR)
out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE)
mdrplot(out)
