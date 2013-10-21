\name{eLine}
\alias{eLine}
\title{Line charts}
\usage{
  eLine(dat, opt = list(), filename = FALSE, local = FALSE,
    style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix.}

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
  ECharts style line charts.
}
\examples{
eLine(iris[,1:4], filename = 'irisLine')
 eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)),
       filename = 'irisLineZoom')
}

