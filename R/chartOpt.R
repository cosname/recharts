#' recharts tilte Set fucntion
#'
#' An shell function for printing of the recharts object.
#'
#' @param x    recharts print object.
#' @param tag   whether print the recharts object to browser or string.
#' @param ...   default parameter.
#' @return The HTML code as a character string.
#' @export 

eTitleSet = function(e1, ...)
{
	settings <- list(...)$optionList
	print(settings)
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
		e1$opt$title$text = settings$title
	}
	
	if (!is.null(settings$subtitle)){
		e1$opt$title$subtext = settings$subtitle
	}
	
	if (!is.null(settings$sublink)){
		e1$opt$title$sublink = settings$sublink
	}	
	
	if (!is.null(settings$link)){
		e1$opt$title$link = settings$link
	}	
	
	if (!is.null(settings$x)){
		e1$opt$title$x = matchPos.x(settings$x)
	}	
	
	if (!is.null(settings$y)){
		e1$opt$title$y = matchPos.y(settings$y)
	}
	
	return(.list2JSON(e1))
}

eToolboxSet = function(e1, ...)
{

	settings <- list(...)$optionList
	print(settings)
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
		e1$opt$toolbox$show = ifelse(settings$show, "true", "false")
	}
	if (!is.null(settings$x)){
		e1$opt$toolbox$x = matchPos.x(settings$x)
	}	
	if (!is.null(settings$y)){
		e1$opt$toolbox$y = matchPos.y(settings$y)
	}
	if (!is.null(settings$orient)){
		e1$opt$toolbox$orient = match.arg(settings$orient, c("horizontal", "vertical"))
	}
	if (!is.null(settings$readOnly)){
		e1$opt$toolbox$feature$dataView = list(readOnly = ifelse(settings$readOnly, "true", "false"))
	}
	if (!is.null(settings$mark)){
		e1$opt$toolbox$feature$mark = ifelse(settings$mark, "true", "false")
	}
	if (!is.null(settings$dataZoom)){
		e1$opt$toolbox$feature$dataZoom = ifelse(settings$dataZoom, "true", "false")
	}
	if (!is.null(settings$magicType)){
		e1$opt$toolbox$feature$magicType = ifelse(settings$magicType, list(c("line", "bar")), "false")
	}
	if (!is.null(settings$restore)){
		e1$opt$toolbox$feature$restore = ifelse(settings$restore, "true", "false")
	}	
	if (!is.null(settings$saveAsImage)){
		e1$opt$toolbox$feature$saveAsImage = ifelse(settings$saveAsImage, "true", "false")
	}

	return(.list2JSON(e1))

}

eCalculableSet = function(e1, ...)
{

	settings <- list(...)$optionList
	print(settings)
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
	# option$toolbox format.
	if (!is.null(settings$calculable)){
		e1$opt$toolbox$calculable = ifelse(settings$calculable, "true", "false")
	}
	return(.list2JSON(e1))

}

eTooltipSet = function(e1, ...)
{

	settings <- list(...)$optionList
	print(settings)
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
		e1$opt$tooltip$show = ifelse(settings$show, "true", "false")
	}	
	if (!is.null(settings$trigger)){
		e1$opt$tooltip$trigger = match.arg(settings$trigger, c("item","axis"))
	}
	if (!is.null(settings$formatter)){
		if(settings$formatter != ""){
			e1$opt$tooltip$formatter = settings$formatter
		}else{
			e1$opt$tooltip$formatter = NULL
		}
	}
	if (!is.null(settings$islandFormatter)){
		e1$opt$tooltip$islandFormatter = settings$islandFormatter
	}
	return(.list2JSON(e1))

}

