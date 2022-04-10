\name{fsreda.object}
\title{Description of \code{fsreda} Objects}
\alias{fsreda.object}
\description{
  An object of class \code{\link{fsreda.object}} holds information about 
  the result of a call to \code{\link{fsreg}}.
}
\value{
  The object itself is basically a \code{\link{list}} with the following 
  components: 

    \item{RES}{n x (n-init+1) matrix containing the monitoring of scaled residuals: 
        the first row is the residual for the first unit, ..., n-th row is 
        the residual for the n-th unit.}
    \item{LEV}{(n+1) x (n-init+1) matrix containing the monitoring of leverage: the first row 
        is the leverage for the first unit, ..., n-th row is 
        the leverage for the n-th unit.}
    \item{BB}{n x (n-init+1) matrix containing the information about the units 
        belonging to the subset at each step of the forward search: first col 
        contains indexes of the units forming subset in the initial step; ...; 
        last column contains units forming subset in the final step (all units).}
    \item{mdr}{n-init x 3 matrix which contains the monitoring of minimum 
        deletion residual or (m+1)-ordered residual at each step of the 
        forward search: first col is the fwd search index (from init to n-1);
        2nd col = minimum deletion residual; 3rd col = (m+1)-ordered residual.
        
        Remark: these quantities are stored with sign, that is the min deletion 
        residual is stored with negative sign if it corresponds to a negative 
        residual.}
    \item{msr}{n-init+1 x 3 matrix which contains the monitoring of maximum 
        studentized residual or m-th ordered residual: first col is the 
        fwd search index (from init to n); 2nd col = maximum studentized residual; 
        3rd col = (m)-ordered studentized residual.}

    \item{nor}{(n-init+1) x 4 matrix containing the monitoring of normality 
        test in each step of the forward search: first col = fwd search 
        index (from init to n); 2nd col = Asymmetry test; 
        3rd col = Kurtosis test; 4th col = Normality test.}
    \item{Bols}{(n-init+1) x (p+1) matrix containing the monitoring of 
        estimated beta coefficients in each step of the forward search.}
    \item{S2}{(n-init+1) x 4 matrix containing the monitoring of S2 or R2 
        in each step of the forward search: 
        \enumerate{
            \item 1st col = fwd search index (from init to n);
            \item 2nd col = monitoring of S2;
            \item 3rd col = monitoring of R2;
            \item 4th col = monitoring of rescaled S2.
        }
        In this case the estimated of s2 at step m is divided by the 
        consistency factor (to make the estimate asymptotically unbiased).}
    \item{coo}{(n-init+1) x 3 matrix containing the monitoring of Cook or 
        modified Cook distance in each step of the forward search:
        \enumerate{
            \item 1st col = fwd search index (from init to n);
            \item 2nd col = monitoring of Cook distance;
            \item 3rd col = monitoring of modified Cook distance.
        }}
    \item{Tols}{(n-init+1) x (p+1) matrix containing the monitoring of 
        estimated t-statistics (as specified in option input 'tstat') 
        in each step of the forward search}
    \item{Un}{(n-init) x 11 matrix which contains the unit(s) included in the 
        subset at each step of the fwd search. 
        
        REMARK: in every step the new subset is compared with the old subset. 
        Un contains the unit(s) present in the new subset but not in the old 
        one Un(1,2) for example contains the unit included in step init+1 
        Un(end,2) contains the units included in the final step of the search.}
    \item{betaINT}{Confidence intervals for the elements of 
        \ifelse{html}{\out{&beta;}}{\eqn{\beta}{beta}}. betaINT is 
        a (n-init+1)-by-2*length(confint)-by-p 3D array. Each third dimension 
        refers to an element of beta: 
        \enumerate{
        \item \code{betaINT[,,1]} is associated with first element of beta;
        \item ...;
        \item \code{betaINT[,,p]} is associated with last element of beta.
        }
        The first two columns contain the lower and upper confidence 
        limits associated with conflev(1). Columns three and four contain 
        the lower and upper confidence limits associated with conflev(2); ...;
        The last two columns contain the lower and upper confidence 
        limits associated with conflev(end).
        For example \code{betaINT[,3:4,5]} contain the lower and upper confidence limits 
        for the fifth element of beta using confidence level specified in 
        the second element of input option \code{conflev}.}
    \item{sigma2INT}{confidence interval for s2.
        \enumerate{
        \item 1st col = fwd search index;
        \item 2nd col = lower confidence limit based on conflev(1);
        \item 3rd col = upper confidence limit based on conflev(1);
        \item 4th col = lower confidence limit based on conflev(2);
        \item 5th col = upper confidence limit based on conflev(2);
        \item ...
        \item penultimate col = lower confidence limit based on conflev(end);
        \item last col = upper confidence limit based on conflev(end).
        }}
    \item{X}{the data matrix X}
    \item{y}{the response vector y}

  The object has class \code{"fsreda"}.
}
\examples{
 \dontrun{
    data(hbk, package="robustbase")
    (out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE))
    class(out)
    summary(out)
}
}
\keyword{robust}
\keyword{regression}
