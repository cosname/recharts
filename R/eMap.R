#' Map charts
#'
#' ECharts style map charts. Only support CHINA now.
#'
#' @param dat    data.frame, rownames are province names.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' testData <- read.csv(system.file("examples", "testDataForMap.csv", package = "recharts"),stringsAsFactors=F) 
#' 
#' eMap(testData, namevar="province")

eMap = function(dat, namevar=NULL, datavar=2:ncol(dat), size = NULL, region="china", color=c("#1e90ff", "#f0ffff"),
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataRange = TRUE, dataRange.x="left", dataRange.y="bottom", dataRange.min=NULL, dataRange.max=NULL,
	dataRange.calculable=TRUE, dataRange.text=c("high", "low"), dataRange.orient="horizontal",
	dataView = FALSE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", 
	calculable=FALSE, xlab = NULL, ylab=NULL,
	showLabel=TRUE, opt = list()) {

	if(class(datavar) == "integer" | class(datavar) == "numeric"){
		datavar = colnames(dat)[datavar]
		datavar = datavar[!is.na(datavar)]
	}else{
		datavar = datavar[datavar%in%colnames(dat)]
	}
	print(datavar)
	if (missing(namevar)| is.null(namevar)){
		insertColumn <- rownames(dat)
		dat <- cbind(insertColumn, dat)
		colnames(dat)[1] <- "region"
		namevar = "region"
	}

	if(length(namevar) > 1) namevar=namevar[1]
	if(class(namevar) == "integer" | class(namevar) == "numeric"){
		namevar = colnames(dat)[as.numeric(namevar)]
	}else if(!namevar %in% colnames(dat)){
		namevar = colnames(dat)[1]
	}

	if(length(datavar) == 0) datavar = colnames(dat)[2]
	if(length(namevar) == 0) namevar = colnames(dat)[1]

	validData <- dat[,c(namevar, datavar)]

	# legendData set
	legendData <- datavar
	opt$legend = recharts:::legendSet(show=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	valueDf <- dat[,datavar]
	
	# option$title format.
	opt$title = recharts:::tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	opt$theme = themeSet(theme = theme)
	opt$calculable = recharts:::calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = recharts:::tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	opt$toolbox = recharts:::toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType=FALSE, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

	if(missing(dataRange.min)|is.null(dataRange.min)){
		dataRange.min=min(validData[,datavar], na.rm = TRUE)
	}

	if(missing(dataRange.max)|is.null(dataRange.max)){
		dataRange.max=max(validData[,datavar], na.rm = TRUE)
	}

	opt$dataRange = recharts:::dataRangeSet(dataRange=dataRange, calculable=dataRange.calculable, dataRange.x=dataRange.x, dataRange.y=dataRange.y,
		dataRange.text = dataRange.text, color=color, precision=1, orient=dataRange.orient, min=dataRange.min, max=dataRange.max)		
	
	opt$series =  vector("list", length(datavar))
    for(i in 1:length(datavar)){		
		outputData <- list()
		#print(datavar[i])
		outputData <- lapply(1:nrow(validData), FUN = function(X){
			list( name= validData[X, namevar], value = validData[X, datavar[i]])
		})
		
		opt$series[[i]] = list(
			name = datavar[i],
			type = "map",
			mapType = region,
			itemStyle = list(
				normal = list(
					label = list(show=showLabel)
				)
			),
			data = outputData
		)
	}	
	

	opt$size = size
	
	### output list format
	chart = htmlwidgets::createWidget(
		'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	)
	chart
}