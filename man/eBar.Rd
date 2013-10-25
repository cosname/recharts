\name{eBar}
\alias{eBar}
\title{Bar charts}
\usage{
  eBar(dat, horiz = FALSE, opt = list(), outfile = FALSE,
    jsdir = NULL, style = NULL)
}
\arguments{
  \item{dat}{data.frame.}

  \item{horiz}{logical. If FALSE, the bars are drawn
  vertically with the first bar to the left. If TRUE, the
  bars are drawn horizontally with the first at the
  bottom.}

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
  ECharts style bar charts.
}
\examples{
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
eBar(dat, outfile = 'irisBar')
eBar(dat, horiz = TRUE, outfile = 'irisBarHoriz')
}

