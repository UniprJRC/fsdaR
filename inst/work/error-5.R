##
## Fixed: but needs improvement
##
##  Now an error will be issued, saying that the matrix is singular.
##  Please note, that this happens only with 'geyser' from MASS, not with geyser2 from fsdaR.
##

library(fsdaR)
library(MASS)

data(geyser)
out <- fsmult(geyser)

##  Error in names(md) <- names(weights) <- rownames(x) :
##    'names' attribute [299] must be the same length as the vector [0]

##====================

out <- smult(geyser)        # 1. Works, but a number of warnings will be issued (visible only in RStudio)
out <- mmmult(geyser)       # 2. Works, but a number of warnings will be issued (visible only in RStudio)
out <- fsmult(geyser)       # 3. Will stop with an exception (before V910)

##  Error in .jcall("RJavaTools", "Ljava/lang/Object;", "invokeMethod", cl,  :
##    java.lang.NullPointerException


##  Now, in V910 will not throw an exception but will return all matrices empty, because
##      Warning: Matrix is singular to working precision.
##      > In FSMmmd (line 575)
##        In FSM (line 389)
##
##  We catch this condition and stop with an error message. A more graceful
##  way of informing the user is necessary.