eLegendSet = function(e1, ...)
{
	settings <- list(...)$optionList
	print(settings)
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
		e1$opt$legend$show = ifelse(settings$show, "true", "false")
	}

	if(length(settings$data) == 0 & length(e1$opt$legend$data)==0){
		e1$opt$legend = list(show="false")
	}else{
		if(length(settings$data) > 0)e1$opt$legend$data = as.list(data)
	}
		
	if(e1$opt$legend$show == "true"){
		e1$opt$legend$show = "true"
		if (!is.null(settings$x)){
			e1$opt$legend$x = matchPos.x(settings$x)
		}	
		if (!is.null(settings$y)){
			e1$opt$legend$y = matchPos.y(settings$y)
		}
		if (!is.null(settings$orient)){
			e1$opt$legend$orient = match.arg(settings$orient, c("horizontal", "vertical"))
		}
	}else{
		e1$opt$legend = list(show="false")
	}
	
	return(.list2JSON(e1))
}

eDataRangeSet = function(e1, ...)
{
	
	settings <- list(...)$optionList
	print(settings)
	if (length(settings) == 0){
		return(FALSE)
	}

	usedSettings = c("show", "lim", "text", "orient", "x", "y", "precision", "calculable", "color")
	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused calculable setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable calculable set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	if (!is.null(settings$show)){
		e1$opt$dataRange$show = ifelse(settings$show, "true", "false")
	}

	if (length(settings$lim) >= 2){
		e1$opt$dataRange$min = floor(settings$lim[1]/10)*10
		e1$opt$dataRange$max = floor(settings$lim[length(settings$lim)]/10)*10
	}

	if (length(settings$text) >= 2){
		e1$opt$dataRange$text = settings$text[c(1, length(settings$text))]
		#e1$opt$dataRange$min = floor(settings$lim[length(settings$lim)]/10)*10
	}
	if (!is.null(settings$orient)){
		e1$opt$dataRange$orient = match.arg(settings$orient, c("horizontal", "vertical"))
	}
	if (!is.null(settings$x)){
		e1$opt$dataRange$x = matchPos.x(settings$x)
	}
	if (!is.null(settings$y)){
		e1$opt$dataRange$y = matchPos.y(settings$y)
	}
	if (!is.null(settings$y)){
		e1$opt$dataRange$y = matchPos.y(settings$y)
	}

	if (!is.null(settings$calculable)){
		e1$opt$dataRange$calculable = ifelse(settings$calculable, "true", "false")
	}
	if (length(settings$color) >= 2){
		e1$opt$dataRange$color = settings$color[c(1, length(settings$color))]
	}
	
	return(.list2JSON(e1))
}
	

