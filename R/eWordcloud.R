#' wordcloud charts
#'
#' ECharts style word cloud.
#'
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @return an htmlwidgets object which can be rendered by Browser.
#' @export
#' @examples
#' library(recharts)
#' x = round(runif(6) * 100)
#' names(x) = LETTERS[1:6]
#' eWordcloud(x) + eTitle(title="test")
#' testData <- read.csv(system.file("examples", "testDataForMap.csv", package = "recharts"),stringsAsFactors=FALSE) 
#' testData$data2 <- testData$data2 * 100
#' eWordcloud(head(testData), ~province, ~data2)


eWordcloud = function(dat, namevar=NULL, valvar=NULL,  size = NULL,
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
{
	if(is.vector(dat) || is.array(dat)){
		dat <- as.data.frame(dat)
		valvar <- 1
		dat$namevar <- rownames(dat)
		namevar <- "namevar"
	}
	else{
		# if the input dat is not data.frame will format it into data.frame.
		if (class(dat) != "data.frame") dat <- as.data.frame(dat)
		
		# if the user input argument namevar is null, will use colume one as name input
		if(is.null(namevar)){
			namevar <- 1
		}else{
			namevar = autoArgLabel(namevar, deparse(substitute(namevar)))
			namevar = evalFormula(namevar, data)
		}
		if(is.null(valvar)){
			valvar <- 2
		}else{
			valvar = autoArgLabel(valvar, deparse(substitute(valvar)))
			valvar = evalFormula(valvar, data)
		}
	}

	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = calculableSet(calculable = calculable)
	opt$theme = themeSet(theme = theme)
	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")


	datFrame = data.frame(value=dat[[valvar]], name=dat[[namevar]])
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
