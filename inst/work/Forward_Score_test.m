%%%
%%% http://rosa.unipr.it/FSDA/guide.html
%%%

%Example 1: original poison data

load('poison.txt');
y=poison(:,end);
X=poison(:,1:6);

clc
seed=10;
rng(seed)

[out0]=FSRfan(y,X,'plots',0,'intercept',0);

out0.bs

bsb = [5, 4, 4, 4, 7;
       9, 16, 7, 7, 11;
      13, 26, 16, 16, 16;
      17, 32, 26, 26, 23;
      29, 33, 36, 36, 33;
      45, 40, 48, 48, 48]


[out]=FSRfan(y,X,'lms', bsb, 'plots',1,'intercept',0,'ylimy',[-14 3]);

Unsel=cell2mat(out.Un);
lla=length(out.la);
nr=size(Unsel,1)/lla;
Un=[Unsel(1:nr,1) reshape(Unsel(:,2),nr,lla)];
