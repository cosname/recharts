#' recharts tilteSet fucntion
#'
#' An shell function for printing of the recharts object.
#'
#' @param x    recharts print object.
#' @param tag   whether print the recharts object to browser or string.
#' @param ...   default parameter.
#' @return The HTML code as a character string.
#' @export 

tilteSet = function(title=NULL, link=NULL, subtitle=NULL, sublink=NULL,
			title.x="left", title.y="top")
{

	# option$title format.
	if (is.null(title)){
		title=""
	}	
	
	if (!is.null(link)){
		link=link
	}
	
	if (is.null(subtitle)){
		subtitle=""
	}	
	
	if (!is.null(sublink)){
		sublink=sublink
	}
	
	returnList <- list(
		text = title,
		subtext = subtitle,
		x = matchPos.x(title.x),
		y = matchPos.y(title.y)
	)
	return(returnList)
}



calculableSet = function(calculable)
{
	return(ifelse(calculable, "true", "false") )
}

tooltipSet = function(tooltip, trigger=c("item","axis"), formatter="", islandFormatter="islandPoint")
{
	if (formatter == "") formatter <- NULL
	if (islandFormatter == "") islandFormatter <- NULL
	returnList <- list(
			show=ifelse(tooltip, "true", "false"),
			trigger=match.arg(trigger))

	returnList$formatter = formatter
	returnList$islandFormatter = islandFormatter			
	return(returnList)
}

toolboxSet = function(toolbox=TRUE, toolbox.x="left", toolbox.y="top", orient=c("horizontal", "vertical"), 
		dataView=TRUE, readOnly=TRUE, mark = TRUE, restore=TRUE, dataZoom=FALSE, saveAsImage=TRUE, magicType=FALSE)
{
	if (magicType){
		magicType = list( show = "true", type = c("line", "bar", "stack", "tiled"))
	}else{
		magicType <- list( show  = "false")
	}
	
	if (!dataView){
		returnList <- list(
			show = ifelse(toolbox, "true", "false"),
			x = matchPos.x(toolbox.x), 
			y = matchPos.y(toolbox.y),
			orient = match.arg(orient),
			feature = list(
				mark = list( show = ifelse(mark, "true", "false")),
				dataZoom = list( show = ifelse(dataZoom, "true", "false")),
				magicType = magicType,
				restore = list( show =ifelse(restore, "true", "false")),
				saveAsImage = list( show =ifelse(saveAsImage, "true", "false"))
			)
		)
	}else{
		returnList <- list(
			show = ifelse(toolbox, "true", "false"),
			x = matchPos.x(toolbox.x), 
			y = matchPos.y(toolbox.y),
			orient = match.arg(orient),
			feature = list(
				mark = list( show =ifelse(mark, "true", "false")),
				dataZoom = list( show =ifelse(dataZoom, "true", "false")),
				magicType = magicType,
				restore = list( show =ifelse(restore, "true", "false")),
				dataView = list( show =list(readOnly = ifelse(readOnly, "true", "false"))),
				saveAsImage = list( show =ifelse(saveAsImage, "true", "false"))
			)
		)
	}
	
	return(returnList)

	
}

legendSet = function(legend=TRUE, data=NULL, orient = c("horizontal", "vertical"), legend.x="left", legend.y="top"){
	if(is.null(data)){legend=FALSE}
	if(legend){
		returnList <- list(
			show="true",
			orient = match.arg(orient),
			x = matchPos.x(legend.x),
			y = matchPos.y(legend.y),
			data = as.list(data)
			)
		return(returnList)
	}else{
		return(list(
			show="false"
		))
	}

}
	
dataRangeSet = function(dataRange=TRUE, max=NULL, min=NULL, dataRange.text=c("high","low"), dataRange.x="left", dataRange.y="bottom",
			precision=1, calculable=TRUE, color=c("#1e90ff", "#f0ffff"), orient=c("vertical", "horizontal"))
{

	if (length(color) >= 2){
		color = color[c(1, length(color))]
	}else{
		color = c("#1e90ff", "#f0ffff")
	}	
	
	if (length(dataRange.text) >= 2){
		dataRange.text = dataRange.text[c(1, length(dataRange.text))]
	}else{
		dataRange.text = c("high","low")
	}

	returnList <- list(
		show = ifelse(dataRange, "true", "false"),
		text = dataRange.text,
		x = matchPos.x( dataRange.x),
		y = matchPos.y( dataRange.y),
		calculable = ifelse(calculable, "true", "false"),
		color = color,
		precision = precision,
		orient = match.arg(orient)
	)
	if (!is.null(max)){max=ceiling(max/10)*10}
	if (!is.null(min)){min=floor(min/10)*10}
	returnList$max = max
	returnList$min = min

	return(returnList)
}

