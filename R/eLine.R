#' Line charts
#'
#' ECharts style line charts.
#'
#' @param dat    data.frame.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' plot(eLine(WorldPhones))


eLine = function(dat, size = c(1024, 768), horiz = FALSE,
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="category", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=TRUE, showLabel=TRUE, opt = list()) 
{
	if (class(dat) != "data.frame") dat <- as.data.frame(dat, stringsAsFactor=F)

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

				
	opt$legend = legendSet( legend=legend, data=colnames(dat), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
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
	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eLine", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "eLine", "list")
	
	### output list format
	return(output)

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
#' plot(eArea(WorldPhones))

eArea = function(dat, size = c(1024, 768), horiz = FALSE, stack="SUM",
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
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
	if (class(dat) != "data.frame") dat <- as.data.frame(dat, stringsAsFactor=F)

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

				
	opt$legend = legendSet( legend=legend, data=colnames(dat), legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
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
	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eArea", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "eArea", "list")
	
	### output list format
	return(output)

}
