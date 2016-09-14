#' Create an HTML funnel charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display data.frame and 
#' factor array, using the JavaScript library ECharts3.
#' @param dat a data object (a data frame or a numeric array with name)
#' @param namevar objects of class "formula" (or one that can be coerced 
#'   to that class):  the funnel name of the given data.frame colnames, e.g. 
#'   \code{namevar = ~funnelName};  namevar only needed for the 
#'   data.frame data input.
#' @param datavar an "formula" object: Associates the value of variable
#'   with symbol color, e.g. \code{datavar = ~valueName}. 
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param fixed Fixed the max of data into 100%, 
#'   default is \code{TRUE}. 
#' @param  theme an object of theme name. see(\url{http://datatables.net/extensions/index}) for detail.
#'   supported theme: \code{c("default", "vintage", "dark", "westeros", "essos", "wonderland", "walden",
#'   "chalk", "infographic", "macarons", "roma", "shine", "purple-passion")}
#' @param title an overall title for the plot. you can modify title widget after chart has been
#'   generated: Echart + eTitle(title = "your title.")
#' @param title.x,title.y the xy coordinates of main title, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify title widget after chart has been generated: 
#'   \code{Echart + eTitle(title="main title", x = "left", y=10)}
#' @param legend logical whether the legend widget show or not, default is TRUE.
#'   you can modify legend widget after chart has been generated, the legend position and 
#'   legend orientation are available at present.
#'   \code{Echart + eLegend(show = TRUE)} 
#' @param legend.x,legend.y the xy coordinates of legend, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(x = "right", y="top")}
#' @param legend.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify legend widget after chart has been generated: 
#'   \code{Echart + eLegend(orient = "vertical")}
#' @param toolbox logical whether the toolbox widget show or not, default is TRUE.
#'   you can modify toolbox widget after chart has been generated, the toolbox position, toolbox 
#'   element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(show = TRUE)}
#' @param toolbox.x,toolbox.y the xy coordinates of toolbox, besides the excat exact pixels value, 
#'   x accept c("left", "right", "center") and y accept c("top", "bottom", "center") as legal input. 
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(x = "right", y="top")}
#' @param toolbox.orient an element of c("horizontal", "vertical"), default is "horizontal"
#'   you can modify toolbox widget after chart has been generated: 
#'   \code{Echart + eToolbox(orient = "vertical")}
#' @param dataview,mark,restore,dataZoom,magicType logical variable whether the dataview
#'   , mark, restore, dataZoom or magicType tool in toolbox widget show or not, 
#'   default is TRUE. you can modify toolbox widget after chart has been generated, 
#'   the toolbox position, toolbox element and toolbox orientation are available at present.  
#'   \code{Echart + eToolbox(dataView = FALSE)}
#' @param tooltip logical whether the tooltip widget for front-end interactive chart
#'   show or not. default is TRUE. you can modify tooltip widget after chart has been generated, 
#'   the tooltip trigger and tooltip formatter is available at present.  
#'   \code{Echart + eTooltip(show = FALSE)}
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for bar chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for bar chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after bar chart has been 
#'   generated through eOption: \code{Echart + eOption(calculable = TRUE)}
#' @param showLabel logical whether the region name label showed on chart.
#'   default is TRUE, e.g. \code{Echart + eOption(showLabel = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#' x = c("Exposure" = 100, "Click" = 80, "Visit" = 60, "Query"=40, "Buy"=20)
#' eFunnel(x) +eTitle(title = "Funnel Plot")
#' funnelDf <- data.frame(namevar = c("Exposure", "Click", "Visit", "Query", "Buy"), 
#'    datavar = c(100, 80, 60, 40, 20), stringsAsFactors=FALSE)
#' eFunnel(funnelDf, ~namevar, ~datavar)
#' 
eFunnel = function(dat, namevar=NULL, datavar=NULL, size = NULL, fixed = TRUE,
                   theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", legend.data = NULL,
                   legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
                   toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
                   dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=FALSE,
                   tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
                   xlab=FALSE, ylab=FALSE, calculable=TRUE, showLabel=TRUE, opt = list())
{
  if(is.vector(dat) || is.array(dat)){
    dat <- as.data.frame(dat)
    datavar <- 1
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
    if(is.null(datavar)){
      datavar <- 2
    }else{
      datavar = autoArgLabel(datavar, deparse(substitute(datavar)))
      # datavar = evalFormula(datavar, data)
    }
  }
  
  if(fixed) dat[[datavar]] = round(dat[[datavar]]/max(dat[[datavar]])*100)
  
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
  
  
  datFrame = data.frame(value=dat[[datavar]], name=dat[[namevar]])
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