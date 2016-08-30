#' Funnel Charts
#'
#' ECharts style Funnel charts.
#'
#' @usage  eFunnel(dat, fix = T, opt = list())
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @param fix    fix the max of data into 100%, default is true. 
#' @return an htmlwidgets object which can be rendered by Browser.
#' @export
#' @examples
#' x = (1:5)*20
#' names(x) = c("订单","咨询","访问","点击","展现")
#' eFunnel(x,theme='macarons') +eTitle(title = "漏斗图")
#' testData <- read.csv(system.file("examples", "testDataForMap.csv", package = "recharts"),stringsAsFactors=FALSE,encoding = "UTF-8") 
#' eFunnel(head(testData), ~province, ~data2)

eFunnel = function(dat, namevar=NULL, valvar=NULL,  size = NULL, fix = TRUE,
                      theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", legend.data = NULL,
                      legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
                      toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                      dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=FALSE,
                      tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
                      xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
{
  if(is.vector(dat) || is.array(dat)){
    dat <- as.data.frame(dat)
    valvar <- 1
    dat$namevar <- rownames(dat)
    namevar <- "namevar"
  }else{
    # if the input dat is not data.frame will format it into data.frame.
    if (class(dat) != "data.frame") dat <- as.data.frame(dat)
    
    # if the user input argument namevar is null, will use colume one as name input
    if(is.null(namevar)){
      namevar <- 1
    }else{
      namevar = autoArgLabel(namevar, deparse(substitute(namevar)))
      # namevar = evalFormula(namevar, data)
    }
    if(is.null(valvar)){
      valvar <- 2
    }else{
      valvar = autoArgLabel(valvar, deparse(substitute(valvar)))
      # valvar = evalFormula(valvar, data)
    }
  }
  
  if(fix) dat[[valvar]] = round(dat[[valvar]]/max(dat[[valvar]])*100)
  
  if(missing(legend.data) | is.null(legend.data)){legendData = dat[[namevar]]
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
  
  
  datFrame = data.frame(value=dat[[valvar]], name=dat[[namevar]])
  datList = unname(lapply(split(datFrame, seq_len(nrow(datFrame))), as.list))
  
  #showLabelLine=showLabel
  #now we don't support the multiple graph in one canvas
  opt$series = list(
    list(
      name = "Funnel",
      type = "funnel",
      size= c('80%', '80%'),
      textRotation = c(0, 45, 90, -45),
      textPadding = 0,
      data = datList   
    )
  )
  
  #jsonStr <- toJSON(opt, pretty=TRUE)
  #outList <- .rechartsOutput(jsonStr, charttype="ePie", size=size)
  opt$size = size
  
  ### output list format
  chart = htmlwidgets::createWidget(
    'echarts', opt, width = size[1], height = size[2], package = 'recharts'
  )
  chart
}
