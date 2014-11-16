\name{hellung}
\alias{hellung}
\docType{data}
\title{hellung - data frame}
\description{
Data frame concerned with growth conditions of {\emph{Tetrahymena}} cells, collected by Per Hellung-Larsen. Data are from two groups of cell cultures where glucose was either added or not added to the growth medium.  For each culture the average cell diameter and cell concentration were recorded. 
}
\usage{data("hellung")}
\format{
  A data frame with 51 observations on the following 3 variables.
  \describe{
    \item{\code{glucose}}{a factor with levels \code{Yes} \code{No}}
    \item{\code{conc}}{a numeric vector}
    \item{\code{diameter}}{a numeric vector}
  }
}
\details{A plot of the diameter by concentration data reveals that the data are distributed exponentially. For interest with two-group, straight line ANCOVA the raw conc and diameter values should be transformed to their common logs.  Cf. hellunglog data frame in this package. 
}
\source{
Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer. pp. 172-182.
}
\references{
Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer.
}
\examples{
data(hellung) # cf. hellunglog data frame
}
\keyword{datasets}
