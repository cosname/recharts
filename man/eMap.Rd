\name{eMap}
\alias{eMap}
\title{Map charts}
\usage{
  eMap(dat, opt = list(), outfile = FALSE, jsdir = NULL,
    style = NULL)
}
\arguments{
  \item{dat}{data.frame or matrix, rownames are province
  names.}

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
  ECharts style map charts. Only support CHINA now.
}
\examples{
options(encoding="UTF-8")
 Sys.setlocale("LC_CTYPE","chs")
 load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
 ChinaGDP
 eMap(ChinaGDP, outfile = 'ChinaGDP')
}

