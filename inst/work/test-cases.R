library(fsdaR)

## 1. Exactly as in Matlab, no optional parameters
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out)
mdrplot(out)

## 2. OK:  Optional parameter 'nameX': string vector == Matlab Cell - OK
##  - we need here also the 'databrush' parameter - the names of the
##      variables will be visible only after we do the brushing.
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out, databrush=1, nameX=c('Var1', 'Var2', 'Var3', 'Var 4'));

## 3. ## Optional parameter label: string vector == matlab Cell array not yet supported !!!
## This does not work also in Matlab - seems to be a bug in the Matlab resfwdplot() function.
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out, datatooltip=1, label=c("Name 1", "Name 2", "Name 3"))


## 4. Optional parameter Color in the structure fground: string vector == matlab Cell array
##  !!! does not work if the list has only one element
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)

resfwdplot(out, fground=list(Color=c('r', 'g')))                 ## OK - Color - cell array
resfwdplot(out, fground=list(Color=c('r')))                      ## ERROR - only one element in the cell array
resfwdplot(out, fg.col=c("red", "green"))       ## OK - Color - cell array
resfwdplot(out, fg.col="red")                   ## OK - only one element in the cell array (workaround)

## 5. Optional parameter LineStyle in the structure fground: string vector == matlab Cell array
##  !!! does not work if the list has only one element
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out, fground=list(Color=c('r', 'm'), LineStyle=c(':', '--')))    ## OK - LineStyle - cell array
resfwdplot(out, fground=list(Color=c('r', 'm'), LineStyle=c(':')))          ## ERROR - only one element in the cell array
resfwdplot(out, fg.col=c("red", "magenta"), fg.lty=c('dotted', "dashed"))     ## OK - LineStyle - cell array
resfwdplot(out, fg.col=c("red", "magenta"), fg.lty=c('dotted'))               ## OK - only one element in the cell array (workaround!!!)


## 6. Optional parameters in the structure bground
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out, bground=list(bthresh=2, bstyle='hide'))
resfwdplot(out, bground=list(bthresh=2, bstyle='faint'))
resfwdplot(out, bground=list(bthresh=2, bstyle='greysh'))
resfwdplot(out, bg.thresh=2, bg.style='greysh')

## 6. Optional parameter datatooltips
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
resfwdplot(out, datatooltip="")                                                 # !!! ERROR - same in Matlab
resfwdplot(out, datatooltip=list(DisplayStyle="datatip"))                       # DisplayStyle
resfwdplot(out, datatooltip=list(DisplayStyle="window"))
resfwdplot(out, datatooltip=list(DisplayStyle="window", SnapToDataVertex="on")) # SnapToDataVertex on/off
resfwdplot(out, datatooltip=list(DisplayStyle="window", LineColor=c("green")))  # !!! Line Color works only as a RGB tree numbers in [0:1]
resfwdplot(out, datatooltip=list(DisplayStyle="window", LineColor=c(0,1,0)))    # !!! Line Color works only as a RGB tree numbers in [0:1]
resfwdplot(out, datatooltip=list(SubsetLinesColor=c(0,1,0)))                    # !!! ERROR


## 7. Test Sregeda() and MMregeda()
n <- 100
y <- rnorm(n)
X <- matrix(rnorm(n*4), nrow=n)

out <- fsreg(y~X, method="S", monitoring=TRUE, msg=TRUE)
resfwdplot(out)

out <- fsreg(y~X, method="MM", monitoring=TRUE)
resfwdplot(out)

##-------------------------------------------------------------
## Examples for mdrplot

## 1. Example of the use of function mdrplot with all the default options.
##  Steps common to all the examples
data(loyalty)
out <- fsreg(amount_spent~., data=loyalty, method="LTS")
## out <- fsreg(amount_spent~., data=loyalty, method="LTS", control=LXS_control(nsamp=1000))
out <- fsreg(amount_spent~., data=loyalty, method="FS", bsb=out$bs, monitoring=TRUE)
mdrplot(out)

## 2. Example of the use of function mdrplot with personalized envelopes.
mdrplot(out, quant=c(0.99, 0.9999))

## 3. datatooltip passed as scalar.
##  Example of the use of function mdrplot with datatooltip passed as
##  scalar (that is using default options for datacursor (i.e.

##DisplayStyle =window
mdrplot(out, datatooltip=1)

