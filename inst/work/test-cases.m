% MATLAB examples for resfwdplot and mdrplot


%% 1. No optional parameters

n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
resfwdplot(out);
mdrplot(out)

%% 2. Optional parameter 'nameX' - cell array
n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
resfwdplot(out, 'databrush', 1, 'nameX',{'var1', 'var2', 'var3', 'var 4'});

%% 3. Optional parameter 'label'
% This does not work also in Matlab - seems to be a bug in the Matlab resfwdplot() function
%
n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
resfwdplot(out, 'datatooltip', 1, 'label', {'Name A', 'Name B', 'Name C'});

%% 4. Optional parameter Color in the structure fground
%
n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
fground = struct;
fground.Color = {'r'};
resfwdplot(out, 'fground', fground)

%% 5. Optional parameter Color in the structure fground
%
n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
fground = struct;
fground.Color = {'r'};
fground.LineStyle = {':', '--'}
resfwdplot(out, 'fground', fground)

%% 6. Optional parameter Color in the structure bground
%
n=100;
y=randn(n,1);
X=randn(n,4);
[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
bground = struct;
% Specify a threshold to define the "background" trajectories
bground.bthresh=2;
% Trajectories whose residual is always between -btresh and +bthresh
% are shown as specified in bground.bstyle
bground.bstyle='hide';
resfwdplot(out, 'bground', bground)

%%-------------------------------------------------------------
%% Examples for mdrplot

% 1. Example of the use of function mdrplot with all the default options.
%   Steps common to all the examples
load('loyalty.txt','loyalty');
y=loyalty(:,4);
X=loyalty(:,1:3);
[outLXS]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,outLXS.bs);
mdrplot(out);

% 2. Example of the use of function mdrplot with personalized envelopes.
mdrplot(out,'quant',[0.99;0.9999]);
    
% 3. datatooltip passed as scalar.
%Example of the use of function mdrplot with datatooltip passed as
%scalar (that is using default options for datacursor (i.e.
%DisplayStyle =window)
 mdrplot(out,'datatooltip',1);
         
% 4. Datatooltip passed as structure.
clear tooltip
tooltip.SnapToDataVertex='on'
tooltip.DisplayStyle='datatip'
mdrplot(out,'datatooltip',tooltip);         


% 5. Use of option sign.
%   Example of the information which can be extracted from option sign=1
%   (default). If the data come from a distribution which has positive
%   asymmetry generally the last part of the search is associated with
%   positive values of the minimum residual among the units belonging to
%   subset The example below shows that the last 60 steps of the curve are
%   associated with a black curve (positive value of mdr)

state = 137; state1=4567;
rand('state', state);
randn('state', state1);
X=randn(200,3);
y=chi2rnd(8,200,1);
[outLXS]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,outLXS.bs);
mdrplot(out,'sign',1);

% 6. Example of the use of option envm.
%    In this case the resuperimposed envelope is based on n-2 observations
mdrplot(out,'envm',length(out.y)-2);

% 7. Interactive_example
%    Input option databrush passed as scalar.
%    Example of the use of function mdrplot with databrush
mdrplot(out,'databrush',1);

% 8. Interactive_example
%    Input option databrush passed as structure.
%    Example where databrush is a structure
databrush=struct
databrush.selectionmode='Lasso'
mdrplot(out,'databrush',databrush)

% 9. Interactive_example
%    Input option databrush passed as structure and brush mode.
%    Example of the use of brush using brush mode
databrush=struct
databrush.selectionmode='Brush'
databrush.Label='on';
mdrplot(out,'databrush',databrush)

% 10. Interactive example: Persistent cumulative brush 1.
%     Every time a brushing action is performed previous 
%     highlightments are removed 
databrush=struct
databrush.persist='off'
databrush.RemoveLabels='off';
mdrplot(out,'databrush',databrush)

% 11. Interactive_example: Persistent cumulative brush 2.
%     Every time a brushing action is performed current highlightments 
%     are added to previous highlightments
databrush=struct
databrush.persist='on';
databrush.selectionmode='Rect'
mdrplot(out,'databrush',databrush)

