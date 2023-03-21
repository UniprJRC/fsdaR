
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `fsdaR`

<!-- badges: start -->

[![CRAN
version](https://www.r-pkg.org/badges/version/fsdaR)](https://cran.r-project.org/package=fsdaR)
[![R-CMD-check](https://github.com/UniprJRC/fsdaR/workflows/R-CMD-check/badge.svg)](https://github.com/UniprJRC/fsdaR/actions)
[![downloads](https://cranlogs.r-pkg.org/badges/fsdaR)](https://cran.r-project.org/package=fsdaR)
[![downloads](https://cranlogs.r-pkg.org/badges/grand-total/fsdaR)](https://cran.r-project.org/package=fsdaR)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
<!-- badges: end -->

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

The `fsdaR` package is on CRAN (The Comprehensive R Archive Network) and
the latest release can be easily installed using the command

    install.packages("fsdaR")

**NOTE (WINDOWS):** To avoid some spurious errors due to the new MCR
installation on Windows (V9.10), add the following to the system path

    <RUNTIME_ROOT>\bin\win64

which most probably boils down to:

    C:\Program Files\MATLAB\MATLAB Runtime\v910\bin\win64

## Building from source

To install the latest stable development version from GitHub, you can
pull this repository and install it using

    ## install.packages("remotes")
    remotes::install_github("UniprJRC/fsdaR")

Of course, if you have already installed `remotes`, you can skip the
first line (I have commented it out).

On Windows, follow the **NOTE** given above.

## Example

This is a basic example which shows you if the package is properly
installed:

``` r
library(fsdaR)
#> Robust Data Analysis Through Monitoring and Dynamic
#> Visualization (version 0.8-1)

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
