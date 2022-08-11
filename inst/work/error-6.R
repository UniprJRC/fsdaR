##  No more reproducible: 23.07.2022 - neither with V910 nor with the new V912!
##
##  Fixed: 15.01.2021 - It is necessary to add the following to the path:
##
##      <RUNTIME_ROOT>\bin\win64
##
##  Which most probably boils down to:
##
##      C:\Program Files\MATLAB\MATLAB Runtime\v910\bin\win64
##
##


## This exact sequence will fail in R console, but will work in RStudio -
##  build with the JARs from 24.09.2021, with MCR from MATLAB 2021a, aka v910
##
##  - If the command data(hbk) - which is not necessary at all! - is removed, everything works fine
##  - However, if it throws the exception once, than many other functions will crash.
##
## To fix the issue, set in the the system path the following directory:
##  <RUNTIME_ROOT>\bin\win64
##
##  i.e. something like this:
##  C:\Program Files\MATLAB\MATLAB Runtime\v910\bin\win64
##

library(robustbase)
library('fsdaR')
(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2)))
data(hbk)
(out <- fsmult(hbk[,1:3], monitoring=TRUE))


## Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##  com.mathworks.toolbox.javabuilder.MWException: Loading C:\Program Files\MATLAB\MATLAB
##Runtime\v910\bin\win64\builtins\matlab_toolbox_lang_builtins\mwcommandfuns_builtinimpl.dllfailed with error: The specified module could not be found.
##
##: not connected: not connected
