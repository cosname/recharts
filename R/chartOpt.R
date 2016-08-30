#' recharts tilte Set fucntion
#'
#' An shell function for printing of the recharts object.
#'
#' @param x    recharts print object.
#' @param tag   whether print the recharts object to browser or string.
#' @param ...   default parameter.
#' @return The HTML code as a character string.
#' @export 

eTitleSet = function(chart, ...)
{
	#print("eTitleSet")
	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}
	
	titleSettings = c("title", "link", "subtitle", "sublink", "x", "y")
	unusedSettings <- setdiff(names(settings), titleSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused title setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable title set: ", paste( titleSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	# option$title format.
	if (!is.null(settings$title)){
		chart$x$title$text = settings$title
	}
	
	if (!is.null(settings$subtitle)){
		chart$x$title$subtext = settings$subtitle
	}
	
	if (!is.null(settings$sublink)){
		chart$x$title$sublink = settings$sublink
	}	
	
	if (!is.null(settings$link)){
		chart$x$title$link = settings$link
	}
	
	if (!is.null(settings$x)){
		chart$x$title$x = matchPos.x(settings$x)
	}
	
	if (!is.null(settings$y)){
		chart$x$title$y = matchPos.y(settings$y)
	}
	
	chart
}

eToolboxSet = function(chart, ...)
{

	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}
	
	usedSettings = c("show", "x", "y", "orient", "readOnly", 
		"mark", "restore", "dataZoom", "saveAsImage", "magicType")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused toolbox setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable toolbox set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	# option$toolbox format.
	if (!is.null(settings$show)){
		chart$x$toolbox$show = ifelse(settings$show, TRUE, FALSE)
	}
	if (!is.null(settings$x)){
		chart$x$toolbox$x = matchPos.x(settings$x)
	}
	if (!is.null(settings$y)){
		chart$x$toolbox$y = matchPos.y(settings$y)
	}
	if (!is.null(settings$orient)){
		chart$x$toolbox$orient = match.arg(settings$orient, c("horizontal", "vertical"))
	}
	if (!is.null(settings$readOnly)){
		chart$x$toolbox$feature$dataView$show = list(readOnly = ifelse(settings$readOnly, TRUE, FALSE))
	}
	if (!is.null(settings$mark)){
		chart$x$toolbox$feature$mark$show = ifelse(settings$mark, TRUE, FALSE)
	}
	if (!is.null(settings$dataZoom)){
		chart$x$toolbox$feature$dataZoom$show = ifelse(settings$dataZoom, TRUE, FALSE)
	}
	if (!is.null(settings$magicType)){
		#print(class(e1))
		if (settings$magicType){
			chart$x$toolbox$feature$magicType$show = TRUE
		}else{
			chart$x$toolbox$feature$magicType$show = FALSE
		}
	}
	if (!is.null(settings$restore)){
		chart$x$toolbox$feature$restore$show = ifelse(settings$restore, TRUE, FALSE)
	}	
	if (!is.null(settings$saveAsImage)){
		chart$x$toolbox$feature$saveAsImage$show = ifelse(settings$saveAsImage, TRUE, FALSE)
	}
	chart
}

eCalculableSet = function(chart, ...)
{

	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}
	
	usedSettings = c("calculable")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	# option$calculable format.
	if (!is.null(settings$calculable)){
		chart$x$calculable = ifelse(settings$calculable, TRUE, FALSE)
	}
	chart
}

eThemeSet = function(chart, ...)
{
	themeArray <- c("macarons","infographic","shiny","dark","blue","green","red","gray","helianthus","roma","mint","macarons2","sakura","default")

	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}
	
	usedSettings = c("theme")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	# option$calculable format.
	if (!is.null(settings$theme)){
		if (is.numeric(settings$theme)){
			theme = themeArray[settings$theme]
			chart$x$theme = theme
		}else if(length(which(themeArray == settings$theme)) >0){
			chart$x$theme = settings$theme
		}else{
			wm_3 = paste("Invalid theme settings:", settings$theme)
			wm_4 = paste("You can type in the index or the name of theme Array: ",  paste( themeArray, collapse=","))
			warning(paste(wm_3, wm_4, sep="\n\r"))
			chart$x$theme = "default"
		}
	}
	chart
}

