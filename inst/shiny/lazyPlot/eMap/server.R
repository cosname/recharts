 # server.R
shinyServer(function(input, output) {
	library(recharts)
	options(shiny.transcode.json = FALSE)

	datasetInput <- reactive({

		optionSetting = list(
			calculable = input$eOption_calculable,
			region = input$eOption_region,
			size = strsplit( input$eOption_size, ",")[[1]]
		)
		titleSetting = list( 
			title = input$title_title,
			subtitle = input$title_subtitle,
			x = input$title_x,
			y = input$title_y
		)
		toolboxSetting = list( 
			show = input$toolbox_show,
			x = input$toolbox_x,
			y = input$toolbox_y,
			orient = input$toolbox_orient,
			readOnly = input$toolbox_readOnly,
			mark = input$toolbox_mark,
			# dataZoom = input$toolbox_dataZoom,
			# magicType = input$toolbox_magicType,
			restore = input$toolbox_restore,
			saveAsImage = input$toolbox_saveAsImage
		)
		
		legendSetting = list( 
			show = input$legend_show,
			x = input$legend_x,
			y = input$legend_y,
			orient = input$legend_orient,
			data = strsplit( input$legend_data, ",")[[1]]
		)	

		tooltipSetting = list(
			show = input$eTooltip_show,
			trigger = input$eTooltip_trigger,
			formatter = input$eTooltip_formatter,
			islandFormatter = input$eTooltip_islandFormatter
		)
		dataRangeSetting = list(
			show = input$eDataRange_show,
			lim = if(length(strsplit( input$eDataRange_lim, ",")[[1]]) < 2){
					""
				}else{
					as.numeric(strsplit( input$eDataRange_lim, ",")[[1]])
				},
			text = strsplit( input$eDataRange_text, ",")[[1]],
			orient = input$eDataRange_orient,
			x = input$eDataRange_x,
			y = input$eDataRange_y,
			precision = as.numeric(input$eDataRange_precision),
			calculable = input$eDataRange_calculable,
			color = strsplit( input$eDataRange_color, ",")[[1]]
		)

		return(list(
			optionSetting = optionSetting,
			titleSetting =titleSetting, 
			toolboxSetting = toolboxSetting,
			legendSetting = legendSetting,
			#axisXSetting = axisXSetting,
			#axisYSetting = axisYSetting,
			tooltipSetting = tooltipSetting,
			dataRangeSetting = dataRangeSetting
			))
	})
	

	
	 output$lazePlot <- renderEcharts({
		recharts.init()
		
		titleSetting <- datasetInput()$titleSetting
		optionSetting <- datasetInput()$optionSetting
		toolboxSetting <- datasetInput()$toolboxSetting
		legendSetting <- datasetInput()$legendSetting
		tooltipSetting <- datasetInput()$tooltipSetting
		dataRangeSetting <<- datasetInput()$dataRangeSetting
		#print(optionSetting)
		tempEchartsObject <- recharts:::eTitleSet(tempEchartsObject, optionList=titleSetting)
		tempEchartsObject <- recharts:::optionSet(tempEchartsObject, optionList=optionSetting)
		tempEchartsObject <- recharts:::eToolboxSet(tempEchartsObject, optionList=toolboxSetting)
		tempEchartsObject <- recharts:::eLegendSet(tempEchartsObject, optionList=legendSetting)
		tempEchartsObject <- recharts:::eDataRangeSet(tempEchartsObject, optionList=dataRangeSetting)

		#Encoding(tempEchartsObject$outList$html$chart) <- "UTF-8"
		mm <<- tempEchartsObject
		
		mm$outList$html$chart = iconv(mm$outList$html$chart, "GBK", "UTF-8")
		
		#tempEchartsObject <- recharts:::eLegendSet(tempEchartsObject, optionList=legendSetting)
		#tempEchartsObject <- recharts:::eTooltipSet(tempEchartsObject, optionList=tooltipSetting)
		#mm <<- recharts:::eDataZoomSet(tempEchartsObject, optionList=dataRangeSetting)
		#Sys.setlocale("LC_CTYPE", recharts_oldLocal) 
		return(mm)
	})
	
	output$rechartsCode <- renderText({
		optionSetting <- datasetInput()$optionSetting
		titleSetting <- datasetInput()$titleSetting
		toolboxSetting <- datasetInput()$toolboxSetting
		legendSetting <- datasetInput()$legendSetting
		#axisXSetting <- datasetInput()$axisXSetting
		#axisYSetting <- datasetInput()$axisYSetting
		tooltipSetting <- datasetInput()$tooltipSetting
		dataRangeSetting <- datasetInput()$dataRangeSetting

		original_optionSetting <- list(
			size = c(1024,768),
			region = tempEchartsObject$opt$series[[1]]$mapType
			#,
			#calculable = TRUE
		)
		original_titleSetting <- list(
			title = "",
			subtitle = "",
			x = "left",
			y = "top"
		)
		original_toolboxSetting <- list(
			show = as.logical(tempEchartsObject$opt$toolbox$show),
			x = tempEchartsObject$opt$toolbox$x,
			y = tempEchartsObject$opt$toolbox$y,
			orient = tempEchartsObject$opt$toolbox$orient,
			readOnly = FALSE,
			mark = TRUE,
			dataZoom = TRUE,
			magicType = TRUE,
			restore = TRUE,
			saveAsImage = TRUE
		)		
		
		original_legendSetting <- list(
			show = TRUE,
			orient = "horizontal",
			x = "left",
			y = "top",
			data = unlist(tempEchartsObject$opt$legend$data)
		)
		
	
		original_eTooltipSetting <- list(
			show = TRUE,
			trigger = "item",
			formatter = "",
			islandFormatter = "'{a} < br/>{b} : {c}'"
		)
				
		original_eDataRangeSetting <- list(
			show = TRUE,
			lim = "",
			text = c("high", "low"),
			x = "left",
			y = "bottom",
			precision = 1,
			calculable = TRUE,
			color=c("#1e90ff", "#f0ffff"),
			orient = "vertical"
		)

		# option setting
		optionArgStr = argStringGen(type="eOption", optionSetting , original_optionSetting)
		titleArgStr = argStringGen(type="eTitle", titleSetting , original_titleSetting)
		toolboxArgStr = argStringGen(type="eToolbox", toolboxSetting , original_toolboxSetting)
		tooltipArgStr = argStringGen(type="eTooltip", tooltipSetting , original_eTooltipSetting)
		dataRangeArgStr = argStringGen(type="eDataRange", dataRangeSetting , original_eDataRangeSetting)
		
		argArray = c("newEchartsObject <- tempEchartsObject", optionArgStr, titleArgStr, toolboxArgStr, tooltipArgStr, dataRangeArgStr )
		argOutput = paste(argArray, collapse = "+ \n" )
		
		return(argOutput)
	  })

 })
 
