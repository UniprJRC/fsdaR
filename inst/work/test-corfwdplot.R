library(fsdaR)

## Load the Hawkins, Bradu, Kass data (hbk):
##  regression data set with 3 explanatory variables
data(hbk, package="robustbase")
head(hbk)

## Extract the explanatory variables for multivariate analysis
X <- hbk[,1:3]

## Do FS monitoring (FSMeda) and plot the correlations of the MDs
out <- fsmult(X, monitoring=TRUE)
corfwdplot(out)         # OK
savePlot(type="jpeg", file="corplot-FS-R.jpg")

## Do monitoring of S estimates (Smulteda) and plot the correlations of the MDs
out <- smult(X, monitoring=TRUE)
corfwdplot(out)         # OK

## Do monitoring of MM estimates (MMmulteda) and plot the correlations of the MDs
out <- mmmult(X, monitoring=TRUE)
corfwdplot(out)         # the correlations are very strange!
savePlot(type="jpeg", file="corplot-MM-R.jpg")

##--------------------------------------------------
## Compare the MM estimates with rrcov - almost identical
(out1 <- mmmult(X))
(out2 <- CovMMest(X))

write.table(hbk, file="hbk.txt", row.names=FALSE, col.names=FALSE)



library(fsdaR)

data(hbk)

(out <- fsmult(hbk[,1:3], monitoring=TRUE))
corfwdplot(out)

(out <- smult(hbk[,1:3], monitoring=TRUE))
corfwdplot(out)

(out <- mmmult(hbk[,1:3], monitoring=TRUE))
corfwdplot(out)

(out <- fsreg(Y~., data=hbk, monitoring=TRUE))
corfwdplot(out)

(out <- fsreg(Y~., data=hbk, method="S", monitoring=TRUE))
corfwdplot(out)

(out <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE))
corfwdplot(out)


##  Test for regression
##
data(starsCYG)
(out <- fsreg(log.light~log.Te, data=starsCYG, monitoring=TRUE))
corfwdplot(out)

(out <- fsreg(log.light~log.Te, data=starsCYG, method="S", monitoring=TRUE))
corfwdplot(out)

(out <- fsreg(log.light~log.Te, data=starsCYG, method="MM", monitoring=TRUE))
corfwdplot(out)
