######
##  VT::04.03.2019
##
##
##  roxygen2::roxygenise("C:/projects/statproj/R/fsdaR", load_code=roxygen2:::load_installed)
##

#' Objects returned by the function \code{\link{tclustfsda}}
#'
#' An object of class \code{\link{tclustfsda.object}} holds information about
#'  the result of a call to \code{\link{tclustfsda}}.
#'
#' @name tclustfsda.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{tclustfsda} is a list containing at least the following components:
#'  \item{call}{the matched call}
#'  \item{muopt}{a k-by-p matrix containing cluster centroid locations. Robust estimate of final centroids of the groups}
#'  \item{sigmaopt}{a p-by-p-by-k array rray containing estimated constrained covariance for the k groups}
#'  \item{idx}{a vector of length n containing assignment of each unit to each of the k groups. Cluster names are integer numbers from 1 to k. 0 indicates trimmed observations.}
#'  \item{size}{a matrix of size (k+1)-by-3. The 1st col is sequence from 0 to k (cluster name); the 2nd col is the number of observations in each cluster; the 3rd col is the percentage of observations in each cluster.
#'
#'      Remark: 0 denotes unassigned units.}
#'  \item{postprob}{n-by-k matrix containing posterior probabilities. \code{postprob[i, j]} contains posterior probabilitiy of unit \code{i} from component (cluster) \code{j}. For the trimmed units posterior probabilities are 0.}
#'  \item{emp}{"Empirical" statistics computed on final classification. When convergence is reached, \code{emp=0}. When convergence is not obtained, this field is a list which contains the statistics of interest: \code{idxemp} (ordered from 0 to k*, k* being the number of groups with at least one observation and 0 representing the possible group of outliers), \code{muemp}, \code{sigmaemp} and \code{sizemp}, which are the empirical counterparts of \code{idx}, \code{muopt}, \code{sigmaopt} and \\code{size}.}
#'  \item{MIXMIX}{BIC which uses parameters estimated using the mixture loglikelihood and the maximized mixture likelihood as goodness of fit measure.
#'
#'  Remark: this output is present just if \code{mixt > 0}.}
#'  \item{MIXCLA}{BIC which uses parameters estimated using the mixture loglikelihood and the maximized mixture likelihood as goodness of fit measure.
#'
#'  Remark: this output is present just if \code{mixt > 0}.}
#'  \item{CLACLA}{BIC which uses the classification likelihood based on parameters estimated using the classification likelihood.
#'
#'  Remark: this output is present just if \code{mixt > 0}.}
#'  \item{notconver}{number of subsets without convergence}
#'  \item{bs}{a vector of length \code{k} containing the units forming initial subset associated with muopt.}
#'  \item{obj}{value of the objective function which is minimized (value of the best returned solution).}
#'  \item{equalweights}{if \code{equalweights=TRUE} means that in the clustering procedure we (ideally) assumed equal cluster weights else (code{equalweitghts=FALSE} means that we allowed for different cluster sizes.}
#'  \item{h}{number of observations that have determined the centroids (number of untrimmed units).}
#'  \item{fullsol}{a vector of size \code{nsamp} which contains the value of the objective function at the end of the iterative process for each extracted subsample.}
#'  \item{X}{the original data matrix X.}
#' @examples
#'
#'  \dontrun{
#'  data(hbk, package="robustbase")
#'  (out <- tclustfsda(hbk[, 1:3], k=2))
#'  class(out)
#'  summary(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL

