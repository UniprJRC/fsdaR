library(tictoc)
library(microbenchmark)

library(fsdaR)

n <- 200
v <- 3
set.seed(123456)
X <- matrix(rnorm(n*v), nrow=n)

Xcont <- X
Xcont[1:5, ] <- Xcont[1:5, ] + 3

## --------------------------------------------------------------
## Timing for fsmult()

##  1. First call: initialization ================================================
tic()
out1 <- fsmult(Xcont)               # no plots (plot defaults to FALSE)
toc()

##  V91:  13.11 sec elapsed
##  V96:  17.58 sec elapsed
##  V910: 22.89 sec elapsed

##  2. Any further call without plots ============================================
tic()
out1 <- fsmult(Xcont)               # no plots (plot defaults to FALSE)
toc()

(res <- microbenchmark(fsmult(Xcont), times=100L, unit="s"))

##  V91
##  Unit: seconds
##            expr     min        lq      mean    median       uq       max neval
##   fsmult(Xcont) 0.11993 0.1280251 0.1379966 0.1330009 0.141686 0.1835726   100

##  V96
##  Unit: seconds
##            expr       min        lq      mean    median        uq       max neval
##   fsmult(Xcont) 0.1199313 0.1234336 0.1463996 0.1283212 0.1526459 0.2691931   100

##  V910
##  Unit: seconds
##            expr      min        lq      mean    median        uq      max neval
##   fsmult(Xcont) 0.118315 0.1293117 0.1832959 0.1935622 0.2244764 0.272651   100

##  3. A call with plots =========================================================

##  First call with plots
tic()
out1 <- fsmult(Xcont, plot=TRUE)    # identical to plots=1
toc()

##  V91
##  56.9 sec elapsed

##  V96
##  43.05 sec elapsed

##  V910
##  49.58 sec elapsed

##  Subsequent calls with plots
tic()
out1 <- fsmult(Xcont, plot=TRUE)    # identical to plots=1
toc()

##  V91
##  21.92 sec elapsed

##  V96
##  9.98 sec elapsed

##  V910
##  12.41 sec elapsed

(res <- microbenchmark(fsmult(Xcont, plot=TRUE), times=3L, unit="s"))


## V91
##  Unit: seconds
##                         expr      min      lq     mean   median       uq      max neval
##   fsmult(Xcont, plot = TRUE) 18.16181 18.5856 19.97409 19.00939 20.88024 22.75109     3

##  V96
##  Unit: seconds
##                         expr      min       lq     mean   median       uq     max neval
## fsmult(Xcont, plot = TRUE) 7.925633 7.995756 8.293367 8.065879 8.477234 8.88859     3

##  V910
##  Unit: seconds
##                         expr      min      lq     mean   median     uq   max     neval
##  fsmult(Xcont, plot = TRUE) 11.77804 11.9665 13.65686 12.09674 12.66326 21.27749    10
