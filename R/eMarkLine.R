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
#' @param symbol symbol type at the two ends of the mark line, none  includes 
#'  'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
#' @param lineType default is solid, can be of ('solid','dashed','dotted')
#' @param lineWidth line width, default is 1
#' @param lineColor default is NULL,
#' @param precision default is 2, 
#' @param seriesIndex default is NULL,
#' @param name default is NULL, 
#' @export
#' @examples 
#' chart = ePoints(iris[, 3:5], theme = 2)
#' eHLine(chart,1,lineColor = 'blue')
#' eHLine(chart,'min',lineWidth = 5)
#' eVLine(chart,1,lineColor = 'blue')
#' eVLine(chart,'min',lineWidth = 5)
#' eMarkLine(chart, c(1,0), c(7,2.5))

#' @export
eHLine = function(chart, yvalue,lineType = 'solid',symbol = 'none', lineWidth = 1,
                  lineColor='red',name = '', precision = NULL, seriesIndex = NULL){
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  tmpOptDat = list()
  if(any(yvalue %in% c('min', 'max', 'average'))){
    tmpOptDat = lapply(yvalue, function(e){
      list(name = name,
           type = e,
           valueIndex = 1,
           lineStyle = list(type=lineType,
                            color=lineColor,
                            width=lineWidth))
    })
  }

  if(is.numeric(yvalue)){
    tmpOptDat = list(
      list(name = name,
           yAxis = yvalue[1],
           valueIndex = 1,
           lineStyle = list(type=lineType,
                            color=lineColor,
                            width=lineWidth))
    )
  }  
  
  for(i in seriesIndex){
    if(!is.null(symbol)) chart$x$series[[i]]$markLine$symbol = symbol
    if(!is.null(precision)) chart$x$series[[i]]$markLine$precision = precision
    
    chart$x$series[[i]]$markLine$data = 
      append(chart$x$series[[i]]$markLine$data,
             tmpOptDat
      )
  }
  
  return(chart)
}

#' @export
eVLine = function(chart, xvalue,lineType = 'dashed',symbol = 'none', lineWidth = 1, 
                  lineColor='red',name = '', precision = NULL, seriesIndex = NULL,
                  label = FALSE,silent = TRUE){
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  tmpOptDat = list()
  
  lineStyle = list(type=lineType,
                   color=lineColor,
                   width=lineWidth)
  
  label = list(show=label)
  
  if(any(xvalue %in% c('min', 'max', 'average'))){
    tmpOptDat = lapply(xvalue, function(e){
      list(name = name,
           type = e,
           valueIndex = 0,
           lineStyle = lineStyle,
           label = label
           )
    })
  }
  
  if(is.numeric(xvalue)){
    tmpOptDat = list(
      list(name = name,
           xAxis = xvalue[1],
           valueIndex = 0,
           lineStyle = lineStyle,
           label = label
           )
    )
  }  
  
  for(i in seriesIndex){
    chart$x$series[[i]]$markLine$silent = silent
    if(!is.null(symbol)) chart$x$series[[i]]$markLine$symbol = symbol
    if(!is.null(precision)) chart$x$series[[i]]$markLine$precision = precision
    
    chart$x$series[[i]]$markLine$data = 
      append(chart$x$series[[i]]$markLine$data,
             tmpOptDat
      )
  }
  
  return(chart)
}

#' @export
eMarkLine = function(chart, startPoint, endPoint, name = '',
                  seriesIndex = NULL,lineType = 'solid',symbol = NULL,
                  lineWidth = 1, lineColor = '#000',precision = NULL){
  if(!is.numeric(startPoint) | !is.numeric(endPoint) |
     length(startPoint)!=2 | length(startPoint)!=2)
      stop('startPoint, endPoint should be numeric and length of 2!')
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  tmpOptDat = list()

  tmpOptDat = list(
    list(
          list(name = name,
              coord = startPoint,
              lineStyle = list(type=lineType,
                               color=lineColor,
                               width=lineWidth)),
          list(coord = endPoint)
          
          )
  )


  for(i in seriesIndex){
    if(!is.null(symbol)) chart$x$series[[i]]$markLine$symbol = symbol
    if(!is.null(precision)) chart$x$series[[i]]$markLine$precision = precision
    
    chart$x$series[[i]]$markLine$data = 
      append(chart$x$series[[i]]$markLine$data,
             tmpOptDat
      )
  }
  return(chart)
}
