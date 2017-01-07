#' @example
# series = list(
# list(
#   name = "Funnel",
#   type = "funnel",
#   size= c('80%', '80%'),
#   textRotation = c(0, 45, 90, -45),
#   textPadding = 0,
#   data = list(list(value=100,
#                    name="A"),
#               list(value=66,
#                    name="B"),
#               list(value=33,
#                    name="C"))
# )
# )
# ePlot(series)
# 
# series2 = list(
#   list(
#     name = '蒸发量',
#     type = 'bar',
#     data = c(2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3)
#   ),
#   list(
#     name = '降水量',
#     type = 'bar',
#     data = c(2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3)
#     
#   ),
#   list(
#     name = '平均温度',
#     type = 'line',
#     yAxisIndex = 1,
#     data = c(2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2)
#     
#   )
# )
# 
# ext = list(
#   xAxis = list(list(
#     type = "category",
#     data = c('1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月')
#   )),
#   yAxis = list(
#     list(
#       type =  'value',
#       name =  '水量',
#       min =  0,
#       max =  250,
#       interval =  50,
#       axisLabel =  list(
#         formatter =  '{value} ml'
#       )
#     ),
#     list(
#       type =  'value',
#       name =  '温度',
#       min =  0,
#       max =  25,
#       interval =  5,
#       axisLabel = list(
#         formatter= '{value} °C'
#       )
#     )
#   ))
# ePlot(series2, ext )
#' @export
ePlot = function(series, ext = NULL, size = NULL, fixed = TRUE,
                 theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", legend.data = NULL,
                 legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
                 toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                 dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=FALSE,
                 tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
                 xlab=FALSE, ylab=FALSE, calculable=TRUE, showLabel=TRUE, opt = list())
{
  if(missing(legend.data) | is.null(legend.data)){legendData = sapply(series, function(x) x[['name']])
  }else{legendData = legend.data}
  
  opt$legend = legendSet( show=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
  
  # option$title format.
  opt$title = tilteSet(title = title, subtitle=subtitle,
                       title.x = title.x, title.y = title.y)
  
  opt$calculable = calculableSet(calculable = calculable)
  opt$theme = themeSet(theme = theme)
  # opt$tooltip format, not open to user now.
  opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
                            formatter = "{a} <br/>{b} : {c}%", islandFormatter="")
  
  
 
  #showLabelLine=showLabel
  #now we don't support the multiple graph in one canvas
  opt$series = series
  
  if(!is.null(ext)){
    if(!is.null(ext$xAxis)) opt$xAxis = ext$xAxis
    if(!is.null(ext$yAxis)) opt$yAxis = ext$yAxis
    if(!is.null(ext$tooltip)) opt$tooltip = ext$tooltip
    if(!is.null(ext$tooltip)) opt$toolbox = ext$toolbox
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