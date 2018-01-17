#' Save recharts into a png/jpg file
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param ... Echarts object
#' @param timeLineName Name of timeline
#' @param width Width of echarts object
#' @param height Height of echarts object
#' @param currentIndex Indicates which is the currently selected item. For instance, if currentIndex is 0,
#'  it indicates that the currently selected item is timeline.data[0] .
#' @param autoPlay Default is TRUE, whether to play automatically. 
#' @param loop Default is TRUE, whether to loop playing.
#' @param playInterval Default is 2000, indicates play speed (gap time between two state), whose unit is millisecond.
#' @param orient  Orientation of the component, whose valid values are: 'vertical': vertical layout.'horizontal': horizontal layout.
#' @param z z value of all graghical elements in , which controls order of drawing graphical components. Components with smaller z values may be overwritten by those with larger z values.
#' @export
#' @examples
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' e1 = ePie(x) + eTitle("test1")
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' e2 = ePie(x) + eTitle("test2")
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' e3 = ePie(x) + eTitle("test3")
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' e4 = ePie(x) + eTitle("test4")
#' eTimeline(e1,e2,e3,e4)

eTimeline = function(..., timeLineName = NULL, width = NULL, height = NULL, currentIndex = 0,
                   autoPlay = TRUE, loop = TRUE, playInterval = 2000,
                   orient = 'horizontal', z = 2){
  x = list(...)
  n = length(x)
  if(n < 2L)
    stop('At least 2 echarts object!')
  if(any(sapply(x,function(a){'echarts' %in% class(x)})))
    stop('All objects should be echarts object!')
  
  options = lapply(x, function(a) a$x)
  
  if(is.null(width)) width = x[[1]]$size[1]
  if(is.null(height)) height = x[[1]]$size[2]
  if(is.null(timeLineName)) timeLineName = 1:n
  opt = list(baseOption = list(timeline=list(
    axisType= 'category',
    currentIndex = currentIndex,
    autoPlay = autoPlay,
    loop = loop,
    playInterval = playInterval,
    orient = orient,
    z = z,
    data=timeLineName
  )
  ),
  options = options)
  
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = e1$size[1], height = e1$size[2],
    preRenderHook = function(instance) {
      instance
    }
  )
  chart = .addClass(chart, "eTimeLine")
  chart
}