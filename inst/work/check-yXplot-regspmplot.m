n=100;
p=3;
X=randn(n,p);
y=100+randn(n,1);

% case 0: y and X1, X2, ..., Xn will be displayed on the axis
yXplot(y,X, 'plo', 1);

% case 1: Nothing will be displayed on the axis
yXplot(y,X, 'plo', 0);

% case 2: Nothing will be displayed on the axis
yXplot(y,X, 'plo', []);

% case 3: Nothing will be displayed on the axis
yXplot(y,X, 'plo', 'anything else');

% case 4: Nothing will be displayed on the axis
yXplot(y,X);


%% Example 2: datatooltip ========================================
%
% yXplot when first input argument y is a structure. Ex1.
% In the following example the input is a strucure which also contains
% information about the forward search.

[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);
yXplot(out,'datatooltip',1);

%% Example 3: datatooltip ========================================
%
%   Example of the use of option datatooltip.
%   It gives the possibility of clicking on the different points and have
%   information about the unit selected, the step of entry into the
%   subset and the associated label
yXplot(out,'datatooltip',1);


%% Example 4: databrush ========================================
%
% Interactive_example
%   Example of the use of option databrush
%   (brushing is done only once using a rectangular selection tool).

[out]=LXS(y,X,'nsamp',1000);
[out]=FSReda(y,X,out.bs);

yXplot(out,'databrush',1);