#' Objects returned by the function \code{\link{tclustfsda}} with the option \code{monitoring=TRUE}
#'
#' An object of class \code{\link{tclusteda.object}} holds information about
#'  the result of a call to \code{\link{tclustfsda}} with the option \code{monitoring=TRUE}.
#'
#' @name tclusteda.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{tclusteda} is a list containing at least the following components:
#'  \item{call}{the matched call}
#'  \item{k}{number of groups}
#'  \item{alpha}{trimming level}
#'  \item{restrfactor}{restriction factor}
#'  \item{IDX}{an \code{n-by-length(alpha)} vector containing assignment of each unit to each of the \code{k}
#'      groups. Cluster names are integer numbers from 1 to k.
#'      0 indicates trimmed observations. The first column refers to \code{alpha[1]}, the second column
#'      refers to \code{alpha[2]}, ..., the last column refers to \code{alpha[length(alpha)]}.}
#'  \item{MU}{a 3 dimensional array of size k-by-p-by-length(alpha) containing the monitoring
#'      of the centroid for each value of alpha. \code{MU[,,1]}, refers to \code{alpha[1]} ...,
#'      \code{MU(,,length(alpha)]} refers to \code{alpha[length(alpha)]}.
#'      The first row in each slice refers to group 1, second row refers to group 2, etc.}
#'  \item{SIGMA}{ A list of length \code{length(alpha)} containing in element \code{j},
#'      with \code{j=1, 2, ..., length(alpha)}, the 3D array of size p-by-p-by-k containing
#'      the \code{k} (constrained) estimated covariance matrices associated with \code{alpha[j]}. }
#'   \item{Amon}{Amon stands for alpha monitoring. Matrix of size \code{(length(alpha)-1)-by-4} which
#'      contains for two consecutive values of alpha the monitoring of three quantities
#'      (change in classification, change in centroid location, change in covariance location).
#'      \itemize{
#'      \item 1st col = value of alpha.
#'      \item 2nd col = ARI index.
#'      \item 3rd col = squared Euclidean distance between centroids.
#'      \item 4th col = squared Euclidean distance between covariance matrices.
#'      }
#'  }

#' @examples
#'
#'  \dontrun{
#'  data(hbk, package="robustbase")
#'  (out <- tclustfsda(hbk[, 1:3], k=2, monitoring=TRUE))
#'  class(out)
#'  summary(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL

#' Objects returned by the function \code{\link{tclustIC}}
#'
#' An object of class \code{\link{tclustic.object}} holds information about
#'  the result of a call to \code{\link{tclustIC}}.
#'
#' @name tclustic.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{tclustic} is a list containing at least the following components:
#'  \item{call}{the matched call}
#'  \item{kk}{a vector containing the values of \code{k} (number of components) which have been considered.
#'      This vector is identical to the optional argument \code{kk} (default is \code{kk=1:5}.}
#'  \item{cc}{a vector containing the values of \code{c} (values of the restriction factor) which
#'      have been considered. This vector is identical to the optional argument \code{cc} (defalt is \code{cc=c(1, 2, 4, 8, 16, 32, 64, 128)}.}
#'  \item{alpha}{trimming level}
#'  \item{whichIC}{Information criteria used}
#'  \item{CLACLA}{a matrix of size \code{length(kk)-times-length(cc)} containinig the value of
#'      the penalized classification likelihood. This output is present only if \code{whichIC="CLACLA"} or  \code{whichIC="ALL"}.}
#'  \item{IDXCLA}{a matrix of lists of size \code{length(kk)-times-length(cc)} containinig the assignment of each unit
#'      using the classification model. This output is present only if \code{whichIC="CLACLA"} or  \code{whichIC="ALL"}.}
#'  \item{MIXMIX}{a matrix of size \code{length(kk)-times-length(cc)} containinig the value of
#'      the penalized mixtrue likelihood. This output is present only if \code{whichIC="MIXMIX"} or  \code{whichIC="ALL"}.}
#'  \item{IDXMIX}{a matrix of lists of size \code{length(kk)-times-length(cc)} containinig the assignment of each unit
#'      using the classification model. This output is present only if \code{whichIC="MIXMIX"} or  \code{whichIC="ALL"}.}
#'  \item{MIXCLA}{a matrix of size \code{length(kk)-times-length(cc)} containinig the value of
#'      the ICL criterion. This output is present only if \code{whichIC="MIXCLA"} or  \code{whichIC="ALL"}.}
#' @examples
#'
#'  \dontrun{
#'  data(hbk, package="robustbase")
#'  (out <- tclustIC(hbk[, 1:3]))
#'  class(out)
#'  summary(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL

