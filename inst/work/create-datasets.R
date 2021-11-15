## Create the swissbanknotes dataset

library(alr3)
data(banknote)

swissbanknotes <- banknote
colnames(swissbanknotes) <- tolower(colnames(swissbanknotes))
colnames(swissbanknotes)[ncol(swissbanknotes)] <- "class"
head(swissbanknotes)
swissbanknotes$class <- swissbanknotes$class+1

head(swissbanknotes)

library(rrcov)
plot(CovClassic(swissbanknotes[,1:6]), which="pairs", col=swissbanknotes$class)

##prompt(swisbanknotes)

save(swissbanknotes, file="swissbanknotes.rda", version=2)

## Example

data(swissbanknotes)
head(swissbanknotes)
plot(CovClassic(swissbanknotes[, 1:6]), which="pairs", col=swissbanknotes$class)

##-------------------------------------------------------------------------
df <- read.table("diabetes.txt")
head(df)
library(mclust)
data(diabetes)
rownames(diabetes) <- NULL
rownames(df) <- NULL

## sort by class
diabetes <- rbind(diabetes[which(diabetes[,1]=="Normal"),], diabetes[which(diabetes[,1]=="Chemical"),], diabetes[which(diabetes[,1]=="Overt"),])

## only one difference in insulin, observation 104
all.equal(diabetes[, 2:4], df, check.names=FALSE)
diabetes[,2:4]-df

colnames(diabetes)
diabetes <- diabetes[,c("glucose", "insulin", "sspg", "class")]
save(diabetes, file="diabetes.rda", version=2)

## The diabetes dataset, introduced by Reaven and Miller (1979),
##  consists of 145 observations (patients). For each patient three
##  measurements are reported: plasma glucose response to oral glucose,
##  plasma insulin response to oral glucose, degree of insulin resistance.

##---------------------------------------------------------------
##
## Swiss Heads data

##  The Swiss Heads data set was introduced by B. Flury and H. Riedwyl (1988).
##  It contains information on six variables describing the dimensions of the
##  heads of 200 twenty year old Swiss soldiers.

swissheads <- read.table("head.txt")
colnames(swissheads) <- c('minimal_frontal_breadth',  'breadth_angulus_mandibulae',  'true_facial_height',  'length_glabella_nasi',  'length_tragion_nasion',  'length_tragion_gnathion')
head(swissheads)
save(swissheads, file="swissheads.rda", version=2)

##---------------------------------------------------------------
##
## Emilia Romana
##
cols <- c('less10',    'more75',    'single',    'divorced',    'widows',    'graduates',    'no_education',
    'employed',    'unemplyed',    'increase_popul',    'migration',    'birth_92_94',    'fecundity',
    'houses',    'houses_2WCs',    'houses_heating',    'TV',    'cars', 'luxury_cars',    'hotels',
    'banking',    'income',    'income_tax_returns',    'factories',    'factories_more10', 'factories_more50',
    'artisanal',    'entrepreneurs')

##  The data set of the municipalities in Emilia Romagna, introduced by
##  Atkinson et al. (2004), contains 341 records for 341 municipalities
##  of Emilia Romagna (an Italian region) for 28 demographic variables.

emilia2001 <- read.table("emilia2001.txt")
head(emilia2001)
dim(emilia2001)
colnames(emilia2001) <- cols
head(emilia2001)
save(emilia2001, file="emilia2001.rda", version=2)

mcd <- CovMcd(emilia2001)
plot(mcd)

##---------------------------------------------------------------
##
## Geyser data
##
##  geyser2 <- read.table("geyser2.txt")
library(tclust)
data(geyser2)
head(geyser2)
dim(geyser2)
save(geyser2, file="geyser2.rda", version=2)

##---------------------------------------------------------------
##
## M5data data
##
##  M5data <- read.table("M5data.txt")
##  colnames(M5data) <- c("X", "Y", "cluster")
library(tclust)
data(M5data)
head(M5data)
dim(M5data)
save(M5data, file="M5data.rda", version=2)



##---------------------------------------------------------------
##
## Hawkins data
##
library(R.matlab)
hh <- readMat("hawkins.mat")
hawkins <- as.data.frame(hh$hawkins[[1]])
note <- hh$hawkins[[4]]
rownames(hawkins) <- 1:nrow(hawkins)
colnames(hawkins) <- c(paste0("X", 1:(ncol(hawkins)-1)), "y")
save(hawkins, file="hawkins.rda", version=2)

##---------------------------------------------------------------
##
## Flea data
##
df <- read.table("flea.txt")
head(df)
dim(df)

colnames(df) <- c("tars1", "tars2", "head", "aede1", "aede2", "aede3", "species")
labels <- c("Concinna", "Heptapotamica", "Heikertingeri")
df$species <- factor(df$species, levels=c(1,2,3), labels=labels)

## convert the numerical variables to double - otherwise they will be integer and MATLAB will spit
df[, 1:6] <- matrix(as.double(as.matrix(df[,1:6])), ncol=6)

flea <- df
save(flea, file="flea.rda", version=2)

##  REFERENCE
##  A. A. Lubischew (1962), "On the Use of Discriminant Functions in Taxonomy", Biometrics, Dec 1962, pp.455--477.
##
##  JSTOR: https://www.jstor.org/stable/2527894

##  Flea-beetle measurements

##  tars1, width of the first joint of the first tarsus in microns (the sum of measurements for both tarsi)
##  tars2, the same for the second joint
##  head, the maximal width of the head between the external edges of the eyes in 0.01 mm
##  ade1, the maximal width of the aedeagus in the fore-part in microns
##  ade2, the front angle of the aedeagus ( 1 unit = 7.5 degrees)
##  ade3, the aedeagus width from the side in microns
##  species, which species is being examined - Concinna, Heptapotamica, Heikertingeri
