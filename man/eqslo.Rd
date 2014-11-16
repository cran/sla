\name{eqslo}
\alias{eqslo}
\docType{data}
\title{Equivalent Slopes Data Frame - eqslo}
\description{
A small (input) data frame comprised of three columns in specific order: (1) Factor (group) variable at two levels, (2) x; a numerical regressor vector, and (3) y; a numerical criterion vector. The data are contrived to yield statistically equivalent slopes but statistically different intercepts.}
\usage{data("eqslo")}
\format{
  A data frame with 10 observations on the following 3 variables.
  \describe{
    \item{\code{group}}{a factor with levels \code{one} \code{two}}
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
For the general two-group, straight line ANCOVA problem, the full model fits four parameters - two intercepts and two slopes, one intercept and one slope for each of the two groups. One of the reduced models fits three parameters - two separate intercepts, and a single, common slope. The data in the eqslo data frame are contrived to yield statistically equivalent (parallel) slopes and statistically different intercepts.
}
\references{
Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer.
Draper NR and Smith H (1998) {\emph{Applied Regression Analysis}}. 3rd ed. Wiley.\cr
Fox J (2008) {\emph{Applied Regression Analysis and General Linear Models}}, 2nd ed. Sage.\cr 
Venables WN and Ripley BD (2002) {\emph{Modern Applied Statistics with S}}. 4th ed. Springer.
}
\examples{
data(eqslo)
str(eqslo)
eqsloObj <- sla(eqslo)
plot(eqsloObj, mod = "A")
}
\keyword{datasets}
