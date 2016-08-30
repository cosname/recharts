#' Radar charts
#'
#' ECharts style radar charts.
#'
#' @param dat    data.frame or matrix, should have colnames and rownames.
#' @param limit  data.frame or matrix, 2 column, indicates the limit of each axis.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' require(plyr)
#' dat = ddply(iris, .(Species), colwise(mean))
#' rownames(dat) = dat[,1]
#' dat = dat[, -1]
#' dat
#' eRadar(dat)
#' df2 <- data.frame(
#'  saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
#' 	seller=c(rep("小黄花",7), rep("小红",7), rep("小白",7)),
#'	weekDay = c(rep(c("周一","周二","周三","周四","周五","周六","周日"),3))
#' )
#' dat <- df2
#' xvar=~weekDay; yvar= ~saleNum; series=~seller
#' eRadar(df2, ~weekDay, ~saleNum, ~seller)


eRadar = function(dat, xvar=NULL, yvar=NULL, series=NULL, size = NULL, ymin=vector(), ymax=vector(),
	theme = "default", title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.data=NULL, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
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
		dat <- with(dat, {
			out <- matrix(nrow=nlevels(series), ncol=nlevels(xvar),
						dimnames=list(levels(series), levels(xvar)))
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
			
	if(missing(legend.data) | is.null(legend.data)){legendData = rownames(dat)
	}else{legendData = legend.data}
	
	opt$legend = legendSet( show=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	opt$polar = list(polarSet(name=colnames(dat), ymin=ymin, ymax=ymax))

	datList = vector("list", nrow(dat))
	for(i in 1:nrow(dat)){
		datList[[i]]$name  = rownames(dat)[i]
		datList[[i]]$value = unnames(unlist(dat[i,]))
	}
	names(datList) = NULL

	
	if(is.null(opt$series)) {
        opt$series = vector("list", 1)
    } 
    if(is.null(opt$series[[1]]$type)) {
        opt$series[[1]]$type =  'radar'
    }
    
    if(is.null(opt$series[[1]]$data)) {
        opt$series[[1]]$data = datList
    }

	opt$size = size
	
	### output list format
	chart = htmlwidgets::createWidget(
		'echarts', opt, width = size[1], height = size[2], package = 'recharts'
	)
	chart
}