argStringGen <- function(type, newSetting, originalSetting){
	# title setting
	optionDiff = list()
	optionArg <- unlist(lapply(names(newSetting), FUN=function(name){
		# check the argument is a vector with more than one.
		if(!setequal(newSetting[[name]], originalSetting[[name]])){
			if (length(newSetting[[name]]) > 1){	
				optionDiff[name] <- newSetting[[name]]
				if( is.character(newSetting[[name]])){
					argStr <- paste(newSetting[[name]], collapse="', '")
					outputStr = paste0("c('", argStr, "')")
					#return(outputStr)
				}else{
					# arg is logical or numeric.
					outputStr <- paste0("c(", toString(newSetting[[name]]), ")")
					#return(outputStr)
				}
				return(paste0(name, " = ", outputStr))
			}else{
				print(paste0(name, ":", newSetting[[name]],originalSetting[[name]]))
				if(is.character(newSetting[[name]])) {
					outputStr = paste0("'", toString(newSetting[[name]]), "'")
				}else{
					outputStr = newSetting[[name]]
				}
				return(paste0(name, " = ", outputStr))
			}
		}	
	})
	)
	if (length(optionArg) > 0){
		optionStr = switch(type, 
			"eTitle" = paste0("eOption(", paste(optionArg, collapse=", "), ")"),
			"eOption" = paste0("eOption(", paste(optionArg, collapse=", "), ")"),
			"eToolbox" = paste0("eToolbox(", paste(optionArg, collapse=", "), ")"),
			"eLegend" = paste0("eLegend(", paste(optionArg, collapse=", "), ")"),
			"eTooltip" = paste0("eTooltip(", paste(optionArg, collapse=", "), ")"),
			"eDataRange" = paste0("eDataRange(", paste(optionArg, collapse=", "), ")")
		)
	
	}else{
		optionStr = NULL
	
	}
	return(optionStr)
 

}

 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/lazyPlot/eMap")
 
 