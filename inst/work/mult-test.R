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
group <- swissbanknotes$class
plot(CovClassic(Y), which="pairs", col=group)

##----------------------------------------------------------------
## EX 2: fsmult() with its print(), plot()  and summary() functions
out <- fsmult(Y)
out
summary(out)

## Plot of (1) Envelopes based on all observations and (2) Scatterplot matrix with outliers higlighted
fsmult(Y, plot=TRUE)

## Plot as above, but additionally resuperimposed envelopes
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
## Labels will be included for the units specified in fg.unit (these are the units entering the last
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

## Ex 5a: Interactive example: persistent noncumulative plot
##  Labels are added for the brushed units. Persistent labels
##      appear in the plot which has been brushed
malfwdplot(out, databrush=list(selectionmode='Rect', persist='off',
        Label='on', RemoveLabels='off'))

## EX 6: Using malfwdplot() with MM estimates
outMM <- mmmult(Y, monitoring=TRUE)
malfwdplot(outMM, conflev=0.99, trace=TRUE)

##================================================================

    ##  Example with datatooltip
    mmdplot(out, mplus1=TRUE, datatooltip=TRUE)

    ##  Example with datatooltip passed as a list
    mmdplot(out, mplus1=TRUE, datatooltip=list(SnapToDataVertex='on', DisplayStyle='datatip'))

    ## Example using option envm: In this case the resuperimposed envelope is based on n-2 observations
    mmdplot(out, envm=nrow(Y)-2)

    ## Example test different graphical parameters: lwd, lwdenv, xlab, ylab
    mmdplot(out, lwd=4, lwdenv=0.1, xlab="My X-label", ylab="My Y-label", main="My title")

    ## Example of the use mmdplot with databrush=TRUE
    mmdplot(out, databrush=TRUE, trace=TRUE)

    ## Should nameX work here?
    mmdplot(out, databrush=TRUE, nameX=paste0(1:ncol(Y), "Var"), trace=TRUE)

    ## Example of databrush passed as a list of options
    mmdplot(out, databrush=list(selectionmode='Lasso'))

    ## Example of databrush passed as a list of options, with brush mode
    mmdplot(out, databrush=list(selectionmode='Brush', Label='on'))

    ## Should label work here?
    mmdplot(out, databrush=list(selectionmode='Brush', Label='on'), label=paste0("Row", 1:nrow(Y)))

    ## Example of persistant non-cumulative brush. Every time a brushing action is performed previous highlightments are removed
    mmdplot(out, databrush=list(persist='off', Label='on', RemoveLabels='off'))

    ## Example of persistant cumulative brush. Every time a brushing action is performed previous highlightments are removed
    mmdplot(out, databrush=list(persist='on', selectionmode='Rect'))

##---------------------------------------------------------------
##
## SB: Forward EDA with malfwdplot()
##
##  Create figure 3.28 p.117 of ARC 2004
##
data(swissbanknotes)
Y <- swissbanknotes[, 1:6]       # take the first 6 variables

## Find an initial subset using unibiv()
## [fre]=unibiv(Y);
## fre=sortrows(fre,[3 4]);
## bs=fre(1:size(Y,2)+5,1);

out <- fsmult(Y, bsb=0, monitoring=TRUE, init=30, scaled=TRUE)
malfwdplot(out,fg.labstep='')


##---------------------------------------------------------------
##
##  SB: Forward EDA gapplot
##  Create figure 3.29 p.117 of ARC 2004

data(swissbanknotes)
Y <- swissbanknotes[, 1:6]       # take the first 6 variables

## Find an initial subset using unibiv()
## [fre]=unibiv(Y);
## fre=sortrows(fre,[3 4]);
## bs=fre(1:size(Y,2)+5,1);

out <- fsmult(Y, bsb=0, monitoring=TRUE, init=30)

##  gap=out.gap;
##  plot1=plot(gap(:,1),gap(:,2:end),'k','LineWidth',2);
##  set(plot1(1),'LineStyle',':')
##  h=legend('min outside - max inside','(m+1)th ordered MD - mth ordered MD','Location','NorthWest');
##  set(h,'FontSize',14);

