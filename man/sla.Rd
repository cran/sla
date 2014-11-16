\name{sla}
\alias{sla}
\alias{sla.default}
\alias{plot.sla}
\alias{print.sla}
\alias{summary.sla}
\alias{print.summary.sla}
\title{Two-Group, Straight-Line ANCOVA: Four Models}
\description{
Fits four linear models ("A", "B", "C", and "D") for the two-group, straight-line ANCOVA problem. (A) Model "A", the full model - fits two intercepts and two slopes (separate intercepts and slopes for each group); (B) Model "B", a reduced model - fits single intercept and single slope to all the data (ignoring group designation); (C) Model "C", a reduced model - fits two different intercepts and a single, common slope; (D) Model "D", a reduced model - fits a single, common intercept and two different slopes. }
\usage{
sla(facxy, ...)
\method{sla}{default}(facxy, ...)
\method{print}{sla}(x, ...)
\method{summary}{sla}(object, ...)
\method{plot}{sla}(x, modelType2Plot = "A", ...)
}
\arguments{
  \item{facxy}{ a data frame with three columns in specific order: (1) factor (Group) variable, (2) numeric x-axis predictor, regressor (or independent) variable, and (3) numeric y-axis criterion (or dependent) variable.}
  \item{x}{ an object of class \code{'sla'}, i.e., a list containing data frames, coefficients, and fitted models.}
  \item{object}{ an object of class \code{'sla'}, i.e., a list containing data frames, coefficients, and fitted models.}
  \item{modelType2Plot}{ a character letter, "A", "B", "C", or "D", to indicate which model, with its associated fitted lines (abline), to plot.} 
  \item{\dots}{ not used.} 
}
\value{
Returns an object of class "sla", which is a list containing the following components:
\item{Call}{model call}
\item{INPUT.df}{input data frame}
\item{Summary of Input Data Frame}{produced from the generic function summary().}
\item{Mod.A}{an object of class "lm" for the fit of Model A.}
\item{Mod.B}{an object of class "lm" for the fit of Model B.}
\item{Mod.C}{an object of class "lm" for the fit of Model C.}
\item{Mod.D}{an object of class "lm" for the fit of Model D.}
\item{Fit.Table}{a data frame containing a description of the fit, number of parameters estimated, residual degrees of freedom, residual sum of squares, and residual mean square for each model "lm" fit, i.e., for models A, B, C and D.}
\item{Test.Table}{a data frame containing a description of three tests of (reduced) models B, C, and D vs. the (full) model A, the degrees of freedom associated with the anova() comparison of the reduced and full models [note: always 2, 1, and 1], the difference between the residual sums of squares between the reduced and full models, the F statistic associated with the test, and the probability associated with the corresponding F statistic for the test.}
\item{Fit.Table.Pretty}{a data frame containing essentially the same information as in Fit.Table but displayed in a prettier format.}
\item{Test.Table.Pretty}{a data frame containing essentially the same information as in Test.Table but displayed in a prettier format.} 
}
\references{
Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer.\cr
Draper NR and Smith H (1998) {\emph{Applied Regression Analysis}}. 3rd ed. Wiley.\cr
Fox J (2008) {\emph{Applied Regression Analysis and General Linear Models}}, 2nd ed. Sage.\cr 
Fox J and Weisberg S (2011) {\emph{An R Companion to Applied Regression}}, 2nd ed. Sage.\cr
Searle SR (1971) {\emph{Linear Models}}, Wiley.\cr
Venables WN and Ripley BD (2002) {\emph{Modern Applied Statistics with S}}. 4th ed. Springer.
}
\author{W Greg Alvord}
\note{
(1) The hellung data frame with conc and diameter raw values is available in the ISwR library from Dalgaard P (2002) {\emph{Introductory Statistics with R}}. Springer.\cr 
(2) Simulated data sets (without setting the seed) using the code provided in the examples yield the desired outcomes 95 percent of the time. 
}
\examples{
data(eqslo)
eqsloObj <- sla(eqslo)
eqsloObj
summary(eqsloObj)
attributes(eqsloObj)
eqsloObj$Mod.C # best fitting reduced model, equivalent slopes, different intercepts
summary(eqsloObj$Mod.C) # lm summary of Model C
plot(eqsloObj, mod = 'C') # plot of data eqslo, fitted lines with equal slopes, different intercepts
##
data(eqint)
eqintObj <- sla(eqint)
eqintObj
summary(eqintObj)
attributes(eqintObj)
eqintObj$Mod.D # best fitting reduced model, equivalent intercepts, different slopes
summary(eqintObj$Mod.D) # lm summary of Model D
plot(eqintObj, mod = 'D') # plot of data eqint, fitted lines with equal intercepts, different slopes
##
## See MASS, 4th ed., pp 139-144 for ANCOVA of whiteside data
##
library(MASS)
data(whiteside) 
whitesideObj <- sla(whiteside)
summary(whitesideObj) # See MASS, 4th ed., pp 139-144 for ANCOVA of whiteside data
par(mfrow = c(2,2))
plot(whitesideObj, "A") # different intercepts and different slopes
plot(whitesideObj, "B") # common intercept and common slope
plot(whitesideObj, "C") # different intercepts, common slope
plot(whitesideObj, "D") # different slopes, common intercept
##
## See Dalgaard, pp. 172-182 for ANCOVA of (log10) hellung data
##
data(hellunglog)
hellunglogObj <- sla(hellunglog)
hellunglogObj
summary(hellunglogObj) # See Dalgaard, pp. 172-182 for ANCOVA of (log10) hellung data
par(mfrow = c(2,2))
plot(hellunglogObj, "A") # different intercepts and different slopes
plot(hellunglogObj, "B") # common intercept and common slope
plot(hellunglogObj, "C") # different intercepts, common slope
plot(hellunglogObj, "D") # different slopes, common intercept
##
## Simulate data for common slope, different intercepts 
## 
group <- c(rep('A', 50), rep('B', 50))
x <- rep(1:50, 2)
set.seed(50) #
y1 <- rnorm(50) + 4*.05*x[1:50]
set.seed(100)
y2 <- rnorm(50) + 7 + y1
y <- c(y1, y2)
esdf <- data.frame(group, x, y)
esdfObj <- sla(esdf)
esdfObj
summary(esdfObj)
par(mfrow = c(2,2))
plot(esdfObj, mod = 'A')
plot(esdfObj, mod = 'B')
plot(esdfObj, mod = 'C')
plot(esdfObj, mod = 'D')
##
## Simulate data for common intercept, different slopes
## 
group <- c(rep('A', 50), rep('B', 50))
x <- rep(1:50, 2)
set.seed(49) # 
y1 <- rnorm(50) + 1*.03*x[1:50]
set.seed(99) #
y2 <- rnorm(50) + 1*.25*x[51:100]
y <- c(y1, y2)
eidf <- data.frame(group, x, y)
eidfObj <- sla(eidf)
eidfObj
summary(eidfObj)
par(mfrow = c(2,2))
plot(eidfObj, mod = 'A')
plot(eidfObj, mod = 'B')
plot(eidfObj, mod = 'C')
plot(eidfObj, mod = 'D')
}
\keyword{ regression }
\keyword{ linear models }