eTooltipSet = function(chart, ...)
{

	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("show", "trigger", "formatter", "islandFormatter")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	# option$tooltip format.
	if (!is.null(settings$show)){
		chart$x$tooltip$show = ifelse(settings$show, TRUE, FALSE)
	}	
	if (!is.null(settings$trigger)){
		chart$x$tooltip$trigger = match.arg(settings$trigger, c("item","axis"))
	}
	if (!is.null(settings$formatter)){
		if(settings$formatter != ""){
			chart$x$tooltip$formatter = settings$formatter
		}else{
			chart$x$tooltip$formatter = NULL
		}
	}
	if (!is.null(settings$islandFormatter)){
		chart$x$tooltip$islandFormatter = settings$islandFormatter
	}
	chart

}

eLegendSet = function(chart, ...)
{
	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("show", "data", "orient", "x", "y")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	if (!is.null(settings$show)){
		chart$x$legend$show = ifelse(settings$show, TRUE, FALSE)
	}

	if(length(settings$data) == 0 & length(chart$x$legend$data)==0){
		chart$x$legend = list(show=FALSE)
	}else{
		#print(111)
		if(length(settings$data) > 0)chart$x$legend$data = as.list(settings$data)
	}

	if(chart$x$legend$show == TRUE){
		chart$x$legend$show = TRUE
		if (!is.null(settings$x)){
			chart$x$legend$x = matchPos.x(settings$x)
		}	
		if (!is.null(settings$y)){
			chart$x$legend$y = matchPos.y(settings$y)
		}
		if (!is.null(settings$orient)){
			chart$x$legend$orient = match.arg(settings$orient, c("horizontal", "vertical"))
		}
	}else{
		chart$x$legend = list(show=FALSE)
		chart$x$legend$data = as.list(settings$data)
	}
	chart
}
eDataZoomSet = function(chart, ...)
{
	settings <- list(...)$optionList
	if (length(settings) == 0){
		return(FALSE)
	}
	
	usedSettings = c("show", "realtime", "orient", "x", "y", "start", "end", "zoomLock", "width", "height", "backgroundColor", 
		"databackgroundColor", "fillerColor", "handleColor", "xAxisIndex", "yAxisIndex")
	
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused dataZoom setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable dataZoom set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if (!is.null(settings$show)){
		chart$x$dataZoom$show = ifelse(settings$show, TRUE, FALSE)
	}	
	
	if (!is.null(settings$realtime)){
		chart$x$dataZoom$realtime = ifelse(settings$realtime, TRUE, FALSE)
	}
	
	if (!is.null(settings$orient)){
		chart$x$dataZoom$orient = match.arg(settings$orient, c("horizontal", "vertical"))
	}
	
	if(!is.null(settings$x) && !is.na(as.numeric(settings$x))){
		chart$x$dataZoom$x = as.numeric(settings$x)
	}else{
		chart$x$dataZoom$x = NULL
	}

	if(!is.null(settings$y) && !is.na(as.numeric(settings$y))){
		chart$x$dataZoom$y = as.numeric(settings$y)
	}else{
		chart$x$dataZoom$y = NULL
	}

	
	if(!is.null(settings$start) && !is.na(as.numeric(settings$start))){
		chart$x$dataZoom$start = as.numeric(settings$start)
	}else{
		chart$x$dataZoom$start = NULL
	}


	if (!is.null(settings$zoomLock)){
		chart$x$dataZoom$zoomLock = ifelse(settings$zoomLock, TRUE, FALSE)
	}
	

	if(!is.null(settings$end) && !is.na(as.numeric(settings$end))){
		chart$x$dataZoom$end = as.numeric(settings$end)
	}else{
		chart$x$dataZoom$end = NULL
	}

		
	if(!is.null(settings$width) && !is.na(as.numeric(settings$width))){
		chart$x$dataZoom$width = as.numeric(settings$width)
	}else{
		chart$x$dataZoom$width = NULL
	}
	
	if(!is.null(settings$height) && !is.na(as.numeric(settings$height))){
		chart$x$dataZoom$height = as.numeric(settings$height)
	}else{
		chart$x$dataZoom$height = NULL
	}

	
	if (!is.null(settings$backgroundColor)){
		chart$x$dataZoom$backgroundColor = settings$backgroundColor
	}
	
	if (!is.null(settings$databackgroundColor)){
		chart$x$dataZoom$databackgroundColor = settings$databackgroundColor
	}

	if (!is.null(settings$fillerColor)){
		chart$x$dataZoom$fillerColor = settings$fillerColor
	}
	
	if (!is.null(settings$handleColor)){
		chart$x$dataZoom$handleColor = settings$handleColor
	}	
	if (!is.null(settings$xAxisIndex)){
		chart$x$dataZoom$xAxisIndex = as.list(settings$xAxisIndex)
	}	
	if (!is.null(settings$yAxisIndex)){
		chart$x$dataZoom$yAxisIndex = as.list(settings$yAxisIndex)
	}
	
	chart

}

