\name{eRadar}
\alias{eRadar}
\title{Radar charts}
\usage{
  eRadar(dat, limit = NULL, opt = list(), outfile = FALSE,
    jsdir = NULL, style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix, should have colnames and
  rownames.}

  \item{limit}{data.frame or matrix, 2 column, indicates
  the limit of each axis.}

  \item{opt}{option of ECharts.}

  \item{outfile}{logical or character. If TRUE or a
  chacacter, output a html that contains echarts; if a
  character, the name of html file will be named. If FALSE,
  return div and script environment in html.}

  \item{jsdir}{character, directory where esl JS and
  echarts JS in. The default directory is
  'http://efe.baidu.com/echarts/doc/example/www/js/'}

  \item{style}{character, div style.}
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
eRadar(dat, outfile = 'irisRadar')
}

