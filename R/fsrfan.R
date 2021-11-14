######
##  VT::2.12.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#'  Robust transformations for regression
#'
#' @description The transformations for negative and positive responses were determined
#'  by Yeo and Johnson (2000) by imposing the smoothness condition that the second
#'  derivative of zYJ (\eqn{\lambda}{lambda}) with respect to y be smooth at y = 0. However some authors,
#'  for example Weisberg (2005), query the physical interpretability of this constraint
#'  which is oftern violated in data analysis. Accordingly, Atkinson et al. (2019) and (2020)
#'  extend the Yeo-Johnson transformation to allow two values of the transformations
#'  parameter: \eqn{\lambda_N} for negative observations and \eqn{\lambda_P} for non-negative ones.
#'
#'  FSRfan monitors:
#'
#'  \enumerate{
#'  \item the t test associated with the constructed variable computed assuming the same transformation
#'      parameter for positive and negative observations fixed. In short we call this test,
#'      "global score test for positive observations".
#'  \item the t test associated with the constructed variable computed assuming a different
#'      transformation for positive observations keeping the value of the transformation parameter
#'      for negative observations fixed. In short we call this test, "test for positive observations".
#'  \item the t test associated with the constructed variable computed assuming a different
#'      transformation for negative observations keeping the value of the transformation parameter
#'      for positive observations fixed. In short we call this test, "test for negative observations".
#'  \item the F test for the joint presence of the two constructed variables described in points 2) and 3).
#'  \item the F likelihood ratio test based on the MLE of \eqn{\lambda_P} and \eqn{\lambda_N}.
#'      In this case the residual sum of squares of the null model bsaed on a single trasnformation
#'      parameter \eqn{\lambda} is compared with the residual sum of squares of the model based
#'      on data transformed data using MLE of \eqn{\lambda_P} and \eqn{\lambda_N}.
#'  }
#'
#' @param y Response variable. A vector with \code{n} elements that
#'  contains the response variable.
#'
#' @param x An \code{n x p} data matrix (\code{n} observations and \code{p} variables).
#'  Rows of \code{x} represent observations, and columns represent variables.
#'
#'  Missing values (NA's) and infinite values (Inf's) are allowed,
#'  since observations (rows) with missing or infinite values will
#'  automatically be excluded from the computations.
#'
#' @param intercept wheather to use constant term (default is \code{intercept=TRUE}
#'
#' @param family string which identifies the family of transformations which must be used. Possible values are
#'  \code{c('BoxCox', 'YJ', 'YJpn', 'YJall')}. Default is \code{'BoxCox'}. The Box-Cox family of power
#'  transformations equals \eqn{(y^{\lambda}-1)/\lambda} for \eqn{\lambda} not equal to zero, and \eqn{\log(y)}
#'  if \eqn{\lambda = 0}.
#'  The Yeo-Johnson (YJ) transformation is the Box-Cox transformation of \eqn{y+1} for nonnegative values, and of
#'  \eqn{|y|+1} with parameter \eqn{2-\lambda} for \eqn{y} negative. Remember that BoxCox can be used only
#'  if input y is positive. Yeo-Johnson family of transformations does not have this limitation.
#'  If \code{family='YJpn'} Yeo-Johnson family is applied but in this case it is also possible
#'  to monitor (in the output arguments \code{Scorep} and \code{Scoren}) the score test for
#'  positive and negative observations respectively. If \code{family='YJall'}, it is also
#'  possible to monitor the joint F test for the presence of the two constructed variables
#'  for positive and negative observations.
#'
#' @param la values of the transformation parameter for which it is necessary
#'  to compute the score test. Default value of lambda is
#'  \code{la=c(-1, -0.5, 0, 0.5, 1)}, i.e., the five most common values of lambda.
#'
#' @param init Search initialization. It specifies the initial subset size to start
#'  monitoring the value of the score test. If \code{init} is not specified it will
#'  be set equal to: \code{p+1}, if the sample size is smaller than 40 or
#'  \code{min(3 * p + 1, floor(0.5 * (n+p+1)))}, otherwise.
#'
#' @param plot If \code{plot=FALSE} (default) or \code{plot=0}  no plot is produced.
#'  If \code{plot=TRUE} a fan plot is shown.
#'
#' @param msg  Controls whether to display or not messages on the screen If \code{msg==TRUE} (default)
#'  messages are displayed on the screen. If \code{msg=2}, detailed messages are displayed,
#'  for example the information at iteration level.
#'
#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#'
#' @param ... potential further arguments passed to lower level functions.
#'
#' @return  An S3 object of class \code{\link{fsrfan.object}} will be returned which is basically a list
#'  containing the following elements:
#'  \enumerate{
#'  \item \code{la} vector containing the values of lambda for which fan plot is constructed
#'  \item \code{bs} matrix of size \code{p X length(la)} containing the units forming
#'      the initial subset for each value of lambda
#'  \item \code{Score} a matrix containing the values of the score test for
#'      each value of the transformation parameter:
#'      \itemize{
#'      \item 1st col = fwd search index;
#'      \item 2nd col = value of the score test in each step of the fwd search for la[1]
#'      \item ...
#'      }
#'  \item \code{Scorep} matrix containing the values of the score test for positive
#'      observations for each value of the transformation parameter.
#'
#'      Note: this output is present only if input option \code{family='YJpn'} or \code{family='YJall'}.
#'
#'  \item \code{Scoren} matrix containing the values of the score test for negative observations
#'      for each value of the transformation parameter.
#'
#'      Note: this output is present only if input option 'family' is 'YJpn' or 'YJall'.
#'
#'  \item \code{Scoreb} matrix containing the values of the score test for the joint
#'      presence of both constructed variables (associated with positive and negative
#'      observations) for each value of the transformation parameter. In this case
#'      the reference distribution is the \eqn{F} with 2 and \code{subset_size - p}
#'      degrees of freedom.
#'
#'      Note: this output is present only if input option \code{family='YJall'}.
#'
#'  \item \code{Un} a three-dimensional array containing \code{length(la)} matrices of
#'      size \code{retnUn=(n-init) X retpUn=11}. Each matrix contains
#'      the unit(s) included in the subset at each step in the search associated
#'      with the corresponding element of \code{la}.
#'
#'      REMARK: at each step the new subset is compared with the old subset.
#'      \code{Un} contains the unit(s) present in the new subset but not in the old one.
#'  }
#'
#' @references
#'  Atkinson, A.C. and Riani, M. (2000), \emph{Robust Diagnostic Regression Analysis} Springer Verlag, New York.
#'
#'  Atkinson, A.C. and Riani, M. (2002), Tests in the fan plot for robust, diagnostic transformations in regression,
#'      \emph{Chemometrics and Intelligent Laboratory Systems}, \bold{60}, pp. 87--100.
#'
#'  Atkinson, A.C. Riani, M. and  Corbellini A. (2019), The analysis of transformations for profit-and-loss data,
#'      \emph{Journal of the Royal Statistical Society, Series C, "Applied Statistics"}, \bold{69}, pp. 251--275.
#'      \doi{10.1111/rssc.12389}
#'
#'  Atkinson, A.C. Riani, M. and Corbellini A. (2021), The Box-Cox Transformation: Review and Extensions,
#'      \emph{Statistical Science}, \bold{36}(2), pp. 239--255. \doi{10.1214/20-STS778}.
#'
#' @examples
#'
#' \dontrun{
#'    data(wool)
#'    XX <- wool
#'    y <- XX[, ncol(XX)]
#'    X <- XX[, 1:(ncol(XX)-1), drop=FALSE]
#'
#'    out <- FSRfan(y, X)                    # call 'FSRfan' with all default parameters
#' }
#'
#' @export
#' @author FSDA team, \email{valentin.todorov@@chello.at}

