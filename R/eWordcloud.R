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
#' @examples
#' 
#' eWordcloud(wordFreqDf_chs, namevar = ~Word, datavar = ~Freq)
#'

eWordcloud = function(dat, namevar=NULL, datavar=NULL,  size = c(1024, 768),
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	sizeRange = c(10,100), rotationRange=c(-90,90), rotationStep = 45, gridSize=2,
	shape="pentagon", maskImage=NULL, 
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	opt = list())
{

	# dat <- wordFreqDf_chs; namevar = ~Word; datavar = ~Freq
	namelabName = recharts:::autoArgLabel(namevar, deparse(substitute(namevar)))
	datalabName = recharts:::autoArgLabel(datavar, deparse(substitute(datavar)))

	namevar = recharts:::evalFormula(namevar, dat)
	datavar = recharts:::evalFormula(datavar, dat)

	plotData <- as.data.frame.matrix(dat[,c(namelabName,datalabName)])
	# sort plotData by value
	
	colnames(plotData) <- c("name", "value")
	plotData <- plotData[order(plotData$value, decreasing=TRUE),]
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	#showLabelLine=showLabel
	#now we don't support the multiple graph in one canvas
	if(is.null(maskImage)){
		opt$series = list(
			list(
				name = "wordCloud",
				type = "wordCloud",
				sizeRange= sizeRange,
				rotationRange = rotationRange,
				rotationStep = rotationStep,
				gridSize = gridSize,
				shape = shape,
				textStyle=list(normal=list(
					color= JS( paste("function () { return 'rgb(' + [ Math.round(Math.random() * 160), ",
						"Math.round(Math.random() * 160),Math.round(Math.random() * 160)].join(',') + ')';}")
				)
			)),
				data = df2List(plotData)
			)
		)	
	}

	#jsonStr <- toJSON(opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="ePie", size=size)
	opt$size = size


	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance){
			instance
		}
	)
	chart = .addClass(chart, "eWordcloud")
	chart
	##### output list format
	# chart = htmlwidgets::createWidget(
	# 	'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	# )
	# chart
}
