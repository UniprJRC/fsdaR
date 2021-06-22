clearvars;close all;
load('hawkins.txt');
y=hawkins(:,9);
X=hawkins(:,1:8);

% requies p+1 starting points
FSR(y,X,'lms',[1,2,3,4,5,6,7,8,9], 'plots', 0);
  
% simple regression, no intercept - requires one starting point
X=hawkins(:,8);
FSR(y,X,'lms',struct('bsb',3), 'intercept', 0, 'plots', 0);
 