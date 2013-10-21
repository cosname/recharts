\name{ePie}
\alias{ePie}
\title{Pie charts}
\usage{
  ePie(dat, opt = list(), filename = FALSE, local = FALSE,
    style = NULL)
}
\arguments{
  \item{dat}{vector, names will be treated as labels}

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
  ECharts style pie charts.
}
\examples{
x = runif(6)
names(x) = LETTERS[1:6]
ePie(x, filename = 'xPie')
}

