\name{ePoints}
\alias{ePoints}
\title{Points charts}
\usage{
  ePoints(dat, opt = list(), outfile = FALSE, jsdir = NULL,
    style = NULL)
}
\arguments{
  \item{dat}{data.frame, should have two column or three
  colume. If three, the third colume should be factor or
  character, it will be treated as category labels.}

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
  ECharts style scatter charts.
}
\examples{
ePoints(iris[,3:5], outfile = 'irisPoints')
}

