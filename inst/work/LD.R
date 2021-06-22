library(fsdaR)

data(loyalty)
head(loyalty)
dim(loyalty)

##  LD (Loyalty cards data): fan plot ====================
y <- loyalty[, 4, drop=FALSE]
X <- loyalty[, -4]
## In MATLAB the function is yXplot(y, X, ...), in R: regspmplot(y, X, group, ...)
#yXplot(y,X,'nameX',nameX,'namey',namey);

## This is not good, should not show x or y labels
regspmplot(y, X)
regspmplot(y, X, plot=FALSE)       # here also not

## Only here should be x and y labels
regspmplot(y, X, plot=TRUE)

## Change the name of Y-axis
regspmplot(y, X, plot=list(namey="Sales"))


## Change the names of the X-variables
regspmplot(y, X, plot=list(nameX=c('Number of visits', 'Age', 'Number of persons in the family')))

##Change both
regspmplot(y, X, plot=list(namey="Sales", nameX=c('Number of visits', 'Age', 'Number of persons in the family')))

## Change ylim
regspmplot(y, X, plot=list(ylimy=c(0,5000)))


## Change xlim
regspmplot(y, X, plot=list(xlimx=c(0,100)))

## Change both xlim and ylim
regspmplot(y, X, plot=list(ylimy=c(0,5000), xlimx=c(0,100)))
