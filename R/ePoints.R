#' Create an HTML scatter charts widget using the ECharts(version:3.2.2) library
#'
#' This function creates an HTML widget to display data.frame using the JavaScript
#' library ECharts3.
#' @param dat a data object (a matrix, a data frame or a factor array)
#' @param xvar,yvar objects of class "formula" (or one that can be coerced 
#'   to that class):  x,y coordinates of the given data.frame colnames, e.g. 
#'   \code{xvar = ~xAxisName}; \code{yvar = ~yAxisName}. xvar, yvar only needed for the 
#'   data.frame data input.
#' @param series an "formula" object: Associates the levels of variable
#'   with symbol color, e.g. \code{series = ~groupName}
#' @param size an array of html widget width and height(either numeric pixels 
#'   or percentage could be accepted): e.g. size = c(1024, 768).
#' @param powers,precision the precision and powers of value display setting.
#'   default: \code{power = 2; precision = 2}
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
#' @param tooltip.trigger an element of c("axis", "item"), default is "axis" for scatter chart.
#'   "axis" option for trigger will show all the information of mouse;
#'   "item" option for tirgger will only show the given item information of mouse.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(trigger = "axis")}
#' @param tooltip.formatter the information formatter for tooltip widget, 
#'   default is "<a>:<b><c>" for scatter chart.
#'   you can modify tooltip widget after chart has been generated: 
#'   \code{Echart + eTooltip(formatter = "<a><b>:<c>")}
#' @param calculable logical whether the front-end interactive chart will 
#'   support the drag-recalculable feature.
#'   the size and calculable option can be setted after scatter chart has been 
#'   generated through eOption: \code{Echart + eOption(calculable = TRUE)}
#' @note You are recommended to use lazyPlot function for interactive chart
#'   option set through "shiny" server.
#' @export
#' @examples
#' ePoints(iris[,3:5], theme=2)
#' iris$Species <- as.character(iris$Species)
#' iris[1:20, "Species"] ="redFlower"
#' ePoints(iris[,3:5], xvar=~Petal.Length, yvar=~Petal.Width, series=~Species, theme=2)
#' 


ePoints = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL,   power=2, precision=2,
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.data=NULL, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=TRUE, magicType=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="value", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=FALSE, showLabel=TRUE, opt = list())
{

	### ePoint data setting,
	# preprocess data to xvar, yvar, serieslab.
	xvar = autoArgLabel(xvar, deparse(substitute(xvar)))
	yvar = autoArgLabel(yvar, deparse(substitute(yvar)))
	namevar = autoArgLabel(series, deparse(substitute(series)))
	
	if(missing(xvar) | is.null(xvar) | xvar=="") xvar = colnames(dat)[1]
	if(missing(yvar) | is.null(yvar) | yvar=="" ) yvar = colnames(dat)[2]
	if(missing(namevar) | is.null(namevar)| namevar==""){
		namevar = "defaultName"
		dat[,"defaultName"] = "default"
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
	
	group <- unique(dat[,3])
    
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)
	opt$theme = themeSet(theme = theme)

	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")
	
	opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

	if(missing(legend.data) | is.null(legend.data)){legendData = group
	}else{legendData = legend.data}
	
	opt$legend = legendSet( show=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale, power=power, precision=precision)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale, power=power, precision=precision)


	opt$series =  vector("list", length(group))
    for(i in 1:length(group)) {
        if(dim(dat)[2]==2) {
            mat = as.matrix(dat)
        } else {
            mat = as.matrix(dat[which(dat[,3]==group[i]), 1:2])
        }
        colnames(mat) = NULL
        rownames(mat) = NULL

        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'scatter'
        }

        if(is.null(opt$series[[i]]$name) & dim(dat)[2]==3) {
            opt$series[[i]]$name = group[i]
        } else {
            warning("You'd better set series:name with y.")
        }
        
        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = mat
        } else {
            warning('You can set series:data with y.')
        }
    }

	#jsonStr <- toJSON(opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="ePoints", size=size)
	opt$size = size
	
	### output list format
	chart = htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
	chart = .addClass(chart, "ePoints")
	chart
}

