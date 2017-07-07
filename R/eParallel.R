#' Create an HTML parallel charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param dat a data object (a matrix, a data frame or a factor array)
#' @param xvar,yvar objects of class "formula" (or one that can be coerced 
#'   to that class):  x,y coordinates of the given data.frame colnames, e.g. 
#'   \code{xvar = ~xAxisName}; \code{yvar = ~yAxisName}. xvar, yvar only needed for the 
#'   data.frame data input.
#' @param series an "formula" object: Associates the levels of variable
#'   with symbol color, e.g. \code{series = ~groupName}
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param horiz logical. If FALSE, the bars are drawn vertically with the 
#'   first bar to the left. 
#' @param stackGroup list object, used to make series pre-stacked before rendering
#'   whole bar chart, if \code{unique(df[["groupName"]])} = c("a", "b", "c", "d", 
#'   "e", "f") and an example legal input for stackGroup should be: 
#'   \code{stackGroup = list(c("a","b"), c("e","f"))}. And the c("a","b") and 
#'   c("e","f") will be stacked into two bar, and the "c" and "d" will account 
#'   two seperated bars.  
#' @param  theme an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
#'   supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
#'   "chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: barEchart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{barEchart + eTitle(title="main title", x = "left", y=10)}
#' @param legend logical whether the legend widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{barEchart + eLegend(show = TRUE)} 
#' @param legend.x,legend.y the xy coordinates of legend, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify legend widget after chart has been generated: 
#'   \code{barEchart + eLegend(x = "right", y="top")}
#' @param legend.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify legend widget after chart has been generated: 
#'   \code{barEchart + eLegend(orient = "vertical")}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after chart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{barEchart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{barEchart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{barEchart + eToolbox(orient = "vertical")}
#' @param dataview,mark,restore,dataZoom,magicType logical variable whether the dataview
#'   , mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
#'   default is TRUE. you can modify toolbox widget after chart has been generated, 
#'   the toolbox position, toolbox element and toolbox orientation are available at present.  
#'   \code{barEchart + eToolbox(dataView = FALSE)}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{barEchart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for bar chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{barEchart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for bar chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{barEchart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after bar chart has been 
#'   generated through eOption: \code{barEchart + eOption(calculable = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples require(plyr)
#' 
#' axisList = list(
#' 	list(index=7, type="category", data = c("low", "middle", "high")), 
#' 	list(index=6, inverse=TRUE, max=50, nameLocation="start")
#' )
#' eParallel(head(parallelDf, 20), series=~groupName, axisList = axisList)
#'

eParallel = function(dat, series=NULL, axisList = list(), size = NULL, colorStyle = "black", 
	layout="horizontal", left = "5%", right="18%", bottom=100, top = 100, theme = "default",
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	axis.scale=TRUE, axis.nameGap = 20, axis.nameLocation = "end", axis.nameColor = NULL,
	line.width = 1, line.opacity = 0.8,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	calculable=TRUE, showLabel=TRUE, opt = list())
{
	# dat = parallelDf; series = ~groupName
	seriesName = recharts:::autoArgLabel(series, deparse(substitute(series)))
	if (!is.null(series)){
		series = as.factor(as.character(recharts:::evalFormula(series, dat)))
		colnames(dat)[ colnames(dat) ==  seriesName] = "seriesName"
	}
	
	
	# if series is null, we will use the data.frame to construct the bar plot..

	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)

	# opt$calculable = calculableSet(calculable = calculable)
	opt$theme = themeSet(theme = theme)
	displayAxixName = colnames(dat)
	if(is.null(series)){
		opt$legend = recharts:::legendSet( show=FALSE, data=c(), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	}else{
		opt$legend = recharts:::legendSet( show=legend, data=levels(series), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
		# displayName should delete the groupName 
		displayAxixName = displayAxixName[displayAxixName!="seriesName"]
	}
	
	# parallelAxis set...
	parallelAxisList = lapply(1:length(displayAxixName), FUN=function(X){return(list(dim=X-1, name = displayAxixName[X]))})

	if(length(axisList) > 0){
		for (axisIndex in 1:length(axisList)){
			modifyList = axisList[[axisIndex]]
			modifyIndex = as.numeric(axisList[[axisIndex]]$index)
			parallelAxisList[[modifyIndex]] = mergeList(parallelAxisList[[modifyIndex]] , modifyList)
		}		
	}
	opt$parallelAxis = parallelAxisList
	
	# parallel setting...

	
	# set Legend and title text color
	if(colorStyle == "white"){
		# default white 
		
		opt$backgroundColor = '#eee'
		parallelList = list(
			left = left,
			right=right,
			bottom = bottom,
			top = top,
			parallelAxisDefault=list(
				type="value",
				name="parallelAxis",
				nameLocation = axis.nameLocation,
				nameGap = axis.nameGap,
				axisLine = list(lineStyle = list(color="#000")),
				axisTick = list(lineStyle = list(color="#000")),
				splitLine = list(lineStyle = list(color="#000")),
				axisLabel = list(textStyle = list(color="#000"))
			)
		)
		
		opt$title$textStyle$color = "#000"
		opt$legend$textStyle$color = "#000"
	}else {
		# else the color will be set to blackColor ...

		opt$backgroundColor = '#333'
		parallelList = list(
			left = left,
			right=right,
			bottom = bottom,
			top = top,
			parallelAxisDefault=list(
				type="value",
				name="parallelAxis",
				nameLocation = axis.nameLocation,
				nameGap = axis.nameGap,
				axisLine = list(lineStyle = list(color="#fff")),
				axisTick = list(lineStyle = list(color="#fff")),
				splitLine = list(lineStyle = list(color="#fff")),
				axisLabel = list(textStyle = list(color="#fff"))
			)
		)
		opt$title$textStyle$color = "#fff"
		opt$legend$textStyle$color = "#fff"
	}
	opt$parallel = parallelList
	
	
	# parallel chart lineStyle setting...
	lineStyleList = list(
		normal=list(
			width=line.width,
			opacity= line.opacity
		)
	)
	
	# data series set...
	if(is.null(levels(series))){
		seriesList = list(list(
			name = "parallel",
			type= "parallel",
			lineStyle = lineStyleList,
			data = jsonlite::toJSON(unname(dat))
		))
	}else{
		seriesList = lapply(levels(series), FUN=function(tempSeries){
			tempPlotData = subset(dat, seriesName ==  tempSeries)
			tempPlotData$seriesName = NULL
			return(list(
				name = tempSeries,
				type= "parallel",
				lineStyle = lineStyleList,
				data = jsonlite::toJSON(unname(tempPlotData))
			))
		})
	}

	if(length(seriesList) == 0){
		stop("invalid series data generated")
	}else{
		opt$series = seriesList
	}
	
	
	#jsonStr <- toJSON(opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="ePoints", size=size)
	opt$size = size


	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance){
			instance
		}
	)
	chart = .addClass(chart, "eParallel")
	# add theme dependencies
	chart = addThemeDependencies(chart)
	chart
	##### output list format
	# chart = htmlwidgets::createWidget(
	# 	'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	# )
	# chart
}