#' Objects returned by the function \code{\link{tclustICsol}}
#'
#' An object of class \code{\link{tclusticsol.object}} holds information about
#'  the result of a call to \code{\link{tclustICsol}}.
#'
#' @name tclusticsol.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{tclusticsol} is a list containing at least the following components:
#'  \item{call}{the matched call}
#'  \item{kk}{a vector containing the values of \code{k} (number of components) which have been considered.
#'      This vector is identical to the optional argument \code{kk} (default is \code{kk=1:5}.}
#'  \item{cc}{a vector containing the values of \code{c} (values of the restriction factor) which
#'      have been considered. This vector is identical to the optional argument \code{cc} (defalt is \code{cc=c(1, 2, 4, 8, 16, 32, 64, 128)}.}
#'  \item{alpha}{trimming level}
#'  \item{whichIC}{Information criteria used}
#'  \item{MIXMIXbs}{a matrix of lists of size \code{NumberOfBestSolutions-times-5} which
#'  contains the details of the best solutions for MIXMIX (BIC). Each row refers to a
#'  solution. The information which is stored in the columns is as follows.
#'  \itemize{
#'  \item 1st col = value of k for which solution takes place
#'  \item 2nd col = value of c for which solution takes place;
#'  \item 3rd col = a vector of length \code{d} which contains the values of \code{c}
#'      for which the solution is uniformly better.
#'  \item 4th col = a vector of length \code{d + r} which contains the values of \code{c}
#'      for which the solution is considered stable (i.e. for which the value
#'      of the adjusted Rand index (or the adjusted Fowlkes and Mallows index)
#'      does not go below the threshold defined in input option \code{ThreshRandIndex}).
#'  \item 5th col = string which contains 'true' or 'spurious'. The solution is labelled
#'      spurious if the value of the adjusted Rand index with the previous solutions
#'      is greater than ThreshRandIndex.
#'  }
#'
#'  Remark: the field MIXMIXbs is present only if \code{whichIC=ALL} or \code{whichIC="MIXMIX"}.
#'  }
#'  \item{MIXMIXbsari}{a matrix of adjusted Rand indexes (or Fowlkes and Mallows indexes)
#'      associated with the best solutions for MIXMIX. A matrix of size \code{NumberOfBestSolutions-times-NumberOfBestSolutions}
#'      whose \code{i,j}-th entry contains the adjusted Rand index between classification produced by solution
#'      \code{i} and solution \code{j}, \code{i,j=1,2, ...,NumberOfBestSolutions}.
#'
#'  Remark: the field \code{MIXMIXbsari} is present only if \code{whichIC=ALL} or \code{whichIC="MIXMIX"}.
#'  }
#'  \item{ARIMIX}{a matrix of adjusted Rand indexes between two consecutive value of \code{c}.
#'      Matrix of size \code{k-by-length(cc)-1}. The first column contains the ARI indexes
#'      between \code{cc[2]} and \code{cc[1]} given \code{k}.
#'      The second column contains the the ARI indexes between \code{cc[3]} and \code{cc[2]} given \code{k}.
#'
#'  Remark: the field \code{ARIMIX} is present only if \code{whichIC=ALL} or \code{whichIC="MIXMIX"} or \code{whichIC="MIXCLA"}.
#'  }
#'  \item{MIXCLAbs}{has the same structure as \code{MIXMIXbs} but referres to MIXCLA.
#'
#'  Remark: the field MIXCLAbs is present only if \code{whichIC=ALL} or \code{whichIC="MIXCLA"}.
#'  }
#'  \item{MIXCLAbsari}{has the same structure as \code{MIXMIXbsari} but referres to MIXCLA.
#'
#'  Remark: the field \code{MIXMIXbsari} is present only if \code{whichIC=ALL} or \code{whichIC="MIXCLA"}.
#'  }
#'  \item{CLACLAbs}{has the same structure as \code{MIXMIXbs} but referres to CLACLA.
#'
#'  Remark: the field CLACLAbs is present only if \code{whichIC=ALL} or \code{whichIC="CLACLA"}.
#'  }
#'  \item{CLACLAbsari}{has the same structure as \code{MIXMIXbsari} but referres to CLACLA.
#'
#'  Remark: the field \code{CLACLAbsari} is present only if \code{whichIC=ALL} or \code{whichIC="CLACLA"}.
#'  }
#'  \item{ARICLA}{a matrix of adjusted Rand indexes between two consecutive value of \code{c}.
#'      Matrix of size \code{k-by-length(cc)-1}. The first column contains the ARI indexes
#'      between \code{cc[2]} and \code{cc[1]} given \code{k}.
#'      The second column contains the the ARI indexes between \code{cc[3]} and \code{cc[2]} given \code{k}.
#'
#'  Remark: the field \code{ARICLA} is present only if \code{whichIC=ALL} or \code{whichIC="CLACLA"}.
#'  }
#' @seealso \code{\link{tclustICsol}}, \code{\link{carbikeplot}}
#' @examples
#'
#'  \dontrun{
#'  data(hbk, package="robustbase")
#'  (out <- tclustIC(hbk[, 1:3]))
#'
#'   ## Plot first two best solutions using as Information criterion MIXMIX
#'   print("Best solutions using MIXMIX")
#'   outMIXMIX <- tclustICsol(out, whichIC="MIXMIX", plot=TRUE, NumberOfBestSolutions=2)
#'   class(outMIXMIX)
#'   summary(outMIXMIX)
#'   print(outMIXMIX$MIXMIXbs)
#'  }
#' @export
#' @keywords robust multivariate
NULL