xAxisSet = function(axisShow=TRUE, type=c("value", "category"), position=c("bottom", "top"), 
			labelName="", label.namePosition=c("start", "end"), scale=TRUE, lim=NULL,
			axisLine=TRUE, axisTick=FALSE, axisLable=TRUE, splitLine=TRUE, splitArea=FALSE, 
			boundaryGap=TRUE, data=NULL, power=2, precision=2, color = "black")
{
	
	returnList <- list(
			position = match.arg(position),
			name = labelName,
			nameLocation = match.arg(label.namePosition),
			scale = ifelse(scale, "true", "false"),
			precision = precision,
			power = power,
			axisLine = list(show = ifelse(axisLine, "true", "false")),
			axisTick = list(show = ifelse(axisTick, "true", "false")),
			axisLable = list(show = ifelse(axisLable, "true", "false"), textStyle=list(color=color)),
			splitLine = list(show = ifelse(splitLine, "true", "false")),
			splitArea = list(show = ifelse(splitArea, "true", "false"))
		)
	
	if(is.null(lim)){
		returnList$max = NULL
		returnList$min = NULL
	}else{
		returnList$max = max(as.numeric(lim))
		returnList$min = min(as.numeric(lim))
	}
	
	if (type == "value"){
		returnList$type = "value"
		if(is.logical(boundaryGap)){boundaryGap=c(0,0)}
		returnList$boundaryGap = boundaryGap
	}else{
		if(is.null(data)){
			data=""
			warning("no axis data for category axis.")
		}
		returnList$type = "category"
		returnList$data = data
		returnList$boundaryGap = ifelse(boundaryGap, "true", "false")	

	}

	return(returnList)

}

yAxisSet = function(axisShow=TRUE, type=c("value", "category"), position=c("left", "right"), 
			labelName="", label.namePosition=c("start", "end"), scale=TRUE, lim=NULL, 
			axisLine=TRUE, axisTick=FALSE, axisLable=TRUE, splitLine=TRUE, splitArea=FALSE, 
			boundaryGap=TRUE, data=NULL, power=2, precision=2)
{

	type = match.arg(type)
	
	returnList <- list(
			position = match.arg(position),
			name = labelName,
			nameLocation = match.arg(label.namePosition),
			scale = ifelse(scale, "true", "false"),
			precision = precision,
			power = power,
			axisLine = list(show = ifelse(axisLine, "true", "false")),
			axisTick = list(show = ifelse(axisTick, "true", "false")),
			axisLable = list(show = ifelse(axisLable, "true", "false")),
			splitLine = list(show = ifelse(splitLine, "true", "false")),
			splitArea = list(show = ifelse(splitArea, "true", "false"))
		)
		
	if(is.null(lim)){
		returnList$max = NULL
		returnList$min = NULL
	}else{
		returnList$max = max(as.numeric(lim))
		returnList$min = min(as.numeric(lim))
	}

	if (type == "value"){
		returnList$type = "value"
		if(is.logical(boundaryGap)){boundaryGap=c(0,0)}
		returnList$boundaryGap = boundaryGap
	}else{
		if(is.null(data)){
			data=""
			warning("no axis data for category axis.")
		}
		returnList$type = "category"
		returnList$data = data
		returnList$boundaryGap = ifelse(boundaryGap, "true", "false")	

	}
	return(returnList)

}

polarSet = function(name=NULL, ymin=NULL, ymax=NULL, center=NULL, radius=NULL, startAngle=90, splitNumber=NULL,
			scale=FALSE, precision=0, power=100, axisLine=TRUE, axisLabel=FALSE,
			splitLine=TRUE, splitArea=TRUE)
{
	indicator <- vector("list", length(name))

	for(i in 1:length(name)){
		indicator[[i]]$text = name[i]

		if(!is.null(ymin[i]) & !is.na(ymin[i])){
			indicator[[i]]$min = as.numeric(ymin[i])
		}

		if(!is.null(ymax[i]) & !is.na(ymax[i])){
			indicator[[i]]$max = as.numeric(ymax[i])
		}
	}
	
	indicatorList <- indicator
	#print(indicatorList)
	returnList <- list(
		indicator = indicator,
		startAngle = startAngle,
		scale = scale,
		precision = precision,
		power = power,
		axisLine = list(show = axisLine),
		axisLabel = list(show = axisLabel),
		splitLine = list(show = splitLine),
		splitArea = list(show = splitArea)
	)
	
	returnList$center <- center
	returnList$radius <- radius
	returnList$splitNumber <- splitNumber

	return(returnList)
}

dataZoomSet = function(show=FALSE, realtime=TRUE, orient=c("horizontal", "vertical"), x=NULL, y=NULL, zoomLock=FALSE,
				start = 0, end = 100, width = NULL, height = NULL, backgroundColor= "#eee",
				databackgroundColor = "#ccc", fillerColor="rgba(50,205,50,0.4)", 
				handleColor = "rgba(70,130,180,0.8)", xAxisIndex=NULL, yAxisIndex=NULL)
{
	# type = match.arg(type)
	
	returnList <- list(
			show = ifelse(show, "true", "false"),
			realtime = ifelse(realtime, "true", "false"),
			orient = match.arg(orient),
			zoomLock = ifelse(zoomLock, "true", "false"),
			start = as.numeric(start),
			end = as.numeric(end),
			backgroundColor = backgroundColor,
			databackgroundColor = databackgroundColor,
			fillerColor = fillerColor,
			handleColor = handleColor,
	)
	
	if(!is.null(x) && !is.na(as.numeric(x))){
		returnList$x = as.numeric(x)
	}else{
		returnList$x = NULL
	}
	
	if(!is.null(y) && !is.na(as.numeric(y))){
		returnList$y = as.numeric(y)
	}else{
		returnList$y = NULL
	}
	
	if(!is.null(width) && !is.na(as.numeric(width))){
		returnList$width = as.numeric(width)
	}else{
		returnList$width = NULL
	}
	
	if(!is.null(height) && !is.na(as.numeric(height))){
		returnList$height = as.numeric(height)
	}else{
		returnList$height = NULL
	}	
	if(length(xAxisIndex) > 0){
		returnList$xAxisIndex = as.list(xAxisIndex)
	}
	if(length(yAxisIndex) > 0){
		returnList$yAxisIndex = as.list(yAxisIndex)
	}
	
	return(returnList)
}