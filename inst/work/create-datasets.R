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

##---------------------------------------------------------------
##
## Income1 data
##
df <- read.table("Income1.txt")
head(df)
dim(df)

colnames(df) <- c("H_NUMPER", "HOTHVAL", "HSSVAL", "HTOTVAL")

## convert the numerical variables to double - otherwise they will be integer and MATLAB will spit
df[, 1:4] <- matrix(as.double(as.matrix(df[,1:4])), ncol=4)

Income1 <- df
save(Income1, file="Income1.rda", version=2)

##  Source: United States Census Bureau, Annual Social and Economic Supplements (2021)
##      https://www.census.gov/data/datasets/time-series/demo/cps/cps-asec.html
##  REFERENCE
##  Atkinson et al. (2023)

##  Income data taken from the United States Census Bureau. The data are
##  a random sample of 200 observations referred to the following variables.
##  The goal is to predict HTOTVAL.

##  H_NUMPER, Number of persons in household
##  HOTHVAL, All other types of income except HEARNVAL Recode - Total other household income
##  HSSVAL, household income - social security
##  HTOTVAL, total household income (dollar amount).


##---------------------------------------------------------------
##
## Income2 data
##
df <- read.table("Income2.txt")
head(df)
dim(df)

colnames(df) <- c("Age", "Education", "Gender", "ExtraGain", "Hours", "Income")

## convert the numerical variables to double - otherwise they will be integer and MATLAB will spit
df[, 1:6] <- matrix(as.double(as.matrix(df[,1:6])), ncol=6)
df$Gender <- factor(df$Gender, labels=c("Female", "Male"))

Income2 <- df
save(Income2, file="Income2.rda", version=2)

##  REFERENCE
##  Atkinson et al. (2023)

##  A sample of 200 observations of full time employees from a municipality
##  in Northern Italy who have declared extra income from investment
##  sources. The variables are as follows.
##  The goal is the possibility in predicting income level based on the individual’s personal information

##  Age,  Age of the person (the minimum is 19 and the maximum is 73).
##  Education, Number of years of education (the minimum value of 5 is primary school, and the maximum value is 16 bachelor degree)
##  Gender, 1 is Male and 0 is Female
##  ExtraGain, Income from investment sources (profit-losses) apart from wages/salary
##  Hours, total number of declared hours worked during the week. The minimum value is 35 and the maximum is 99.
##  Income, total yearly income (Euro amount)

##================================================================
##
## Bank data
##
df <- read.csv("bank_data.csv")
head(df)
dim(df)

## convert the numerical variables to double - otherwise they will be integer and MATLAB will spit
df <- matrix(as.double(as.matrix(df)), ncol=ncol(df))

bank_data<- df
save(bank_data, file="bank_data.rda", version=2)

## Description
#'  There are 1949 univariate observations on the amount of money made from individual
#'  personal banking customers over a year for an Italian bank. Because of the linking
#'  of products, it is not straightforward for the bank to attribute the profit to
#'  individual sources. The bank made a preliminary classification of its 700 products
#'  into 48 macrocategories (macroservices). Among these 48 macrocategories, the 13
#'  most important ones according to the bank are listed below and form our set of
#'  explanatory variables. All explanatory variables are discrete, taking
#'  values 0, 1, 2, . . . , the number of services (inside each macroservice) that
#'  each customer has signed up for – number of credit cards, number of domestic
#'  direct debits, number of current accounts and so forth. T

The variables are:
- X1 = Personal loans,
- X2 = Financing and hire-purchase,
- X3 = Mortgages,
- X4 = Life insurance
- X5 = Share account
- X6 = Bond account
- X7 = Current account
- X8 = Salary deposits
- X9 = Debit cards
- X10 = Credit cards
- X11 =Telephone banking
- X12 = Domestic direct debits
- X13 = Money transfers.
- y = Profit/loss,

## Source
Riani, M., Cerioli, A., Atkinson, A. C., and Perrotta, D. (2014d). Supplement
to “Monitoring robust regression”. doi:10.1214/14-EJS897SUPP.

## References
Riani, M., Cerioli, A., Atkinson, A. C., and Perrotta, D. (2014a). Monitoring robust
regression. Electronic Journal of Statistics, 8, 642–673.

##================================================================
##
## Hospital data
##
df <- read.csv("hospital.csv")
head(df)
dim(df)

## convert the numerical variables to double - otherwise they will be integer and MATLAB will spit
df <- matrix(as.double(as.matrix(df)), ncol=ncol(df))

hospital <- df
save(hospital, file="hospital.rda", version=2)

## Description
#'  Hospital data (Neter et al., 1996).
#'
#'  Data on the logged survival time of 108 patients undergoing liver surgery,
#'  together with four potential explanatory variables. Data are composed of
#'  54 observations plus other 54 observations, introduced to check the model
#'  fitted to the first 54. Their comparison suggests there is no systematic
#'  difference between the two sets. However by looking at some FS plots
#'  (Riani and Atkinson, 2007), we conclude that these two groups are significantly
#'  different

The variables are:
- X1
- X2
- X3
- X4
- y

## Source
J. NETER, M. H. KUTNER, C. J. NACHTSHEIM, W.WASSERMAN, Applied Linear Statistical Models (4th edition). McGraw-Hill, New York, 1996.

## References
A. C. ATKINSON, M. RIANI, Robust Diagnostic Regression Analysis. Springer-Verlag, New York, 2000.
