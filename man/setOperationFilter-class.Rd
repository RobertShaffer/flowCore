% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{setOperationFilter-class}
\alias{setOperationFilter-class}
\alias{setOperationFilter}
\title{Class "setOperationFilter"}
\description{
This is a Superclass for the unionFilter, intersectFilter, complementFilter
and subsetFilter classes, which all consist of two or more component filters
and are constructed using set operators (\code{&}, \code{|}, \code{!}, and
\code{\%&\%} or \code{\%subset\%} respectively).
}
\section{Slots}{

\describe{
\item{\code{filters}}{Object of class \code{"list"}, containing the component filters.}

\item{\code{filterId}}{Object of class \code{"character"}
referencing the filter applied.}
}}

\section{Extends}{


Class \code{"\linkS4class{filter}"}, directly.
}

\seealso{
\code{\link[flowCore:filter-methods]{filter}}

Other setOperationFilter classes: \code{\link{complementFilter-class}},
  \code{\link{intersectFilter-class}},
  \code{\link{subsetFilter-class}},
  \code{\link{unionFilter-class}}
}
\author{
B. Ellis
}
\concept{setOperationFilter classes}
\keyword{classes}
