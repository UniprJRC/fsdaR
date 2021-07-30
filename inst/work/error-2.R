##  Fixed: 30.07.2021 - now an error will be raised if cmap is not a matrix with three columns.
##  See below the new example

library(fsdaR)
data(geyser2)
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(cmap="autumn"))

##  Error in .jcall(fsdaEngine, returnType, fsdaFunction, as.integer(nargout),  :
##    com.mathworks.toolbox.javabuilder.MWException: Arrays have incompatible sizes for this operation.


library(fsdaR)
data(geyser2)

##  Filled contour plots with additional options: contourf plot with a named colormap.
##  Here we define four MATLAB-like colormaps, but the user can define anything else,
##  presented by a matrix with three columns which are the RGB triplets.

summer <- as.matrix(data.frame(x1=seq(from=0, to=1, length=65), x2=seq(from=0.5, to=1, length=65), x3=rep(0.4,65)))
spring <- as.matrix(data.frame(x1=rep(1, 65), x2=seq(from=0, to=1, length=65), x3=seq(from=1, to=0, length=65)))
winter <- as.matrix(data.frame(x1=rep(0, 65), x2=seq(from=0, to=1, length=65), x3=seq(from=1, to=0, length=65)))
autumn <- as.matrix(data.frame(x1=rep(1, 65), x2=seq(from=0, to=1, length=65), x3=rep(0, 65)))

out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=autumn))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=winter))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=spring))
out <- tclustfsda(geyser2, k=3, alpha=0.1, restrfactor=10000, plot=list(type="contourf", cmap=summer))