eDataRangeSet = function(chart, ...)
{
	
	settings <- list(...)$optionList
	#print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("show", "lim", "text", "orient", "x", "y", 
		"precision", "calculable", "color")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	if (!is.null(settings$show)){
		chart$x$dataRange$show = ifelse(settings$show, TRUE, FALSE)
	}

	if (length(settings$lim) >= 2){
		chart$x$dataRange$min = floor(settings$lim[1]/10)*10
		chart$x$dataRange$max = floor(settings$lim[length(settings$lim)]/10)*10
	}

	if (length(settings$text) >= 2){
		chart$x$dataRange$text = settings$text[c(1, length(settings$text))]
		#chart$x$dataRange$min = floor(settings$lim[length(settings$lim)]/10)*10
	}
	if (!is.null(settings$orient)){
		chart$x$dataRange$orient = match.arg(settings$orient, c("horizontal", "vertical"))
	}
	if (!is.null(settings$x)){
		chart$x$dataRange$x = matchPos.x(settings$x)
	}
	if (!is.null(settings$y)){
		chart$x$dataRange$y = matchPos.y(settings$y)
	}
	if (!is.null(settings$y)){
		chart$x$dataRange$y = matchPos.y(settings$y)
	}

	if (!is.null(settings$calculable)){
		chart$x$dataRange$calculable = ifelse(settings$calculable, TRUE, FALSE)
	}
	if (length(settings$color) >= 2){
		chart$x$dataRange$color = settings$color[c(1, length(settings$color))]
	}
	
	chart
}
	