fsrfan <- function(y, x, intercept=TRUE, plot=FALSE,
        family=c("BoxCox", "YJ", "YJpn", "YJall"), la=c(-1, -0.5, 0, 0.5, 1), init,
        msg=TRUE,
        trace=FALSE, ...)
{
    if(is.data.frame(x))
      x <- data.matrix(x)
    else if(!is.matrix(x))
      x <- matrix(x, length(x), 1,
                  dimnames = list(names(x), deparse(substitute(x))))
    if(!is.numeric(x)) stop("x is not a numeric")

    if(is.data.frame(y))
      y <- data.matrix(y)
    else if(!is.matrix(y))
      y <- matrix(y, length(y), 1,
                  dimnames = list(names(y), deparse(substitute(y))))
    if(!is.numeric(y)) stop("y is not a numeric")

    storage.mode(x) <- "double"
    storage.mode(y) <- "double"

    dx <- dim(x)
    xn <- (dnx <- dimnames(x))[[2]]
    xn <- if (!is.null(xn))
        xn
    else if (dx[2] > 1)
        paste("X", 1:dx[2], sep = "")
    else if(dx[2])
        "X"
    dimnames(x) <- list(dnx[[1]], xn)

    n <- nrow(x)
    p <- ncol(x)

    family <- match.arg(family)

    control <- list(...)
    control$intercept <- ifelse(intercept, 1, 0)
    control$la <- la
    control$plots <- ifelse(plot, 1, 0)
    control$family <- family

    if(!missing(init))
        control$init <- init

    xmsg <- 0
    if(is.logical(msg))
        xmsg <- ifelse(msg, 1, 0)
    else  if(is.numeric(msg) && msg >= 0 && msg <= 2)
        xmsg <- msg
    else
        stop("Invalid parameter 'msg'. Should be TRUE/FALSE or 0, 1, 2.")
    control$msg <- xmsg

    outclass <- "fsrfan"

    parlist = c(.jarray(y, dispatch=TRUE), .jarray(x, dispatch=TRUE))
    paramNames = names(control)
    if(trace)
        print(control)

    if(length(paramNames) > 0)
    {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i]
            paramValue = control[[i]]

            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    out <- callFsdaFunction("FSRfan", "[Ljava/lang/Object;", 1, parlist)
    if(is.null(out))
        return(NULL)

    arr1 = .jcast(out[[1]], "com/mathworks/toolbox/javabuilder/MWStructArray")
    arr = .jnew("org/jrc/ipsc/globesec/sitaf/fsda/FsdaMWStructArray", arr1)

    if(trace)
    {
        cat("\nReturning from MATLAB FSRfan().  Fields returned by MATLAB: \n")
        print(arr$fieldNames())
    }

    Score <- if(as.integer(arr$hasField("Score", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Score", as.integer(1)), "[[D", simplify = TRUE))

    Scorep <- if(as.integer(arr$hasField("Scorep", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scorep", as.integer(1)), "[[D", simplify = TRUE))

    Scoren <- if(as.integer(arr$hasField("Scoren", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scoren", as.integer(1)), "[[D", simplify = TRUE))

    Scoreb <- if(as.integer(arr$hasField("Scoreb", as.integer(1))) != 1) NULL
             else as.matrix(.jevalArray(arr$get("Scoreb", as.integer(1)), "[[D", simplify = TRUE))

    la <- as.matrix(.jevalArray(arr$get("la", as.integer(1)), "[[D", simplify = TRUE))
    bs <- as.matrix(.jevalArray(arr$get("bs", as.integer(1)), "[[D", simplify = TRUE))

    ## Un is returned as a cell array (a list of matrices). Convert it to
    ##  a tri-dimensional array
    Un <- unwrapComplexNumericCellArray(as.matrix(.jevalArray(arr$get("Un", as.integer(1)))))
    aUn <- array(dim=c(dim(Un[[1]])[2], dim(Un[[1]])[1], length(Un)))
    for(ix in 1:length(Un))
        aUn[,,ix] <- t(Un[[ix]])
    dimnames(aUn) <- list(aUn[,1,1], c("Step", 1:10), la)

    X <- if(as.integer(arr$hasField("X", as.integer(1))) != 1) NULL
                else as.matrix(.jevalArray(arr$get("X", as.integer(1)), "[[D", simplify = TRUE))
    y <- if(as.integer(arr$hasField("y", as.integer(1))) != 1) NULL
                else as.matrix(.jevalArray(arr$get("y", as.integer(1)), "[[D", simplify = TRUE))

    ans <- list(call=match.call(), la=la, bs=bs, Score=Score, Un=aUn, X=X, y=y)

    if(family %in% c("YJpn", "YJall")) {
        ans$Scorep <- Scorep
        ans$Scoren <- Scoren

        if(family == "YJall") {
            ans$Scoreb <- Scoreb
        }
    }

    freeMatlabResources(out)

    class(ans) <- outclass
    return (ans)
}
