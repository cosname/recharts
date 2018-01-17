#' Create an HTML candle charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param dat a data object (a matrix, a data frame or a factor array)
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
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
#' mat = rbind(c(2286.33,2299.99,2281.9,2309.39),
#'             c(2297.11,2305.11,2290.12,2305.3),
#'             c(2303.75,2302.4,2292.43,2314.18),
#'             c(2293.81,2275.67,2274.1,2304.95),
#'             c(2281.45,2288.53,2270.25,2292.59),
#'             c(2286.66,2293.08,2283.94,2301.7),
#'             c(2293.4,2321.32,2281.47,2322.1),
#'             c(2323.54,2324.02,2321.17,2334.33),
#'             c(2316.25,2317.75,2310.49,2325.72),
#'             c(2320.74,2300.59,2299.37,2325.53),
#'             c(2300.21,2299.25,2294.11,2313.43),
#'             c(2297.1,2272.42,2264.76,2297.1),
#'             c(2270.71,2270.93,2260.87,2276.86),
#'             c(2264.43,2242.11,2240.07,2266.69),
#'             c(2242.26,2210.9,2205.07,2250.63),
#'             c(2190.1,2148.35,2126.22,2190.1)
#' )
#' rownames(mat) = Sys.Date() - (16:1)
#' eCandle(mat)

eCandle = function(dat,  candleColor, size = NULL,
                   theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
                   legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
                   toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                   dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
                   tooltip = TRUE, tooltip.trigger="axis", tooltip.formatter="", axis.scale=TRUE,
                   axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
                   xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
                   xlab.name = "", xlab.namePosition="start", xlim=NULL, 
                   ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
                   ylab.name = "", ylab.namePosition="start", ylim=NULL,
                   calculable=TRUE, showLabel=TRUE, opt = list(),...){
  
  plotData = as.matrix(dat)
  if(ncol(plotData) != 4){
    warning('Length of columns should be 4!')
  }
  
  # option$title format.
  opt$title = tilteSet(title = title, subtitle=subtitle,
                       title.x = title.x, title.y = title.y)
  
  opt$calculable = calculableSet(calculable = calculable)
  opt$theme = themeSet(theme = theme)
  
  # opt$tooltip format, not open to user now.
  opt$tooltip = tooltipSet(tooltip=tooltip,trigger=tooltip.trigger,
                           formatter = tooltip.formatter, islandFormatter="")
  
  opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
                           dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
                           saveAsImage=TRUE)
  
  opt$legend = legendSet( show=legend, data=colnames(plotData), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
  
  if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
    xlab.data = rownames(plotData)
  }

  opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
                       labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
                       axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
                       splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	
  if(is.null(ylim)) ylim = c(min(plotData[,3]), max(plotData[,4]))
  opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
                       labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
                       axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
                       splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)
  
  
  opt$series[[1]]$type = 'k'
  opt$series[[1]]$data = plotData
  opt$size = size
  
  
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = size[1], height = size[2],
    preRenderHook = function(instance){
      instance
    }
  )
  chart = .addClass(chart, "eCandle")
  # add theme dependencies
  chart = addThemeDependencies(chart)
  chart
  ##### output list format
  # chart = htmlwidgets::createWidget(
  # 	'echarts', opt, width = size[1], height = size[2], package = 'recharts'
  # )
  # chart
}
