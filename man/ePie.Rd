\name{ePie}
\alias{ePie}
\title{Pie charts}
\usage{
  ePie(dat, opt = list(), outfile = FALSE, jsdir = NULL,
    style = NULL)
}
\arguments{
  \item{dat}{vector, names will be treated as labels}

  \item{opt}{option of ECharts.}

  \item{outfile}{logical or character. If TRUE or a
  chacacter, output a html that contains echarts; if a
  character, the name of html file will be named. If FALSE,
  return div and script environment in html.}

  \item{jsdir,}{character, directory where esl JS and
  echarts JS in. The default directory is
  'http://efe.baidu.com/echarts/doc/example/www/js/'}

  \item{style}{character, div style.}
}
\value{
  The HTML code as a character string.
}
\description{
  ECharts style pie charts.
}
\examples{
x = runif(6)
names(x) = LETTERS[1:6]
ePie(x, outfile = 'xPie')
}

