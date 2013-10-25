\name{eForce}
\alias{eForce}
\title{Force network graph}
\usage{
  eForce(networkMatrix, propertyDf = NULL, opt = list(),
    outfile = FALSE, jsdir = NULL, style = NULL)
}
\arguments{
  \item{networkMatrix}{required, a symmetric matrix, each
  cell value indicates the weight of the two nodes and the
  0 or NA cell would not be counted in. The matrix should
  have colnames or rownames.}

  \item{propertyDf}{optional, dataframe which contain the
  metadata for the nodes. It could contain category, value
  and color columns. The colnames and rownames are
  required.}

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
  ECharts style Force network graph visulize the social
  network matrix data.
}
\examples{
testData <- matrix(1:25, nrow=5)
eForce(testData, outfile='network')
}

