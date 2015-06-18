#' wordcloud charts
#'
#' ECharts style word cloud.
#'
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @return an htmlwidgets object which can be rendered by Browser.
#' @export
#' @examples
#' x = round(runif(6) * 100)
#' names(x) = LETTERS[1:6]
#' eWordcloud(x) + eTitle(title="test")

eWordcloud = function(dat, namevar=NULL, xvar=NULL,  size = c(1024, 768),
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
{

	
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
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")


	datFrame = data.frame(value=dat[[xvar]], name=dat[[namevar]])
    datList = unname(lapply(split(datFrame, seq_len(nrow(datFrame))), as.list))
	
	#showLabelLine=showLabel
	#now we don't support the multiple graph in one canvas
	opt$series = list(
		list(
			name = "wordCloud",
			type = "wordCloud",
			size= c('80%', '80%'),
			textRotation = c(0, 45, 90, -45),
			textPadding = 0,
			data = datList   
		)
	)
	
	#jsonStr <- toJSON(opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="ePie", size=size)
	opt$size = size
	
	### output list format
	chart = htmlwidgets::createWidget(
		'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	)
	chart
}