eAxis.XSet = function(e1, ...)
{
	
	settings <- list(...)$optionList
	print(settings)
	if(length(settings) == 0){
		return(FALSE)
	}


	usedSettings = c("show", "type", "lim", "data", "sacle", "position", "valueLabel",
		"label.color", "label.fontSize", "labael.margin", "label.rotate", "label.interval",
		"tick.show", "tick.color", "tick.width",
		"splitLine", "splitNumber", "splitArea", 
		"precision", "power", "gap", "name", "nameLocation")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused eAxis.X setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable eAxis.X set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if (!is.null(settings$show)){
		e1$opt$xAxis$axisLabel$show = ifelse(settings$scale, "true", "false")
	}
		
	if (!is.null(settings$type)){
		type = match.arg(settings$type, c("value", "category"))
		e1$opt$xAxis$type = type
	}
	if (e1$opt$xAxis$type == "value"){
		# if the axis type is value, the data argument is inactive
		if (length(settings$lim) >= 2){
			e1$opt$xAxis$min = floor(settings$lim[1]/10)*10
			e1$opt$xAxis$max = floor(settings$lim[length(settings$lim)]/10)*10
		}
		if(!is.null(settings$gap)){
			e1$opt$xAxis$boundaryGap = ifelse(settings$gap, "true", "false")
		}
	}else{
		# if the axis type is category, the lim argument is inactive
		if (length(settings$data) >= 1){
			e1$opt$xAxis$data = as.vector(settings$data)
		}
		if(!is.null(settings$gap)){
			e1$opt$xAxis$boundaryGap = ifelse(settings$gap, "true", "false")
		}
	}
	
	if (!is.null(settings$scale)){
		e1$opt$xAxis$scale = ifelse(settings$scale, "true", "false")
	}
	
	if (!is.null(settings$position)){
		position = match.arg(settings$position, c("bottom", "top"))
		e1$opt$xAxis$position = position
	}

	# xAxis Label settings.
	if (!is.null(settings$valueLabel)){
		e1$opt$xAxis$axisLabel$formatter = paste("{value}", settings$valueLabel, sep="")
	}
	if(!is.null(settings$label.color)){
		e1$opt$xAxis$axisLabel$textStyle$color = settings$label.color
	}
	if(!is.null(settings$label.fontSize)){
		e1$opt$xAxis$axisLabel$textStyle$fontSize = as.numeric(settings$fontSize)
	}
	if(!is.null(settings$label.margin)){
		e1$opt$xAxis$axisLabel$margin = as.numeric(settings$margin)
	}	
	if(!is.null(settings$label.rotate)){
		e1$opt$xAxis$axisLabel$margin = as.numeric(settings$rotate)
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
		e1$opt$xAxis$axisLabel$interval = settings$label.interval
	}
	# xAxis tick settings.
	if(!is.null(settings$tick.show)){
		e1$opt$xAxis$axisTick$show = ifelse(settings$show, "true", "false")
	}
	if(!is.null(settings$tick.color)){
		e1$opt$xAxis$axisTick$show = "true"
		e1$opt$xAxis$axisTick$lineStyle$color = settings$tick.color
	}	
	if(!is.null(settings$tick.width)){
		e1$opt$xAxis$axisTick$show = "true"
		e1$opt$xAxis$axisTick$lineStyle$width = as.numeric(settings$tick.width)
	}

	#xAxis splitLine
	if(!is.null(settings$splitLine)){
		e1$opt$xAxis$splitLine$show = ifelse(settings$splitLine, "true", "false")
	}

	#split Number only for value type.
	if(!is.null(settings$splitNumber)){
		e1$opt$xAxis$splitNumber = as.numeric(settings$splitNumber)
	}

	if(!is.null(settings$splitArea)){
		e1$opt$xAxis$splitArea = ifelse(settings$splitArea, "true", "false")
	}

	if(!is.null(settings$precision)){
		e1$opt$xAxis$precision = as.integer(settings$precision)
	}	
	
	if(!is.null(settings$power)){
		e1$opt$xAxis$precision = as.integer(settings$power)
	}
	
	if(!is.null(settings$gap)){
		if (length(settings$gap)!=2){
			warning("the gap argument only allow a numeric vector([0,0]) as input.")
		}else{
			e1$opt$xAxis$boundaryGap = as.integer(settings$gap)
		}
	}
	
	if(!is.null(settings$name)){
		e1$opt$xAxis$name = settings$name
	}

	if(!is.null(settings$nameLocation)){
		e1$opt$xAxis$nameLocation = match.arg(settings$nameLocation, c("start", "end"))
	}
	return(.list2JSON(e1))

}
eAxis.Y = function(e1, ...)
{
	
	settings <- list(...)$optionList
	print(settings)
	if(length(settings) == 0){
		return(FALSE)
	}


	usedSettings = c("show", "type", "lim", "data", "sacle", "position", "valueLabel",
		"label.color", "label.fontSize", "labael.margin", "label.rotate", "label.interval",
		"tick.show", "tick.color", "tick.width",
		"splitLine", "splitNumber", "splitArea", 
		"precision", "power", "gap", "name", "nameLocation")

	unusedSettings <- setdiff(names(settings), usedSettings)
	if (length(unusedSettings)>0){
		wm_1 <- paste("unused eAxis.Y setting inputs: ", paste(unusedSettings, collapse=","), ".", sep="")
		wm_2 <- paste("Acceptable eAxis.Y set: ", paste( usedSettings, collapse=", "), ".", sep="")
		warning(paste(wm_1, wm_2, sep="\n\r"))
	}
	
	if (!is.null(settings$show)){
		e1$opt$yAxis$axisLabel$show = ifelse(settings$scale, "true", "false")
	}
		
	if (!is.null(settings$type)){
		type = match.arg(settings$type, c("value", "category"))
		e1$opt$yAxis$type = type
	}
	if (e1$opt$yAxis$type == "value"){
		# if the axis type is value, the data argument is inactive
		if (length(settings$lim) >= 2){
			e1$opt$yAxis$min = floor(settings$lim[1]/10)*10
			e1$opt$yAxis$max = floor(settings$lim[length(settings$lim)]/10)*10
		}
		if(!is.null(settings$gap)){
			e1$opt$yAxis$boundaryGap = ifelse(settings$gap, "true", "false")
		}
	}else{
		# if the axis type is category, the lim argument is inactive
		if (length(settings$data) >= 1){
			e1$opt$yAxis$data = as.vector(settings$data)
		}
		if(!is.null(settings$gap)){
			e1$opt$yAxis$boundaryGap = ifelse(settings$gap, "true", "false")
		}
	}
	
	if (!is.null(settings$scale)){
		e1$opt$yAxis$scale = ifelse(settings$scale, "true", "false")
	}
	
	if (!is.null(settings$position)){
		position = match.arg(settings$position, c("left", "right"))
		e1$opt$yAxis$position = position
	}

	# yAxis Label settings.
	if (!is.null(settings$valueLabel)){
		e1$opt$yAxis$axisLabel$formatter = paste("{value}", settings$valueLabel, sep="")
	}
	if(!is.null(settings$label.color)){
		e1$opt$yAxis$axisLabel$textStyle$color = settings$label.color
	}
	if(!is.null(settings$label.fontSize)){
		e1$opt$yAxis$axisLabel$textStyle$fontSize = as.numeric(settings$fontSize)
	}
	if(!is.null(settings$label.margin)){
		e1$opt$yAxis$axisLabel$margin = as.numeric(settings$margin)
	}	
	if(!is.null(settings$label.rotate)){
		e1$opt$yAxis$axisLabel$margin = as.numeric(settings$rotate)
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
		e1$opt$yAxis$axisLabel$interval = settings$label.interval
	}
	# yAxis tick settings.
	if(!is.null(settings$tick.show)){
		e1$opt$yAxis$axisTick$show = ifelse(settings$show, "true", "false")
	}
	if(!is.null(settings$tick.color)){
		e1$opt$yAxis$axisTick$show = "true"
		e1$opt$yAxis$axisTick$lineStyle$color = settings$tick.color
	}	
	if(!is.null(settings$tick.width)){
		e1$opt$yAxis$axisTick$show = "true"
		e1$opt$yAxis$axisTick$lineStyle$width = as.numeric(settings$tick.width)
	}

	#yAxis splitLine
	if(!is.null(settings$splitLine)){
		e1$opt$yAxis$splitLine$show = ifelse(settings$splitLine, "true", "false")
	}

	#split Number only for value type.
	if(!is.null(settings$splitNumber)){
		e1$opt$yAxis$splitNumber = as.numeric(splitNumber)
	}

	if(!is.null(settings$splitArea)){
		e1$opt$yAxis$splitArea = ifelse(settings$splitArea, "true", "false")
	}

	if(!is.null(settings$precision)){
		e1$opt$yAxis$precision = as.integer(settings$precision)
	}	
	
	if(!is.null(settings$power)){
		e1$opt$yAxis$precision = as.integer(settings$power)
	}
	
	if(!is.null(settings$gap)){
		if (length(settings$gap)!=2){
			warning("the gap argument only allow a numeric vector([0,0]) as input.")
		}else{
			e1$opt$yAxis$boundaryGap = as.integer(settings$gap)
		}
	}
	
	if(!is.null(settings$name)){
		e1$opt$yAxis$name = settings$name
	}

	if(!is.null(settings$nameLocation)){
		e1$opt$yAxis$nameLocation = match.arg(settings$nameLocation, c("start", "end"))
	}
	return(.list2JSON(e1))

}


