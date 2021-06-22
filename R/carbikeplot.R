######
##  VT::17.12.2018
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR")
##
#' Produces the carbike plot to find best relevant clustering solutions obtained by \code{\link{tclustICsol}}
#'
#' @description Takes as input the output of function  \code{\link{tclustICsol}}
#'  (that is a structure containing the best relevant solutions) and produces the
#'  car-bike plot. This plot provides a concise summary of the best relevant solutions.
#'  This plot shows on the horizontal axis the value of \code{c} and on the vertical axis
#'  the value of \code{k}. For each solution we draw a rectangle for the interval of
#'  values for which the solution is best and stable and a horizontal line which departs
#'  from the rectangle for the values of \code{c} in which the solution is only stable.
#'  Finally, for the best value of \code{c} associated to the solution, we show a circle
#'  with two numbers, the first number indicates the ranked solution among those which are
#'  not spurious and the second one the ranked number including the spurious solutions.
#'  This plot has been baptized 'car-bike', because the first best solutions (in general
#'  2 or 3) are generally best and stable for a large number of values of \code{c} and
#'  therefore will have large rectangles. In addition, these solutions are likely to
#'  be stable for additional values of \code{c} and therefore are likely to have horizontal
#'  lines departing from the rectangles (from here the name 'cars'). Finally, local minor
#'  solutions (which are associated with particular values of \code{c} and \code{k}) do not
#'  generally present rectangles or lines and are shown with circles (from here the
#'  name 'bikes').
#'
#' @param out An S3 object of class \code{\link{tclusticsol.object}},
#'  (output of \code{\link{tclustICsol}}) containing the relevant solutions.
#' @param SpuriousSolutions Wheather to include or not spurious solutions. By default spurios
#'  solutions are not included into the plot.

#' @param trace Whether to print intermediate results. Default is \code{trace=FALSE}.
#' @param ... potential further arguments passed to lower level functions.
#' @references
#'      Cerioli, A., Garcia-Escudero, L.A., Mayo-Iscar, A. and Riani M. (2017).
#'      Finding the Number of Groups in Model-Based Clustering via Constrained Likelihoods,
#'      emph{Journal of Computational and Graphical Statistics}, pp. 404-416,
#'      https://doi.org/10.1080/10618600.2017.1390469.
#' @examples
#'  \dontrun{
#'  data(geyser2)
#'  out <- tclustIC(geyser2, whichIC="MIXMIX", plot=FALSE, alpha=0.1)
#'
#'  ## Plot first two best solutions using as Information criterion MIXMIX
#'  print("Best solutions using MIXMIX")
#'  outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)
#'
#'  print(outMIXMIX$MIXMIXbs)
#'
#'  carbikeplot(outMIXMIX)
#'  }
#' @export

#' @author FSDA team, \email{valentin.todorov@@chello.at}

carbikeplot <- function(out, SpuriousSolutions=FALSE,
    trace=FALSE, ...)
{

    ## Perform check on the structure of 'out'
    if(missing(out) | !inherits(out, "tclusticsol"))
        stop("Function defined only for output of tclustICsol().")

    ## Remove the call component
    outStr <- out[-which(names(out) == "call")]

    control <- list(SpuriousSolutions=SpuriousSolutions)

    # Initialize parlist to the input values. All parameters from the control structure
    # must be added to the R list *before* converting it into a MATLAB struct

    ## VT::16.10.2017: the mandatory input parameters are all contained
    ##  in an S3 class (a list), which is the output of one of the tclustICsol() fucntion.
    ##  Convert the S3 class to a Matlab structure and initialize with it the parameter list.
    ##  NOTE: this is identical to the initialization of the parameter list in fsreg()
    ##      with the mandatory X and y.
    ##
    parlist <- list(list2MatlabStruct(outStr))
    paramNames = names(control)

    if (length(paramNames) > 0) {
        for (i in 1:length(paramNames)) {
            paramName = paramNames[i];
            paramValue = control[[i]];
            matlabValue = rType2MatlabType(paramName, paramValue)
            parlist = c(parlist, .jnew("java/lang/String", paramName), matlabValue)
        }
    }

    matlabParams <- parlist
    out <- callFsdaFunction("carbikeplot", "[Ljava/lang/Object;", 1, parlist)
    ans = list()

    freeMatlabResources(out)
    return(invisible(ans))
}
