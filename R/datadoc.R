######
##  VT::04.03.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR", load_code=roxygen2:::load_installed)
##
#'
#'
#'
#' Demographic data from the 341 miniciplaities in Emilia Romagna (an Italian region).
#'
#' A data set containing 28 demographic variables for 341 municipalities in Emilia Romagna (an Italian region).
#'
#' @name emilia2001
#' @docType data
#' @usage data(emilia2001)
#' @format A data frame with 341 rows and 28 variables
#' The variables are as follows:
#'
#' \itemize{
#'   \item less10: population aged less than 10
#'   \item more75: population aged more than 75
#'   \item single single-member families
#'   \item divorced": divorsed
#'   \item widows: widows and widowers
#'   \item graduates: population aged more than 25 who are graduates
#'   \item no_education:  of those aged over 6 having no education
#'   \item employed: activity rate
#'   \item unemployed: unemployment rate
#'   \item increase_popul: standardised natural increase in population
#'   \item migration: standardised change in population due to migration
#'   \item birth_92_94: average birth rate over 1992-94
#'   \item fecundity: three-year average birth rate amongst women of child-bearing age
#'   \item houses: occupied houses built since 1982
#'   \item houses_2WCs: occupied houses with 2 or more WCs
#'   \item houses_heating: occupied houses with fixed heating system
#'   \item TV: TV licence holders
#'   \item cars: number of cars for 100 inhabitants
#'   \item luxury_cars: luxury cars
#'   \item hotels: working in hotels and restaurants
#'   \item banking: working in banking and finance
#'   \item income: average declared income amongst those filing income tax returns
#'   \item income_tax_returns: inhabitants filing income tax returns
#'   \item factories: residents employed in factories and public services
#'   \item factories_more10: employees employed in factories withy more tha 10 employees
#'   \item factories_more50: employees employed in factories withy more tha 50 employees
#'   \item artisanal: artisanal enterprises
#'   \item entrepreneurs: enterpreneous and skilled self-employed among those of working age
#' }
#'
#'  @references
#'  Atkinson, A. C., Riani, M., and Cerioli, A. (2004). \emph{Exploring Multivariate Data with the Forward Search}. Springer-Verlag, New York.
#' @keywords datasets
NULL
#' Old Faithful Geyser Data.
#'
#' A bivariate data set obtained from the Old Faithful Geyser, containing the eruption
#'  length and the length of the previous eruption for 271 eruptions of this geyser in minutes.
#'
#' @name geyser2
#' @docType data
#' @usage data(geyser2)
#' @format A data frame with 271 rows and 2 variables
#' The variables are as follows:
#'
#' \itemize{
#'   \item Eruption length: The eruption length in minutes.
#'   \item Previous eruption length: The length of the previous eruption in minutes.
#' }
#'
#' @references
#'      Garcia-Escudero, L.A., Gordaliza, A. (1999). Robustness properties of k-means and trimmed k-means,
#'      \emph{Journal of the American Statistical Assoc.}, Vol.\strong{94}, No.447, 956-969.
#'
#'      Haerdle, W. (1991). \emph{Smoothing Techniques with Implementation in S}, New York: Springer.
#'
#' @keywords datasets
NULL
#' Mixture M5 Data.
#'
#' A bivariate data set obtained from three normal bivariate distributions with different scales and
#'  proportions 1:2:2. One of the components is strongly overlapping with another one. A 10%% background
#'  noise is added uniformly distributed in a rectangle containing the three normal components and not
#'  strongly overlapping with the three mixture components. A precise description of the M5 data set
#'  can be found in Garcia-Escudero et al. (2008).
#'
#' @name M5data
#' @docType data
#' @usage data(M5data)
#' @format A data frame with 2000 rows and 3 variables
#' The first two columns are the two variables. The last column is the true classification vector where symbol "0" stands for the contaminating data points.
#'
#' @source
#'      Garcia-Escudero, L.A., Gordaliza, A., Matran, C. and Mayo-Iscar, A. (2008). A General Trimming Approach to Robust Cluster Analysis,
#'      \emph{Annals of Statistics}, Vol.\strong{36}, 1324-1345. \doi{10.1214/07-AOS515}.
#'
#' @keywords datasets
NULL
#' Simulated data X.
#'
#' The X dataset has been simulated by Gordaliza, Garcia-Escudero and Mayo-Iscar during the Workshop
#'  ADVANCES IN ROBUST DATA ANALYSIS AND CLUSTERING held in Ispra on October 21st-25th 2013. It is
#'  a bivariate dataset of 200 observations. It presents two parallel components without contamination.
#'
#' @name X
#' @docType data
#' @usage data(X)
#' @format A data frame with 200 rows and 2 variables
#'
#' @keywords datasets
NULL
#' Fishery data.
#'
#' The fishery data consist of 677 transactions of a fishery product in Europe.
#'  For each transaction the Value in 1000 euro and the quantity in Tons are reported.
#'
#' @name fishery
#' @docType data
#' @usage data(fishery)
#' @format A data frame with 677 rows and 2 variables
#'
#' @keywords datasets
NULL
#' Wool data.
#'
#'  The wool data give the number of cycles to failure of a worsted yarn under
#'  cycles of repeated loading. The variables are: length of test specimen;
#'  amplitude of loading cycle; load
#'
#' @name wool
#' @docType data
#' @usage data(wool)
#' @format A data frame with 27 rows and 4 variables
#'
#' @keywords datasets
NULL
#' Mussels data.
#'
#'  These data, introduced by Cook and Weisberg (1994), consist of 82 observations on horse mussels from
#'  New Zeland. The variables are shell length, width, height, mass and muscle mass
#'
#' @name mussels
#' @docType data
#' @usage data(mussels)
#' @format A data frame with 82 rows and 5 variables
#'
#' @keywords datasets
NULL
#' Hawkins data.
#'
#'  These data, simulated by Hawkins, consist of 128 observations
#'      and eight explanatory variables \code{(X1, ..., X8)} and one dependent variable, \code{y}.
#'
#' @name hawkins
#' @docType data
#' @usage data(hawkins)
#' @format A data frame with 128 rows and 9 variables
#'
#' @keywords datasets
NULL
#' Poison
#'
#' The poison data (by Box and Cox, 1964) are about the time to death of animals in a \code{3 x 4}
#'  factorial experiment with four observations at each factor combination. There are no outliers
#'  or influential observations that cannot be reconciled with the greater part of the data by a
#'  suitable transformation.
#'
#' @name poison
#' @docType data
#' @usage data(poison)
#' @format A data frame with 48 rows and 7 variables: six explanatory and one response variable.
#'
#' @source G. E. P. Box and D. R. Cox (1964). An Analysis of Transformations,
#'  \emph{Journal of the Royal Statistical Society. Series B}, \bold{26}2 pp. 211--252.
#'
#' @examples
#'  data(poison)
#'  head(poison)
#'
#' @keywords datasets
NULL
#' Flea
#'
#' Flea-beetle measurements
#'
#' @name flea
#' @docType data
#' @usage data(flea)
#' @format A data frame with 74 rows and 7 variables: six explanatory and one response variable - \code{species}.
#' The variables are as follows:
#'
#' \itemize{
#'   \item tars1: width of the first joint of the first tarsus in microns (the sum of measurements for both tarsi)
#'   \item tars2: the same for the second joint
#'   \item head: the maximal width of the head between the external edges of the eyes in 0.01 mm
#'   \item ade1: the maximal width of the aedeagus in the fore-part in microns
#'   \item ade2: the front angle of the aedeagus ( 1 unit = 7.5 degrees)
#'   \item ade3: the aedeagus width from the side in microns
#'   \item species, which species is being examined - \code{Concinna}, \code{Heptapotamica}, \code{Heikertingeri}
#' }
#'
#'
#' @references A. A. Lubischew (1962), On the Use of Discriminant Functions in Taxonomy, \emph{Biometrics}, \bold{18}4 pp.455--477.
#'
#' @examples
#'  data(flea)
#'  head(flea)
#'
#' @keywords datasets
NULL
#' z1
#'
#' Simulated data to test tclustIC() and tclustICsol(), carbike() functions
#'
#' @name z1
#' @docType data
#' @usage data(z1)
#' @format A data frame with 150 rows and 2 variables.
#' The variables are as follows:
#'
#' \itemize{
#'   \item X1
#'   \item X2
#' }
#'
#' @references
#'  Maitra, R. and Melnykov, V. (2010), Simulating data to study performance
#'  of finite mixture modeling and clustering algorithms, \emph{The Journal of
#'  Computational and Graphical Statistics}, Vol. 19, pp. 354-376.
#'
#' @examples
#'  data(z1)
#'  head(z1)
#'  \dontrun{
#'  (out <- tclustIC(z1, plots=FALSE, whichIC="CLACLA"))
#'  (outCLACLA <- tclustICsol(out, whichIC="CLACLA", plot=FALSE))
#'  carbikeplot(outCLACLA)
#'  }
#'
#' @keywords datasets
NULL
#' Income1
#'
#' Income data taken from the United States Census Bureau. The data are
#'  a random sample of 200 observations referred to four variables.
#'  The goal is to predict HTOTVAL.
#'
#' @name Income1
#' @docType data
#' @usage data(Income1)
#' @format A data frame with 200 rows and 4 variables.
#' The variables are as follows:
#'
#' \itemize{
#'   \item H_NUMPER: Number of persons in household
#'   \item HOTHVAL: All other types of income except HEARNVAL Recode - Total other household income
#'   \item HSSVAL: household income - social security
#'   \item HTOTVAL: total household income (dollar amount)
#' }
#'
#'
#' @source United States Census Bureau (2021). Annual Social and Economic Supplements
##      \url{https://www.census.gov/data/datasets/time-series/demo/cps/cps-asec.html}
#'
#' @examples
#'  data(Income1)
#'  head(Income1)
#'
#' @keywords datasets
NULL
#' Income2
#'
#' A sample of 200 observations of full time employees from a municipality
#'  in Northern Italy who have declared extra income from investment
#'  sources. The variables are as follows.
#'  The goal is the possibility in predicting income level based on
#'  the individual's personal information.