## 4. Datatooltip passed as structure.
mdrplot(out, datatooltip=list(SnapToDataVertex='on', DisplayStyle='datatip'))

## 5. Use of option sign.
##   Example of the information which can be extracted from option sign=1
##   (default). If the data come from a distribution which has positive
##   asymmetry generally the last part of the search is associated with
##   positive values of the minimum residual among the units belonging to
##   subset The example below shows that the last 60 steps of the curve are
##   associated with a black curve (positive value of mdr)

set.seed(137)
X <- matrix(rnorm(600), ncol=3)
y <- rchisq(200, 8)
out <- fsreg(y~X, method="LTS")
##out <- fsreg(y~x, method="LTS", control=LXS_control(nsamp=1000))
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
mdrplot(out, sign=1)

## 6. Example of the use of option envm.
##   In this case the resuperimposed envelope is based on n-2 observations
mdrplot(out, envm = length(out$y)-2)

## 7. Interactive_example
##    Input option databrush passed as scalar.
##    Example of the use of function mdrplot with databrush
mdrplot(out, databrush=1)

## 8. Interactive_example
##    Input option databrush passed as structure.
##    Example where databrush is a structure
mdrplot(out, databrush=list(selectionmode='Lasso'))

## 9. Interactive_example
##    Input option databrush passed as structure and brush mode.
##    Example of the use of brush using brush mode
mdrplot(out, databrush=list(selectionmode="Brush", Label="on"))

## 10. Interactive example: Persistent cumulative brush 1.
##     Every time a brushing action is performed previous
##     highlightments are removed
mdrplot(out, databrush=list(persist='off', RemoveLabels='off'))

## 11. Interactive_example: Persistent cumulative brush 2.
##     Every time a brushing action is performed current highlightments
##     are added to previous highlightments
mdrplot(out, databrush=list(persist='on', selectionmode='Rect'))

## 12. Examples for the optional arguments in mdrplot: xlab, xlim, etc
##
mdrplot(out, xlim=c(60, 160), ylim=c(2,3), xlab="My X-label", ylab="My Y-label", main="My title")
mdrplot(out, cex.axis=2, cex.lab=2)
mdrplot(out, lwd=2)
mdrplot(out, lwdenv=2)
mdrplot(out, tag="MyPlot")
mdrplot(out, namey="My response", nameX=c("V1", "V2", "V3"), databrush=1)
mdrplot(out, label=c("V1", "V2", "V3"))



##----------------------------------------------------------------
##
##  Examples with levfwdplot()
##

library(fsdaR)

## 1. Exactly as in Matlab, no optional parameters
n <- 200
y <- rnorm(n)
X <- matrix(rnorm(n*3), nrow=n)

out <- fsreg(y~X, method="LTS")
out <- fsreg(y~X, method="FS", bsb=out$bs, monitoring=TRUE)
levfwdplot(out)

## 2. Standard options (lty and lwd)
    levfwdplot(out, lty=c("dashed", "dotdash", "dotted"), lwd=0.5)

## 3. Foreground options
    ##    % Specify the steps in which labels have to be put
    ##    n=length(y);
    ##    fground.flabstep=[n/2 n*0.75 n+0.5];;

    levfwdplot(out, fg.unit=c(2, 5, 20, 23, 35, 45), fg.lwd=3)

## 4. More Foreground options
    ## Same as above, but the colormap used for leverage trajectories is
    ## based on residual values.
    levfwdplot(out, fg.unit=c(2, 5, 20, 23, 35, 45), fg.lwd=3, xground="res")

## 5. Background options
    ## Specify a threshold to define the "background" trajectories:    bg.thresh=0.1;
    ## Trajectories whose leverage is always between -btresh and +bthresh are shown as specified in bg.style

    levfwdplot(out, bg.thresh=0.1, bg.style="hide")

## 6. Datatooltip options
    ##   Gives the user the possibility of clicking on the different points
    ##   and have information about the unit selected, the step of entry
    ##   into the subset and the associated label.
    ##  - In this example the style of the datatooltip is 'datatip'. Click on a
    ##      trajectory when the levfwdplot is displayed.
    ##
    levfwdplot(out, datatooltip=list(DisplayStyle="datatip"))
    levfwdplot(out, datatooltip=list(DisplayStyle="window"))