eAxis.XSet = function(chart, ...)
{
	
	settings <- list(...)$optionList
	if(length(settings) == 0){
		return(FALSE)
	}


	usedSettings = c("show", "type", "lim", "data", "scale", "position", "valueLabel",
		"label.color", "label.fontSize", "label.margin", "label.rotate", "label.interval",
		"tick.show", "tick.color", "tick.width", "tick.length",
		"splitLine", "splitNumber", "splitArea", 
		"precision", "power", "gap", "name", "nameLocation")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused eAxis.X setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable eAxis.X set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if (!is.null(settings$show)){
		chart$x$xAxis$axisLabel$show = ifelse(settings$show, TRUE, FALSE)
	}
		
	if (!is.null(settings$type)){
		type = match.arg(settings$type, c("value", "category"))
		chart$x$xAxis$type = type
	}
	if (chart$x$xAxis$type == "value"){
		# if the axis type is value, the data argument is inactive
		if (length(settings$lim) >= 2){
			chart$x$xAxis$min = floor(settings$lim[1]/10)*10
			chart$x$xAxis$max = floor(settings$lim[length(settings$lim)]/10)*10
		}
		if(!is.null(settings$gap)){
			chart$x$xAxis$boundaryGap = ifelse(settings$gap, TRUE, FALSE)
		}

		if(!is.null(settings$scale)){
			chart$x$xAxis$scale = ifelse(settings$scale, TRUE, FALSE)
		}
	}else{

		# if the axis type is category, the lim argument is inactive
		if (length(settings$data) >= 1){
			chart$x$xAxis$data = settings$data
		}
		if(!is.null(settings$gap)){
			chart$x$xAxis$boundaryGap = ifelse(settings$gap, TRUE, FALSE)
		}
	}
	
	if (!is.null(settings$scale)){
		chart$x$xAxis$scale = ifelse(settings$scale, TRUE, FALSE)
	}
	
	if (!is.null(settings$position)){
		position = match.arg(settings$position, c("bottom", "top"))
		chart$x$xAxis$position = position
	}

	# xAxis Label settings.
	if (!is.null(settings$valueLabel)){
		chart$x$xAxis$axisLabel$formatter = paste("{value}", settings$valueLabel, sep="")
	}
	if(!is.null(settings$label.color)){
		chart$x$xAxis$axisLabel$textStyle$color = settings$label.color
	}
	if(!is.null(settings$label.fontSize)){
		chart$x$xAxis$axisLabel$textStyle$fontSize = as.numeric(settings$label.fontSize)
	}
	if(!is.null(settings$label.margin)){
		chart$x$xAxis$axisLabel$margin = as.numeric(settings$label.margin)
	}	
	if(!is.null(settings$label.rotate)){
		chart$x$xAxis$axisLabel$rotate = as.numeric(settings$label.rotate)
	}
	if(!is.null(settings$label.interval)){
		if(tolower(settings$label.interval) != "auto" ){
			if(is.na(as.numeric(settings$label.interval))){
				settings$label.interval = "auto"
			}else{
				settings$label.interval = as.numeric(settings$label.interval)
			}
		}else{
			settings$label.interval = "auto"
		}
		chart$x$xAxis$axisLabel$interval = settings$label.interval
	}
	# xAxis tick settings.
	if(!is.null(settings$tick.show)){
		chart$x$xAxis$axisTick$show = ifelse(settings$tick.show, TRUE, FALSE)
	}
	if(!is.null(settings$tick.color)){
		chart$x$xAxis$axisTick$show = TRUE
		chart$x$xAxis$axisTick$lineStyle$color = settings$tick.color
	}	
	if(!is.null(settings$tick.width)){
		chart$x$xAxis$axisTick$show = TRUE
		chart$x$xAxis$axisTick$lineStyle$width = as.numeric(settings$tick.width)
	}
	if(!is.null(settings$tick.length)){
		chart$x$xAxis$axisTick$show = TRUE
		chart$x$xAxis$axisTick$lineStyle$length = as.numeric(settings$tick.length)
	}

	#xAxis splitLine
	if(!is.null(settings$splitLine)){
		chart$x$xAxis$splitLine$show = ifelse(settings$splitLine, TRUE, FALSE)
	}

	#split Number only for value type.
	if(!is.null(settings$splitNumber)){
		chart$x$xAxis$splitNumber = as.numeric(settings$splitNumber)
	}

	if(!is.null(settings$splitArea)){
		chart$x$xAxis$splitArea = ifelse(settings$splitArea, TRUE, FALSE)
	}

	if(!is.null(settings$precision)){
		chart$x$xAxis$precision = as.integer(settings$precision)
	}
	
	if(!is.null(settings$power)){
		chart$x$xAxis$precision = as.integer(settings$power)
	}
	

	
	if(!is.null(settings$name)){
		chart$x$xAxis$name = settings$name
	}

	if(!is.null(settings$nameLocation)){
		chart$x$xAxis$nameLocation = match.arg(settings$nameLocation, c("start", "end"))
	}
	chart

}

