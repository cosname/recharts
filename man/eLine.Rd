\name{eLine}
\alias{eLine}
\title{Line charts}
\usage{
  eLine(dat, opt = list(), outfile = FALSE, jsdir = NULL,
    style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix.}

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
  ECharts style line charts.
}
\examples{
eLine(iris[,1:4], outfile = 'irisLine')
 eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)),
       outfile = 'irisLineZoom')
}

