.onAttach <- function(libname, pkgname ){

	
	## we'd really recommended user to use Chrome browser to display the canvas charts.
	chrome_path = file.path(Sys.getenv("LOCALAPPDATA"), "Google\\Chrome\\Application\\chrome.exe", fsep ="\\")
	chrome_path_2 = file.path("C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe")
	chrome_path_3 = file.path("C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe")
	
	if( file.exists(chrome_path)){
		options( browser = chrome_path)
	}else if(file.exists(chrome_path_2)){
		options( browser = chrome_path_2)
	}else if(file.exists(chrome_path_3)){
		options( browser = chrome_path_3)
	}
	
  
  ## This function are required to set option in recharts functions,
	
	#options(recharts.html5.dir = chartr("\\", "/", system.file("html5", package = "recharts")))
	options(recharts.geoData.dir = chartr("\\", "/", system.file("data", package = "recharts")))
	options(recharts.template.dir = chartr("\\", "/", system.file("template", package = "recharts")))
	options(recharts.images.dir = chartr("\\", "/", system.file("images", package = "recharts")))


	
	options(recharts.plot.tag=NULL)
	options(recharts.print.tag="html")
	
	recharts.tags <- c("type",  "chartid", "html", "header", "chart", "jsHeader", "jsData", "jsDrawChart", 
			"jsDisplayChart", "jsFooter", "jsChart", "divChart", "caption", "footer")
	options(recharts.tags = recharts.tags)

	
}



