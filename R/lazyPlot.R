
#' a lazy mode for plot
#'
#' 
#' @export 

lazyPlot <- function(e1){
	recharts_oldLocal <<- Sys.getlocale("LC_CTYPE")
	Sys.setlocale("LC_CTYPE", "uk")
	if ("recharts" %in% class(e1)){
		assign("tempEchartsObject", e1, env=.GlobalEnv)
		library(shiny)
		if ("eLine" %in% class(e1) | "eArea" %in% class(e1) | "eBar" %in% class(e1) | "ePoints" %in% class(e1)){
			# eLine/eArea/eBar LazyPlot.
			runApp(system.file("shiny","lazyPlot","eLine_Area", package = "recharts"))
		}else if("eMap" %in% class(e1)){
			# eMap lazyPlot
			runApp(system.file("shiny","lazyPlot","eMap", package = "recharts"))
		}
	}
}

