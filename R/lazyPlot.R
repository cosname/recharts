
#' a lazy mode for plot
#'
#' 
#' @export 

lazyPlot <- function(e1){
	if ("recharts" %in% class(e1)){
		assign("tempEchartsObject", e1, env=.GlobalEnv)
		library(shiny)
		runApp(system.file("shiny","lazyPlot", package = "recharts"))
	}
}
