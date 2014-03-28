#' Force network graph
#'
#' ECharts style Force network graph visulize the social network matrix data.
#'
#' @param networkMatrix   required, a symmetric matrix, each cell value indicates 
#' the weight of the two nodes and the 0 or NA cell would not be counted in. 
#' The matrix should have colnames or rownames.
#' @param propertyDf   optional, dataframe which contain the metadata for the nodes. 
#' It could contain category, value and color columns. The colnames and rownames are required.
#' @param opt option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' testData <- matrix(1:25, nrow=5)
#' plot(eForce(testData))





#####################################
##  The network graph:
##	       Jobs(10)
##	      //1    \\2
##       //    3  \\
##    Gates(9)----Obama(8)
##
##  The weighted network Matrix would be:
##        Jobs   Gates  Obama
##  Jobs   0       1      2
##  Gates  1       0      3
##  Obama  2       3      0
##
##  The property data.frame:
##         category   value    color
##  Jobs   "人物"       10   '#ff7f50'
##  Gates  "朋友"       8    '#87cdfa'
##  Obama  "朋友"       9    '#87cdfa'
#######################################



# networkMatrix <- matrix(c(
# 	c(0, 1, 2, 1, 2, 3, 6, 6, 1, 1, 1 ),
# 	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
#	c(2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0 ),
#	c(1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0 ),
#	c(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
#	c(3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
#	c(6, 0, 1, 1, 1, 1, 0, 6, 0, 1, 0 ),
#	c(6, 0, 0, 1, 0, 0, 6, 0, 0, 0, 0 ),
#	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
#	c(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ),
#	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
#	), ncol=11
# )

# propertyDf <- data.frame(
#	category = c("人物", "家人", "家人", "家人", "家人", "朋友", 
#				"朋友", "朋友", "朋友", "朋友", "朋友"),
#	name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
#			"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates", 
# 			"Jonathan", "Tim Cook", "Wayne"),
#	value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
#  )

# rownames(propertyDf) = propertyDf$name

# eForce(networkMatrix=networkMatrix, propertyDf=propertyDf)


