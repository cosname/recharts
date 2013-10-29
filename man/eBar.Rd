\name{eBar}
\alias{eBar}
\title{Bar charts}
\usage{
  eBar(dat, horiz = FALSE, opt = list())
}
\arguments{
  \item{dat}{data.frame.}

  \item{horiz}{logical. If FALSE, the bars are drawn
  vertically with the first bar to the left. If TRUE, the
  bars are drawn horizontally with the first at the
  bottom.}

  \item{opt}{option of ECharts.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style bar charts.
}
\examples{
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
plot(eBar(dat))
plot(eBar(dat, horiz = TRUE))
}

