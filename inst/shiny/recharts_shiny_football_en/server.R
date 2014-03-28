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
	
	load("football.rda")
	
	
	datasetInput <- reactive({
		selectedState <- input$StateSelector
		Encoding(selectedState) <- "UTF-8"
		
		selectedPlayer <- input$PlayerSelector
		Encoding(selectedPlayer) <- "UTF-8"
		
		stateList <- table_state[,1]
		playerList <- table_player[,1]
		#provinceNameList <- provinceData[,2]
			
		year <- input$YearSelector
		if(year == 2011){
			stateData <- table_state[stateList %in% selectedState ,c(1, 2:5 )]
			playerData <- table_player[ selectedPlayer%in% selectedPlayer , c(1, 2:5) ]
		}else if(year == 2012){
			stateData <- table_state[stateList %in% selectedState ,c(1, 6:9 )]
			playerData <- table_player[ selectedPlayer%in% selectedPlayer , c(1, 6:9) ]
		}else{
			stateData <- table_state[stateList %in% selectedState ,c(1, 10:13 )]
			playerData <- table_player[ selectedPlayer%in% selectedPlayer , c(1, 10:13) ]
		}
		names(stateData) <- c("Team", "First Stage in first half","Second Stage in first half","First Stage in second half","Second Stage in second half")
		names(playerData) <- c("Player", "First Stage in first half","Second Stage in first half","First Stage in second half","Second Stage in second half")
		outputData <- list(stateData=stateData, playerData = playerData)
		return(outputData)
	})
	
	output$stateBar <- renderEcharts({
		plotDf <- datasetInput()
		stateDf <- plotDf$stateData
		rownames(stateDf) <- stateDf[,1]
		
		stateDf <- stateDf[,-1]
		
		
		eBarOutput <- eBar(stateDf, opt=list(title=list(text=toUTF8(""))))
		#eMapOutput <- eMap(mapDf, opt=list(title=list(text= titleText)))
		#eBarOutput$html$chart <- gsub("http://echarts.baidu.com/doc/example/www", ".", eBarOutput$html$chart)

		#print(eMapOutput)
		return(eBarOutput)
	})

	output$playLine <- renderEcharts({
		plotDf <- datasetInput()
		stateDf <- plotDf$stateData

		selectedState <- input$StateSelector
		Encoding(selectedState) <- "UTF-8" 
		
		selectedPlayer <- input$PlayerSelector
		Encoding(selectedPlayer) <- "UTF-8"
		
		playerList <- toUTF8(table_player[,1])
		#print(playerList%in% selectedPlayer)
		stateList <- table_state[,1]
		
		playerData <- table_player[ playerList%in% selectedPlayer ,]
		stateData <- table_state[ stateList%in% selectedState ,]
		insertRow <- c("Global", apply(stateData[,2:13], 2, mean))
		playerDf <- playerData
		#print(playerDf)
		playerDf <- rbind(playerData, insertRow)
		#print(playerDf)
		names(playerDf) <- c("Player","2011_First stage in first half","2011_Second stage in first half","2011_First stage in second half","2011_Second stage in second half", 
				"2012_First stage in first half","2012_Second stage in first half","2012_First stage in second half","2012_Second stage in second half",
				"2013_First stage in first half","2013_Second stage in first half","2013_First stage in second half","2013_Second stage in second half"
		)
		
		plotDf <- t(playerDf)
		colnames(plotDf) <- toUTF8(plotDf[1,])

		plotDf <- plotDf[-1,]
		eLineOutput <- eLine(plotDf)
		#eLineOutput$html$chart <- gsub("http://echarts.baidu.com/doc/example/www", ".", eLineOutput$html$chart)
		#print(eLineOutput)
		return(eLineOutput)
	})
	
	output$PiePlot <- renderEcharts({
		plotDf <- datasetInput()
		playerDf <- plotDf$playerData
		
		outputDf <- apply(playerDf[,2:5], 2, mean)

		#print(playerDf)
		names(outputDf) <- c("First Stage in first half","Second Stage in first half","First Stage in second half","Second Stage in second half")
		
		ePieOutput <- ePie(outputDf, main=toUTF8("distribution of stamina"))
		#ePieOutput$html$chart <- gsub("http://echarts.baidu.com/doc/example/www", ".", ePieOutput$html$chart)

		return(ePieOutput)
	})
	
	
 })
 
 
 
 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/recharts_shiny_football_en/")
 
 