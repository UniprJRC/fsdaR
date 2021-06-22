library(fsdaR)

##  Stars data from 'robustbase'
data(starsCYG)
head(starsCYG)

## Compute OLS, MM and LTS regression using robustbase and draw
##  a scatterplot with the three lines
##
(stars.lm <- lm(log.light~log.Te, data=starsCYG))
(stars.mm <- lmrob(log.light~log.Te, data=starsCYG))
(stars.lts <- ltsReg(log.light~log.Te, data=starsCYG))

## Plot the data with OLS, LTS and MM regression lines
plot(log.light~log.Te, data=starsCYG)
abline(stars.lm, col="blue", lty="solid")
abline(stars.mm, col="red", lty="dashed")
abline(stars.lts, col="green", lty="dashed")
legend("topright", leg=c("MM-est", "OLS", "LTS"), lty=c("dashed", "solid", "dashed"), col=c("red", "blue", "green"))

## LTS-estimation
out <- fsreg(log.light~log.Te, data=starsCYG, method="LTS")
print(out)
summary(out)

## S-estimation monitoring: this will take some time
(out <- fsreg(log.light~log.Te, data=starsCYG, method="S", monitoring=TRUE))

## resfwdplot with no optional paramters
resfwdplot(out)

## resfwdplot with optional paramters: change the color and line type of foreground units
resfwdplot(out, fg.col="red", fg.lty="dotdash")

## resfwdplot with brushing. Note that we are changing the X- and Y-labels of the scatterplot
resfwdplot(out, fg.col="red", fg.lty="dotdash", databrush=TRUE, nameX="log.TE", namey="log.light")

## We get the following picture with MM-estimates, Tukey’s bisquare 
##  function. The three sets of residuals are clearly seen for virtually all efficiency values.
(out <- fsreg(log.light~log.Te, data=starsCYG, method="MM", monitoring=TRUE))
fsdaR:::resindexplot(out)
resfwdplot(out, fg.col="red", fg.lty="dotdash")

## Forward search: Stars data. Forward plot of minimum deletion residuals,
##  leading to identification of multiple outliers. The given levels of
##  the envelopes are for pointwise tests of outlyingness.
##
(out <- fsreg(log.light~log.Te, data=starsCYG, method="FS", monitoring=TRUE))
mdrplot(out)
levfwdplot(out)
