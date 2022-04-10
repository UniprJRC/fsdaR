% Check from R:
%  news(db = tools:::.build_news_db_from_package_NEWS_Rd("C:/projects/statproj/R/rrcov/inst/NEWS.Rd"))
\name{NEWS}
\title{News for \R Package \pkg{fsdaR}}
\encoding{UTF-8}

\section{CHANGES in fsdaR VERSION 0.7-0 (2022-04-10)}{
  \subsection{NEW FEATURES}{
    \itemize{
        \item Updated with the new version of FSDA
        \item Added formula interface and plot function for fsrfan()
        \item Added a vignette (Robust transformations in regression)
        \item  Removed the dependence on rrcov and replaced by 'suggest'
    }
  }
  \subsection{BUG FIXES}{
    \itemize{
        \item Tests and corrections of fsrfan()
    }
  }
}
\section{CHANGES in fsdaR VERSION 0.6-5 (2021-11-24)}{
  \subsection{NEW FEATURES}{
    \itemize{
        \item Added a new function: fsrfan()
        \item Added new dataset(s): poison, flea
        \item Fixed a bug in tclustICsol.R (alpha was not passed to the output object)
        \item Updated to the most recent version of MCR: R2021a (V910)
        \item Fixed a bug in fsmmmdrs(): Unrecognized function or variable 'progbar'
    }
  }
}
\section{CHANGES in fsdaR VERSION 0.5-1 (2020-06-24)}{
  \subsection{NEW FEATURES}{
    \itemize{
      \item Upgraded to the newest MATLAB runtime: MCR V96
      \item Added functions covplot(), spmplot() and regspmplot()
      \item Improved the interface of the functions resindexplot() and malindexplot()       
      \item Added data sets \code{X}, \code{fisheries}, \code{mussels} and \code{wool}.      
      \item Added function tclustreg()
    }
  }
}
