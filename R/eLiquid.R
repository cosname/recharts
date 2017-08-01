#' Create an HTML Liquid charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param percentDat percent data
#' @param wave number of waves, default is 3
#' @param radius raduis for liquid chart, default is '80%'
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
#' @examples require(plyr)
#' eLiquid(0.6)
#' eLiquid(0.6,wave = 6)

eLiquid = function(percentDat, wave=3, radius = '80%',size = NULL, 
                   theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
                   toolbox = FALSE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                   dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
                   tooltip = TRUE, tooltip.trigger="axis", tooltip.formatter="", 
                   calculable=TRUE, showLabel=TRUE, opt = list()){
  if(percentDat > 1 ){
    percentDat = 1
    warning('percentDat should less than 1, set as 100%')
  }
  
  if(percentDat <0 ){
    percentDat = 0
    warning('percentDat should less than 1, set as 0%')
  }
  
  if(percentDat!=0){
    plotData = seq(percentDat, by=-percentDat/wave, length.out = wave)
  }
  opt = list()
  
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
  
  opt$series = list(list(type = 'liquidFill',
                       data = plotData,
                       radius = '80%'))
  opt$size = size
  
  
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = size[1], height = size[2],
    preRenderHook = function(instance){
      instance
    }
  )
  chart = .addClass(chart, "eLiquid")
  # add theme dependencies
  chart = addThemeDependencies(chart)
  chart$dependencies <- c(chart$dependencies,
                          list(
                            htmltools::htmlDependency(
                              "eLiquid",
                              "1.0.5",
                              system.file("htmlwidgets/plugins", package = "recharts"),
                              script = "echarts-liquidfill.js"
                            )
                          ))
  chart
  
}