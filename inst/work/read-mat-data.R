##install.packages("R.matlab")
library(R.matlab)

##  X
data <- readMat('X.mat')
str(data)

X <- data$X[[1]]
colnames(X) <- c("y1", "y2")
save(X, file="X.rda")

## notes:
data$X[[2]]

The X dataset has been simulated by Gordaliza, García-Escudero & Mayo-Iscar during the Workshop ADVANCES IN ROBUST DATA ANALYSIS AND CLUSTERING held in Ispra on October 21st-25th
2013. It is a bivariate dataset of 200 observations. It presents two parallel components without contamination.

##-------------------------------------------------------------

## fishery
data <- readMat('fishery.mat')
str(data)

fishery <- data$fishery[[1]]
colnames(fishery) <- c("quantity", "value")
rownames(fishery) <- 1:nrow(fishery)
save(fishery, file="fishery.rda")


## notes:
data$fishery[[4]]
The fishery data consist of 677 transactions of a fishery product in Europe. For each transaction the Value in 1000 euro and the quantity in Tons are reported.

##-------------------------------------------------------------

## wool
data <- readMat('wool.mat')
str(data)

wool <- data$wool[[1]]
colnames(wool) <- c("length", "amplitude", "load", "cycles")
rownames(wool) <- 1:nrow(wool)
save(wool, file="wool.rda")


## notes:
data$wool[[4]]
The wool data give the number of cycles to failure of a worsted yarn under cycles of repeated loading.
The variables are: X1, length of test specimen; X2, amplitude of loading cycle; X3, load

##-------------------------------------------------------------

## mussels
data <- readMat('mussels.mat')
str(data)

mussels <- data$mussels[[4]]

## data$mussels[[2]]        # variable names
colnames(mussels) <- c("length", "width", "height", "shell_mass", "muscle_mass")
rownames(mussels) <- 1:nrow(mussels)
save(mussels, file="mussels.rda")


## notes:
data$mussels[[1]]
These data, introduced by Cook and Weisberg (1994), consist of 82 observations on horse mussels from
New Zeland. The variables are shell length, width, height, mass and muscle mass
