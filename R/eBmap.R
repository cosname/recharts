#' Create an HTML map charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param center center of echarts map(lon,lat)
#' @param zoom zoom of the map
#' @param roam allow roam, default is true
#' @param mapStyle a list object to set map style
#' @param title,subtitle an overall title for the plot. you can modify title widget after chart has been
#'   generated: Echart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{Echart + eTitle(title="main title", x = "left", y=10)}
#' @export
#' @examples
#' eBmap()
eBmap = function(center = c(104.114129, 37.550339), zoom = 5, roam = TRUE, mapStyle  = NULL,
                 title = NULL, subtitle = NULL, title.x = "center", title.y = "top", size = NULL
                 ){
  opt = list()
  opt$title = tilteSet(title = title, subtitle=subtitle,
                       title.x = title.x, title.y = title.y)
  opt$bmap = list(center = center,
                  zoom = zoom,
                  roam = roam,
                  mapStyle = mapStyle)
  
  chart = htmlwidgets::createWidget(
    'echarts', opt,
    package = 'recharts', width = opt$size[1], height = opt$size[2],
    preRenderHook = function(instance) {
      instance
    }
  )
  chart$dependencies <- c(chart$dependencies,
                          echartsDependencies())
  
  chart = .addClass(chart, "eMap")
  chart = .addClass(chart, "ebmap")
  
  chart
  

}