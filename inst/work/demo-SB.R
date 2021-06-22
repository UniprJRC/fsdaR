library(fsdaR)

## Swiss banknotes data: Six variables measured on 100 genuine and 100
##  counterfeit old (printed before the second world war) Swiss 1000-franc
##  bank notes (Flury and Riedwyl, 1988).
##

##  Load the data and take the first 6 variables (the last one is the grouping variable)
data(swissbanknotes)
Y <- swissbanknotes[, 1:6]

## EX 1: Scatterplot matrix of the two groups (using package rrcov)
library(rrcov)
group <- swissbanknotes$class + 1
plot(CovMcd(Y), which="pairs", col=group)

##----------------------------------------------------------------
## EX 2: fsmult() with its print(), plot()  and summary() functions
out <- fsmult(Y)
out
summary(out)
fsmult(Y, plot=TRUE)
fsmult(Y, plot=2)

## Close all graphical windows now!

##---------------------------------------------------------------
## EX 3: Forward EDA with minimum Mahalanobis distance: mmdplot()
out <- fsmult(Y, bsb=0, monitoring=TRUE, init=30)
mmdplot(out, mplus1=TRUE)

##  Example with datatooltip
mmdplot(out, mplus1=TRUE, datatooltip=TRUE)

## Use (default) brushing with a rectangular tool
mmdplot(out, databrush=TRUE)


##----------------------------------------------------------------
## EX 4: Example with malfwdplot: Plots the trajectories of scaled
##  Mahalanobis distances along the search
##  - malfwdplot() can be called after fsmult, smult or mmmult,
##      with monitoring option (monitoring=TRUE)
##
## Control the characteristics of the units in foreground in the malfwdplot():
##
## Labels will be included for the units specified in gf.unit (these are the units entering the last
## six steps of the search)
##      fg.unit=c(1, 13, 40, 70, 71, 5)
##
## Change the font size of the Labels
##      fg.cex=14
##
## The Labels will be put by default at the beginning - change this behaviour by setting e.g.
##  fg.labstep=70
##
malfwdplot(out, xlim=c(28, 100), fg.unit=c(1, 13, 40, 70, 71, 5), fg.cex=1.5, fg.labstep=70)

##----------------------------------------------------------------
## EX 5: Interactive example: brushing using a rectangular selection tool and cyan color
malfwdplot(out, databrush=list(selectionmode='Brush', FlagColor='c'))

## Ex 5a: Interactive example: persistant noncumulative plot
##  Labels are added for the brushed units. Persistent labels
##      appear in the plot which has been brushed
malfwdplot(out, databrush=list(selectionmode='Rect', persist='off',
        Label='on', RemoveLabels='off'))

## EX 6: Using malfwdplot() with S estimates
outS <- smult(Y, monitoring=TRUE)
malfwdplot(outS, conflev=0.99, trace=TRUE)

## EX 7: Using malfwdplot() with MM estimates
outMM <- mmmult(Y, monitoring=TRUE)
malfwdplot(outMM, conflev=0.99, trace=TRUE)

##================================================================
