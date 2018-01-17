#' Create an HTML sankey charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display data.frame, using the JavaScript library ECharts3.
#' @param dat a data.frame object
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: sankeyEchart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{sankeyEchart + eTitle(title="main title", x = "left", y=10)}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after chart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{sankeyEchart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{sankeyEchart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{sankeyEchart + eToolbox(orient = "vertical")}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{sankeyEchart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "item" for sankey chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{sankeyEchart + eTooltip(trigger = "item")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after bar chart has been 
#'   generated through eOption: \code{sankeyEchart + eOption(calculable = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#' dat = data.frame(source=c("Agricultural 'waste'","Bio-conversion",
#'                           "Bio-conversion","Bio-conversion","Bio-conversion",
#'                           "Biofuel imports","Biomass imports","Coal imports",
#'                           "Coal reserves","Coal","District heating","District heating",
#'                           "District heating","Electricity grid","Electricity grid"),
#'                  target=c("Bio-conversion","Liquid","Losses","Solid","Gas","Liquid",
#'                           "Solid","Coal","Coal","Solid","Industry","Heating and cooling - commercial",
#'                           "Heating and cooling - homes","Over generation / exports","Heating and cooling - homes"),
#'                  value=c(124.729,0.597,26.862,280.322,81.144,35,35,11.606,63.965,75.571,
#'                          10.639,22.505,46.184,104.453,113.726))
#' eSankey(dat)


eSankey = function(dat,  candleColor, size = NULL,
                   title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
                   toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                   tooltip = TRUE, tooltip.trigger="item", 
                   calculable=TRUE, opt = list(),...){
  
  if (!is.data.frame(dat)){
    warning('Input "links" should be data.frame')
  }
  if(ncol(dat) != 3){
    warning('Length of columns should be 3!')
  }
  if(sum(colnames(dat)==c('source','target','value'))!=3){
    warning('Colnames of "links" should be c("source","target","value") with correct order')
  }
  dat$source = as.character(dat$source)
  dat$target = as.character(dat$target)
  dat$value = as.numeric(dat$value)
  nodes = unique(c(dat$source,dat$target))
  nodes = as.data.frame(nodes)
  colnames(nodes) = "name"
  links = dat
  nodes = jsonlite::toJSON(nodes)
  links = jsonlite::toJSON(links)
  
  # option$title format.
  opt$title = tilteSet(title = title, subtitle=subtitle,
                       title.x = title.x, title.y = title.y)
  opt$calculable = calculableSet(calculable=calculable)
  
  # opt$tooltip format, not open to user now.
  opt$tooltip = tooltipSet(tooltip=tooltip,trigger=tooltip.trigger)
  
  opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
                           dataView=FALSE, mark=FALSE, dataZoom = FALSE, magicType = FALSE, restore = FALSE, readOnly = readOnly,
                           saveAsImage=TRUE)
  
  
  opt$series$type = 'sankey'
  opt$series$layout = 'none'
  opt$series$data = nodes
  opt$series$links = links
  
  opt$series$itemStype$normal$borderWidth = 1
  opt$series$itemStype$normal$borderColor = '#aaa'
  opt$series$lineStyle$normal$color = 'source'
  opt$series$lineStyle$normal$curveness = 0.5
  opt$size = size
  
  
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = size[1], height = size[2],
    preRenderHook = function(instance){
      instance
    }
  )
  chart = .addClass(chart, "eSankey")
  # add theme dependencies
  #chart = addThemeDependencies(chart)
  chart
  ##### output list format
  # chart = htmlwidgets::createWidget(
  #  'echarts', opt, width = size[1], height = size[2], package = 'recharts'
  # )
  # chart
}