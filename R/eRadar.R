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
#' plot(eRadar(dat))

eRadar = function(dat, size = c(1024, 768), ymin=vector(), ymax=vector(),
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.data=NULL, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	xlab=FALSE, ylab=FALSE,	calculable=TRUE, showLabel=TRUE, opt = list())
{
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
			
	if(missing(legend.data) | is.null(legend.data)){legendData = rownames(dat)
	}else{legendData = legend.data}
	
	opt$legend = legendSet( legend=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)
	
	opt$polar = list(polarSet(name=colnames(dat), ymin=ymin, ymax=ymax))

	datList = vector("list", nrow(dat))
	for(i in 1:nrow(dat)){
		datList[[i]]$name  = rownames(dat)[i]
		datList[[i]]$value = unnames(dat[i,])
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
	

	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eRadar", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "eRadar", "list")
	
	### output list format
	return(output)
	
}