%%--------------------------------------------------------------
%%
%%  Exmples for levfwdplot
%%
%% 1. No optional parameters
    % Produce monitoring leverage plot with all the default options.
    % Generate input structure for the levfwdplot
    n=200;
    p=3;
    randn('state', 123456);
    X=randn(n,p);
    % Uncontaminated data
    y=randn(n,1);
    % Contaminated data
    y(1:5)=y(1:5)+6;
    [out]=LXS(y,X,'nsamp',1000);
    [out]=FSReda(y,X,out.bs);
    levfwdplot(out);
    
%% 2. Standard options (lty and lwd)
    % Example of the use of some options inside structure standard.
    % Initialize structure standard
    % Specify the steps in which labels have to be put
    standard=struct;
    standard.LineStyle={'-';'-.';':'};
    % Specify the line width
    standard.LineWidth=0.5;
    levfwdplot(out,'standard',standard)
    
    
%% 3. Foreground options
    % Example of the use of some options inside structure fground.
    % Initialize structure fground
    fground = struct;
    % Specify which trajectories have to be highlighted
    fground.funit=[2 5 20 23 35 45];
    % Specify the steps in which labels have to be put
    n=length(y);
    fground.flabstep=[n/2 n*0.75 n+0.5];;
    % Specify the line width of the highlighted trajectories
    fground.LineWidth=3;
    % Produce a monitoring residuals plot in which labels are put for units
    % [2 5 20 23 35 45] in steps [n/2 n*0.75 n+0.5] of the search
    levfwdplot(out,'fground',fground)    

%% 4. More Foreground options
    % Same as above, but the colormap used for leverage trajectories is
    % based on residual values.
    levfwdplot(out,'fground',fground,'xground','res')

%% 5. Background options
   % Example of the use of some options inside structure bground
    bground = struct;
    % Specify a threshold to define the "background" trajectories
    bground.bthresh=0.1;
    % Trajectories whose leverage is always between -btresh and +bthresh
    % are shown as specified in bground.bstyle
    bground.bstyle='hide';
    levfwdplot(out,'bground',bground)

%% 6. Datatooltip options
    %   Example of the use of option datatooltip.
    %   Gives the user the possibility of clicking on the different points
    %   and have information about the unit selected, the step of entry
    %   into the subset and the associated label. 
    datatooltip = struct;
    % In this example the style of the datatooltip is 'datatip'. Click on a
    % trajectory when the levfwdplot is displayed.
    datatooltip.DisplayStyle = 'datatip';
    levfwdplot(out,'datatooltip',datatooltip);
    % Now we use the default style, which is 'window'.
    datatooltip.DisplayStyle = 'window';
    levfwdplot(out,'datatooltip',datatooltip);


%% 7. Databrush: once, with rectangular brush
    %   Example of the use of option databrush
    %   (brushing is done only once using a rectangular selection tool)
    levfwdplot(out,'databrush',1)
    %   An equivalent statement is
    databrush=struct;
    databrush.selectionmode='Rect';
    levfwdplot(out,'databrush',databrush);

%% 8. Databrush: once, with circular tool
    % Example of the use of brush using selection with circular tool
    databrush=struct;
    databrush.selectionmode='Brush';
    levfwdplot(out,'databrush',databrush)

%% 9. Databrush: once, with lasso selection and fleur pointer
    %   Example of the use of brush using lasso selection tool and fleur
    %   pointer
    databrush=struct;
    databrush.selectionmode='lasso';
    databrush.Pointer='fleur';
    levfwdplot(out,'databrush',databrush)
    
%% 10. Databrush: once, with rectangular brush and superimposed labels
    %   Example of the use of rectangular brush with superimposed labels
    %   for the brushed units and persistent labels in the plot which has
    %   been brushed
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    levfwdplot(out,'databrush',databrush)    

