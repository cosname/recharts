 shinyUI(pageWithSidebar(
	 headerPanel("recharts on Shiny server"),
	 sidebarPanel(
		selectInput("YearSelector", "Choose a year:",
		choices = c(2011, 2012, 2013))
	 ),
	 mainPanel(
		### includeHTML(recharts.shiny.init()) is fatal to run apps.
		includeHTML(recharts.shiny.init()),
		htmlOutput("rechartPie")
	)
))

