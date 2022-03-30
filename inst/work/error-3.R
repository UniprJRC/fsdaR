##  Non-reproducible, I cannot figure in what situation this error occurs.
##  Once this happens, only restart of R can help.
##
##  Probably related to error-6 (see also issue 6 in Bug-examples.r)

library(fsdaR)
data(geyser2)
(out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1))


##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Loading C:\Program Files\MATLAB\MATLAB
##    Runtime\v910\bin\win64\builtins\matlab_toolbox_lang_builtins\mwcommandfuns_builtinimpl.dllfailed with error: The specified module could not be found.
##  : not connected: not connected
