#' Create an HTML map charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param dat a data object (a data frame or a factor array)
#' @param namevar objects of class "formula" (or one that can be coerced 
#'   to that class):  the region name of the given data.frame colnames, e.g. 
#'   \code{xvar = ~province};  namevar only needed for the 
#'   data.frame data input.
#' @param datavar an "formula" object: Associates the value of variable
#'   with symbol color, e.g. \code{datavar = ~valueName}. If multiple columns 
#'   input, you can use "+" to connect them \code{datavar = ~val1 + val2}
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param region the display map region name, "china" is default. At present,
#'   \code{c("world", "usa", "china")} and the Chinese province name(in chinese)
#' 	 are supported.
#' @param color two elements for the color scaling, default is c("#1e90ff", "#f0ffff").
#'   The first element is the color for max value and the second element is the color
#'   for min value. \code{color = c("red", "yellow")}
#'  @param  theme an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
#'   supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
#'   "chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: mapEchart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{mapEchart + eTitle(title="main title", x = "left", y=10)}
#' @param legend logical whether the legend widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{mapEchart + eLegend(show = TRUE)} 
#' @param legend.x,legend.y the xy coordinates of legend, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify legend widget after chart has been generated: 
#'   \code{mapEchart + eLegend(x = "right", y="top")}
#' @param legend.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify legend widget after chart has been generated: 
#'   \code{mapEchart + eLegend(orient = "vertical")}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after chart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{mapEchart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{mapEchart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{mapEchart + eToolbox(orient = "vertical")}
#' @param dataview,mark,restore,dataZoom,magicType logical variable whether the dataview
#'   , mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
#'   default is TRUE. you can modify toolbox widget after chart has been generated, 
#'   the toolbox position, toolbox element and toolbox orientation are available at present.  
#'   \code{mapEchart + eToolbox(dataView = FALSE)}
#' @param dataRange logical whether the dataRange widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{mapEchart + eDataRange(show = TRUE)} 
#' @param dataRange.x,dataRange.y the xy coordinates of dataRange, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify dataRange widget after chart has been generated: 
#'   \code{mapEchart + eDataRange(x = "left", y="bottom")}
#' @param dataRange.calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature for dataRange widget.
#'   the size and calculable option can be setted after bar chart has been 
#'   generated through eOption: \code{mapEchart + eDataRange(calculable = TRUE)}
#' @param dataRange.min,dataRange.max the limitation value for data scale, default is null
#'   means the limitation of dataRange will modify automatically.
#' @param dataRange.text the min and max text symbol showed for dataRange widget.
#'   default is c("high", "low").
#' @param dataRange.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify dataRange widget after chart has been generated: 
#'   \code{mapEchart + eDataRange(orient = "vertical")}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{mapEchart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for bar chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{mapEchart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for bar chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{mapEchart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after bar chart has been 
#'   generated through eOption: \code{mapEchart + eOption(calculable = TRUE)}
#' @param showLabel logical whether the region name label showed on map.
#'   default is TRUE, e.g. \code{mapEchart + eOption(showLabel = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#' mapData <- head(mapTestData_chs, 5)
#' eMap(mapData, namevar=~stdName, datavar = ~val1 + val2)
#' provinceMapData <- mapTestData_chs[6:15,]
#' eMap(provinceMapData, namevar=~stdName, datavar = ~val1+val2, region=unique(provinceMapData$motherName)[1])


eMap = function(dat, namevar=NULL, datavar=NULL, size = NULL, region="china", color=c("#1e90ff", "#f0ffff"),
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = FALSE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE,
	dataRange = TRUE, dataRange.x="left", dataRange.y="bottom", dataRange.min=NULL, dataRange.max=NULL,
	dataRange.calculable=TRUE, dataRange.text=c("high", "low"), dataRange.orient="horizontal",
	tooltip = TRUE, tooltip.trigger="item", formatter="", 
	calculable=FALSE, xlab = NULL, ylab=NULL,
	showLabel=TRUE, opt = list()) {
	# config the province/city should be display...
	# Only one arguement could be supported.
	# dat=mapData;namevar = ~province; datavar = ~value + val2
	placeName = recharts:::autoArgLabel(namevar, deparse(substitute(namevar)))
	
	# allow multiple variable input
	# support format: ~value+val2, c("value", "val2")
	dataName = recharts:::autoArgLabel(datavar, deparse(substitute(datavar)))
	
	# generate provinceVariable and dataVariable
	placeVariable = recharts:::evalFormula(namevar, dat)
	if(length(dataName) == 1){
		valueDf = data.frame(value = recharts:::evalFormula(datavar, dat))
		colnames(valueDf)[1] <- dataName
	}else{
		valueDf = recharts:::evalFormula(datavar, dat)
	}
	
	
	# legendData set
	opt$legend = recharts:::legendSet(show=legend, data=dataName, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	# option$title format.
	opt$title = recharts:::tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	opt$theme = themeSet(theme = theme)
	opt$calculable = recharts:::calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = recharts:::tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	opt$toolbox = recharts:::toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType=FALSE, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

	if(missing(dataRange.min)|is.null(dataRange.min)){
		dataRange.min=min(valueDf[,dataName], na.rm = TRUE)
	}

	if(missing(dataRange.max)|is.null(dataRange.max)){
		dataRange.max=max(valueDf[,dataName], na.rm = TRUE)
	}

	opt$dataRange = recharts:::dataRangeSet(dataRange=dataRange, calculable=dataRange.calculable, dataRange.x=dataRange.x, dataRange.y=dataRange.y,
		dataRange.text = dataRange.text, color=color, precision=1, orient=dataRange.orient, min=dataRange.min, max=dataRange.max)		
	
	# regionFormat(region)
	#displayRegion = recharts:::regionFormat(region)
	#print(displayRegion)
	# opt$series =  vector("list", length(dataName))
	opt$series = lapply(dataName, FUN=function(tmpVar){
		# tmpVar = dataName[1]
		# generate template data frame for each placevar and valuevar;
		valDf = data.frame(name = placeVariable, value = valueDf[,tmpVar], stringsAsFactors=F)
		# use df2List realize the function: unname(alply(valDf, 1, unlist))
		seriesData = recharts:::df2List(valDf)
		return(list(
			name = tmpVar,
			type = "map",
			mapType = region,
			itemStyle = list(
				normal = list(
					label = list(show=showLabel)
				)
			),
			data = seriesData
		))
	})
	
	opt$size = size
	# mapOption <<- opt
	
	# render echarts by front-end browser.
	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
	chart = .addClass(chart, "eMap")
	chart
}
