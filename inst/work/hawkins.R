library(fsdaR)

##  Example of use of options xlim and ylim (Hawkins data).
    data(hawkins)

##  Use of FSR starting with 1000 subsamples

    out <- fsreg(y~., data=hawkins, control=FSR_control(nsamp=1000, plot=TRUE))

##  Use of FSR starting with 1000 subsamples
##  focusing in the output plots to the interval 1-6 on the y axis and
##  to steps 30-90.

    out <- fsreg(y~., data=hawkins, control=FSR_control(nsamp=1000, plot=TRUE, ylim=c(1,6), xlim=c(30, 90), labeladd=TRUE), trace=TRUE)


##    % Example of use of options xlim and ylim (Hawkins data).
##    load('hawkins.txt','hawkins');
##    y=hawkins(:,9);
##    X=hawkins(:,1:8);
##    % Use of FSR starting with 1000 subsamples
##    [out]=FSR(y,X,'nsamp',1000);
##    % Use of FSR starting with 1000 subsamples
##    % focusing in the output plots to the interval 1-6 on the y axis and
##    % to steps 30-90.
##    [out]=FSR(y,X,'nsamp',1000,'ylim',[1 6],'xlim',[30 90], 'labeladd', 1);
