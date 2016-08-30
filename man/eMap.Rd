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
testData <- read.csv(system.file("examples", "testDataForMap.csv", package = "recharts"),stringsAsFactors=FALSE) 
eMap(testData, namevar="province")
}