ePolarSet = function(e1, ...)
{
	
	settings <- list(...)$optionList
	print(settings)
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
		if(max(settings$index) > length(e1$opt$polar[[1]]$indicator)){
			stop("index input has invalid elements.")
			# jump out loop
		}
		if( !is.null( settings$name)){
			if(length(settings$name) != length(settings$index)){
				stop("length of name argument is not equal to index argument.")
			}
			for(index in settings$index){
				e1$opt$polar[[1]]$indicator[[index]]$text = settings$name[which(settings$index == index)]
			}
		}
		if( !is.null( settings$lim )){
			settings$lim = as.numeric(matrix(settings$lim, ncol=2))
			if(length(settings$lim[,1]) != length(settings$index)){
				stop("length of lim argument is not equal to index argument.")
			}
			for(index in settings$index){
				lim <- settings$lim[which(settings$index == index),]
				if (!is.na(lim[1])) e1$opt$polar[[1]]$indicator[[index]]$min = lim[1]
				if (!is.na(lim[2])) e1$opt$polar[[1]]$indicator[[index]]$max = lim[2]
			}
		}
	}else{
		# set the polar with name and lim object.
		if( !is.null( settings$name)){
			if(length(settings$name) != length(e1$opt$polar[[1]]$indicator)){
				stop("length of name argument is not equal to the length of given data.")
			}
			for(index in seq(1,length(e1$opt$polar[[1]]$indicator))){
				e1$opt$polar[[1]]$indicator[[index]]$text = settings$name[index]
			}
		}
		
		if( !is.null( settings$lim )){
			settings$lim = as.numeric(matrix(settings$lim, ncol=2))
			if(length(settings$lim[,1]) != length(e1$opt$polar[[1]]$indicator)){
				stop("length of lim argument is not equal to the length of given data.")
			}
			for(index in seq(1,length(e1$opt$polar[[1]]$indicator))){
				lim <- settings$lim[index,]
				if (!is.na(lim[1])) e1$opt$polar[[1]]$indicator[[index]]$min = lim[1]
				if (!is.na(lim[2])) e1$opt$polar[[1]]$indicator[[index]]$max = lim[2]
			}
		}
	}
	
	#set center
	if(length(settings$center) > 0 & length(settings$center) != 2){
		warning("the center argment should be length of 2.")
	}else if(length(settings$center) == 2){
		e1$opt$polar[[1]]$center = settings$center
	}
	
	#set radius
	if(length(settings$radius) > 0){
		e1$opt$polar[[1]]$radius = as.numeric(settings$radius[[1]])
	}
	
	#set scale
	if(!is.null(settings$scale)){
		e1$opt$polar[[1]]$scale = ifelse(settings$scale, "true", "false")
	}

	#set startAngle
	if(length(settings$startAngle) > 0){
		e1$opt$polar[[1]]$radius = as.numeric(settings$radius[[1]])
	}

	#set splitNumber
	if(!is.null(settings$splitNumber)){
		e1$opt$polar[[1]]$splitNumber = as.numeric(settings$splitNumber)
	}
	
	#set precision
	if(!is.null(settings$precision)){
		e1$opt$polar[[1]]$precision = as.numeric(settings$precision)
	}
	#set power
	if(!is.null(settings$power)){
		e1$opt$polar[[1]]$power = as.numeric(settings$power)
	}

	#set name formatter, "" will make the name null.
	if(!is.null(settings$formatter)){
		e1$opt$polar[[1]]$name$formatter = formatter
	}
		#set axisLine show or not
	if(!is.null(settings$axisLine)){
		e1$opt$polar[[1]]$axisLine$show = ifelse(settings$axisLine, "true", "false")
	}

	#set axisLabel show or not
	if(!is.null(settings$axisLabel)){
		e1$opt$polar[[1]]$axisLabel$show = ifelse(settings$axisLabel, "true", "false")
	}
	
	#set splitLine show or not
	if(!is.null(settings$splitLine)){
		e1$opt$polar[[1]]$splitLine$show = ifelse(settings$splitLine, "true", "false")
	}
	#set splitArea show or not
	if(!is.null(settings$splitArea)){
		e1$opt$polar[[1]]$splitArea$show = ifelse(settings$splitArea, "true", "false")
	}
	
	return(.list2JSON(e1))
}