##----------------------------------------------------------------
## SB (genuine notes): brushing from mmdplot
##  Interactive_example

data(swissbanknotes)
Y <- swissbanknotes[, 1:6]      # take the first 6 variables
Y <- Y[1:100,]                  # take the genuine notes
n <- nrow(Y)
p <- ncol(Y)
conflev <- c(0.95, 0.99, 1-0.01/n)

##[fre]=unibiv(Y);
##fre=sortrows(fre,[3 4]);
##bs=fre(1:size(Y,2)+5,1);

out <- fsmult(Y, bsb=0, monitoring=TRUE, init=30, scaled=FALSE)
mmdplot(out, databrush=list(labeladd=1, Label='on', RemoveLabels='off', BrushShape='rect'))

## Control the characteristics of the units in foreground in the resfwdplot
fground=struct;
## Labels will be included for units (these are the units entering the last
## six steps of the search
fground.funit=[1 13 40 70 71 5];
## FontSize of the Labels
fground.FontSize=14;
## The Labels will be put when m=30
fground.flabstep=30;
standard.xlim=[28 100];

malfwdplot(out, standard=list(xlim=c(28, 100)), fground=list(fuint=c(1, 13, 40, 70, 71, 5)))

##----------------------------------------------------------------

## SB:  analysis using S and MM estimators
data(swissbanknotes)
Y <- swissbanknotes[, 1:6]       # take the first 6 variables
n <- nrow(Y)
p <- ncol(Y)
conflev <- c(0.95, 0.99, 1-0.01/n)

outS <- smult(Y)
malindexplot(outS, p, conflev=conflev, laby="S-estimates")

outMM <- mmmult(Y)
malindexplot(outMM, conflev=conflev, laby="MM-estimates")


    outS <- smult(Y, plot=TRUE)
    outS <- smult(Y, plot=list(nameY=paste0("Var", 1:ncol(Y))))

##----------------------------------------------------------------------
library(fsdaR)

## SB: (Swiss banknotes) Forward EDA minMD
data(swissbanknotes)
Y <- swissbanknotes[, 1:6]       # take the first 6 variables

Y <- Y[1:100,]                  # take the genuine notes
n <- nrow(Y)
p <- ncol(Y)
conflev <- c(0.95, 0.99, 1-0.01/n)

##[fre]=unibiv(Y);
##fre=sortrows(fre,[3 4]);
##bs=fre(1:size(Y,2)+5,1);

out <- fsmult(Y, bsb=0, monitoring=TRUE, init=30, scaled=FALSE)

## Control the characteristics of the units in foreground in the malfwdplot():
##
## Labels will be included for the units specified in gf.unit (these are the units entering the last
## six steps of the search)
##      fg.unit=c(1, 13, 40, 70, 71, 5)
##
## Change the font size of the Labels
##      fg.cex=14;
##
## The Labels will be put by default at the beginning - change this behaviour by setting e.g.
##  fg.labstep=70;
##
malfwdplot(out, xlim=c(28, 100), fg.unit=c(1, 13, 40, 70, 71, 5), fg.cex=1.5, fg.labstep=70)

## Interactive example 1: by setting databrush=TRUE, brushing is done only once using
##  a rectangular selection tool)
malfwdplot(out, databrush=TRUE)


## Interactive example: brushing using a rectangular selection tool and cyan color
malfwdplot(out, databrush=list(selectionmode='Brush', FlagColor='c'))

## Interactive example: brushing using a rectangular selection tool.
##  Every time a brushing action is performed previous highlightments are removed
malfwdplot(out, databrush=list(selectionmode='Rect', Label='on', RemoveLabels='off'), trace=TRUE)

## Interactive example: persistant noncumulative plot
##  Labels are added for the brushed units. Persistent labels appear in the plot which has been brushed
malfwdplot(out, databrush=list(selectionmode='Rect', persist='off', Label='on', RemoveLabels='off'))


## Using malfwdplot() with MM estimates
outMM <- mmmult(Y, monitoring=TRUE)
malfwdplot(outMM, conflev=0.99, trace=TRUE)
