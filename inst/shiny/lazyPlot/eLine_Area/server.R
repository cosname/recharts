 # server.R
shinyServer(function(input, output) {
	library(recharts)

	options(shiny.transcode.json = FALSE)

	datasetInput <- reactive({
		#mainTitle <- input$mainTitle
		#subTitle <- input$subTitle
		#titleX <- input$titleX
		#titleX <- input$titleY
		optionSetting = list(
			calculable = input$eOption_calculable,
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
			dataZoom = input$toolbox_dataZoom,
			magicType = input$toolbox_magicType,
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
		
		axisXSetting = list(
			show = input$eAxisX_show,
			type = input$eAxisX_type,
			lim = strsplit( input$eAxisX_lim, ",")[[1]],
			name = input$eAxisX_name,
			nameLocation = input$eAxisX_nameLocation,
			scale = input$eAxisX_scale,
			precision = input$eAxisX_precision,
			power = input$eAxisX_power,
			splitNumber = as.numeric(input$eAxisX_splitNumber),
			data = unlist(strsplit(input$eAxisX_data, ",")),
			position = input$eAxisX_position,
			valueLabel = input$eAxisX_valueLabel,
			label.color = input$eAxisX_label_color,
			label.fontSize = as.numeric(input$eAxisX_label_fontSize),
			label.margin = as.numeric(input$eAxisX_label_margin),
			label.rotate = as.numeric(input$eAxisX_label_rotate),
			label.interval = input$eAxisX_label_interval,
			tick.show = input$eAxisX_tick_show,
			tick.color = input$eAxisX_tick_color,
			tick.width = as.numeric(input$eAxisX_tick_width),
			tick.length = as.numeric(input$eAxisX_tick_length),
			splitLine = input$eAxisX_splitLine,
			splitArea = input$eAxisX_splitArea,
			gap = if(input$eAxisX_type=="value"){
					unlist(strsplit(input$eAxisX_gap, ","))
				}else{
					 input$eAxisY_gap_2
				}
		)

		
		axisYSetting = list(			
			show = input$eAxisY_show,
			type = input$eAxisY_type,
			lim = strsplit( input$eAxisY_lim, ",")[[1]],
			name = input$eAxisY_name,
			nameLocation = input$eAxisY_nameLocation,
			scale = input$eAxisY_scale,
			precision = as.numeric(input$eAxisY_precision),
			power = as.numeric(input$eAxisY_power),
			splitNumber = as.numeric(input$eAxisY_splitNumber),
			data = unlist(strsplit(input$eAxisY_data, ",")),
			position = input$eAxisY_position,
			valueLabel = input$eAxisY_valueLabel,
			label.color = input$eAxisY_label_color,
			label.fontSize = as.numeric(input$eAxisY_label_fontSize),
			label.margin = as.numeric(input$eAxisY_label_margin),
			label.rotate = as.numeric(input$eAxisY_label_rotate),
			label.interval = input$eAxisY_label_interval,
			tick.show = input$eAxisY_tick_show,
			tick.color = input$eAxisY_tick_color,
			tick.width = as.numeric(input$eAxisY_tick_width),
			tick.length = as.numeric(input$eAxisY_tick_length),
			splitLine = input$eAxisY_splitLine,
			splitArea = input$eAxisY_splitArea,
			gap = if(input$eAxisY_type=="value"){
					unlist(strsplit(input$eAxisY_gap, ","))
				}else{
					 input$eAxisY_gap_2
				}
		)
		
		if (input$eAxisY_type != "value"){
			axisYSetting$name = NULL
			axisYSetting$nameLocation = NULL
			axisYSetting$scale = NULL
			axisYSetting$precision = NULL
			axisYSetting$power = NULL
		}
		if (input$eAxisX_type != "value"){
			axisXSetting$name = NULL
			axisXSetting$nameLocation = NULL
			axisXSetting$scale = NULL
			axisXSetting$precision = NULL
			axisXSetting$power = NULL
		}
		
		
		tooltipSetting = list(
			show = input$eTooltip_show,
			trigger = input$eTooltip_trigger,
			formatter = input$eTooltip_formatter,
			islandFormatter = input$eTooltip_islandFormatter
		)
		dataZoomSetting = list(
			show = input$eDataZoom_show,
			realtime = input$eDataZoom_realtime,
			zoomLock = input$eDataZoom_zoomLock,
			x = as.numeric(input$eDataZoom_x),
			y = as.numeric(input$eDataZoom_y),
			start = as.numeric(input$eDataZoom_start),
			end = as.numeric(input$eDataZoom_end),
			width = as.numeric(input$eDataZoom_width),
			height = as.numeric(input$eDataZoom_height),
			backgroundColor = ifelse(input$eDataZoom_colorSetting, input$eDataZoom_backgroundColor, "#eee"),
			databackgroundColor = ifelse(input$eDataZoom_colorSetting, input$eDataZoom_databackgroundColor, "#ccc"),
			fillerColor = ifelse(input$eDataZoom_colorSetting, input$eDataZoom_fillerColor, "rgba(50,205,50,0.4)"),
			handleColor = ifelse(input$eDataZoom_colorSetting, input$eDataZoom_handleColor, "rgba(70,130,180,0.8)")
		)

		return(list(
			optionSetting = optionSetting,
			titleSetting =titleSetting, 
			toolboxSetting = toolboxSetting,
			legendSetting = legendSetting,
			axisXSetting = axisXSetting,
			axisYSetting = axisYSetting,
			tooltipSetting = tooltipSetting,
			dataZoomSetting = dataZoomSetting
			))
	})
	

	
	 output$lazePlot <- renderEcharts({
		recharts.init()
		
		titleSetting <- datasetInput()$titleSetting
		optionSetting <- datasetInput()$optionSetting
		toolboxSetting <- datasetInput()$toolboxSetting
		legendSetting <- datasetInput()$legendSetting
		axisXSetting <- datasetInput()$axisXSetting
		axisYSetting <- datasetInput()$axisYSetting
		tooltipSetting <- datasetInput()$tooltipSetting
		dataZoomSetting <- datasetInput()$dataZoomSetting
		
		tempEchartsObject <- recharts:::eTitleSet(tempEchartsObject, optionList=titleSetting)
		tempEchartsObject <- recharts:::optionSet(tempEchartsObject, optionList=optionSetting)
		tempEchartsObject <- recharts:::eToolboxSet(tempEchartsObject, optionList=toolboxSetting)
		tempEchartsObject <- recharts:::eLegendSet(tempEchartsObject, optionList=legendSetting)
		tempEchartsObject <- recharts:::eAxis.XSet(tempEchartsObject, optionList=axisXSetting)
		tempEchartsObject <- recharts:::eAxis.YSet(tempEchartsObject, optionList=axisYSetting)
		tempEchartsObject <- recharts:::eTooltipSet(tempEchartsObject, optionList=tooltipSetting)
		mm <<- recharts:::eDataZoomSet(tempEchartsObject, optionList=dataZoomSetting)
		#Sys.setlocale("LC_CTYPE", recharts_oldLocal) 
		return(mm)
	})
	  output$rechartsCode <- renderText({
		optionSetting <- datasetInput()$optionSetting
		titleSetting <- datasetInput()$titleSetting
		toolboxSetting <- datasetInput()$toolboxSetting
		legendSetting <- datasetInput()$legendSetting
		axisXSetting <- datasetInput()$axisXSetting
		axisYSetting <- datasetInput()$axisYSetting
		tooltipSetting <- datasetInput()$tooltipSetting
		dataZoomSetting <- datasetInput()$dataZoomSetting

		original_optionSetting <- list(
			size = tempEchartsObject$opt$size,
			calculable = as.logical(toupper(tempEchartsObject$opt$calculable))
		)
		original_titleSetting <- list(
			title = tempEchartsObject$opt$title$text,
			subtitle = tempEchartsObject$opt$title$subtext,
			x = tempEchartsObject$opt$title$x,
			y = tempEchartsObject$opt$title$y
		)
		original_toolboxSetting <- list(
			show = TRUE,
			x = "right",
			y = "top",
			orient = "horizontal",
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
		
		if(tempEchartsObject$opt$xAxis$type=="value"){
			original_eAxisXSetting <- list(
				show = TRUE,
				type = "value",
				lim = NULL,
				name = "X Axis",
				nameLocation = "end",
				scale = TRUE,
				precision = NA,
				power = NA,
				splitNumber = NA,
				gap = c(0,0),
				position = "bottom",
				valueLabel = "",
				label.color = "black",
				label.fontSize = 12,
				label.margin = 10,
				label.rotate = 0,
				label.interval = "auto",
				tick.show = TRUE,
				tick.color = "",
				tick.width = 2,
				tick.length = 10,
				splitLine = TRUE,
				splitArea = TRUE
			)
		}else{
			original_eAxisXSetting <- list(
				show = TRUE,
				type = "category",
				splitNumber = NA,
				data = tempEchartsObject$opt$xAxis$data,
				gap = TRUE,
				position = "bottom",
				valueLabel = "",
				label.color = "black",
				label.fontSize = 12,
				label.margin = 10,
				label.interval = "auto",
				label.rotate = 0,
				tick.show = TRUE,
				tick.color = "",
				tick.width = 2,
				tick.length = 10,
				splitLine = TRUE,
				splitArea = TRUE
			)
		}		
		
		if(tempEchartsObject$opt$yAxis$type =="value"){
			original_eAxisYSetting <- list(
				show = TRUE,
				type = "value",
				lim = NULL,
				name = "Y Axis",
				nameLocation = "end",
				scale = TRUE,
				precision = NA,
				power = NA,
				splitNumber = 5,
				gap = c(0,0),
				position = "left",
				valueLabel = "",
				label.color = "black",
				label.fontSize = 12,
				label.margin = 10,
				label.interval = "auto",
				label.rotate = 0,
				tick.show = TRUE,
				tick.color = "",
				tick.width = 2,
				tick.length = 10,
				splitLine = TRUE,
				splitArea = TRUE
			)
		}else{
			original_eAxisYSetting <- list(
				show = TRUE,
				type = "category",
				splitNumber = 5,
				data = tempEchartsObject$opt$yAxis$data,
				gap = TRUE,
				position = "left",
				valueLabel = "",
				label.color = "black",
				label.fontSize = 12,
				label.margin = 10,
				label.interval = "auto",
				label.rotate = 0,
				tick.show = TRUE,
				tick.color = "",
				tick.width = 2,
				tick.length = 10,
				splitLine = TRUE,
				splitArea = TRUE
			)
		}
		
		original_eTooltipSetting <- list(
			show = TRUE,
			trigger = "item",
			formatter = "",
			islandFormatter = "'{a} < br/>{b} : {c}'"
		)
				
		original_eDataZoomSetting <- list(
			show = TRUE,
			realtime = TRUE,
			zoomLock = FALSE,
			x = NA,
			y = NA,
			start = 0,
			end = 100,
			width = NA,
			height = NA,
			backgroundColor = "#eee",
			databackgroundColor = "#ccc",
			fillerColor = "rgba(50,205,50,0.4)",
			handleColor = "rgba(70,130,180,0.8)"
		)

		# option setting
		optionArgStr = argStringGen(type="eOption", optionSetting , original_optionSetting)
		titleArgStr = argStringGen(type="eTitle", titleSetting , original_titleSetting)
		toolboxArgStr = argStringGen(type="eToolbox", toolboxSetting , original_toolboxSetting)
		lagendArgStr = argStringGen(type="eLegend", dataZoomSetting , original_eDataZoomSetting)
		axisXArgStr = argStringGen(type="eAxis.X", axisXSetting , original_eAxisXSetting)
		axisYArgStr = argStringGen(type="eAxis.Y", axisYSetting , original_eAxisYSetting)
		tooltipArgStr = argStringGen(type="eTooltip", tooltipSetting , original_eTooltipSetting)
		dataZoomArgStr = argStringGen(type="eDataZoom", dataZoomSetting , original_eDataZoomSetting)
		
		argArray = c("newEchartsObject <- tempEchartsObject", optionArgStr, titleArgStr, toolboxArgStr, lagendArgStr, axisXArgStr, axisYArgStr, tooltipArgStr, dataZoomArgStr )
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
			"eTitle" = paste0("eTitle(", paste(optionArg, collapse=", "), ")"),
			"eOption" = paste0("eOption(", paste(optionArg, collapse=", "), ")"),
			"eToolbox" = paste0("eToolbox(", paste(optionArg, collapse=", "), ")"),
			"eLegend" = paste0("eLegend(", paste(optionArg, collapse=", "), ")"),
			"eAxis.X" = paste0("eAxis.X(", paste(optionArg, collapse=", "), ")"),
			"eAxis.Y" = paste0("eAxis.Y(", paste(optionArg, collapse=", "), ")"),
			"eTooltip" = paste0("eTooltip(", paste(optionArg, collapse=", "), ")"),
			"eDataZoom" = paste0("eDataZoom(", paste(optionArg, collapse=", "), ")")
		)
	
	}else{
		optionStr = NULL
	
	}
	return(optionStr)
 

}

 
 # runApp("E:/kuaipan/git/recharts/inst/shiny/lazyPlot/eLine_Area")
 
 