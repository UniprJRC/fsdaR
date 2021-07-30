library(fsdaR)
library(MASS)

data(geyser)
out <- fsmult(geyser)

##  Error in names(md) <- names(weights) <- rownames(x) :
##    'names' attribute [299] must be the same length as the vector [0]