eAxis.YSet = function(chart, ...)
{
	
	settings <- list(...)$optionList
	#print(settings)
	if(length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("show", "type", "lim", "data", "scale", "position", "valueLabel",
		"label.color", "label.fontSize", "label.margin", "label.rotate", "label.interval",
		"tick.show", "tick.color", "tick.width", "tick.length",
		"splitLine", "splitNumber", "splitArea", 
		"precision", "power", "gap", "name", "nameLocation")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused eAxis.Y setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable eAxis.Y set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if (!is.null(settings$show)){
		chart$x$yAxis$axisLabel$show = ifelse(settings$show, TRUE, FALSE)
	}
		
	if (!is.null(settings$type)){
		type = match.arg(settings$type, c("value", "category"))
		chart$x$yAxis$type = type
	}
	if (chart$x$yAxis$type == "value"){
		# if the axis type is value, the data argument is inactive
		if (length(settings$lim) >= 2){
			chart$x$yAxis$min = floor(settings$lim[1]/10)*10
			chart$x$yAxis$max = floor(settings$lim[length(settings$lim)]/10)*10
		}
		if(!is.null(settings$gap)){
			if (length(settings$gap)!=2){
				warning("the gap argument only allow a numeric vector([0,0]) as input.")
			}else{
				chart$x$yAxis$boundaryGap = as.numeric(settings$gap)
			}
		}
		if(!is.null(settings$scale)){
			chart$x$yAxis$scale = ifelse(settings$scale, TRUE, FALSE)
		}
	}else{
		# if the axis type is category, the lim argument is inactive
		if (length(settings$data) >= 1){
			chart$x$yAxis$data = as.vector(settings$data)
		}
		if(!is.null(settings$gap)){
			chart$x$yAxis$boundaryGap = ifelse(settings$gap, TRUE, FALSE)
		}
	}
	
	if (!is.null(settings$scale)){
		chart$x$yAxis$scale = ifelse(settings$scale, TRUE, FALSE)
	}
	
	if (!is.null(settings$position)){
		position = match.arg(settings$position, c("left", "right"))
		chart$x$yAxis$position = position
	}

	# yAxis Label settings.
	if (!is.null(settings$valueLabel)){
		chart$x$yAxis$axisLabel$formatter = paste("{value}", settings$valueLabel, sep="")
	}
	if(!is.null(settings$label.color)){
		chart$x$yAxis$axisLabel$textStyle$color = settings$label.color
	}
	if(!is.null(settings$label.fontSize)){
		chart$x$yAxis$axisLabel$textStyle$fontSize = as.numeric(settings$label.fontSize)
	}
	if(!is.null(settings$label.margin)){
		chart$x$yAxis$axisLabel$margin = as.numeric(settings$label.margin)
	}	
	if(!is.null(settings$label.rotate)){
		chart$x$yAxis$axisLabel$rotate = as.numeric(settings$label.rotate)
	}
	if(!is.null(settings$label.interval)){
		if(tolower(settings$label.interval) != "auto" ){
			if(is.na(as.numeric(settings$label.interval))){
				settings$label.interval = "auto"
			}else{
				settings$label.interval = as.numeric(settings$label.interval)
			}
		}else{
			settings$label.interval = "auto"
		}
		chart$x$yAxis$axisLabel$interval = settings$label.interval
	}
	# yAxis tick settings.
	if(!is.null(settings$tick.show)){
		chart$x$yAxis$axisTick$show = ifelse(settings$tick.show, TRUE, FALSE)
	}
	if(!is.null(settings$tick.color)){
		chart$x$yAxis$axisTick$show = TRUE
		chart$x$yAxis$axisTick$lineStyle$color = settings$tick.color
	}	
	if(!is.null(settings$tick.width)){
		chart$x$yAxis$axisTick$show = TRUE
		chart$x$yAxis$axisTick$lineStyle$width = as.numeric(settings$tick.width)
	}	
	if(!is.null(settings$tick.length)){
		chart$x$yAxis$axisTick$show = TRUE
		chart$x$yAxis$axisTick$lineStyle$length = as.numeric(settings$tick.length)
	}

	#yAxis splitLine
	if(!is.null(settings$splitLine)){
		chart$x$yAxis$splitLine$show = ifelse(settings$splitLine, TRUE, FALSE)
	}

	#split Number only for value type.
	if(!is.null(settings$splitNumber)){
		chart$x$yAxis$splitNumber = as.numeric(settings$splitNumber)
	}

	if(!is.null(settings$splitArea)){
		chart$x$yAxis$splitArea = ifelse(settings$splitArea, TRUE, FALSE)
	}

	if(!is.null(settings$precision)){
		chart$x$yAxis$precision = as.integer(settings$precision)
	}	
	
	if(!is.null(settings$power)){
		chart$x$yAxis$precision = as.integer(settings$power)
	}
	
	if(!is.null(settings$name)){
		chart$x$yAxis$name = settings$name
	}

	if(!is.null(settings$nameLocation)){
		chart$x$yAxis$nameLocation = match.arg(settings$nameLocation, c("start", "end"))
	}
	chart

}


ePolarSet = function(chart, ...)
{
	
	settings <- list(...)$optionList
	#print(settings)
	if(length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("index", "center", "name", "lim", "radius", "scale", "startAngle", "splitNumber",
		"precision", "power", "axisLine", "axisLabel", "splitLine", "splitArea")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused ePolar setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable ePolar set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}

	## name and lim setting.
	if(is.null(settings$index)){
		# set the polar[[index]] with name and lim.
		if(max(settings$index) > length(chart$x$polar[[1]]$indicator)){
			stop("index input has invalid elements.")
			# jump out loop
		}
		if( !is.null( settings$name)){
			if(length(settings$name) != length(settings$index)){
				stop("length of name argument is not equal to index argument.")
			}
			for(index in settings$index){
				chart$x$polar[[1]]$indicator[[index]]$text = settings$name[which(settings$index == index)]
			}
		}
		if( !is.null( settings$lim )){
			settings$lim = as.numeric(matrix(settings$lim, ncol=2))
			if(length(settings$lim[,1]) != length(settings$index)){
				stop("length of lim argument is not equal to index argument.")
			}
			for(index in settings$index){
				lim <- settings$lim[which(settings$index == index),]
				if (!is.na(lim[1])) chart$x$polar[[1]]$indicator[[index]]$min = lim[1]
				if (!is.na(lim[2])) chart$x$polar[[1]]$indicator[[index]]$max = lim[2]
			}
		}
	}else{
		# set the polar with name and lim object.
		if( !is.null( settings$name)){
			if(length(settings$name) != length(chart$x$polar[[1]]$indicator)){
				stop("length of name argument is not equal to the length of given data.")
			}
			for(index in seq(1,length(chart$x$polar[[1]]$indicator))){
				chart$x$polar[[1]]$indicator[[index]]$text = settings$name[index]
			}
		}
		
		if( !is.null( settings$lim )){
			settings$lim = as.numeric(matrix(settings$lim, ncol=2))
			if(length(settings$lim[,1]) != length(chart$x$polar[[1]]$indicator)){
				stop("length of lim argument is not equal to the length of given data.")
			}
			for(index in seq(1,length(chart$x$polar[[1]]$indicator))){
				lim <- settings$lim[index,]
				if (!is.na(lim[1])) chart$x$polar[[1]]$indicator[[index]]$min = lim[1]
				if (!is.na(lim[2])) chart$x$polar[[1]]$indicator[[index]]$max = lim[2]
			}
		}
	}
	
	#set center
	if(length(settings$center) > 0 & length(settings$center) != 2){
		warning("the center argment should be length of 2.")
	}else if(length(settings$center) == 2){
		chart$x$polar[[1]]$center = settings$center
	}
	
	#set radius
	if(length(settings$radius) > 0){
		chart$x$polar[[1]]$radius = as.numeric(settings$radius[[1]])
	}
	
	#set scale
	if(!is.null(settings$scale)){
		chart$x$polar[[1]]$scale = ifelse(settings$scale, TRUE, FALSE)
	}

	#set startAngle
	if(length(settings$startAngle) > 0){
		chart$x$polar[[1]]$radius = as.numeric(settings$radius[[1]])
	}

	#set splitNumber
	if(!is.null(settings$splitNumber)){
		chart$x$polar[[1]]$splitNumber = as.numeric(settings$splitNumber)
	}
	
	#set precision
	if(!is.null(settings$precision)){
		chart$x$polar[[1]]$precision = as.numeric(settings$precision)
	}
	#set power
	if(!is.null(settings$power)){
		chart$x$polar[[1]]$power = as.numeric(settings$power)
	}

	#set name formatter, "" will make the name null.
	if(!is.null(settings$formatter)){
		chart$x$polar[[1]]$name$formatter = formatter
	}
		#set axisLine show or not
	if(!is.null(settings$axisLine)){
		chart$x$polar[[1]]$axisLine$show = ifelse(settings$axisLine, TRUE, FALSE)
	}

	#set axisLabel show or not
	if(!is.null(settings$axisLabel)){
		chart$x$polar[[1]]$axisLabel$show = ifelse(settings$axisLabel, TRUE, FALSE)
	}
	
	#set splitLine show or not
	if(!is.null(settings$splitLine)){
		chart$x$polar[[1]]$splitLine$show = ifelse(settings$splitLine, TRUE, FALSE)
	}
	#set splitArea show or not
	if(!is.null(settings$splitArea)){
		chart$x$polar[[1]]$splitArea$show = ifelse(settings$splitArea, TRUE, FALSE)
	}
	
	chart
}


#' recharts set fucntion
#'
#' An shell function for setting arguments of the recharts object.
#'
#' @param obj  recharts object.
#' @return The output list of recharts as a list.
#' @export 

optionSet <- function(chart, ...){

	settings <- list(...)$optionList
	#print(settings)
	if(length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("size", "calculable", "region")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused eOption setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable eOption set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if(length(settings$size) == 2){
		chart$x$size = as.numeric(settings$size)
	}
		
	if (!is.null(settings$calculable)){
		chart$x$calculable = ifelse(settings$calculable, TRUE, FALSE)
	}	
	#print(settings$region)
	if (!is.null(settings$region)){
		newRegion = settings$region
		for (i in 1:length(chart$x$series)){
			chart$x$series[[i]]$mapType = newRegion
		}
	}
	chart
}
