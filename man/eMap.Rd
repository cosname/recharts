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
dataDf <- data.frame(province=c("jiangsu", "beijing", "guangdong"), value=c(100, 200, 300), stringsAsFactors=FALSE)
eMap(dataDf, ~province, ~value)
}

