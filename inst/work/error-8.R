##  VT::03.04.2022

library(fsdaR)

##  The MATLAB code tries to read a .mat file: Hyp_BdpEff.mat, which does
##  not exist if no FSDA is installed.

data(hbk, package="robustbase")
(out <- fsreg(Y~., data=hbk, method="S", control=Sreg_control(rhofunc='hyperbolic')))


##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Unable to read file 'Hyp_BdpEff.mat'. No such file or directory.
