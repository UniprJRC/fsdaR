detach(name="package:fsdaR", unload=TRUE)

library(fsdaR)

## 1. All three work with default arguments
## h can be between n/2 and n-1 [38 and 74]
## bdp is greater than 0 and less or equal to 0.5
(out <- fsreg(Y~., data=hbk, method="LTS"))
