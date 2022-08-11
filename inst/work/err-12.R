##  ISSUE 12 - V912 - 28.07.2022
##
##  tclustICplot produces the plot but issues a message
##  "No graphical device, interactive datatooltip not enabled"
##  and the datatooltip does not work.
##
##  Fixed 28.07.2022:
##
##  The issue is fixed in FSDA 8.5.29 and it was necessary to
##  recompile the jars with the new FSDA files.

library(fsdaR)
data(geyser2)
out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)

##    Starting parallel pool (parpool) using the 'local' profile ...
##    Connected to the parallel pool (number of workers: 2).
##    k=1
##    k=2
##    k=3
##    k=4
##    k=5
##    Parallel pool using the 'local' profile is shutting down.

tclustICplot(out, whichIC="MIXMIX")

##  No graphical device, interactive datatooltip not enabled
