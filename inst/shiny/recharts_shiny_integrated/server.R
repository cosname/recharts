 # server.R
shinyServer(function(input, output) {
	library(recharts)
	library(tmcn)
	options(shiny.transcode.json = FALSE)
	# setwd("E:/kuaipan/git/recharts/inst/shiny/recharts_shiny_integrated/")
	
	#provinceData <- read.csv("testData.csv", stringsAsFactors=F)
	
	#provinceList <- unique(provinceData[,2])
	#provinceData_new <- lapply(provinceList, function(province){
	#	tempArray <- provinceData[provinceData[,2] == province,]
	#	if (length(tempArray[,1]) == 1){
	#		return(tempArray)
	#	}else{
	#		outputArray = tempArray[1,]
	#		outputArray[7:20] = apply(tempArray[,7:20], 2, sum )
	#		return(outputArray)
	#	}
	#})
	# provinceData <- data.frame(t(matrix(unlist(provinceData_new), ncol=29)))
	# out <-provinceData
	# out[[1]] <- toUTF8(out[[1]])
	# out[[2]] <- toUTF8(out[[2]])

		
	# provinceData <- out
	# save(provinceData, file = "testData.rda")
	
	load("testData.rda")
	
	
	datasetInput <- reactive({
		selectedName <- input$Province
		Encoding(selectedName) <- "UTF-8"
		provinceNameList <- provinceData[,2]
			
		year <- input$YearSelector
		if(year == 2012){
			outputData <- provinceData[provinceNameList %in% selectedName ,c(1:6,7:13)]
		}else{
			outputData <- provinceData[ provinceNameList %in% selectedName ,c(1:6,14:20)]
		}
		return(outputData)
	})
	
	 output$rechartMap <- renderEcharts({
		plotDf <- datasetInput()
		print(plotDf)
		colvar = input$Color
		#print(colvar)
		#Encoding(colvar) <- "UTF-8"
		colorArray = c("总体", "男性","女性", "低档", "中低档", "中高档", "高档")
		colorIndex = which(colorArray == colvar)
		titleText = paste(input$YearSelector, "年全国销售数据--", input$Color)
		titleText = toUTF8(titleText)
		print(titleText)
		
		mapDf <- data.frame(value=plotDf[,colorIndex+6])
		rownames(mapDf) = plotDf[,2]
		names(mapDf) = toUTF8("值")
		mapDf[,1] <- as.numeric(as.character(mapDf[,1]))		
		eMapOutput <- eMap(mapDf, opt=list(title=list(text= titleText)))
		#print(eMapOutput)
		return(eMapOutput)
	})

	output$BarPlot <- renderEcharts({
		plotDf_base <- datasetInput()
		plotDf_bar <- plotDf_base
		if(input$BarType == "性别"){
			plotDf_bar = plotDf_bar[,c(2,11,12)]
			names(plotDf_bar) <- toUTF8(c("province",  "男性","女性"))
		}else{
			plotDf_bar = plotDf_bar[,c(2,7:10)]
			names(plotDf_bar) <- toUTF8(c("province", "低档", "中低档", "中高档", "高档"))
		}
		rownames(plotDf_bar) <- plotDf_base[,2] 

		eBarOutput <- eBar(plotDf_bar)
		return(eBarOutput)
	})
	output$PiePlot <- renderEcharts({
		plotDf_pie <<- datasetInput()
		plotDf_pie <- plotDf_pie[,7:10]
		plotDf_pie[,1] <- as.numeric(as.character(plotDf_pie[,1]))
		plotDf_pie[,2] <- as.numeric(as.character(plotDf_pie[,2]))
		plotDf_pie[,3] <- as.numeric(as.character(plotDf_pie[,3]))
		plotDf_pie[,4] <- as.numeric(as.character(plotDf_pie[,4]))
		outputData <- apply(plotDf_pie, 2, sum)
		names(outputData) <- toUTF8( c("低档", "中低档", "中高档", "高档"))
		ePieOutput <- ePie(outputData)

		return(ePieOutput)
	})
	
	
 })
 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/recharts_shiny_integrated/")
 
 