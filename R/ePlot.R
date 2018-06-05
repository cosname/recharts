#' @title Create rEcharts from an R object
#' 
#' @usage 
#' ePlot (series, ext = NULL, size = NULL)
#' 
#' @param series a list object for data in echarts
#' @param ext xAxis, yAxis, tooltip, toolbox, timeline setting in echarts
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @examples
#' series = list(
#' list(
#'   name = "Funnel",
#'   type = "funnel",
#'   size= c('80%', '80%'),
#'   textRotation = c(0, 45, 90, -45),
#'  textPadding = 0,
#'   data = list(list(value=100,
#'                    name="A"),
#'               list(value=66,
#'                    name="B"),
#'               list(value=33,
#'                    name="C"))
#' )
#' )
#' # ePlot(series)
#' # 
#' series2 = list(
#'   list(
#'     name = '\u84b8\u53d1\u91cf',
#'     type = 'bar',
#'     data = c(2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3)
#'   ),
#'   list(
#'     name = '\u964d\u6c34\u91cf',
#'     type = 'bar',
#'     data = c(2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3)
#' 
#'   ),
#'   list(
#'     name = '\u5e73\u5747\u6e29\u5ea6',
#'     type = 'line',
#'     yAxisIndex = 1,
#'     data = c(2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2)
#' 
#'   )
#' )
#' 
#' ext = list(
#'   xAxis = list(list(
#'     type = "category",
#'     data = c('1\u6708','2\u6708','3\u6708','4\u6708','5\u6708','6\u6708','7\u6708','8\u6708','9\u6708','10\u6708','11\u6708','12\u6708')
#'   )),
#'   yAxis = list(
#'     list(
#'       type =  'value',
#'       name =  '\u6c34\u91cf',
#'       min =  0,
#'       max =  250,
#'       interval =  50,
#'       axisLabel =  list(
#'         formatter =  '{value} ml'
#'       )
#'     ),
#'    list(
#'       type =  'value',
#'       name =  '\u6e29\u5ea6',
#'       min =  0,
#'       max =  25,
#'       interval =  5,
#'       axisLabel = list(
#'         formatter= '{value} °C'
#'       )
#'     )
#'   ))
#' ePlot(series2, ext )
#' @export
ePlot = function(series, ext = NULL, size = NULL, 
                 theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", legend.data = NULL,
                 legend = TRUE, legend.x = "center", legend.y= "bottom", legend.orient="horizontal", 
                 tooltip = TRUE, tooltip.trigger="item", 
                 calculable=TRUE,  opt = list())
{
  if(missing(legend.data) | is.null(legend.data)){legendData = sapply(series, function(x) x[['name']])
  }else{legendData = legend.data}

  opt$legend <- list()
  if(is.list(legendData)){
    for(i in 1:length(legendData)){
      opt$legend[[i]] <- legendSet(show=legend, data=legendData[[i]], legend.x=legend.x[i], legend.y=legend.y[i], orient=legend.orient)
    }
  } else {
    opt$legend = legendSet( show=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
  }
  
  # option$title format.
  opt$title <- list()
  if(length(title) > 1){
    for(i in 1:length(title)){
      opt$title[[i]] <- tilteSet(title = title[i],title.x = title.x[i], title.y = title.y[i])
    }
  } else {
    opt$title = tilteSet(title = title, subtitle=subtitle,
                         title.x = title.x, title.y = title.y)
  }

  opt$calculable = calculableSet(calculable = calculable)
  opt$theme = themeSet(theme = theme)
  # opt$tooltip format, not open to user now.
  opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
                            formatter = "{b}: {c}", islandFormatter="")
  #now we don't support the multiple graph in one canvas
  opt$series = series 

  if(!is.null(ext)){
    if(!is.null(ext$xAxis)) opt$xAxis = ext$xAxis
    if(!is.null(ext$yAxis)) opt$yAxis = ext$yAxis
    if(!is.null(ext$tooltip)) opt$tooltip = ext$tooltip
    if(!is.null(ext$toolbox)) opt$toolbox = ext$toolbox
    if(!is.null(ext$timeline)) opt$timeline = ext$timeline
  }


  #jsonStr <- toJSON(opt, pretty=TRUE)
  opt$size = size

  ### output list format
  chart = htmlwidgets::createWidget(
    'echarts', opt, width = size[1], height = size[2], package = 'recharts',
    preRenderHook = function(instance) {
      instance
    }
  )
  chart
}
