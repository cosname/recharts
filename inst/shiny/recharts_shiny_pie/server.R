 # server.R
shinyServer(function(input, output) {
	library(recharts)

	options(shiny.transcode.json = FALSE)
	
	browserData <- data.frame(
		ie7 = c(600, 200, 100),
		ie8 = c(800, 300, 500),
		ie9 = c(200, 600, 800),
		chrome = c(400, 800, 1200),
		firefox = c(200, 200, 200)
 	)
	
	yearArray = c( 2011, 2012, 2013)
	
	datasetInput <- reactive({
		selectedYear <- input$YearSelector
		print(selectedYear)
		return(browserData[which(yearArray == selectedYear),])
	})
	
	 output$rechartPie <- renderEcharts({
		plotArray <<- datasetInput()
		recharts.init()	
		class(plotArray) <- "integer"
		mm <<- ePie(plotArray)
		mm <- mm + eTitle(title="test")
		mm <- mm + option(size=c(500,500))
		class(mm) <- "list"
		return(mm)
	})
 })
 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/recharts_shiny_pie/")
 
 