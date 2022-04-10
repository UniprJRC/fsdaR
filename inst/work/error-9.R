##  VT::03.04.2022
##  'mmdrsplot' fails ... cannot find the MATLAB function mmdrsplot()

library(fsdaR)
data(hbk, package="robustbase")

out <- fsmmmdrs(hbk[,1:3])                  # OK
mmdrsplot(out)                              # fails

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, .jarray(parameters)) :
##  method mmdrsplot with signature ([Ljava/lang/Object;)[Ljava/lang/Object; not found
