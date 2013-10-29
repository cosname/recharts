\name{eRadar}
\alias{eRadar}
\title{Radar charts}
\usage{
  eRadar(dat, limit = NULL, opt = list())
}
\arguments{
  \item{dat}{data.frame or matrix, should have colnames and
  rownames.}

  \item{limit}{data.frame or matrix, 2 column, indicates
  the limit of each axis.}

  \item{opt}{option of ECharts.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style radar charts.
}
\examples{
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
plot(eRadar(dat))
}

