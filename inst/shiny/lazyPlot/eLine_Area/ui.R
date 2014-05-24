
shinyUI(
fluidPage(

  titlePanel("lazyPlot 让懒人学会作图"),
  fluidRow(
  column(3, wellPanel(
	tabsetPanel(id = "inTabset",
        tabPanel("通用选项", 		
			h5("使用eOption配置Echarts通用选项："),
			textInput("eOption_size", "图像尺寸", paste0(tempEchartsObject$opt$size, collapse = ",")),
			checkboxInput("eOption_calculable", "拖拽重计算", as.logical(tempEchartsObject$opt$calculable))
		),
		tabPanel("标题",
			h5("使用eTitle配置Echarts标题："),
			textInput("title_title", "主标题", tempEchartsObject$opt$title$text),
			textInput("title_subtitle", "副标题", tempEchartsObject$opt$title$subtext),
			textInput("title_x", "标题位置（横向）", tempEchartsObject$opt$title$x),
			textInput("title_y", "标题位置（纵向）", tempEchartsObject$opt$title$y)
		),
        tabPanel("工具箱",
			h5("使用eToolbox配置工具箱选项："),
			checkboxInput("toolbox_show", "工具箱是否显示", TRUE),
			textInput("toolbox_x", "工具箱横向位置", "right"),
			textInput("toolbox_y", "工具箱纵向位置", "top"),
			selectInput("toolbox_orient", "工具箱方向",
				c("horizontal", "vertical")),
			checkboxInput("toolbox_readOnly", "数据是否可编辑", FALSE),
			checkboxInput("toolbox_mark", "辅助线工具", TRUE),
			checkboxInput("toolbox_dataZoom", "区域缩放工具", TRUE),
			checkboxInput("toolbox_magicType", "图形切换工具", TRUE),
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
		tabPanel("X轴", 
			h5("使用eAxis.X配置X轴选项"),
			checkboxInput("eAxisX_show", "是否显示X轴", TRUE),
			selectInput("eAxisX_type", "X轴类型（类别，数值）", c("category", "value"), selected=tempEchartsObject$opt$xAxis$type),
			
			#name/nameLocation/lim/scale/precision/power/splitNumber for value type
			textInput("eAxisX_lim", "X轴范围（使用','分隔）", ""),
			textInput("eAxisX_name", "X轴名称", "X Axis"),
			radioButtons("eAxisX_nameLocation", "X轴名称位置", c("end" = "end", "start" = "start")),
			checkboxInput("eAxisX_scale", "X轴显示是否依比例可变", TRUE),
			textInput("eAxisX_precision", "X轴小数精度", ""),
			textInput("eAxisX_power", "X轴整数精度", ""),
			textInput("eAxisX_splitNumber", "X轴分隔数", ""),
			textInput("eAxisX_gap", "X轴两侧留白（百分比）", "0,0"),
			
			# data for category type
			textInput("eAxisX_data", "X轴数据数据列表（仅类目可用）",  paste(tempEchartsObject$opt$xAxis$data, collapse=",")),
			checkboxInput("eAxisX_gap_2", "X轴两侧是否留白（类目）", TRUE),
			
			# general settings
			radioButtons("eAxisX_position", "X轴位置（上、下）", c("bottom" = "bottom", "top" = "top")),

			checkboxInput("eAxisX_layoutSetting", "其他外观选项", FALSE),
			textInput("eAxisX_valueLabel", "名称显示公式", ""),
			textInput("eAxisX_label_color", "X轴文字标签颜色", "black"),
			textInput("eAxisX_label_fontSize", "X轴文字标签字体大小", 12),
			textInput("eAxisX_label_margin", "X轴坐标轴文本标签与坐标轴的间距", 10),
			textInput("eAxisX_label_rotate", "X轴标签旋转角度", 0),
			textInput("eAxisX_label_interval", "X轴标签显示挑选间隔（仅类目可用）", "auto"),
			checkboxInput("eAxisX_tick_show", "X轴标记是否显示", TRUE),
			textInput("eAxisX_tick_color", "X轴轴标记颜色", ""),
			textInput("eAxisX_tick_length", "X轴轴标记长度", 10),
			textInput("eAxisX_tick_width", "X轴轴标记宽度", 2),
			checkboxInput("eAxisX_splitLine", "是否显示分隔线", TRUE),
			checkboxInput("eAxisX_splitArea", "是否显示分割区域", TRUE)
		),		
		
		tabPanel("Y轴", 
			h5("使用eAxis.Y配置Y轴选项"),
			checkboxInput("eAxisY_show", "是否显示X轴", TRUE),
			selectInput("eAxisY_type", "eAxis.Y(type=)", c("category", "value"), selected=tempEchartsObject$opt$yAxis$type),
			
			#name/nameLocation/lim/scale/precision/power/splitNumber for value type
			textInput("eAxisY_lim", "Y轴范围（使用','分隔）", ""),
			textInput("eAxisY_name", "Y轴名称", "Y Axis"),
			radioButtons("eAxisY_nameLocation", "Y轴名称位置", c("end" = "end", "start" = "start")),
			checkboxInput("eAxisY_scale", "Y轴显示是否依比例可变", TRUE),
			textInput("eAxisY_precision", "Y轴小数精度", ""),
			textInput("eAxisY_power", "Y轴整数精度", ""),
			textInput("eAxisY_splitNumber", "Y轴分隔数", 5),
			textInput("eAxisY_gap", "Y轴两侧留白（百分比）", "0,0"),
	
			# data for category type
			textInput("eAxisY_data", "X轴数据数据列表（仅类目可用）",  paste(tempEchartsObject$opt$yAxis$data, collapse=",")),
			checkboxInput("eAxisY_gap_2", "X轴两侧是否留白（类目）", TRUE),
			
			radioButtons("eAxisY_position", "X轴位置（上、下）", c("left" = "left", "right" = "right")),
			# general settings
			checkboxInput("eAxisY_layoutSetting", "其他外观选项", FALSE),
			textInput("eAxisY_valueLabel", "名称显示公式", ""),
			textInput("eAxisY_label_color", "X轴文字标签颜色", "black"),
			textInput("eAxisY_label_fontSize", "X轴文字标签字体大小", 12),
			textInput("eAxisY_label_margin", "X轴坐标轴文本标签与坐标轴的间距", 10),
			textInput("eAxisY_label_rotate", "X轴标签旋转角度", 0),
			textInput("eAxisY_label_interval", "X轴标签显示挑选间隔（仅类目可用）", "auto"),
			checkboxInput("eAxisY_tick_show", "X轴标记是否显示", TRUE),
			textInput("eAxisY_tick_color", "X轴轴标记颜色", ""),
			textInput("eAxisY_tick_width", "X轴轴标记宽度", 2),
			textInput("eAxisY_tick_length", "X轴轴标记长度", 10),
			checkboxInput("eAxisY_splitLine", "是否显示分隔线", TRUE),
			checkboxInput("eAxisY_splitArea", "是否显示分割区域", TRUE)
		),
		tabPanel("提示框", 
			h5("使用eTooltip配置提示框选项"),
			checkboxInput("eTooltip_show", "是否显示提示框", TRUE),
			selectInput("eTooltip_trigger", "提示框触发类型（元素、轴）", c("item", "axis"), selected=tempEchartsObject$opt$tooltip$trigger),
			textInput("eTooltip_formatter", "内容格式器", ""),
			textInput("eTooltip_islandFormatter", "数据孤岛内容格式器（拖拽重计算独有）", "'{a} < br/>{b} : {c}'")
		),		
		tabPanel("数据区域缩放", 
			h5("使用eDataZoom配置数据区域缩放选项。与toolbox.feature.dataZoom同步，仅对直角坐标系图表有效。"),
			checkboxInput("eDataZoom_show", "是否显示区域缩放工具", TRUE),
			checkboxInput("eDataZoom_realtime", "是否实时", TRUE),
			checkboxInput("eDataZoom_zoomLock", "缩放区域是否锁定", FALSE),
			textInput("eDataZoom_x", "缩放工具横向位置", ""),
			textInput("eDataZoom_y", "缩放工具纵向位置", ""),
			textInput("eDataZoom_start", "起始位置（百分比）", 0),
			textInput("eDataZoom_end", "结束位置（百分比）", 100),
			textInput("eDataZoom_width", "宽度", ""),
			textInput("eDataZoom_height", "高度", ""),
			checkboxInput(inputId= "eDataZoom_colorSetting", "是否颜色设置", FALSE),
			textInput("eDataZoom_backgroundColor", "背景颜色", "#eee"),
			textInput("eDataZoom_databackgroundColor", "数据缩略背景颜色", "#ccc"),
			textInput("eDataZoom_fillerColor", "选择区域填充颜色", "rgba(50,205,50,0.4)"),
			textInput("eDataZoom_handleColor", "控制手柄颜色", "rgba(70,130,180,0.8)")			
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