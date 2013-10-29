\name{ePie}
\alias{ePie}
\title{Pie charts}
\usage{
  ePie(dat, opt = list())
}
\arguments{
  \item{dat}{vector, names will be treated as labels}

  \item{opt}{option of ECharts.}
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
ePie(x)
}

