\name{eArea}
\alias{eArea}
\title{Line charts}
\usage{
  eArea(dat, opt = list())
}
\arguments{
  \item{dat}{data.frame or matrix}

  \item{opt}{option of ECharts.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style area charts.
}
\examples{
plot(eArea(WorldPhones))
}

