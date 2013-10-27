 # server.R
shinyServer(function(input, output) {
	library(recharts)

	options(shiny.transcode.json = FALSE)

	networkMatrix <- matrix(c(
		c(0, 1, 2, 1, 2, 3, 6, 6, 1, 1, 1 ),
		c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
		c(2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0 ),
		c(1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0 ),
		c(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
		c(3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
		c(6, 0, 1, 1, 1, 1, 0, 6, 0, 1, 0 ),
		c(6, 0, 0, 1, 0, 0, 6, 0, 0, 0, 0 ),
		c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
		c(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ),
		c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
		), ncol=11
	)

	propertyDf <- data.frame(
		category = c("A", "B", "B", "B", "B", "C", 
					"C", "C", "C", "C", "C"),
		name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
				"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates", 
				"Jonathan", "Tim Cook", "Wayne"),
		value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
	 )

	rownames(propertyDf) = propertyDf$name

	datasetInput <- reactive({
		selectedName <- input$nameList
		return(selectedName)
	})
	
	 output$rechartForce <- renderEcharts({
		selectedName <<- datasetInput()
		print(selectedName)
		#print(networkMatrix)
		newMatrix <- networkMatrix[rownames(propertyDf) %in% selectedName,
				rownames(propertyDf) %in% selectedName]
		newProperDf <- propertyDf[ rownames(propertyDf) %in% selectedName,]
		
		eForceOutput <- eForce(newMatrix, newProperDf)
		return(eForceOutput)
	})
 })
 
 # runApp("E:/kuaipan/recharts/recharts/inst/shiny/recharts_shiny_eForce/")
 
 