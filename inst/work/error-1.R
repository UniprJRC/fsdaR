##
##  Fixed long ago.
##
## Error with opening a file - file identifier

library(fsdaR)
data(M5data)

out <- tclustfsda(M5data[,1:2], k=3, alpha=0.1, restrfactor=1, nsamp=1000, plot=TRUE, equalweights=TRUE)

##=====================================================================================================

##  ClaLik with untrimmed units selected using crisp criterion
##  Error using fgets
##  Invalid file identifier. Use fopen to generate a valid file identifier.

##  Error in verLessThanFS (line 110)

##  Error in logmvnpdfFS (line 353)

##  Error in tclust (line 1727)

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Invalid file identifier. Use fopen to generate a valid file identifier.
