##---------------------------------------------------------------
##
##  Test saveas()
##
library(fsdaR)

X <- iris[,1:4]
out <- fsmult(X, monitoring=TRUE)
covplot(out, tag="xxx")

## This will work, but if I skip format MWException: Not enough input arguments exception will be thrown
##  Also, if I skip fig, i.e. use the current figure, "gcf", will not work
saveas("xxx", fname="xxx.jpg", format="jpg")
