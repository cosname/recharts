# eMap function.
shinyUI(
fluidPage(

  titlePanel("lazyPlot 让懒人学会作图"),
  fluidRow(
  column(3, wellPanel(
	tabsetPanel(id = "inTabset",
        tabPanel("通用选项", 		
			h5("使用eOption配置Echarts通用选项："),
			textInput("eOption_size", "图像尺寸", paste0(tempEchartsObject$opt$size, collapse = ",")),
			textInput("eOption_region", "地图区域", "china")
			#,checkboxInput("eOption_calculable", "拖拽重计算", TRUE)
		),
		tabPanel("标题",
			h5("使用eTitle配置Echarts标题："),
			textInput("title_title", "主标题", ""),
			textInput("title_subtitle", "副标题", ""),
			textInput("title_x", "标题位置（横向）", "left"),
			textInput("title_y", "标题位置（纵向）", "top")
		),
        tabPanel("工具箱",
			h5("使用eToolbox配置工具箱选项："),
			checkboxInput("toolbox_show", "工具箱是否显示", as.logical(tempEchartsObject$opt$toolbox$show)),
			textInput("toolbox_x", "工具箱横向位置", tempEchartsObject$opt$toolbox$x),
			textInput("toolbox_y", "工具箱纵向位置", tempEchartsObject$opt$toolbox$y),
			selectInput("toolbox_orient", "工具箱方向",
				c("horizontal", "vertical"), tempEchartsObject$opt$toolbox$orient),
			checkboxInput("toolbox_readOnly", "数据是否可编辑", FALSE),
			checkboxInput("toolbox_mark", "辅助线工具", TRUE),
			#checkboxInput("toolbox_dataZoom", "区域缩放工具", TRUE),
			#checkboxInput("toolbox_magicType", "图形切换工具", TRUE),
			checkboxInput("toolbox_restore", "图形还原工具", TRUE),
			checkboxInput("toolbox_saveAsImage", "图片输出工具", TRUE)
		),
		tabPanel("图例",
			h5("使用eLegend配置图例选项"),
			checkboxInput("legend_show", "图例是否显示", TRUE),
			selectInput("legend_orient", "图例方向",
				c("horizontal", "vertical")),
			textInput("legend_x", "图例横向位置", "left"),
			textInput("legend_y", "图例纵向位置", "top"),
			textInput("legend_data", "图例数组（使用','分隔）", paste(tempEchartsObject$opt$legend$data, collapse=","))
		),
		tabPanel("提示框",
			h5("使用eTooltip配置提示框选项"),
			checkboxInput("eTooltip_show", "是否显示提示框", TRUE),
			selectInput("eTooltip_trigger", "提示框触发类型（元素、轴）", c("item", "axis"), selected=tempEchartsObject$opt$tooltip$trigger),
			textInput("eTooltip_formatter", "内容格式器", ""),
			textInput("eTooltip_islandFormatter", "数据孤岛内容格式器（拖拽重计算独有）", "'{a} < br/>{b} : {c}'")
		),		
		tabPanel("值域漫游选项", 
			h5("使用eDataRange配置值域漫游选项"),
			checkboxInput("eDataRange_show", "是否显示值域漫游工具", TRUE),
			textInput("eDataRange_lim", "值域漫游显示范围（大,小/使用','分隔）", ""),
			textInput("eDataRange_text", "文本提示（大,小/使用','分隔）", "high,low"),
			selectInput("eDataRange_orient", "图例方向",
				c("horizontal", "vertical"), "vertical"),
			textInput("eDataRange_x", "值域漫游工具横轴位置", "left"),
			textInput("eDataRange_y", "值域漫游工具纵轴位置", "bottom"),
			textInput("eDataRange_precision", "值域漫游数值显示精度", 1),
			checkboxInput("eDataRange_calculable", "值域漫游是否实时计算", TRUE),
			textInput("eDataRange_color", "值域漫游颜色选项", "#1e90ff,#f0ffff")
		)
	)
    ),
 
	submitButton("Update Graph")
	),
	

	column(9, 
		mainPanel(
			### includeHTML(recharts.shiny.init()) is fatal to run apps.
			includeHTML(recharts.shiny.init()),
			htmlOutput("lazePlot"),
			verbatimTextOutput("rechartsCode")
		)
	)
),
includeScript("www/script.js"),
includeScript("www/tooltip.js")


))