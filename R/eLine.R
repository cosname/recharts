#' Line charts
#'
#' ECharts style line charts.
#'
#' @param dat    data.frame.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' eLine(WorldPhones, theme=1)


eLine = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL, horiz = FALSE,
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
	xlabName = recharts:::autoArgLabel(xvar, deparse(substitute(xvar)))
	ylabName = recharts:::autoArgLabel(yvar, deparse(substitute(yvar)))

	xvar = as.factor(recharts:::evalFormula(xvar, dat))
	yvar = recharts:::evalFormula(yvar, dat)

	series = as.factor(recharts:::evalFormula(series, dat))

	# if series is null, we will use the xvar and yvar to construct the bar plot..
	if(is.null(xvar) & is.null(yvar) & !is.factor(dat)){
		# Mode 1. use default data.frame as input...
		dat <- as.data.frame(dat, stringsAsFactor=F)
	}else if(!is.null(xvar) & !is.null(yvar) & !is.null(series)){
		#print("Mode1")
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


	opt$legend = legendSet( show=legend, data=colnames(dat), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
		xlab.data = rownames(dat)
	}
	if(match.arg(ylab.type, c("category" , "value")) == "category" & is.null(ylab.data)){
		ylab.data = colnames(dat)
	}
	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)

	# data set...
	opt$series =  vector("list", ncol(dat))
    for(i in 1:ncol(dat)) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'line'
        }
        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(dat)[i]
        } else {
            warning('You can set series:name with colnames(dat).')
        }

        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = unnames(dat[,i])
        } else {
            warning('You can set series:data with dat.')
        }
    }

	if(horiz==TRUE) {
		tmp = opt$xAxis
		opt$xAxis = opt$yAxis
		opt$yAxis = tmp
	}
	opt$size = size
	
	htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = size[1], height = size[2],
		preRenderHook = function(instance) {
			instance
		}
	)

}

#' Area charts
#'
#' ECharts style area charts.
#'
#' @param dat    data.frame or matrix
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' eArea(WorldPhones)

eArea = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL, horiz = FALSE, stack="SUM",
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=FALSE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=TRUE, showLabel=TRUE, opt = list()) 
{
	xlabName = recharts:::autoArgLabel(xvar, deparse(substitute(xvar)))
	ylabName = recharts:::autoArgLabel(yvar, deparse(substitute(yvar)))

	xvar = as.factor(recharts:::evalFormula(xvar, dat))
	yvar = recharts:::evalFormula(yvar, dat)

	series = as.factor(recharts:::evalFormula(series, dat))

	# if series is null, we will use the xvar and yvar to construct the bar plot..
	if(is.null(xvar) & is.null(yvar) & !is.factor(dat)){
		# Mode 1. use default data.frame as input...
		dat <- as.data.frame(dat, stringsAsFactor=F)
	}else if(!is.null(xvar) & !is.null(yvar) & !is.null(series)){
		#print("Mode1")
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
	
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")
	
	opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = magicType, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

				
	opt$legend = legendSet( show=legend, data=colnames(dat), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	if(match.arg(xlab.type, c("category" , "value")) == "category" & is.null(xlab.data)){
		xlab.data = rownames(dat)
	}
	if(match.arg(ylab.type, c("category" , "value")) == "category" & is.null(ylab.data)){
		ylab.data = colnames(dat)
	}
	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale)

	# data set...
	opt$series =  vector("list", ncol(dat))

    for(i in 1:ncol(dat)) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'line'
        }

        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(dat)[i]
        } else {
            warning('You can set series:name with dat.')
        }
        
        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = unnames(dat[,i])
        } else {
            warning('You can set series:data with dat.')
        }
		
		if(is.null(opt$series[[i]]$stack)) {
            opt$series[[i]]$stack = 'SUM'
        }

        if(is.null(opt$series[[i]]$itemStyle$normal$areaStyle$type)) {
            opt$series[[i]]$itemStyle$normal$areaStyle$type = 'default'
        }
    }
    

	if(horiz==TRUE) {
		tmp = opt$xAxis
		opt$xAxis = opt$yAxis
		opt$yAxis = tmp
	}
	
	opt$size = size
	
	displayOutput(opt)
	htmlwidgets::createWidget(
		'echarts', opt,
		package = 'recharts', width = opt$size[1], height = opt$size[2],
		preRenderHook = function(instance) {
			instance
		}
	)

}
