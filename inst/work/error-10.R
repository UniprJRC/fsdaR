
##  ISSUE 10
##
##  This happens only when run in R CMD check
##  Does not matter with which data set is run. However, it works
##  fine in the examples for carikeplot()!

##
> ### Name: tclustIC
> ### Title: Performs cluster analysis by calling 'tclustfsda' for different
> ###   number of groups 'k' and restriction factors 'c'
> ### Aliases: tclustIC
>
> ### ** Examples
>
> ## Not run:
> ##D  data(geyser2)
> ##D  out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)
> ##D  out
> ##D  summary(out)
> ##D
> ## End(Not run)
>
>  data(flea)
>  Y <- as.matrix(flea[, 1:(ncol(flea)-1)])    # select only the numeric variables
>  rownames(Y) <- 1:nrow(Y)
>  head(Y)
  tars1 tars2 head aede1 aede2 aede3
1   191   131   53   150    15   104
2   185   134   50   147    13   105
3   200   137   52   144    14   102
4   173   127   50   144    16    97
5   171   118   49   153    13   106
6   160   118   47   140    15    99
>
>  (out <- tclustIC(Y, whichIC="CLACLA", plot=FALSE, alpha=0.1, nsamp=100))

This is the very first call to the FSDA engine,
it can take some time to initialize it ...


k=1
k=2
k=3
k=4
k=5
Error using gcp (line 49)
Java exception occurred:
java.lang.IllegalStateException: An application can only use one MCR component that uses Parallel Computing Toolbox functionality.
        at com.mathworks.toolbox.distcomp.util.MatlabRefStore.initMatlabRef(MatlabRefStore.java:50)

Error in tclustIC (line 196)

Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
  com.mathworks.toolbox.javabuilder.MWException: Java exception occurred:
java.lang.IllegalStateException: An application can only use one MCR component that uses Parallel Computing Toolbox functionality.
        at com.mathworks.toolbox.distcomp.util.MatlabRefStore.initMatlabRef(MatlabRefStore.java:50)
Calls: tclustIC -> callFsdaFunction -> .jcall -> .jcheck
Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in 'inst/doc' ... OK
* checking running R code from vignettes ...
  'fsdaR-transreg_PA2.Rmd' using 'UTF-8'... OK
 NONE
* checking re-building of vignette outputs ... OK
* checking PDF version of manual ... OK
* DONE

Status: 1 ERROR
