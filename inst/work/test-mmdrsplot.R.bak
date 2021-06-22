library(fsdaR)

data(hbk)
out <- fsmmmdrs(hbk[,1:3])
class(out)
summary(out)

##  Interactive_example
##      Two groups with approximately the same number of units.

set.seed(1234)
n1 <- n2 <- 100
p <- 3
Y1 <- matrix(runif(n1*p), nrow=n1)
Y2 <- matrix(runif(n2*p), nrow=n2) + 1
Y <- rbind(Y1, Y2)
colnames(Y) <- paste0("Y", 1:p)
group <- c(rep(1, n1), rep(2, n2))

##    spmplot(Y, group)
pairs(Y, main = "Two simulated groups", cex=1.4, pch=21, bg=c("red", "blue")[unclass(group)])
plot(CovClassic(Y), which="pairs", col=group, main='Two simulated groups')

## parfor of Parallel Computing Toolbox is used (if present in current computer)
##  and pool is cleaned after the execution of the random starts
##  The number of workers which is used is the one specified
##  in the local/current profile

out <- fsmmmdrs(Y, nsimul=100, init=10, plot=TRUE);

cat("\nThe two peaks in the trajectories of minimum Mahalanobis distance (mmd).\n",
    "clearly show the presence of two groups.\n",
    "The decrease after the peak in the trajectories of mmd is due to the masking effect.\n")

mmdrsplot(out, databrush=TRUE)
