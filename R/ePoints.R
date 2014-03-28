#' Points charts
#'
#' ECharts style scatter charts. 
#'
#' @param dat    data.frame, should have two column or three colume. 
#' If three, the third colume should be factor or character, it will be treated as category labels.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' plot(ePoints(iris[,3:5]))

ePoints = function(dat, size = c(1024, 768), xvar=NULL, yvar=NULL, namevar=NULL, power=2, precision=2,
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.data=NULL, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = TRUE, readOnly = FALSE, mark=TRUE, dataZoom=TRUE, magicType=TRUE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", axis.scale=TRUE,
	axis.line=TRUE, axis.tick=FALSE, axis.lable=TRUE, axis.splitLine=TRUE, axis.splitArea=FALSE, axis.boundaryGap=TRUE,
	xlab=TRUE, xlab.type="value", xlab.data=NULL, xlab.position="bottom",
	xlab.name = "", xlab.namePosition="start", xlim=NULL,
	ylab=TRUE, ylab.type="value", ylab.data=NULL, ylab.position="left", 
	ylab.name = "", ylab.namePosition="start", ylim=NULL,
	calculable=FALSE, showLabel=TRUE, opt = list())
{
	### ePoint data setting,
	# preprocess data to xvar, yvar, namevar.
		
	# format the dat to data.frame
	if (class(dat) != "data.frame") dat <- as.data.frame(dat, stringsAsFactor=F)
	
	if(ncol(dat)<2) {
        stop("dim(dat)[2] should be 2 or 3.")
    }else if(ncol(dat) == 2){
		dat[,3] == "default"
		colnames(dat)[3] = "name"
		namevar = "name"
	}

	if(missing(xvar) | is.null(xvar)) xvar = colnames(dat)[1]
	if(missing(yvar) | is.null(yvar)) yvar = colnames(dat)[2]
	if(missing(namevar) | is.null(namevar)){
		namevar = "defaultName"
		dat[,"defaultName"] = "default"
	}
	
	if(length(xvar) > 1) xvar = xvar[1]
	if(class(xvar) == "integer" | class(xvar) == "numeric"){
		if (xvar > ncol(dat)){
			stop("wrong xvar input...")
		}else{
			xvar = colnames(dat)[xvar]
		}
	}else if(!xvar %in% colnames(dat)){
		stop("wrong xvar input...")
	}
	
	if(length(yvar) > 1) yvar = yvar[1]
	if(class(yvar) == "integer" | class(yvar) == "numeric"){
		if (yvar > ncol(dat)){
			stop("wrong yvar input...")
		}else{
			yvar = colnames(dat)[yvar]
		}
	}else if(!yvar %in% colnames(dat)){
		stop("wrong yvar input...")
	}
	
	if(length(namevar) > 1) namevar = namevar[1]
	if(class(namevar) == "integer" | class(namevar) == "numeric"){
		if (namevar > ncol(dat)){
			stop("wrong namevar input...")
		}else{
			namevar = colnames(dat)[namevar]
		}
	}else if(!namevar %in% colnames(dat)){
		stop("wrong namevar input...")
	}
	
	

	# if the xvar/yvar/namevar is null, will use the first column of dat as default.	And check the xvar in the dat colnames.
	if (is.null(xvar) || !xvar %in% colnames(dat)) xvar = colnames(dat)[1]
	if (is.null(yvar) || !yvar %in% colnames(dat)) yvar = colnames(dat)[2]
	if (is.null(namevar) || !namevar %in% colnames(dat)) namevar = colnames(dat)[3]
	 
	dat <- dat[,c(xvar, yvar, namevar)]
	
	group <- unique(dat[,3])
    
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

	if(missing(legend.data) | is.null(legend.data)){legendData = group
	}else{legendData = legend.data}
	
	opt$legend = legendSet( legend=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	opt$xAxis = xAxisSet(axisShow=xlab, type=xlab.type, data=xlab.data, position=xlab.position,
				labelName=xlab.name, label.namePosition=xlab.namePosition, lim=xlim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale, power=power, precision=precision)	
	
	opt$yAxis = yAxisSet(axisShow=ylab, type=ylab.type, data=ylab.data, position=ylab.position,
				labelName=ylab.name, label.namePosition=ylab.namePosition, lim=ylim,
				axisLine=axis.line, axisTick=axis.tick, axisLable=axis.lable, splitLine=axis.splitLine, 
				splitArea=axis.splitArea, boundaryGap=axis.boundaryGap, scale=axis.scale, power=power, precision=precision)


	opt$series =  vector("list", length(group))
    for(i in 1:length(group)) {
        if(dim(dat)[2]==2) {
            mat = as.matrix(dat)
        } else {
            mat = as.matrix(dat[which(dat[,3]==group[i]), 1:2])
        }
        colnames(mat) = NULL
        rownames(mat) = NULL

        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'scatter'
        }

        if(is.null(opt$series[[i]]$name) & dim(dat)[2]==3) {
            opt$series[[i]]$name = group[i]
        } else {
            warning("You'd better set series:name with y.")
        }
        
        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = mat
        } else {
            warning('You can set series:data with y.')
        }
    }

	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="ePoints", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "ePoints", "list")
	
	### output list format
	return(output)
}

