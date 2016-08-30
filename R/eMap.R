#' Map charts
#'
#' ECharts style map charts. Only support CHINA now.
#'
#' @param dat    data.frame, rownames are province names.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' testData <- read.csv(system.file("examples", "testDataForMap.csv", package = "recharts"),stringsAsFactors=FALSE) 
#' 
#' mapData <- data.frame(province=c("上海", "江苏", "广东", "黑龙江"), "数据1"=c(100, 200, 300, 500), "数据测2"=c(200,300,400,200), val3=c(1,2,3,5), stringsAsFactors=F)
#' eMap(mapData, namevar=~province, datavar = ~value+val2)
#' provinceMapData <- data.frame(city=c("盐城市", "南京市", "苏州市"), value=c(100, 200, 300), val2=c(200,300,400), val3=c(1,2,3), stringsAsFactors=F)
#' eMap(provinceMapData, namevar=~city, datavar = ~value+val2, region="江苏")
#' eMap(testData, namevar="province")


eMap = function(dat, namevar=NULL, datavar=NULL, size = NULL, region="china", color=c("#1e90ff", "#f0ffff"),
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataRange = TRUE, dataRange.x="left", dataRange.y="bottom", dataRange.min=NULL, dataRange.max=NULL,
	dataRange.calculable=TRUE, dataRange.text=c("high", "low"), dataRange.orient="horizontal",
	dataView = FALSE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", 
	calculable=FALSE, xlab = NULL, ylab=NULL,
	showLabel=TRUE, opt = list()) {
	# config the province/city should be display...
	# Only one arguement could be supported.
	# dat=mapData;namevar = ~province; datavar = ~value+val2
	placeName = recharts:::autoArgLabel(namevar, deparse(substitute(namevar)))
	
	# allow multiple variable input
	# support format: ~value+val2, c("value", "val2")
	dataName = recharts:::autoArgLabel(datavar, deparse(substitute(datavar)))
	
	# generate provinceVariable and dataVariable
	placeVariable = recharts:::evalFormula(namevar, dat)
	valueDf = recharts:::evalFormula(datavar, dat)

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
	htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
}
