#' Bar charts
#'
#' ECharts style bar charts.
#'
#' @param dat    data.frame.
#' @param horiz   logical. If FALSE, the bars are drawn vertically with the first bar to the left. 
#' If TRUE, the bars are drawn horizontally with the first at the bottom.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' require(plyr)
#' dat = ddply(iris, .(Species), colwise(mean))  
#' rownames(dat) = dat[,1]
#' dat = dat[, -1]
#' dat
#' eBar(dat)
#' eBar(dat, horiz = TRUE)
#' #mode 2 input.
#' df2 <- data.frame(
#'  saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
#' 	seller=c(rep("小黄",7), rep("小红",7), rep("小白",7)),
#'	weekDay = c(rep(c("周一","周二","周三","周四","周五","周六","周日"),3))
#' )
#' dat <- df2
#' xvar=~weekDay; yvar= ~saleNum; series=~seller
#' eBar(df2, ~weekDay, ~saleNum, ~seller)
#' dat <- df2[1:7,]
#' eBar(dat, ~weekDay, ~saleNum)
#' dat <- cut(rnorm(1000), -4:4)
#' eBar(dat)
#' xvar=NULL; yvar=NULL; series=NULL


eBar = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL, horiz = FALSE,
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="axis", formatter="", axis.scale=TRUE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL, 
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=TRUE, showLabel=TRUE, opt = list()) 
{	
	
	# dat <- data.frame( saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85), seller=c(rep("小黄",7), rep("小红",7), rep("小白",7)), weekDay = c(rep(c("周一","周二","周三","周四","周五","周六","周日"),3)))
	# xvar=~weekDay; yvar= ~saleNum; series=~seller
	xlabName = recharts:::autoArgLabel(xvar, deparse(substitute(xvar)))
	ylabName = recharts:::autoArgLabel(yvar, deparse(substitute(yvar)))

	xvar = recharts:::evalFormula(xvar, dat)
	yvar = recharts:::evalFormula(yvar, dat)
	seriesName = recharts:::autoArgLabel(series, deparse(substitute(series)))
	if (!is.null(series)) series = as.factor(as.character(recharts:::evalFormula(series, dat)))

	# if series is null, we will use the xvar and yvar to construct the bar plot..
	if(is.null(xvar) & is.null(yvar) & !is.factor(dat)){
		# Mode 1. use default data.frame as input...
		dat <- as.data.frame(dat, stringsAsFactor=F)
	}else if(!is.null(xvar) & !is.null(yvar) & !is.null(series)){
		# print("Mode1")
		# Mode 2. all of xvar, yvar and series are valid...
		xvar = as.factor(as.character(xvar))
		dat <- with(dat, {
			out <- matrix(nrow=nlevels(series), ncol=nlevels(as.factor(xvar)),
						dimnames=list(unique(series), unique(xvar)))
			out[cbind(series, xvar)] <- yvar
			out
		})
		dat <- as.data.frame(dat)
	}else if(!is.null(xvar) & !is.null(yvar) & is.null(series)){
		# Mode 3. format dat with only x and y variable.
		dat <- data.frame(val = yvar)
		colnames(dat) <- ylabName
		rownames(dat) <- xvar
	}else if(is.null(xvar) & is.null(yvar) & is.factor(dat)){
		# Mode 4. factor
		tempD <- as.data.frame(table(dat))
		dat <- data.frame(val = tempD[,"Freq"])
		colnames(dat) <- "Frequency"
		rownames(dat) <- tempD[,1]
	}


	#opt = list()

	# option$title format.
	opt$title = recharts:::tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)

	opt$calculable = recharts:::calculableSet(calculable = calculable)
	opt$theme = recharts:::themeSet(theme = theme)

	# opt$tooltip format, not open to user now.
	opt$tooltip = recharts:::tooltipSet(tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	opt$toolbox = recharts:::toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

	opt$legend = recharts:::legendSet( show=legend, data=colnames(dat), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
		xlab.data = rownames(dat)
	}
	if(match.arg(ylab.type, c("category" , "value")) == "category" & is.null(ylab.data)){
		ylab.data = colnames(dat)
	}
	opt$xAxis = recharts:::xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	

	opt$yAxis = recharts:::yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)

	# data set...
	opt$series =  vector("list", ncol(dat))
    for(i in 1:dim(dat)[2]) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'bar'
        }

        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(dat)[i]
        } else {
            warning('You can set series:name with colnames(dat).')
        }

        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = unname(dat[,i])
        } else {
            warning('You can set series:data with dat.')
        }
    }
	if(horiz==TRUE) {
		tmp = opt$xAxis
		opt$xAxis = opt$yAxis
		opt$yAxis = tmp
	}
	#jsonStr <- toJSON(opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="ePoints", size=size)
	opt$size = size
	
	
	
	htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)
	##### output list format
	# chart = htmlwidgets::createWidget(
	# 	'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	# )
	# chart
}











