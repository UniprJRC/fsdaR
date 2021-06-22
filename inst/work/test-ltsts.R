library(fsdaR)

##  Simulated data with linear trend and level shift.
##  No seasonal component.
    set.seed(1234)
    n <- 45
    a <- 1
    b <- 0.8
    sig <- 1
    seq <- 1:n
    y <- a + b * seq + sig * rnorm(n)

    ## Add a level shift in the simulated series
    y[round(n/2):n] <- y[round(n/2):n] + 10

    ## model with a linear trend, non seasonal and level shift
##    model =struct;
##    model.trend=1;
##    model.seasonal=0;

    ## Potential level shift position is investigated in positions:
    ## t=10, t=11, ..., t=T-10.
##    model.lshift=10;

    out <- ltsts(y, plot=TRUE, trace=TRUE)

    ## Using the notation of the paper RPRH: A=1, B=1, G=0 and $\delta_1>0$.
##    str=strcat('A=1, B=0, G=0, $\delta_2=',num2str(out.posLS),'$');
##    title(findobj(gcf,'-regexp','Tag','LTSts:ts'),str,'interpreter','latex');


## Test simulate_ts ==============================================
##
library(fsdaR)

##  Simulated time series with linear trend.
##  A time series of 100 observations is simulated from a model which
##  contains a linear trend (with slope 1 and intercept 0), no seasonal
##  component, no explanatory variables and a signal to noise ratio egual to 20

out <- simulate_ts(100, plot=TRUE)
out1 <- ltsts(out$y, plot=TRUE, trace=TRUE)
