 # server.R
shinyServer(function(input, output) {
	library(recharts)

	options(shiny.transcode.json = FALSE)

	datasetInput <- reactive({
		#mainTitle <- input$mainTitle
		#subTitle <- input$subTitle
		#titleX <- input$titleX
		#titleX <- input$titleY
		
		titleSetting = list( 
			title = input$title.title,
			subtitle = input$title.subtitle,
			x = input$title.x,
			y = input$title.y
		)
		toolboxSetting = list( 
			show = input$toolbox.show,
			x = input$toolbox.x,
			y = input$toolbox.y,
			orient = input$toolbox.orient,
			readOnly = input$toolbox.readOnly,
			mark = input$toolbox.mark,
			dataZoom = input$toolbox.dataZoom,
			magicType = input$toolbox.magicType,
			restore = input$toolbox.restore,
			saveAsImage = input$toolbox.saveAsImage
		)
		return(list(
			titleSetting=titleSetting, 
			toolboxSetting= toolboxSetting))
	})
	
	 output$lazePlot <- renderEcharts({
		recharts.init()
		titleSetting <<- datasetInput()$titleSetting
		toolboxSetting <<- datasetInput()$toolboxSetting

		mm <- recharts:::eTitleSet(tempEchartsObject, optionList=titleSetting)
		mm <- recharts:::eToolboxSet(mm, optionList=toolboxSetting)
		return(mm)
	})
 })
 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/lazyPlot/")
 
 