#' Pie charts
#'
#' ECharts style pie charts.
#'
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @return T	he HTML code as a character string.
#' @export
#' @examples
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' plot(ePie(x))

ePie = function(dat, size = c(1024, 768), xvar=NULL, namevar=NULL, type=c("pie", "rose"), roseType=c("radias", "area"),
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
{	

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
	if (is.null(title)){
		if (type == "rose"){
			ifelse(roseType == "area", headerInfo = "Area", headerInfo = "Radius")
			title = paste("RoseType_", headerInfo, "Mode")
		}else{
			title = "Pie Chart"
		}
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

				
	opt$legend = legendSet( legend=legend, data=dat[[namevar]], legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	datFrame = data.frame(value=dat[[xvar]], name=dat[[namevar]])
    datList = lapply(split(datFrame, seq_len(nrow(datFrame))), as.list)
    names(datList) = NULL
	
	#showLabelLine=showLabel
	#now we don't support the multiple graph in one canvas
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
	outList <- .rechartsOutput(jsonStr, charttype="ePie", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "ePie", "list")
	
	### output list format
	return(output)
}

