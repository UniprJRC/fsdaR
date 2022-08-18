library(fsdaR)

## Example of call to psifun() with no input arguments (all defaults).
##  In this case TB link (default) is used with bdp=0.5 (default) for regression (p=1).
##  Since u is empty, the vectors rho, psi, etc. will not be returned.
out <- fsdaR:::psifun()

## Example of call to psifun() with just one input arguments.
## In this case TB link (default) is used with bdp=0.5 (default) for regression (p=1).

n <- 20
u <- rnorm(n)
(out <- psifun(u))

## Example of call to psifun with bdp specified.
##  In this case TB link is used with the bdp specified as input
n <- 20
u <- rnorm(n)
(out <- fsdaR:::psifun(u, bdp=0.1))

## Example of call to psifun() with bdp and rhofunc prespecified.
##  In this case PD link is used with the bdp specified as input
n <- 20
u <- rnorm(n)
(out <- fsdaR:::psifun(u, fun="PD", bdp=0.1))

## Example of call to psifun() with eff and fun prespecified.
##  In this case OPT link is used with the eff specified as input
n <- 20
u <- rnorm(n)
(out <- fsdaR:::psifun(u, fun="OPT", eff=0.9))

## Example of call to psifun() with const prespecified.
##  In this case HA link is used with the c=1.5 specified as input
n <- 20
u <- rnorm(n)
(out <- fsdaR:::psifun(u, fun="HA", const=1.5))

## Example of call to psifun() with const prespecified, and personalized input parameters for HA link.
##  In this case HA link is used with the constant c=0.5 specified as input
n <- 20
u <- rnorm(n)
(out <- fsdaR:::psifun(u, fun="HA", const=0.5, param=c(2, 3, 8)))
