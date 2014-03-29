
shinyUI(fluidPage(
  titlePanel("lazy plot mode to make user to config recharts arguments online."),
  fluidRow(
  column(3, wellPanel(
	tabsetPanel(id = "inTabset",
        tabPanel("eTitle", 		
			h5("Use eTitle to config the title of graph:"),
			textInput("title.title", "eTitle(title=)", ""),
			textInput("title.subtitle", "eTitle(subtitle=)", ""),
			textInput("title.x", "eTitle(x=)", "left"),
			textInput("title.y", "eTitle(y=)", "top")
		),
        tabPanel("eToolbox",			
			h5("Use eToolbox to config the title of graph:"),
			checkboxInput("toolbox.show", "eToolbox(show=)", TRUE),
			textInput("toolbox.x", "eToolbox(x=)", "right"),
			textInput("toolbox.y", "eToolbox(y=)", "top"),
			selectInput("toolbox.orient", "eToolbox(orient=)",
				c("horizontal", "vertical")),
			checkboxInput("toolbox.readOnly", "eToolbox(readOnly=)", FALSE),
			checkboxInput("toolbox.mark", "eToolbox(mark=)", TRUE),
			checkboxInput("toolbox.dataZoom", "eToolbox(dataZoom=)", TRUE),
			checkboxInput("toolbox.magicType", "eToolbox(magicType=)", TRUE),
			checkboxInput("toolbox.restore", "eToolbox(restore=)", TRUE),
			checkboxInput("toolbox.saveAsImage", "eToolbox(saveAsImage=)", TRUE)
		)
      )
	 ),
	submitButton("Update Graph")
	),
	

	column(3, 
		mainPanel(
			### includeHTML(recharts.shiny.init()) is fatal to run apps.
			includeHTML(recharts.shiny.init()),
			htmlOutput("lazePlot"),
			h5(paste("output text:", "tempEchartsObject"))
		)
	)
)))