#'
#' @name Income2
#' @docType data
#' @usage data(Income2)
#' @format A data frame with 200 rows and 6 variables.
#' The variables are as follows:
#'
#' \itemize{
#'  \item Age:  Age of the person (the minimum is 19 and the maximum is 73).
#'  \item Education: Number of years of education (the minimum value of 5 is
#'      primary school, and the maximum value is 16 bachelor degree)
#'  \item Gender: A factor - Male or Female
#'  \item ExtraGain: Income from investment sources (profit-losses)
#'      apart from wages/salary
#'  \item Hours: total number of declared hours worked during the week.
#'      The minimum value is 35 and the maximum is 99
#'  \item Income: total yearly income (Euro amount)
#' }
#'
#'

#' @examples
#'  data(Income2)
#'  head(Income2)
#'
#' @keywords datasets
NULL
#' Multiple regression data showing the effect of masking (Atkinson and Riani, 2000).
#'
#' There are 60 observations on a response y with the values of three explanatory variables.
#'  The scatter plot matrix of the data shows y increasing with each of x1, x2 and x3.
#'  The plot of residuals against fitted values shows no obvious pattern. However the
#'  FS finds that there are 6 masked outliers.
#'
#' @name multiple_regression
#' @docType data
#' @usage data(multiple_regression)
#' @format A data frame with 60 rows and 4 variables
#' The variables are as follows:
#'
#' \itemize{
#'   \item X1
#'   \item X2
#'   \item X3
#'   \item y
#' }
#'
#'  @references
#'  Atkinson, A. C., and Riani, M. (2000). \emph{Robust Diagnostic Regression Analysis}. Springer-Verlag, New York.
#' @keywords datasets
NULL
#' Hospital data (Neter et al., 1996)
#'
#'  Data on the logged survival time of 108 patients undergoing liver surgery,
#'  together with four potential explanatory variables. Data are composed of
#'  54 observations plus other 54 observations, introduced to check the model
#'  fitted to the first 54. Their comparison suggests there is no systematic
#'  difference between the two sets. However by looking at some FS plots
#'  (Riani and Atkinson, 2007), we conclude that these two groups are significantly
#'  different
#'
#' @name hospital
#' @docType data
#' @usage data(hospital)
#' @format A data frame with 108 rows and 5 variables
#' The variables are as follows:
#'
#' \itemize{
#'   \item X1
#'   \item X2
#'   \item X3
#'   \item X4
#'   \item y
#' }
#'
#'  @source
#'  J. NETER, M. H. KUTNER, C. J. NACHTSHEIM, W.WASSERMAN, \emph{Applied Linear Statistical Models} (4th edition). McGraw-Hill, New York, 1996.
#'
#'  @references
#'  A. C. ATKINSON, M. RIANI, \emph{Robust Diagnostic Regression Analysis}. Springer-Verlag, New York, 2000.
#'
#' @keywords datasets
NULL
#' Forbes' data on air pressure in the Alps and the boiling point of water (Weisberg, 1985).
#'
#' A data set on air pressure in the Alps and the boiling point of water (Weisberg, 1985).
#'  There are 17 observations on the boiling point of water at different pressures, obtained
#'  from measurements at a variety of elevations in the Alps. The purpose of the experiment was
#'  to allow prediction of pressure from boiling point, which is easily measured, and so to
#'  provide an estimate of altitude: the higher the altitude, the lower the pressure.
#'  The dataset is characterized by one clear outlier.
#'
#' @name forbes
#' @docType data
#' @usage data(forbes)
#' @format A data frame with 17 rows and 2 variables
#' The variables are as follows:
#'
#' \itemize{
#'   \item x: boiling point
#'   \item y: 100 x log(pressure)
#' }
#'
#' @references
#'  Weisberg, S. (1985). \emph{Applied Linear Regression}. Wiley, New York.
#'
#' @examples
#'  data(forbes)
#'  plot(y~x, data=forbes)
#'
#' @keywords datasets
NULL
#' Bank data (Riani et al., 2014).
#'
#' There are 60 observations on a response y with the values of three explanatory variables.
#'  The scatter plot matrix of the data shows y increasing with each of x1, x2 and x3.
#'  The plot of residuals against fitted values shows no obvious pattern. However the
#'  FS finds that there are 6 masked outliers.
#'
#' @name bank_data
#' @docType data
#' @usage data(bank_data)
#' @format A data frame with 1949 rows and 14 variables.
#'  The variables are as follows:
#' \itemize{
#'   \item x1: Personal loans
#'   \item x2: Financing and hire-purchase
#'   \item x3: Mortgages
#'   \item x4: Life insurance
#'   \item x5: Share amount
#'   \item x6: Bond account
#'   \item x7: Current account
#'   \item x8: Salary deposits
#'   \item x9: Debit cards
#'   \item x10: Credit cards
#'   \item x11: Telephone banking
#'   \item x12: Domestic direct debits
#'   \item x13: Money transfers
#'   \item y: Profit/loss
#' }
#'
#' @source
#'  Riani, M., Cerioli, A., Atkinson, A. C., and Perrotta, D. (2014). Supplement to ''Monitoring robust regression''. doi:10.1214/14-EJS897SUPP.
#'
#' @references
#'  Riani, M., Cerioli, A., Atkinson, A. C., and Perrotta, D. (2014). Monitoring robust regression. \emph{Electronic Journal of Statistics}, 8, 642-673.
#'
#' @keywords datasets
NULL
