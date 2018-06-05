#' Create an markpoint using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display matrix, data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param chart a recharts object
#' @param dat a data object (a matrix, a data frame or a factor array)
#' @param xvar,yvar objects of class "formula" (or one that can be coerced 
#'   to that class):  x,y coordinates of the given data.frame colnames, e.g. 
#'   \code{xvar = ~xAxisName}; \code{yvar = ~yAxisName}. xvar, yvar only needed for the 
#'   data.frame data input.
#' @param series an "formula" object: Associates the levels of variable
#'   with symbol color, e.g. \code{series = ~groupName}
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param type default is NULL,
#' @param valueIndex default is 0, 
#' @param seriesIndex default is NULL,
#' @param symbol default is 'pin', 
#' @param symbolSize default is  50, 
#' @param symbolRotate default is NULL,
#' @param symbolOffset default is c(0,0), 
#' @param silent default is FALSE, 
#' @param label default is NULL,
#' @param itemStyle default is NULL
#' @export
#' @examples 
#' dat <- cut(rnorm(1000), -4:4)
#' chart = eLine(dat)
#' eMarkPoint(chart, type=c('max','min'),valueIndex = 1)
#' eMarkPoint(chart, dat = data.frame(2:3,rep(200,2)),
#'            type=c('max','min'),valueIndex = 1)

eMarkPoint = function(chart, dat=NULL, xvar=NULL, yvar=NULL, series=NULL, type = NULL,
                      valueIndex = 0, seriesIndex = NULL,
                      symbol =  'pin', symbolSize = 50, symbolRotate = NULL,
                      symbolOffset = c(0,0), silent = TRUE, label = NULL,
                      itemStyle = NULL
                      ){
  
  if(is.null(seriesIndex)) seriesIndex = 1:length(chart$x$series)
  
  markPoint = list()
  ## TODO different symbol
  markPoint$symbol = symbol
  ## TODO different symbolSize
  markPoint$symbolSize = symbolSize
  ## Whether to ignore mouse events.
  markPoint$silent = silent
  markPoint$symbolOffset = symbolOffset
  
  if(!is.null(symbolRotate))    markPoint$symbolRotate = symbolRotate

  if(!is.null(label))    markPoint$label = label
  
  if(!is.null(itemStyle))    markPoint$itemStyle = itemStyle
  
  if(any(c('min','max','average') %in% type)){
    markPoint$data = lapply(type, function(e){
      list(name = e,
           type = e,
           valueIndex = valueIndex)
    })
  }
  
  # label
  if(!is.null(dat)){
    # dat = markDat
    ### ePoint data setting,
    # preprocess data to xvar, yvar, serieslab.
    xvar = autoArgLabel(xvar, deparse(substitute(xvar)))
    yvar = autoArgLabel(yvar, deparse(substitute(yvar)))
    namevar = autoArgLabel(series, deparse(substitute(series)))
    
    if(missing(xvar) | is.null(xvar) | xvar=="") xvar = colnames(dat)[1]
    if(missing(yvar) | is.null(yvar) | yvar=="" ) yvar = colnames(dat)[2]
    if(missing(namevar) | is.null(namevar)| namevar==""){
      namevar = "defaultName"
      dat[,"defaultName"] = paste0("default", 1:nrow(dat))
    }
    dat <- dat[,c(xvar, yvar, namevar)]
    
    # format the dat to data.frame
    if (class(dat) != "data.frame") dat <- as.data.frame(dat, stringsAsFactor=F)
    
    if(ncol(dat)<2) {
      stop("dim(dat)[2] should be 2 or 3.")
    }else if(ncol(dat) == 2){
      dat[,3] == "default"
      colnames(dat)[3] = "name"
      namevar = "name"
    }
    
    if(length(xvar) > 1) xvar = xvar[1]
    if(class(xvar) == "integer" | class(xvar) == "numeric"){
      if (xvar > ncol(dat)){
        stop("wrong xvar input...")
      }else{
        xvar = colnames(dat)[xvar]
      }
    }else if(!xvar %in% colnames(dat)){
      stop("wrong xvar input...")
    }
    
    if(length(yvar) > 1) yvar = yvar[1]
    if(class(yvar) == "integer" | class(yvar) == "numeric"){
      if (yvar > ncol(dat)){
        stop("wrong yvar input...")
      }else{
        yvar = colnames(dat)[yvar]
      }
    }else if(!yvar %in% colnames(dat)){
      stop("wrong yvar input...")
    }
    
    if(length(namevar) > 1) namevar = namevar[1]
    if(class(namevar) == "integer" | class(namevar) == "numeric"){
      if (namevar > ncol(dat)){
        stop("wrong namevar input...")
      }else{
        namevar = colnames(dat)[namevar]
      }
    }else if(!namevar %in% colnames(dat)){
      stop("wrong namevar input...")
    }
    
    # if the xvar/yvar/namevar is null, will use the first column of dat as default.	And check the xvar in the dat colnames.
    if (is.null(xvar) || !xvar %in% colnames(dat)) xvar = colnames(dat)[1]
    if (is.null(yvar) || !yvar %in% colnames(dat)) yvar = colnames(dat)[2]
    if (is.null(namevar) || !namevar %in% colnames(dat)) namevar = colnames(dat)[3]
    
    dat <- dat[,c(xvar, yvar, namevar)]
    
    pointDat = list()
    for(i in 1:nrow(dat)){
      # tmpDat = dat[i,]
      pointDat = append(pointDat, 
                        list(list(name = dat[i,3], coord = c(dat[i,1],dat[i,2]))))
    }
    # pointDat = apply(dat,1,function(e){
    #   e = unname(e)
    #   
    #   tmpOut$name = e[3]
    #   tmpOut$coord = c(e[1],e[2])
    #   return(tmpOut)
    # })
    # print(pointDat)
    if(is.null(markPoint$data)){
      markPoint$data = pointDat
    }else{
      markPoint$data = append(markPoint$data, pointDat)
    }
   
  }
  # print(pointDat)
  for(index in seriesIndex){
    chart$x$series[[index]]$markPoint = markPoint
  }
  # print(chart$x)

  return(chart)
}