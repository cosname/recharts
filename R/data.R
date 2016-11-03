#' mapInfoDf use for china map name reference.
#'
#' This dataset comes from geo infomation.
#'
#' @section Variables:
#' \describe{
#'   \item{state}{State where seizure occured.}
#'   \item{potency}{Purity of cocaine, as percentage (100\% = pure cocaine,
#'     0\% = all filler)}
#'   \item{weight}{Weight, in grams.}
#'   \item{month}{Month in which seizure occured.}
#'   \item{price}{Estimated value in USD.}
#' }
#' @section Use:
#' Use of this data requires your agreement to refer to your analyses as
#' "unvalidated DEA data and to claim authorship and responsibility for any
#' inferences and/or conclusions you may draw from this information."
#' @format Data frame with 3380 observations of 5 variables.
#' @source
#' \url{http://www.justice.gov/dea/resource-center/stride-data.shtml}
"mapInfoDf"

#' mapTestData_chs use for eMap chart generation.
#'
#' This dataset comes from geo infomation.
#' @format Data frame with 3380 observations of 5 variables.
#' @source
#' \url{http://www.justice.gov/dea/resource-center/stride-data.shtml}
"mapTestData_chs"

#' parallelDf use for eParallel chart generation.
#'
#' This dataset comes from  infomation.
#' @format Data frame with 1140 observations of 6 variables.
"parallelDf"

#' wordFreqDf for eWordcloud chart generation.
#'
#' This dataset comes from ECharts original data.
#' @format Data frame with 337 observations of 2 variables.
"wordFreqDf"

#' wordFreqDf_chs for eWordcloud chart generation.
#'
#' This dataset comes from published articles of cos.name.
#' And use the Chinese word segmentation package(jiebaR) to generate the word data.frame.
#' @format Data frame with 996 observations of 2 variables.
"wordFreqDf_chs"