%% 11. Databrush: persistant, non-cumulative brush
%
%   All previuos examples used a non persistent brushing (that is brushing
%   could be done only once). The examples below use persistent brushing
%   (that is brushing can be done multiple times)
%
    %   Example of the use of persistent non cumulative brush. Every time a
    %   brushing action is performed previous highlightments are removed
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='off';
    levfwdplot(out,'databrush',databrush)
    
%% 12. Databrush: persistant, cumulative brush
    %   Example of the use of persistent cumulative brush. Every time a
    %   brushing action is performed current highlightments are added to
    %   previous highlightments
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='on';
    databrush.persist='on';
    levfwdplot(out,'databrush',databrush)    

%% 13. Databrush: persistant, cumulative brush fitting one OLS line to each group
    %   The same as before, but also fit one ols line to each selected group
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='on';
    databrush.persist='on';
    databrush.bivarfit='0';
    levfwdplot(out,'databrush',databrush)

%% 14. Databrush: persistant, cumulative brush fitting one OLS line to all data
    %   The same but now fit a single ols line to all data.
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='on';
    databrush.bivarfit='1';
    levfwdplot(out,'databrush',databrush)

%% 14. Databrush: persistant, cumulative brush: first OLS line to all data 
%%      and a second on the group of observations that remain unselected.
    %   The same but now fit a first ols line to all data and a second line
    %   on the group of observations which remain unselected.
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='on';
    databrush.bivarfit='2';
    levfwdplot(out,'databrush',databrush)

%{
    % Interactive_example
    %   The same but now fit a single ols line to the group with index 4.
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='on';
    databrush.bivarfit='i4';
    levfwdplot(out,'databrush',databrush)
%}
%
%{
    % Interactive_example
    %   The same but now add the line mean(y)+Ci*Xi.
    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='on';
    databrush.multivarfit='1';
    levfwdplot(out,'databrush',databrush)
%}
%
%{
    % Interactive_example
    % Example of use of option databrush suboptions multivarfit 2, persist on.
    load('multiple_regression.txt');
    y=multiple_regression(:,4);
    X=multiple_regression(:,1:3);
    [out]=LXS(y,X,'nsamp',10000);
    [out]=FSReda(y,X,out.bs);
    out1=out;
    out1.RES=out.RES.^2;
    mdrplot(out,'ylimy',[1 5]);

    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='off';
    databrush.persist='on';
    databrush.multivarfit='2';
    levfwdplot(out,'databrush',databrush)
%}
%
%{
    % Interactive_example
    % Fidelity cards data 1.
    XX=load('loyalty.txt');
    namey='Sales'
    y=XX(:,end);
    y=y.^0.4;
    nameX={'Number of visits', 'Age', 'Number of persons in the family'};

    X=XX(:,1:end-1);
    [out]=LXS(y,X,'nsamp',10000);
    [out]=FSReda(y,X,out.bs);
    mdrplot(out,'ylimy',[1.6 4.5],'xlimx',[420 510],'lwd',2,'FontSize',16,'SizeAxesNum',16,'lwdenv',2);
    mdrplot(out,'ylimy',[1.6 4.5],'envm',489,'xlimx',[420 510],'lwd',2,'FontSize',16,'SizeAxesNum',16,'lwdenv',2);

    databrush=struct;
    databrush.selectionmode='Rect';
    databrush.Label='on';
    databrush.RemoveLabels='on';
    databrush.persist='on';
    databrush.multivarfit='2';
    levfwdplot(out,'databrush',databrush)
%}
%
%{
    % Fidelity cards data 2.
    XX=load('loyalty.txt');
    namey='Sales'
    y=XX(:,end);
    y=y.^0.4;
    X=XX(:,1:end-1);
    [out]=LXS(y,X,'nsamp',10000);
    [out]=FSReda(y,X,out.bs);
    plotopt=levfwdplot(out,'msg',2)
    % In order to reuse the options which have been stored inside plotopt
    % use the following sintax
    % levfwdplot(out,plotopt{:})
%}


%
%   REMARK: note that at present options.databrush and options.datatooltip
%   cannot be used at the same time. These options will be replaced by a
%   single option (options.interact) in future versions of the toolbox.
%
