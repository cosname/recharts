#' Wrapper functions for Shiny
#'
#' Use \code{eChartOutput()} to create a container for a ECharts widget in the
#' UI, and \code{renderEChart()} to render the widget on the server side.
#' @param outputId the output id to be used in the \code{output} object on the
#'   server side
#' @param width the width of the chart
#' @param height the height of the chart
#' @rdname recharts-shiny
#' @export
#' @examples # !formatR
#' \donttest{library(recharts)
#' library(shiny)
#' app = shinyApp(
#'   ui = fluidPage(eChartOutput('myChart')),
#'   server = function(input, output) {
#'     chart = echart(x = rnorm(100), y = rnorm(100))
#'     output$myChart = renderEChart(chart)
#'   }
#' )
#'
#' if (interactive()) print(app)}
eChartOutput = function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'echarts', width, height, package = 'recharts')
}

#' @param expr an R expression to return an EChart widget
#' @inheritParams htmlwidgets::shinyRenderWidget
#' @rdname recharts-shiny
#' @export
renderEChart = function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) expr = substitute(expr)  # force quoted
  htmlwidgets::shinyRenderWidget(expr, eChartOutput, env, quoted = TRUE)
}
