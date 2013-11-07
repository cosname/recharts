#' Pie charts
#'
#' ECharts style pie charts.
#'
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' plot(ePie(x))

ePie = function(dat, xvar=NULL, namevar=NULL, type=c("pie", "rose"), roseType=c("radias", "area"),
	windowSize = c(500, 500), main = NULL, subtitle = NULL, titlePos.x = c("center", "left", "right"),
	titlePos.y = c("top", "center", "bottom"), legend.x = c("center", "left", "right"), legend.y= c("bottom", "center", "top"),
	legend.orient=c("horizontal", "vertical"),xlab = NULL, toolbox = TRUE, readOnly = TRUE, mark=FALSE, showLabel=TRUE) 
	{
    
	opt = list()
	
	type <- match.arg(type)
	roseType <- match.arg(roseType)
	
	# format the dat to data.frame
	if (class(dat) != "data.frame") dat <- as.data.frame(dat)
	
	# if the xvar is null, will use the first column of dat as default.	And check the xvar in the dat colnames.
	if (is.null(xvar) || !xvar %in% colnames(dat)) xvar = colnames(dat)[1]
	
	# if the namevar is null, will use rownames of dat as default.	And check the xvar in the dat colnames.
	if (is.null(namevar) || !namevar %in% colnames(dat)) {
		dat[,"NAME"] = rownames(dat)
		namevar = "NAME"
	}
	
	# option$title format.
	if (is.null(main)){
		if (type == "rose"){
			main = paste("rose plot for", roseType, "type")
		}else{
			main = "pie chart of recharts"
		}
	}
	if (is.null(subtitle)){
		subtitle = ""
	}
	opt$title = list(
		text = main,
		subtext = subtitle,
		x = match.arg(titlePos.x), 
		y = match.arg(titlePos.y)
	)
	
	# opt$tooltip format, not open to user now.
	opt$tooltip = list(
		trigger = "item",
		formatter = "{a} <br/>{b} : {c} ({d}%)"
	)
	
	# toolbox format
	opt$toolbox=list(
		show = ifelse(toolbox, "true", "false"),
		feature = list(
			mark = ifelse(mark, "true", "false"),
			dataView = list(readOnly = ifelse(readOnly, "true", "false")),
			restore = "true",
			saveAsImage = "true"
		)
	)
	
	# format legend
	opt$legend = list(
		orient = match.arg(legend.orient),
		x = match.arg(legend.x),
		y = match.arg(legend.y),
		data = dat[[namevar]]
	)
	
	opt$calculable = TRUE
	
	datFrame = data.frame(value=dat[[xvar]], name=dat[[namevar]])
    datList = split(datFrame, 1:dim(datFrame)[1])
    names(datList) = NULL
	
	#showLabelLine=showLabel
	# now we don't support the multiple graph in one canvas
	opt$series = list(
		list(
			name = paste(type, "chart"),
			type = "pie",
			radius = c(20,110),
			center = c("50%", 200),
			roseType = ifelse(type=="rose", roseType, ""),
			itemStyle = list(
				normal = list(
					label = list( show = showLabel),
					labelLine = list( show = showLabel)
				),
				emphasis = list(
					label = list( show = !showLabel),
					labelLine = list( show = !showLabel)
				)
			),
			data = datList   
		)
	)	
	
	

	jsonStr <- toJSON(opt, pretty=TRUE)
	
	outList <- .rechartsOutput(jsonStr, charttype="ePie")
	return(outList)
}

