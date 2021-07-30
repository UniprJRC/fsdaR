library(fsdaR)

data(hbk)
out <- fsmmmdrs(hbk[,1:3])

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Unrecognized function or variable 'progbar'.
