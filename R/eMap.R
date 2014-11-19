#' Map charts
#'
#' ECharts style map charts. Only support CHINA now.
#'
#' @param dat    data.frame, rownames are province names.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' options(encoding="UTF-8")
#' Sys.setlocale("LC_CTYPE","chs")
#' load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
#' 
#' plot(eMap(ChinaGDP))

eMap = function(dat, namevar=NULL, datavar=2:ncol(dat), size = c(1024, 768), region="china", color=c("#1e90ff", "#f0ffff"),
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataRange = TRUE, dataRange.x="left", dataRange.y="bottom", dataRange.min=NULL, dataRange.max=NULL,
	dataRange.calculable=TRUE, dataRange.text=c("high", "low"), dataRange.orient="horizontal",
	dataView = FALSE, readOnly = FALSE, mark=TRUE, dataZoom=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", 
	calculable=FALSE, xlab = NULL, ylab=NULL,
	showLabel=TRUE, opt = list()) {
	
	region = switch(region,
		beijing = "北京",
		shanghai = "上海",
		tianjin = "天津",
		heilongjiang = "黑龙江",
		neimenggu = "内蒙古",
		jilin = "吉林",
		liaoning = "辽宁",
		tianjin = "天津",
		hebei = "河北",
		shandong = "山东",
		shanxi = "山西",
		shannxi = "陕西",
		ningxia = "宁夏",
		gansu = "甘肃",
		qinghai = "青海",
		xizang = "西藏",
		xinjiang = "新疆",
		sichuan = "四川",
		yunnan = "云南",
		guizhou = "贵州",
		chongqing = "重庆",
		guangxi = "广西",
		guangdong = "广东",
		hainan = "海南",
		taiwan = "台湾",
		macau = "澳门",
		hongkong = "香港",
		fujian = "福建",
		jiangxi = "江西",
		hunan = "湖南",
		hunbei = "湖北",
		anhui = "安徽",
		zhejiang = "浙江",
		jiangsu = "江苏",
		henan = "河南",
		region
	)
	
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
	opt$legend = recharts:::legendSet(legend=legend, data=legendData, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	valueDf <- dat[,datavar]
	
	# option$title format.
	opt$title = recharts:::tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	
	opt$calculable = recharts:::calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = recharts:::tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	opt$toolbox = recharts:::toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = FALSE, restore = TRUE, readOnly = readOnly,
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
			list( name= validData[X, namevar], value = validData[X, datavar[i]], selected="false")
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
	

	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eMap", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "eMap", "list")
	
	### output list format
	return(output)
}