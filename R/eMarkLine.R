#' Create an HTML bar charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param chart a recharts object
#' @param yvalue,xvalue x,y value for horizontal or vertical line,can be one of 
#' ('min','max','average')
#' @param startPoint,endPoint start and end point for XYline
#' @param series an "formula" object: Associates the levels of variable
#'   with symbol color, e.g. \code{series = ~groupName}
#' @param lineWidth line width, default is 1
#' @param lineColor default is NULL,
#' @param precision default is 2, 
#' @param seriesIndex default is NULL,
#' @param name default is NULL, 
#' @export
#' chart = ePoints(iris[, 3:5], theme = 2)
#' eHLine(chart,1,lineColor = 'blue')
#' eHLine(chart,'min',lineWidth = 5)
#' eVLine(chart,1,lineColor = 'blue')
#' eVLine(chart,'min',lineWidth = 5)
#' eMarkLine(chart, c(1,0), c(7,2.5))

#' @export
eHLine = function(chart, yvalue, lineWidth = NULL, lineColor=NULL,
                  name = '', precision = NULL, seriesIndex = NULL){
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  tmpOptDat = list()
  if(any(yvalue %in% c('min', 'max', 'average'))){
    tmpOptDat = lapply(yvalue, function(e){
      list(name = name,
           type = e,
           valueIndex = 1)
    })
  }

  if(is.numeric(yvalue)){
    tmpOptDat = list(
      list(name = name,
           yAxis = yvalue[1],
           valueIndex = 1)
    )
  }  
  
  for(i in seriesIndex){
    if(!is.null(precision)) chart$x$series[[i]]$markLine$precision = precision
    if(!is.null(lineColor)) chart$x$series[[i]]$markLine$lineStyle = list(normal=list(color=lineColor))
    if(!is.null(lineWidth)) chart$x$series[[i]]$markLine$lineStyle = list(normal=list(width=lineWidth))
    
    chart$x$series[[i]]$markLine$data = 
      append(chart$x$series[[i]]$markLine$data,
             tmpOptDat
      )
  }
  
  return(chart)
}

#' @export
eVLine = function(chart, xvalue, lineWidth = NULL, lineColor=NULL,
                  name = '', precision = NULL, seriesIndex = NULL){
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  tmpOptDat = list()
  if(any(xvalue %in% c('min', 'max', 'average'))){
    tmpOptDat = lapply(xvalue, function(e){
      list(name = name,
           type = e,
           valueIndex = 0)
    })
  }
  
  if(is.numeric(xvalue)){
    tmpOptDat = list(
      list(name = name,
           xAxis = xvalue[1],
           valueIndex = 0)
    )
  }  
  
  for(i in seriesIndex){
    if(!is.null(precision)) chart$x$series[[i]]$markLine$precision = precision
    if(!is.null(lineColor)) chart$x$series[[i]]$markLine$lineStyle = list(normal=list(color=lineColor))
    if(!is.null(lineWidth)) chart$x$series[[i]]$markLine$lineStyle = list(normal=list(width=lineWidth))
    
    chart$x$series[[i]]$markLine$data = 
      append(chart$x$series[[i]]$markLine$data,
             tmpOptDat
      )
  }
  
  return(chart)
}

#' @export
eMarkLine = function(chart, startPoint, endPoint, name = '',
                  seriesIndex = NULL,lineWidth = NULL, lineColor=NULL,
                 precision = NULL){
  if(!is.numeric(startPoint) | !is.numeric(endPoint) |
     length(startPoint)!=2 | length(startPoint)!=2)
      stop('startPoint, endPoint should be numeric and length of 2!')
  
  if(is.null(seriesIndex)) seriesIndex = 1
  tmpOptDat = list()

  tmpOptDat = list(
    list(
          list(name = name,
              coord = startPoint),
          list(coord = endPoint)
          
          )
  )
  
  

  if(!is.null(precision)) chart$x$series[[seriesIndex]]$markLine$precision = precision
  if(!is.null(lineColor)) chart$x$series[[seriesIndex]]$markLine$lineStyle = list(normal=list(color=lineColor))
  if(!is.null(lineWidth)) chart$x$series[[seriesIndex]]$markLine$lineStyle = list(normal=list(width=lineWidth))
  chart$x$series[[seriesIndex]]$markLine$data = 
    append(chart$x$series[[seriesIndex]]$markLine$data,
           tmpOptDat
    )
  return(chart)
}