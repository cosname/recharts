
$("#eDataZoom_colorSetting").change(dataZoomColorSetting)
function dataZoomColorSetting(){
	

	
	if ($("#eDataZoom_colorSetting").prop("checked")){
		$("label[for=eDataZoom_backgroundColor]").show()
		$("label[for=eDataZoom_databackgroundColor]").show()
		$("label[for=eDataZoom_fillerColor]").show()
		$("label[for=eDataZoom_handleColor]").show()
		
		$("#eDataZoom_backgroundColor").show()
		$("#eDataZoom_databackgroundColor").show()
		$("#eDataZoom_fillerColor").show()
		$("#eDataZoom_handleColor").show()
	}else{
		$("label[for=eDataZoom_backgroundColor]").hide()
		$("label[for=eDataZoom_databackgroundColor]").hide()
		$("label[for=eDataZoom_fillerColor]").hide()
		$("label[for=eDataZoom_handleColor]").hide()
		
		$("#eDataZoom_backgroundColor").hide()
		$("#eDataZoom_databackgroundColor").hide()
		$("#eDataZoom_fillerColor").hide()
		$("#eDataZoom_handleColor").hide()
	}
}
dataZoomColorSetting()

$("#eAxisX_layoutSetting").change(xAxisLayoutSetting)
function xAxisLayoutSetting(){
	if ($("#eAxisX_layoutSetting").prop("checked")){
		$("label[for=eAxisX_valueLabel]").show()
		$("label[for=eAxisX_label_color]").show()
		$("label[for=eAxisX_label_fontSize]").show()
		$("label[for=eAxisX_label_margin]").show()
		$("label[for=eAxisX_label_rotate]").show()
		$("label[for=eAxisX_label_interval]").show()
		$("label[for=eAxisX_tick_show]").show()
		$("label[for=eAxisX_tick_color]").show()
		$("label[for=eAxisX_tick_width]").show()
		$("label[for=eAxisX_tick_length]").show()
		$("label[for=eAxisX_splitLine]").show()
		$("label[for=eAxisX_splitArea]").show()
		
		$("#eAxisX_valueLabel").show()
		$("#eAxisX_label_color").show()
		$("#eAxisX_label_fontSize").show()
		$("#eAxisX_label_margin").show()
		$("#eAxisX_label_rotate").show()
		$("#eAxisX_label_interval").show()
		$("#eAxisX_tick_show").show()
		$("#eAxisX_tick_color").show()
		$("#eAxisX_tick_width").show()
		$("#eAxisX_tick_length").show()
		$("#eAxisX_splitLine").show()
		$("#eAxisX_splitArea").show()
	}else{
		$("label[for=eAxisX_valueLabel]").hide()
		$("label[for=eAxisX_label_color]").hide()
		$("label[for=eAxisX_label_fontSize]").hide()
		$("label[for=eAxisX_label_margin]").hide()
		$("label[for=eAxisX_label_rotate]").hide()
		$("label[for=eAxisX_label_interval]").hide()
		$("label[for=eAxisX_tick_show]").hide()
		$("label[for=eAxisX_tick_color]").hide()
		$("label[for=eAxisX_tick_width]").hide()
		$("label[for=eAxisX_tick_length]").hide()
		$("label[for=eAxisX_splitLine]").hide()
		$("label[for=eAxisX_splitArea]").hide()
		
		$("#eAxisX_valueLabel").hide()
		$("#eAxisX_label_color").hide()
		$("#eAxisX_label_fontSize").hide()
		$("#eAxisX_label_margin").hide()
		$("#eAxisX_label_rotate").hide()
		$("#eAxisX_label_interval").hide()
		$("#eAxisX_tick_show").hide()
		$("#eAxisX_tick_color").hide()
		$("#eAxisX_tick_width").hide()
		$("#eAxisX_tick_length").hide()
		$("#eAxisX_splitLine").hide()
		$("#eAxisX_splitArea").hide()
	}

}

$("#eAxisY_layoutSetting").change(yAxisLayoutSetting)
function yAxisLayoutSetting(){
	if ($("#eAxisY_layoutSetting").prop("checked")){
		$("label[for=eAxisY_valueLabel]").show()
		$("label[for=eAxisY_label_color]").show()
		$("label[for=eAxisY_label_fontSize]").show()
		$("label[for=eAxisY_label_margin]").show()
		$("label[for=eAxisY_label_rotate]").show()
		$("label[for=eAxisY_label_interval]").show()
		$("label[for=eAxisY_tick_show]").show()
		$("label[for=eAxisY_tick_color]").show()
		$("label[for=eAxisY_tick_width]").show()
		$("label[for=eAxisY_tick_length]").show()
		$("label[for=eAxisY_splitLine]").show()
		$("label[for=eAxisY_splitArea]").show()
		
		$("#eAxisY_valueLabel").show()
		$("#eAxisY_label_color").show()
		$("#eAxisY_label_fontSize").show()
		$("#eAxisY_label_margin").show()
		$("#eAxisY_label_rotate").show()
		$("#eAxisY_label_interval").show()
		$("#eAxisY_tick_show").show()
		$("#eAxisY_tick_color").show()
		$("#eAxisY_tick_width").show()
		$("#eAxisY_tick_length").show()
		$("#eAxisY_splitLine").show()
		$("#eAxisY_splitArea").show()
	}else{
		$("label[for=eAxisY_valueLabel]").hide()
		$("label[for=eAxisY_label_color]").hide()
		$("label[for=eAxisY_label_fontSize]").hide()
		$("label[for=eAxisY_label_margin]").hide()
		$("label[for=eAxisY_label_rotate]").hide()
		$("label[for=eAxisY_label_interval]").hide()
		$("label[for=eAxisY_tick_show]").hide()
		$("label[for=eAxisY_tick_color]").hide()
		$("label[for=eAxisY_tick_width]").hide()
		$("label[for=eAxisY_tick_length]").hide()
		$("label[for=eAxisY_splitLine]").hide()
		$("label[for=eAxisY_splitArea]").hide()
		
		$("#eAxisY_valueLabel").hide()
		$("#eAxisY_label_color").hide()
		$("#eAxisY_label_fontSize").hide()
		$("#eAxisY_label_margin").hide()
		$("#eAxisY_label_rotate").hide()
		$("#eAxisY_label_interval").hide()
		$("#eAxisY_tick_show").hide()
		$("#eAxisY_tick_color").hide()
		$("#eAxisY_tick_width").hide()
		$("#eAxisY_tick_length").hide()
		$("#eAxisY_splitLine").hide()
		$("#eAxisY_splitArea").hide()
	}

}
xAxisLayoutSetting()
yAxisLayoutSetting()
