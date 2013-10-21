\name{eArea}
\alias{eArea}
\title{Line charts}
\usage{
  eArea(dat, opt = list(), filename = FALSE, local = FALSE,
    style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix}

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
  ECharts style area charts.
}
\examples{
eArea(iris[,1:4], filename = 'irisArea')
}

