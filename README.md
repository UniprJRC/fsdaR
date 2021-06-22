
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fsdaR

This package provides interface to the ‘MATLAB’ toolbox ‘Flexible
Statistical Data Analysis (FSDA)’ which is comprehensive and
computationally efficient software package for robust statistics in
regression, multivariate and categorical data analysis. The current R
version implements tools for regression: (forward search, S- and
MM-estimation, least trimmed squares (LTS) and least median of squares
(LMS)), for multivariate analysis (forward search, S- and
MM-estimation), for cluster analysis and cluster-wise regression. The
distinctive feature of our package is the possibility of monitoring the
statistics of interest as a function of breakdown point, efficiency or
subset size, depending on the estimator. This is accompanied by a rich
set of graphical features, such as dynamic brushing, linking,
particularly useful for exploratory data analysis.

## Installation

You can install ‘fsdaR’ from github with:

``` r
# install.packages("remotes")
remotes::install_github("UniprJRC/fsdaR", INSTALL_opts=c("--no-multiarch"))
```

## Example

This is a basic example which shows you if the package is properly
installed:

``` r
library(fsdaR)
#> Loading required package: rrcov
#> Loading required package: robustbase
#> Scalable Robust Estimators with High Breakdown Point (version 1.5-5)
#> Robust Data Analysis Through Monitoring and Dynamic
#> Visualization (version 0.5-3)

n <- 200
v <- 3
set.seed(123456)
X <- matrix(rnorm(n*v), nrow=n)

Xcont <- X
Xcont[1:5, ] <- Xcont[1:5,] + 3

out <- fsmult(Xcont, trace=TRUE)               # no plots (plot defaults to FALSE)
#> 
#> Optional parameters to FSM(): 
#> $plots
#> [1] 0
#> 
#> $crit
#> [1] "md"
#> 
#> $rf
#> [1] 0.95
#> 
#> $msg
#> [1] 1
#> 
#> $nocheck
#> [1] 0
#> 
#> This is the very first call to the FSDA engine, 
#> it can take some time to initialize it ...
#> 
#> 
#> Returning from FSM().  Fields returned by MATLAB: 
#> [1] "outliers" "loc"      "cov"      "md"       "mmd"      "Un"       "nout"    
#> [8] "class"
names(out)
#> [1] "call"     "outliers" "loc"      "cov"      "md"       "X"        "mmd"     
#> [8] "Un"       "nout"

out <- fsmult(Xcont, trace=TRUE, plot=TRUE)    # identical to plots=1
#> 
#> Optional parameters to FSM(): 
#> $plots
#> [1] 1
#> 
#> $crit
#> [1] "md"
#> 
#> $rf
#> [1] 0.95
#> 
#> $msg
#> [1] 1
#> 
#> $nocheck
#> [1] 0
#> 
#> 
#> Returning from FSM().  Fields returned by MATLAB: 
#> [1] "outliers" "loc"      "cov"      "md"       "mmd"      "Un"       "nout"    
#> [8] "class"
```
