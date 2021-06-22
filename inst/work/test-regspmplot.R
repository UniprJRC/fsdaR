library(fsdaR)

##  Example of the use of function regspmplot with all the default options
##  regsmplot() with first argument vector y and no option.
##  In the first example as input there are two matrices: y and X respectively
##  A simple plot is created

n <- 100
p <- 3
X <- matrix(data=rnorm(n*p), nrow=n, ncol=p)
y <- matrix(data=100 + rnorm(n*1), nrow=n, ncol=1)
regspmplot(y, X)

##  Example of the use of function regspmplot with first argument
##  vector y and third argument group.
##  Different groups are shown in the yXplot

group <- rep(0, n)
group[1:(n/2)] <- rep(1, n/2)
regspmplot(y, X, group)

##  Example of the use of function regspmplot with first argument
##  vector y, third argument group and fourth argument plot
##  (Ex1) plot=TRUE
regspmplot(y, X, group, plot=TRUE)

##  Call regspmplot() with first input argument a vector: Example of use of option selunit.
##  Example of the use of function regspmplot putting the text for the units
##  which have a value of y smaller than 98 and greater than 102.
regspmplot(y, X, selunit=c('98', '102'))

##  Call regspmplot() with first input argument a vector: Example of use of option selunit.
##  Example of the use of function yXplot putting the text for the units
##  which have a value of y smaller than 1% percentile and greater than 99% percentile of y
regspmplot(y, X, selunit=as.character(quantile(y, c(.01, .99))))

##  Example with the first input argument an S3 object.
##  In the following example the input is an object which also contains
##  information about the forward search.
(out1 <- fsreg(y~X, method="LMS", control=LXS_control(nsamp=1000)))
(out <- fsreg(y~X, bsb=out1$bs, monitoring=TRUE))
regspmplot(out, plot=0)

regspmplot(out, selunit=c(2, 5, 20, 23, 35, 45))

## This will work only with databrush, see the MATLAB code below.
regspmplot(out, selstep=c(20, 22, 27, 36))

    % Interactive_example
    %   Example of the use of options selunit and selstep.
    yXplot(out,'selunit',[2 5 20 23 35 45],'selstep',[20 22 27 36],...
            'databrush',{'persist','off','selectionmode' 'Rect'})
    %   produces a resfwdplot in which labels are put for units
    %   [2 5 20 23 35 45] in steps [20 22 27 36] of the search

    % Interactive_example
    %   Example of the use of options selstep, selunit, selunitbold and
    %   selunitcolor.
    %   It produces a yXplot plot in which labels are put for units
    %   which have a residual greater and 1.5. When a set of units is brushed in the yXplot
    %   in the monitoring residuals plot the labels are added in steps
    %   selsteps.
   yXplot(out,'selstep',[40 21 80],'selunit','1.5',...
           'databrush',{'persist','off','selectionmode' 'Rect'})

    % Interactive_example
    %   Example of the use of option selunit (notice that in this
    %   case selunit is a cell array of strings.
    %   Highlight only the trajectories which in at least one step of the
    %   search had a value smaller than -3 or greater than 2 and label
    %   them at the beginning and at the end of the search.
    yXplot(out,'selunit',{'-3';'2'},...
            'databrush',{'selectionmode' 'Rect'});

##  Interactive_example
##  Example of the use of option databrush
##  (brushing is done only once using a rectangular selection tool).
regspmplot(out, databrush=TRUE)

##  An equivalent statement is
regspmplot(out, databrush=list(selectionmode="Rect"))

    % Interactive_example
    %   Example of the use of brush using a rectangular selection tool and
    %   a cyan colour.
   yXplot(out,'databrush',{'selectionmode' 'Rect' 'FlagColor' 'c'})

    % Interactive_example
    %  Example of the use of brush using multiple selection circular tools.
    yXplot(out,'databrush',{'selectionmode' 'Brush'})

    % Interactive_example
    %   Example of the use of brush using lasso selection tool and fleur pointer.
    yXplot(out,'databrush',{'selectionmode' 'lasso','Pointer','fleur'})

    % Interactive_example
    %   Example of the use of rectangular brush. Superimposed labels for
    %   the brushed units and persistent labels in the plot which has been
    %   brushed
    yXplot(out,'databrush',{'selectionmode' 'Rect' 'Label' 'on' 'RemoveLabels' 'off'})

    % Interactive_example
    % Example of persistent cumulative brushing (with persist off).
    %   All previous examples used a non persistent brushing (that is brushing
    %   could be done only once). The examples below use persistent brushing
    %   (that is brushing can be done multiple times)
    %
    %   Example of the use of persistent non cumulative brush. Every time a
    %   brushing action is performed previous highlightments are removed
    %   Every time a brushing action is performed
    %   current highlightments replace previous highlightments
    yXplot(out,'databrush',{'selectionmode','Rect','persist' 'off' ...
                            'Label' 'on' 'RemoveLabels' 'off'})

    % Interactive_example
    % Example of persistent cumulative brushing (with persist on).
    %   Every time a brushing action is performed
    %   current highlightments are added to previous highlightments
    yXplot(out,'databrush',{'selectionmode','Rect','persist' 'on' ...
                            'Label' 'off' 'RemoveLabels' 'on'})

   % Interactive_example
    % Example of persistent cumulative brushing (with persist on and labeladd '1').
    %   Now option labeladd '1'. In this case the row numbers of the
    %   selected units is displayed in the monitoring residuals plot
    yXplot(out,'databrush',{'selectionmode','Rect','persist' 'on' ...
                            'labeladd' '1'})

##  Example of the use of option datatooltip.
##  It gives the possibility of clicking on the different points and have
##  information about the unit selected, the step of entry into the
##  subset and the associated label
regspmplot(out, datatooltip=TRUE)

    % Option datatooltip combined with rownames
    % Example of use of option datatooltip.
    % First input argument of yXplot is a structure.
    load carsmall
    x1 = Weight;
    x2 = Horsepower;    % Contains NaN data
    X=[x1 x2];
    y = MPG;    % Contaminated data
    boo=~isnan(y);
    y=y(boo,:);
    X=X(boo,:);
    Model=Model(boo,:);
    [out]=LXS(y,X,'nsamp',1000);
    [out]=FSReda(y,X,out.bs);
    % field label (rownames) is added to structure out
    % In this case datatooltip will display the rowname and not the default
    % string row...
    out.label=cellstr(Model);
    yXplot(out,'datatooltip',1)
