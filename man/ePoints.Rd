\name{ePoints}
\alias{ePoints}
\title{Points charts}
\usage{
  ePoints(dat, opt = list())
}
\arguments{
  \item{dat}{data.frame, should have two column or three
  colume. If three, the third colume should be factor or
  character, it will be treated as category labels.}

  \item{opt}{option of ECharts.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style scatter charts.
}
\examples{
plot(ePoints(iris[,3:5]))
}

