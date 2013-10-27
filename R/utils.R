.recharts.httpd.handler <- function (path, query, ...) 
{
	path <- gsub("^/custom/recharts/", "", path)
	f <- sprintf("%s%s%s", tempdir(), .Platform$file.sep, path)
	
	ext <- file_ext(path)
	contenttype <- switch(ext,
			"css" = "text/css",
			"gif" = "image/gif",
			"jpg" = "image/jpeg",
			"png" = "image/png",
			"svg" = "image/svg+xml",
			"html" = "text/html",
			"pdf" = "application/pdf",
			"ps" = "application/postscript", # in GLMMGibbs, mclust
			"sgml" = "text/sgml", # in RGtk2
			"xml" = "text/xml",  # in RCurl
			"text/plain")
	
	list(file = f, "content-type" = contenttype, "status code" = 200L)
}



.isServerRunning <- function(){
	get("httpdPort", envir = environment(startDynamicHelp)) > 0
}

.tempId <- function(){
	id = paste('ID', format(Sys.time(), "%Y%m%d%H%M%S"), proc.time()[3]*100, sep="_")
	return(id)
}


.rechartsOutput <- function(jsonStr, charttype="default" ){
	templatedir = getOption("recharts.template.dir")
	chartid <- paste(charttype, basename(tempfile(pattern = "")), sep = "ID")
	
	headerHtml <- readLines(file.path(templatedir, "header.html"))
	footerHtml <- readLines(file.path(templatedir, "footer.html"))
	captionHtml <- readLines(file.path(templatedir, "caption.html"))
	chartHtml <- readLines(file.path(templatedir, "chart.recharts.html"))

	headerStr <- gsub("HEADER", chartid, headerHtml)
	footerStr <- footerHtml
	captionStr <- gsub("CHARTID", chartid, captionHtml)
	chartStr <- gsub("TEMPID", chartid, chartHtml)
	chartStr <- gsub("<!--JSONHERE-->", jsonStr, chartStr)
	
	headerStr <- paste(headerStr, collapse = "\n")
	footerStr <- paste(footerStr, collapse = "\n")
	captionStr <- paste(captionStr, collapse = "\n")
	chartStr <- paste(chartStr, collapse = "\n")
	
	outList <- list()
	outList$type <- charttype
	outList$chartid <- chartid
	outList$html <- list(header = headerStr, chart = chartStr, caption = captionStr, footer = footerStr)
	
	class(outList) <-  c("recharts",  "list")
	return(outList)

}

recharts.init <- function(){
	jsLoaderFlag <<- FALSE
}

renderEcharts <- function (expr, env = parent.frame(), quoted = FALSE) 
{
    func <- shiny::exprToFunction(expr, env, quoted)
    function() {
        chart <- func()
        paste(chart$html$chart, collapse = "\n")
    }
}



recharts.shiny.init <- function(){
	return(file.path(system.file("shiny", package = "recharts"),  "rechartsWidget.html" ))

}


pause <- function(){  
  invisible(readline("\nPress <return> to continue: ")) 
}

