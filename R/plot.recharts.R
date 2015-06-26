
#' Reports whether x is a option object
#' @param x An object to test
#' @export
is.option <- function(x) inherits(x, "option")

#' Set recharts option
#' 
#' @export
#'
option <- function(...) {

	elements <- list(...)
	structure(elements, class ="option")

}

#' Set recharts option
#' 
#' @export
#'
eTitle = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eOption = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eToolbox = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eCalculable = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eLegend = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eTooltip = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eDataRange = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eAxis.X = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eAxis.Y = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
ePolar = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eDataZoom = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eTheme = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}


"setFunctionName" <- function(e2name){
	e2name <- strstrip(e2name)
	functionName = gsub("\\(.*", "", e2name)
	#print(functionName)
	setFuncList <- c("eOption", "eTitle", "eToolbox", "eCalculable", "eLegend", "eTooltip", "eDataRange",
		"eAxis.X", "eAxis.Y", "ePolar", "eDataZoom", "eTheme", "option")
	if (!functionName %in% setFuncList){
		stop(paste("unspported eCharts setting function inputs", functionName))
		return(FALSE)
	}else{
		return(functionName)
	}
}

#' Modify a recharts by adding on new components.
#' 
#' @param e1 An object of class \code{recharts}
#' @param e2 A component to add to \code{e1}
#'
#' @export
#'
#' @seealso \code{\link{set}}
#' @method + recharts
"+.echarts" <- function(e1, e2){

	e2name <- deparse(substitute(e2))
	
	optType <- setFunctionName(e2name)

	switch(optType,
		eTitle = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eTitleSet(e1, optionList=e2))
			}
		},
		eToolbox = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eToolboxSet(e1, optionList=e2))
			}
		},		
		eCalculable = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eCalculableSet(e1, optionList=e2))
			}
		},
		eTheme = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eThemeSet(e1, optionList=e2))
			}
		},
		eTooltip = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eTooltipSet(e1, optionList=e2))
			}
		},
		eLegend = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eLegendSet(e1, optionList=e2))
			}
		},		
		eDataRange = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eDataRangeSet(e1, optionList=e2))
			}
		},		
		eAxis.X = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eAxis.XSet(e1, optionList=e2))
			}
		},		
		eAxis.Y = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eAxis.YSet(e1, optionList=e2))
			}
		},		
		ePolar = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(ePolarSet(e1, optionList=e2))
			}
		},		
		eDataZoom = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eDataZoomSet(e1, optionList=e2))
			}
		},
		eOption = {
			if ("echarts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(optionSet(e1, optionList=e2))
			}
		}
	)
}

#' @export
"%+%" <- `+.echarts`



