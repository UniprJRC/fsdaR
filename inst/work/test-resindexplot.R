######
##
##  The function 'resindexplot' plots the residuals from a regression analysis
##  versus index number or any other variable. The residuals come from an output
##  object of any of the regression fucntions or a simply a vector of values.
##  In order to use the databrush option, the residuals must come from one of
##  the fsdaR regression functions.
##
##  Test the following parameters:
##      1. xlab, ylab, main, numlab, indlab,
##      2. col, cex, lwd, cex.axis, cex.lab
##      3. conflev, xlim, ylim
##      4. nameX, namey, databrush
##      5. x
##      ?? tag


##detach(name="package:fsdaR", unload=TRUE)


library(fsdaR)
a <- as.double(1:10)
names(a) <- 1:10
resindexplot(a)
resindexplot(rnorm(100))

data(stackloss)
stats <- lm(stack.loss~., data=stackloss)
conflev=c(0.95,0.99)

##  1. Test xlab, ylab, main, numlab and indlab -----------------------------------------------------------------------
## default obs. labels (the five max)
resindexplot(stats$residuals)
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", main="My test residual plot")

## no obs. labels
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=0)
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=NULL)
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab="")

## number of obs. labels specified (the max): length(numlab) == 1
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=3)

## indexes of obs. labels specified: through numlab, length(numlab) > 1
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=c(3, 5))

## indexes of obs. labels specified: through indlab
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", indlab=c(3, 5))

## both number and indexes of obs. labels specified: warning
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=3, indlab=1)

## Error: index cannot be negative
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", indlab=c(-3, 5))
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", numlab=c(-3))

## 2. Test size and color of symbols, font size of labels and numbers on the axis
##  - MATLAB BUG: The font size of the numbers on the axis cannot be changed!

resindexplot(stats$residuals, cex=2)                # large symbols, no fill color
resindexplot(stats$residuals, cex=2, col="none")    # no fill color
resindexplot(stats$residuals, cex=2, col="auto")    # auto select color (seems not to work in MATLAB)
resindexplot(stats$residuals, cex=2, col=c(0,0.4470, 0.7410))    #RGB triplet
resindexplot(stats$residuals, cex=2, col="red")
resindexplot(stats$residuals, lwd=3)
resindexplot(stats$residuals, lwd=0)
resindexplot(stats$residuals, lwd=-1)
resindexplot(stats$residuals, conflev=conflev, xlab="Index number", ylab="Deletion residuals", cex.lab=2)
resindexplot(stats$residuals, conflev=conflev, cex.axis=2)      ## does not work

##  This is a MATLAB example
##    load('stack_loss.txt');
##    y=stack_loss(:,4);
##    X=stack_loss(:,1:3);
##    conflev=[0.95,0.99];
##    % Compute studentized residuals (deletion residuals)
##    stats=regstats(y,X,'linear',{'standres','studres'});
##    resindexplot(stats.studres,'labx','Index number','laby','Deletion residuals', 'FontSize',32, 'SizeAxesNum',32);

## 3. Test confidence level, xlim and ylim
conflev=c(0.95,0.99)
resindexplot(stats$residuals, conflev=conflev)
resindexplot(stats$residuals, conflev=conflev, xlim=c(0,10), ylim=c(-10,10))

## 4. Test databrush, nameX and namey
out <- fsreg(stack.loss~., data=stackloss)
resindexplot(out)                       # default, no brushing
resindexplot(out, databrush="")         # as the default: databrush is empty
resindexplot(out, databrush=FALSE)      # as the default: databrush is FALSE=empty
resindexplot(out, databrush=TRUE)       # databrush is a scalar (TRUE or 1)
resindexplot(out, databrush=1)          # databrush is a scalar (TRUE or 1)
resindexplot(out, databrush=1, namey="My response", nameX=c("V1", "V2", "V3"))  # set namey and nameX

resindexplot(rnorm(100), databrush=1)   # ERROR: for databrush the input structure must contain y and X

resindexplot(out, databrush=list(persist=""))    # persist is empty - only once
resindexplot(out, databrush=list(persist="on"))  # persist is 'on' - multiple times, add the units to the previous
resindexplot(out, databrush=list(persist="off")) # persist is 'off' - multiple times, remove the previous units

## Parameter 'labeladd' - I d o not understand this one
resindexplot(out, databrush=list(labeladd="1"))             # the defailt
resindexplot(out, databrush=list(labeladd=c("1", "2")))     # ERROR

## Parameter 'bivarfit' and ''ultivarfit'
resindexplot(out, databrush=list(bivarfit=""))                  # ERROR: this is the default, no bivarfit line
resindexplot(out, databrush=list(bivarfit="1"))                 # One OLS line to all units
resindexplot(out, databrush=list(bivarfit="2"))                 # Two OLS lines: one to all points and one to the last selected group
resindexplot(out, databrush=list(persist="on", bivarfit="0"))   # One OLS line for each selected group

resindexplot(out, databrush=list(multivarfit=""))                 # No OLS line is fitted
resindexplot(out, databrush=list(persist="on", multivarfit="1"))  # One OLS line based on MULTIVARIATE REGRESSION for each selected group
resindexplot(out, databrush=list(persist="on", multivarfit="2"))  # Two OLS lines based on MULTIVARIATE REGRESSION for each selected group: one to all points and one to the last selected group
resindexplot(out, databrush=list(persist="on", multivarfit="0"))  #T No OLS line

## All options of the MATLAB function selectdataFS(), which is extension of selectdata():
##      https://www.mathworks.com/matlabcentral/fileexchange/13857-graphical-data-selection-tool?focused=5087787&tab=function
## Test some of these options
resindexplot(out, databrush=list(BrushShape="rect"))        # BrushShape=c("circle", "rect"), default is "circle"
resindexplot(out, databrush=list(SelectionMode="Lasso"))    # SelectionMode= c('Lasso', 'Brush', 'Rect', 'Closest'), default is "Lasso"
resindexplot(out, databrush=list(SelectionMode="Rect"))     # SelectionMode= c('Lasso', 'Brush', 'Rect', 'Closest'), default is "Lasso"


## 5. Test x (a vector for the X axis)
out <- fsreg(stack.loss~., data=stackloss)
resindexplot(out)
resindexplot(out, x=1:100)      # ERROR, two vectors must be same length
resindexplot(out, x=1:21)       # this is the default
resindexplot(out, x=(1:21)+5)   # Shift the X axis (does not make sense)
