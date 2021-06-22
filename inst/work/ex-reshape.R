##  When there are multiple measurements of the same subject,
##  across time or using different tools, the data is often described
##  as being in "wide" format if there is one observation row per
##  subject with each measurement present as a different variable
##  and "long" format if there is one observation row per measurement
##  (thus, multiple rows per subject). Different functions require
##  different formats, and so the need to reshape a data set may arise.

##  Below, we start with a data set in wide format. Students have been
##  measured using five metrics: read, write, math, science, and socst.


hsb2 <- read.table('https://stats.idre.ucla.edu/stat/r/faq/hsb2.csv', header=T, sep=",")
head(hsb2)

##  To reformat this data set into long form, we will use the reshape function.
##  The arguments we provide include a list of variable names that define the
##  different times or metrics (varying), the name we wish to give the
##  variable containing these values in our long data set (v.names),
##  the name we wish to give the variable describing the different
##  times or metrics (timevar), the values this variable will have
##  (times), and the end format for the data (direction).
##  Additionally, we have provided new row names.

## Wide to long

l <- reshape(hsb2,
  varying = c("read", "write", "math", "science", "socst"),
  v.names = "score",
  timevar = "subj",
  times = c("read", "write", "math", "science", "socst"),
  new.row.names = 1:1000,
  direction = "long")

l.sort <- l[order(l$id),]
head(l.sort)


##  After sorting by id, we can see that we have five rows per student
##  and their five scores appear in the score variable with the subj
##  variable indicating which test on which the score was measured.
##  For each of the five rows per id, the female, race, ses, schtyp,
##  and prog variables are unchanging.

##  We can similarly go from this long form back to our original wide
##  form again using reshape with different arguments (most importantly,
##  direction = "wide"). With timevar, we indicate the variable that will
##  define the multiple measurements per subject. With idvar, we list
##  the variables that should do not vary within subject.


## Long to wide

w <- reshape(l.sort,
  timevar = "subj",
  idvar = c("id", "female", "race", "ses", "schtyp", "prog"),
  direction = "wide")

head(w)

##---------------------------------------------------------------
dim(w)
##[1] 200  11

dim(hsb2)
##[1] 200  11