#' Objects returned by the function \code{\link{tclustreg}}
#'
#' An object of class \code{\link{tclustreg.object}} holds information about
#'  the result of a call to \code{\link{tclustreg}}.
#'
#' @name tclustreg.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{tclustreg} is a list containing at least the following components:
#'  \item{call}{the matched call}
#' @seealso \code{\link{tclustreg}}
#' @examples
#'
#'  \dontrun{
#'
#'  ## The X data have been introduced by Gordaliza, Garcia-Escudero & Mayo-Iscar (2013).
#'  ## The dataset presents two parallel components without contamination.
#'
#'  data(X)
#'  y1 = X[, ncol(X)]
#'  X1 = X[,-ncol(X), drop=FALSE]
#'
#'  out <- tclustreg(y1, X1, k=2, alphaLik=0.05, alphaX=0.01, restrfactor=5, trace=TRUE)
#'  class(out)
#'  str(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL
#' Objects returned by the function \code{\link{fsrfan}}
#'
#' An object of class \code{\link{fsrfan.object}} holds information about
#'  the result of a call to \code{\link{fsrfan}}.
#'
#' @name fsrfan.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{fsrfan} is a list containing at least the following components:
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
#' @examples
#'
#'  \dontrun{
#'    data(wool)
#'    XX <- wool
#'    y <- XX[, ncol(XX)]
#'    X <- XX[, 1:(ncol(XX)-1), drop=FALSE]
#'
#'    out <- fsrfan(X, y)
#'
#'    class(out)
#'    summary(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL
#' Objects returned by the function \code{\link{score}}
#'
#' An object of class \code{\link{score.object}} holds information about
#'  the result of a call to \code{\link{score}}.
#'
#' @name score.object
#' @return The functions \code{print()} and \code{summary()} are used to obtain and print a
#'  summary of the results. An object of class \code{score} is a list containing at least the following components:
#'  \enumerate{
#'  \item \code{la}: vector containing the values of lambda for which fan plot is constructed
#'  \item \code{Score}: a vector containing the values of the score test for
#'      each value of the transformation parameter.
#'  \item \code{Lik}: value of the likelihood. This output is produced only if lik=TRUE.
#'  }
#'
#' @examples
#'
#'  \dontrun{
#'    data(wool)
#'    (out <- score(cycles~., data=wool, lik=TRUE))
#'
#'    class(out)
#'    summary(out)
#'  }
#' @export
#' @keywords robust multivariate
NULL
