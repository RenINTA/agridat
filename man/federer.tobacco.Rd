\name{federer.tobacco}
\alias{federer.tobacco}
\docType{data}
\title{
  Height of Tobacco plants exposed to radiation
}
\description{
  Height of Tobacco plants exposed to radiation
}
\format{
  A data frame with 56 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{block}}{Block, numeric}
    \item{\code{dose}}{Radiation dose, roentgens}
    \item{\code{height}}{Height of 20 plants, cm}
  }
}
\details{
  An experiment conducted in 1951 and described in Federer (1954).  The
  treatment involved exposing tobacco seeds to seven different doses of
  radiation.  The seedlings were transplanted to the field in an RCB
  experiment with 7 treatments in 8 blocks.  The physical layout of the
  experiment was in 8 rows and 7 columns.  Shortly after the plants were
  transplanted to the field it became apparent that an environmental
  gradient existed. The response variable was the total height
  (centimeters) of 20 plants.
}
\source{
  Walter T Federer and C S Schlottfeldt, 1954. 
  The use of covariance to control gradients in experiments.
  \emph{Biometrics}, 10, 282--290.
}
\references{
  R. D. Cook and S. Weisberg (1999).
  \emph{Applied Statistics Including Computing and Graphics}.

  Walter T Federer and Russell D Wolfinger, 2003.
  PROC GLM and PROC MIXED Codes for Trend Analyses for
  Row-Column Designed Experiments,
  \emph{Handbook of Formulas and Software for Plant Geneticists and
    Breeders}, Haworth Press.

  Paul N Hinz, 1987.
  Nearest-Neighbor Analysis in Practice,
  \emph{Iowa State Journal of Research}, 62, 199--217.
}
\examples{
dat <- federer.tobacco

# RCB analysis.  Treatment factor not signficant.
dat <- transform(dat, dosef=factor(dose), rowf=factor(row),
                 blockf=factor(block))
m1 <- lm(height ~ blockf + dosef, data=dat)
anova(m1)

# RCB residuals show strong spatial trends
levelplot(resid(m1) ~ row * block, data=dat, col.regions=RedGrayBlue(21))

# Row-column analysis.  Treatment now significant
m2 <- lm(height ~ rowf + blockf + dosef, data=dat)
anova(m2)
}