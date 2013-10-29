\name{eMap}
\alias{eMap}
\title{Map charts}
\usage{
  eMap(dat, opt = list())
}
\arguments{
  \item{dat}{data.frame, rownames are province names.}

  \item{opt}{option of ECharts.}
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
plot(eMap(ChinaGDP))
}

