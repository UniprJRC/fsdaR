##  ISSUE 11 - V912 - 14.07.2022
##
##  Fixed 23.07.2022:
##  The problem was that the MATLAB paths were before the MCR paths -
##  seems that there is a filename conflict with files of the parallel toolbox.
##  - To fix it I just moved the MATLAB paths to the end
##
##  - To reproduce it, set the paths in the following order:
##
##        C:\Program Files\MATLAB\R2022a\runtime\win64;
##        C:\Program Files\MATLAB\R2022a\bin;
##        C:\Program Files\MATLAB\MATLAB Runtime\v912\runtime\win64;
##

library(fsdaR)
data(z1)
out <- tclustIC(z1, plots=FALSE)

##=========================================================
##
##  OUTPUT with V910
##
> library(fsdaR)
Robust Data Analysis Through Monitoring and Dynamic
Visualization (version 0.8-0)

> data(z1)
>
> ## Computation of information criterion
> out <- tclustIC(z1, plots=FALSE)
k=1
k=2
k=3
k=4
k=5
Error using gcp
The specified superclass 'parallel.internal.customattr.CustomPropTypes' contains a parse error, cannot be found on MATLAB's search path, or is shadowed by another file with the
same name.

Error in tclustIC (line 196)

Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
  com.mathworks.toolbox.javabuilder.MWException: The specified superclass 'parallel.internal.customattr.CustomPropTypes' contains a parse error, cannot be found on MATLAB's search path, or is shadowed by another file with the same name.
>

##=========================================================
##
##  OUTPUT with V910

> library(fsdaR)
Robust Data Analysis Through Monitoring and Dynamic
Visualization (version 0.8-0)

> data(z1)
>
> ## Computation of information criterion
> out <- tclustIC(z1, plots=FALSE)
Starting parallel pool (parpool) using the 'local' profile ...
Connected to the parallel pool (number of workers: 2).
k=1
k=2
k=3
k=4
k=5
Parallel pool using the 'local' profile is shutting down.