eForce = function(networkMatrix, propertyDf=NULL, size = c(1024, 768),
	maxR=25, minR=15, density=0.05, attractiveness=1.2, showLabel=TRUE, 
	title = NULL, subtitle = NULL, title.x = "center", title.y = "top", 
	legend = TRUE, legend.x = "left", legend.y= "top", legend.orient="horizontal", 
	toolbox = TRUE, toolbox.orient = "horizontal", toolbox.x = "right", toolbox.y = "top", 
	dataView = FALSE, readOnly = TRUE, mark=TRUE, dataZoom=FALSE,
	tooltip = TRUE, tooltip.trigger="item", formatter="", 
	calculable=FALSE, xlab = NULL, ylab=NULL, opt = list() ) {
	## networkMatrix would be a symmetric matrix
	## if the propertyDf is null, all the category and value are 0 as default.
	
	# option$title format.
	opt$title = tilteSet(title = title, subtitle=subtitle,
			title.x = title.x, title.y = title.y)
	

	opt$calculable = calculableSet(calculable = calculable)

	# opt$tooltip format, not open to user now.
	opt$tooltip = tooltipSet( tooltip=tooltip,trigger=tooltip.trigger,
			formatter = "", islandFormatter="")

	
	
	opt$toolbox = toolboxSet(toolbox=toolbox, toolbox.x=toolbox.x, toolbox.y=toolbox.y, orient=toolbox.orient,
				dataView=dataView, mark=mark, dataZoom = dataZoom, magicType = FALSE, restore = TRUE, readOnly = readOnly,
				saveAsImage=TRUE)

	### data format and data map.
	if(!is.null(propertyDf) && (nrow(propertyDf) != nrow(networkMatrix))){
		warning("dat matrix doesn't have the same length to propertyDf. The propertyDf will be ignored.")
		propertyDf = NULL
	}

	
	networkMatrix <- as.matrix(networkMatrix)
	if (nrow(networkMatrix) != ncol(networkMatrix))  stop("networkMatrix would be a symmetric matrix")
	
	# matrix name check.
	if (is.null(colnames(networkMatrix))){
		if (is.null(rownames(networkMatrix))){
			if (is.null(propertyDf)){
				# if the rowname, colname and the propertyDf are missing, will use 1:nrow as names.
				rownames(networkMatrix) = 1:nrow(networkMatrix)
				colnames(networkMatrix) = 1:nrow(networkMatrix)
			}else{
				# if the propertyDf is not Null, the matrix name will use the propertyDf names.
				rownames(networkMatrix) = rownames(propertyDf)
				colnames(networkMatrix) = rownames(propertyDf)
			}
		}else{
			colnames(networkMatrix) = rownames(networkMatrix)
		}
	}
	
	if(!is.null(rownames(propertyDf))) rownames(propertyDf) = rownames(networkMatrix)
	
	# transfer the network Matrix to links items.
	networkMatrix[!lower.tri(networkMatrix)] <- NA
	networkMatrix[networkMatrix==0] <- NA
	validNode <- as.data.frame(t(which(!is.na(networkMatrix), arr.ind=TRUE)))
	linksOutput <- lapply(validNode, FUN=function(nodeIndex){
		return(
			list(
				source = nodeIndex[1] - 1,
				target = nodeIndex[2] - 1,
				weight = networkMatrix[nodeIndex[1], nodeIndex[2]]
			)
		)
	})
	
	names(linksOutput) <- NULL
	
	# set the nodes property item.
	
	#set the default color array.
	.gg.color.hue <- function(n) {
		hues = seq(15, 375, length=n+1)
		hcl(h=hues, l=65, c=100)[1:n]
	}

	#If the propertyDf is null, will use category = 0, value=0 as default.
	if (is.null(propertyDf)){
		nodesOutput <- lapply(colnames(networkMatrix), FUN = function(nodeName){
			return(
				list(
					category = 0,
					name = nodeName,
					value = 0
				)
			)
		})
		
		categoriesOutput <- list(list(
			name = "Default",
			itemStyle = list(
				normal = list(
					color = .gg.color.hue(1)
				)
			)
		))
		categoryList = list("Default")
	}else{
		if(is.null(propertyDf$value)){
			# if the propertyDf has no column named value, the value will set to 0.
			propertyDf$value=0
		}
		if(is.null(propertyDf$color)){
			# if the propertyDf has no column named color, the color will be default to the .gg.color.hue class.
			# Also, the color will be .gg.color.hue(1) if the category column missed at the same time.
			if (is.null(propertyDf$category)){
				propertyDf$category = 0
				propertyDf$color = .gg.color.hue(1)
			}else{
				categoryList = unique(propertyDf$category)
				colArray = .gg.color.hue(length(categoryList))
				for(category in categoryList ){
					propertyDf[which(propertyDf$category == category), "color"] = colArray[which(categoryList == category)]
				}
			}
		}
		
		categoryList = unique(propertyDf$category)
		
		legendData = categoryList

		nodesOutput <- lapply(colnames(networkMatrix), FUN = function(nodeName){
			indexOfDf = which(rownames(propertyDf) == nodeName)[1]
			if(is.na (indexOfDf)){
				return(
					list(
						category = 0,
						name = nodeName,
						value = 0
					)
				)
			}else{
				return(
					list(
						category = which(categoryList == propertyDf[indexOfDf, "category"]) - 1,
						name = nodeName,
						value = propertyDf[indexOfDf, "value"]
					)
				)
			}
		})
		
		categoriesOutput <- lapply(categoryList, function(category){
			return(
					list(
						name = category,
						itemStyle = list(
							normal = list(
								color = propertyDf[which(propertyDf$category == category),  "color"][1]
							)
						)
					)
				)
			}
		)
	}
	
	#legendData set
	

	if(is.null(opt$series$type)) {
		opt$series$type = "force"
	}
	
	if(is.null(opt$series$minRadius)) {
		opt$series$minRadius = minR
	}
		
	if(is.null(opt$series$maxRadius)) {
		opt$series$maxRadius = maxR
	}

	if(is.null(opt$series$density)) {
		opt$series$density = density
	}
		
	if(is.null(opt$series$attractiveness)) {
		opt$series$attractiveness = attractiveness
	}
		
	if(is.null(opt$series$itemStyle)) {
		itemStyleOutput = list(
			normal = list(
				label = list(
					show = "true",
					textStyle = list(color="#800080")
				),
				nodeStyle = list(
					brushType = "both",
					strokeColor = "rgba(255,215,0,0.4)",
					lineWidth = 8
				)
			),
			emphasis = list(
				label = list(
					show = "true"
				),
				nodeStyle = list(
					r = maxR
				)
			)
		)
	}
	#legend setting
		# option$legend Should set at last...
	# if(legend){
	#	opt$legend = list(
	#		show =  "true",
	#		x = matchPos.x(legend.x),
	#		y = matchPos.y(legend.y),
	#		orient =  match.arg(legend.orient)
	#	)
	#}else{
	#	opt$legend = list(
	#		show = ifelse(legend, "true", "false")
	#	)
	#}
	
	opt$legend = legendSet( legend=legend, data=categoryList, legend.x=legend.x, legend.y=legend.y, orient=legend.orient)

	
	opt$series$itemStyle = itemStyleOutput
	opt$series$categories = categoriesOutput
	opt$series$nodes = nodesOutput
	opt$series$links = linksOutput
	opt$series = list(opt$series)

	jsonStr <- toJSON(opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eForce", size=size)
	opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "eForce", "list")
	
	### output list format
	return(output)
}
	
	
