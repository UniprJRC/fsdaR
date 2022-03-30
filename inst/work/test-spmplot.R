##---------------------------------------------------------------
##
##  Test spmplot()
##
library(fsdaR)
X <- iris[,1:4]
out <- fsmult(X, monitoring=TRUE)

library(tictoc)
tic()
spmplot(X)
toc()

spmplot(X, group=iris$Species)
spmplot(X, group=iris$Species, dispopt="box")
spmplot(X, group=iris$Species, plot="")      # no labels
spmplot(X, group=iris$Species, plot=FALSE)   # no labels
spmplot(X, group=iris$Species, plot=c())     # no labels
spmplot(X, group=iris$Species, plot=NULL)    # no labels

spmplot(X, group=iris$Species, plot=TRUE)    # default variable labels Y1, Y2, ...
spmplot(X, group=iris$Species, plot=FALSE)   # no variable labels
spmplot(X, group=iris$Species, plot=list(nameY=c('SL','SW','PL','PW')))
spmplot(X, group=iris$Species, variables=c('SL','SW','PL','PW'))

## control the symbols - pch
spmplot(X, group=iris$Species, plot=list(sym="o+x"))     # the default
spmplot(X, group=iris$Species, plot=list(sym="ov*"))     # other symbols
spmplot(X, group=iris$Species, plot=list(sym="o+a"))     # error - 'a' is not allowed symbol

spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "square", "none")))
spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "pentagram", "hexagram")))
spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "square")))     # the shorter vector will be recycled
spmplot(X, group=iris$Species, plot=list(sym=c("diamond")))               # an error, because the single string is not recognized as a cell !!!

spmplot(X, group=iris$Species, pch=c(1,3,4))            # the default
spmplot(X, group=iris$Species, pch=c(1,6,8))            #
spmplot(X, group=iris$Species, pch=18)
spmplot(X, group=iris$Species, pch=31)                  # Warning: Character  not suported by Matlab. Will be replaced by 'o'
sspmplot(X, group=iris$Species, plot=list(sym="o+a"))     # error - 'a' is not allowed symbol

spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "square", "none")))
spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "pentagram", "hexagram")))
spmplot(X, group=iris$Species, plot=list(sym=c("diamond", "square")))     # the shorter vector will be recycled
spmplot(X, group=iris$Species, plot=list(sym=c("diamond")))               # an error, because the single string is not recognized as a cell !!!

## control the legend
spmplot(X, group=iris$Species, plot=list(doleg=TRUE))           # draw legend (default)
spmplot(X, group=iris$Species, plot=list(doleg="on"))           # same
spmplot(X, group=iris$Species, plot=list(doleg=FALSE))          # no legend
spmplot(X, group=iris$Species, plot=list(doleg=off))            # same - no legend

spmplot(X, group=iris$Species, legend=TRUE)           # draw legend (default)
spmplot(X, group=iris$Species, legend="on")           # same
spmplot(X, group=iris$Species, legend=FALSE)          # no legend
spmplot(X, group=iris$Species, legend="off")          # same - no legend


## control colors
spmplot(X, group=iris$Species, col=c("green", "red", "cyan"))       # choose colors
spmplot(X, group=iris$Species, col=c("black"))                      # recycle the color (black)
spmplot(X, group=iris$Species, col=1:3)

## control symbol size
spmplot(X, group=iris$Species, plot=list(siz=3))         # MATLAB style
spmplot(X, group=iris$Species, cex=0.5)                 # R style (the default is 6pt)
spmplot(X, group=iris$Species, cex=2)                   # R style
spmplot(X, group=iris$Species, cex=c(0.5, 1, 2))        # different size for each group

## control the labels
spmplot(X, group=iris$Species, plot=list(labeladd="1", label=paste0("V",1:nrow(X))))
spmplot(X, group=iris$Species, labeladd=FALSE)
spmplot(X, group=iris$Species, labeladd=TRUE, label=paste0("V",1:nrow(X)))

spmplot(out)
spmplot(out, group=iris$Species)
spmplot(out, group=iris$Species, dispopt="box")

##----------------------------------------------------------------
library(fsdaR)

## Now test the direct use of fsmult(). Set two groups, e.g. those obtained from fsmult().
##  Generate contaminated data
n <- 200
X <- matrix(rnorm(n*3), ncol=3)
Xcont <- X
Xcont[1:5,] <- Xcont[1:5,] + 3

out <- fsmult(Xcont, plot=TRUE)


group <- rep(0, n)
group[out$outliers] <- 1

##  By default, the legend identifies the groups with the identifiers
##  given in vector 'group'.

spmplot(Xcont, group=group, dispopt='box', labeladd=TRUE, col=c("blue", "red"), trace=TRUE)
