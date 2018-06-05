#' Create an HTML line charts widget using the ECharts(version:3.2.2) library
#' 
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param dat a data object (a matrix, a data frame or a factor array)
#' @param xvar,yvar objects of class "formula" (or one that can be coerced 
#'   to that class):  x,y coordinates of the given data.frame colnames, e.g. 
#'   \code{xvar = ~xAxisName}; \code{yvar = ~yAxisName}. xvar, yvar only needed for the 
#'   data.frame data input.
#' @param type type : 'scatter' or 'line'
#' @param series an "formula" object: Associates the levels of variable
#'   with symbol color, e.g. \code{series = ~groupName}
#' @param smooth wether the line should be smoothy or not.
#' @param symbol Icon types provided by ECharts includes 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
#' @param symbolSize symbol size. It can be set to single numbers like 10, or use an array to represent width and height. For example, [20, 10] means symbol width is 20, and height is10.
#' @param z z -level
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param theme an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
#'   supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
#'   "chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: Echart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{Echart + eTitle(title="main title", x = "left", y=10)}
#' @param legend logical whether the legend widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{Echart + eLegend(show = TRUE)} 
#' @param legend.x,legend.y the xy coordinates of legend, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(x = "right", y="top")}
#' @param legend.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(orient = "vertical")}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after cahart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(orient = "vertical")}
#' @param dataview,mark,restore,dataZoom,magicType logical variable whether the dataview
#'   , mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
#'   default is TRUE. you can modify toolbox widget after chart has been generated, 
#'   the toolbox position, toolbox element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(dataView = FALSE)}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{Echart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for line chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for line chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after line chart has been 
#'   generated through eOption: \code{Echart + eOption(calculable = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#'   eLine(WorldPhones, theme=1)
#'   #mode 2 input.
#'   df2 <- data.frame(
#'     saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
#'     seller=c(rep("Yellow",7), rep("Red",7), rep("White",7)),
#'   	 weekDay = c(rep(c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"),3)),
#'     stringsAsFactors =FALSE
#'   )
#'   eLine(df2, xvar=~weekDay, yvar= ~saleNum, series=~seller)
#'
#'  dat <- cut(rnorm(1000), -4:4)
#'  eLine(dat)
#'
#' 

eLine = function(dat, xvar=NULL, yvar=NULL,type = "scatter" ,series=NULL, size = NULL, horiz = FALSE, smooth = NULL,
                 symbol = NULL, symbolSize = NULL, z=NULL,
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="axis", formatter="", axis.scale=TRUE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=TRUE, showLabel=TRUE, opt = list()) 
{
	xlabName = autoArgLabel(xvar, deparse(substitute(xvar)))
	ylabName = autoArgLabel(yvar, deparse(substitute(yvar)))

	xvar = evalFormula(xvar, dat)
	yvar = evalFormula(yvar, dat)
	seriesName = autoArgLabel(series, deparse(substitute(series)))
	if (!is.null(series)) series = as.factor(as.character(evalFormula(series, dat)))

	
	# if series is null, we will use the xvar and yvar to construct the line plot..
	if(is.null(xvar) & is.null(yvar) & !is.factor(dat)){
		# Mode 1. use default data.frame as input...
		plotData <- as.data.frame(dat, stringsAsFactor=F)
	}else if(!is.null(xvar) & !is.null(yvar) & !is.null(series)){
		#print("Mode1")
		# Mode 2. all of xvar, yvar and series are valid...
		xvarArray = unique(as.character(xvar))
		seriesArray = unique(as.character(series))
		dataMatrix = xtabs(as.formula(paste0(ylabName, "~", xlabName , "+",  seriesName)), dat)
		plotData <- as.data.frame.matrix(dataMatrix[xvarArray,seriesArray])
	}else if(!is.null(xvar) & !is.null(yvar) & is.null(series)){
		# Mode 3. format dat with only x and y variable.
		plotData <- data.frame(val = yvar)
		colnames(plotData) <- ylabName
		rownames(plotData) <- xvar
	}else if(is.null(xvar) & is.null(yvar) & is.factor(dat)){
		# Mode 4. factor
		tempD <- as.data.frame(table(dat))
		plotData <- data.frame(val = tempD[,"Freq"])
		colnames(plotData) <- "Frequency"
		rownames(plotData) <- tempD[,1]
	}
	
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)
	opt$theme = themeSet(theme = theme)

	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")
	
	opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)


	opt$legend = legendSet( show=legend, data=colnames(plotData), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
		xlab.data = rownames(plotData)
	}
	if(match.arg(ylab.type, c("category" , "value")) == "category" & is.null(ylab.data)){
		ylab.data = colnames(plotData)
	}
	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)

	# data set...
	opt$series =  vector("list", ncol(plotData))
    for(i in 1:ncol(plotData)) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = type
        }
        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(plotData)[i]
        } else {
            warning('You can set series:name with colnames(dat).')
        }

        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = unnames(plotData[,i])
        } else {
            warning('You can set series:data with dat.')
        }
      
        if(!is.null(smooth)){
          opt$series[[i]]$smooth=smooth
        }
      
        if(!is.null(symbol)){
          opt$series[[i]]$symbol=symbol
        }
        
        if(!is.null(symbolSize)){
          opt$series[[i]]$symbolSize=symbolSize
        }
      
        if(!is.null(z)){
          opt$series[[i]]$z=z
        }
    }
  
	
	
	if(horiz==TRUE) {
		tmp = opt$xAxis
		opt$xAxis = opt$yAxis
		opt$yAxis = tmp
	}
	opt$size = size
	
	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
	chart = .addClass(chart, "eLine")
	
	# add theme dependencies
	chart = addThemeDependencies(chart)
	
	chart
}

