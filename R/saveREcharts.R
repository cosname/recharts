#' Save recharts into a png/jpg file
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param chart a recharts object
#' @param file file name for saving
#' @param size htmlwidgets size for recharts
#' @param delay Time to wait before taking screenshot, in seconds. Sometimes a longer delay is needed for all assets to display properly.
#' @export


saveREcharts = function(chart, file, size = NULL, delay = 2){
  tmpFile = paste0(tempdir(),"/rechartsTemp.html")
  htmlwidgets::saveWidget(chart,tmpFile,selfcontained = F)
  
  if(!is.null(size)){
    chart$width = size[1]
    chart$height = size[2]
  }
  
  webshot::webshot(tmpFile,file,vwidth = c1$width, vheight = c1$height, delay =delay)
  
}