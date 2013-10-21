\name{ePoints}
\alias{ePoints}
\title{Points charts}
\usage{
  ePoints(dat, opt = list(), filename = FALSE,
    local = FALSE, style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix, should have two column
  or three colume. If three, the third colume should be
  factor or character, it will be treated as category
  labels.}

  \item{opt}{option of ECharts.}

  \item{filename}{logical or character. If TRUE or a
  chacacter, output a html that contains echarts; if a
  character, the name of html file will be named. If FALSE,
  return div and script environment in html.}

  \item{local}{logical, online or local.}

  \item{style}{character, div style.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style scatter charts.
}
\examples{
ePoints(iris[,3:5], filename = 'irisPoints')
}

