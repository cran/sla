\name{sla-package}
\alias{sla-package}
\docType{package}
\title{Two-Group, Straight-Line ANCOVA}
\description{
Fits four linear models ("A", "B", "C", and "D") for the two-group, straight-line ANCOVA problem. (A) Model "A", the full model - fits two intercepts and two slopes (separate intercepts and slopes for each group); (B) Model "B", a reduced model - fits single intercept and single slope to all the data (ignoring group designation); (C) Model "C", a reduced model - fits two different intercepts and a single, common slope; (D) Model "D", a reduced model - fits a single, common intercept and two different slopes.
}
\details{
\tabular{ll}{
Package: \tab sla\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-08-24\cr
License: \tab GPL-2\cr
}
The \code{'sla'} function fits four linear models ("A", "B", "C", and "D"), described above, in connection with the two-group, straight-line ANCOVA problem. The \code{'print'} function produces directly interpretable coefficients (intercepts and slopes) for each model "A", "B", "C", and "D".  The \code{'summary'} function presents two tables.  The top table displays the number of parameters fit, the residual degrees of freedom, the residual sum of squares, and the residual mean square for each model "A", "B", "C", and "D". The bottom table displays reductions in sums of squares, F statistics, and probabilities associated with models "B", "C", and "D",respectively, vs. model "A", thus testing for three null hypotheses: (1) equivalence of the data sets for the two groups, (2) equivalence of slopes for the two groups, and (3) equivalence of intercepts for the two groups.
}   
\author{
W Greg Alvord

Maintainer: W Greg Alvord <greg.alvord@nih.gov>
}
\references{
Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer.\cr
Draper NR and Smith H (1998) {\emph{Applied Regression Analysis}}. 3rd ed. Wiley.\cr
Fox J (2008) {\emph{Applied Regression Analysis and General Linear Models}}, 2nd ed. Sage.\cr 
Fox J and Weisberg S (2011) {\emph{An R Companion to Applied Regression}}, 2nd ed. Sage.\cr
Searle SR (1971) {\emph{Linear Models}}, Wiley.\cr
Venables WN and Ripley BD (2002) {\emph{Modern Applied Statistics with S}}. 4th ed. Springer.
}
\keyword{ package }
\keyword{ regression }
\keyword{ linear models}
\examples{
data(eqslo)
eqsloObj <- sla(eqslo)
eqsloObj
summary(eqsloObj)
attributes(eqsloObj)
eqsloObj$Mod.C # best fitting reduced model, equivalent slopes, different intercepts
summary(eqsloObj$Mod.C) # lm summary of Model C
plot(eqsloObj, mod = 'C') # plot of data eqslo, fitted lines with equal slopes, different intercepts
}