#' Create an HTML area charts widget using the ECharts(version:3.2.2) library
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
#' @param theme an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
#'   supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
#'   "chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: Echart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{Echart + eTitle(title="main title", x = "left", y=10)}
#' @param legend logical whether the legend widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{Echart + eLegend(show = TRUE)} 
#' @param legend.x,legend.y the xy coordinates of legend, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(x = "right", y="top")}
#' @param legend.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(orient = "vertical")}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after cahart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(orient = "vertical")}
#' @param dataview,mark,restore,dataZoom,magicType logical variable whether the dataview
#'   , mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
#'   default is TRUE. you can modify toolbox widget after chart has been generated, 
#'   the toolbox position, toolbox element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(dataView = FALSE)}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{Echart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for area chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for area chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after area chart has been 
#'   generated through eOption: \code{Echart + eOption(calculable = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#'   eArea(WorldPhones, theme=1)
#'   #mode 2 input.
#'   df2 <- data.frame(
#'     saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
#'     seller=c(rep("Yellow",7), rep("Red",7), rep("White",7)),
#'   	 weekDay = c(rep(c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"),3)),
#'     stringsAsFactors =FALSE
#'   )
#'   eArea(df2, xvar=~weekDay, yvar= ~saleNum, series=~seller)
#'
#'  dat <- cut(rnorm(1000), -4:4)
#'  eArea(dat)
#'
#' 
eArea = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL, horiz = FALSE, stack="SUM",
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=FALSE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=TRUE, showLabel=TRUE, opt = list()) 
{
	
	xlabName = autoArgLabel(xvar, deparse(substitute(xvar)))
	ylabName = autoArgLabel(yvar, deparse(substitute(yvar)))
	seriesName = autoArgLabel(series, deparse(substitute(series)))

	xvar = evalFormula(xvar, dat)
	
	yvar = evalFormula(yvar, dat)

	series = as.factor(evalFormula(series, dat))
	# if series is null, we will use the xvar and yvar to construct the area plot..
	if(is.null(xvar) & is.null(yvar) & !is.factor(dat)){
		# Mode 1. use default data.frame as input...
		plotData = as.data.frame(dat, stringsAsFactor=F)
	}else if(!is.null(xvar) & !is.null(yvar) & !is.null(series)){
		#print("Mode1")
		# Mode 2. all of xvar, yvar and series are valid...
		xvarArray = unique(as.character(xvar))
		seriesArray = unique(as.character(series))
		dataMatrix = xtabs(as.formula(paste0(ylabName, "~", xlabName , "+",  seriesName)), dat)
		plotData <- as.data.frame.matrix(dataMatrix[xvarArray,seriesArray])
	}else if(!is.null(xvar) & !is.null(yvar) & is.null(series)){
		# Mode 3. format dat with only x and y variable.
		plotData = data.frame(val = yvar)
		colnames(plotData) = ylabName
		rownames(plotData) = xvar
	}else if(is.null(xvar) & is.null(yvar) & is.factor(dat)){
		# Mode 4. factor
		tempD = as.data.frame(table(dat))
		plotData = data.frame(val = tempD[,"Freq"])
		colnames(plotData) = "Frequency"
		rownames(plotData) = tempD[,1]
	}

	
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)
	opt$theme = themeSet(theme = theme)
	
	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")
	
	opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

				
	opt$legend = legendSet( show=legend, data=colnames(plotData), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
		xlab.data = rownames(plotData)
	}
	if(match.arg(ylab.type, c("category" , "value")) == "category" & is.null(ylab.data)){
		ylab.data = colnames(plotData)
	}
	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)

	# data set...
	opt$series =  vector("list", ncol(plotData))

    for(i in 1:ncol(plotData)) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'line'
        }

        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(plotData)[i]
        } else {
            warning('You can set series:name with dat.')
        }
        
        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = unnames(plotData[,i])
        } else {
            warning('You can set series:data with dat.')
        }
		
		if(is.null(opt$series[[i]]$stack)) {
            opt$series[[i]]$stack = 'SUM'
        }

        if(is.null(opt$series[[i]]$itemStyle$normal$areaStyle$type)) {
            opt$series[[i]]$itemStyle$normal$areaStyle$type = 'default'
        }
    }
    

	if(horiz==TRUE) {
		tmp = opt$xAxis
		opt$xAxis = opt$yAxis
		opt$yAxis = tmp
	}
	
	opt$size = size
	
	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = opt$size[1], height = opt$size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
	chart = .addClass(chart, "eArea")
	# add theme dependencies
	chart = addThemeDependencies(chart)
	
	chart

}
