#' recharts plot fucntion
#'
#' An shell function for ploting of the recharts object.
#'
#' @param x    recharts plot object.
#' @param tag   whether plot the recharts object to browser or string.
#' @param ...   default parameter.
#' @return The HTML code as a character string or an html page.
#' @export



plot.recharts <- function (x, tag = NULL, Local = FALSE, ...) 
{

	if (missing(tag))
		tag <- getOption("recharts.plot.tag")
	if (is.null(tag) | !("recharts" %in% class(x))) {
		if (!.isServerRunning()) {
			tools:::startDynamicHelp()
		}
		env <- get(".httpd.handlers.env", asNamespace("tools"))
		env[["recharts"]] <- .recharts.httpd.handler
		root.dir <- tempdir()
		print(paste("chart path", root.dir))
		if (!file.exists(root.dir)) dir.create(root.dir, recursive = TRUE)
		if (x$outList$type == "geoVis") {
			file.copy(getOption("recharts.geoData.dir"), root.dir, recursive = TRUE)
		}

		if ("recharts" %in% class(x)) {
			chart.txt <- "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n        \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <title>%s</title>\n  <meta http-equiv=\"content-type\" content=\"text/html;charset=GBK\" />\n  <style type=\"text/css\">\n    body {\n          color: #444444;\n          font-family: Arial,Helvetica,sans-serif;\n          font-size: 75%%;\n    }\n    a {\n          color: #4D87C7;\n          text-decoration: none;\n    }\n  </style>\n</head>\n<body>\n<p>\n  You find below the HTML code of the visualisation.<br />\n  You can copy and paste the code into an existing HTML page.<br />\n  For more information see also <a href=\"/library/googleVis/html/gvisMethods.html\">?print.recharts</a></p>\n<p><textarea rows=\"50\" name=\"html\" cols=\"80\">\n%s\n</textarea>\n</p>\n</body>\n</html>\n"
			chart.txt <- sprintf(chart.txt, x$outList$chartid, gsub(">", 
							"&gt;", gsub("<", "&lt;", paste(unlist(x$outList$html$chart), 
											collapse = "\n"))))
			cat(chart.txt, file = file.path(root.dir, paste("Chart_", 
									x$outList$chartid, ".html", sep = "")))
			file <- file.path(root.dir, paste(x$outList$chartid, ".html", 
							sep = ""))
		}else {
			basex <- basename(x)
			if (length(grep("htm", substr(basex, nchar(basex) - 
											3, nchar(basex)))) < 1)
				warning("The file does not appear to be an html file.\n")
			file.copy(from = x, to = file.path(root.dir, basex), 
					...)
			file <- file.path(root.dir, basex)
		}
		print(x, file = file)

		if (Local){
			file.copy(file.path(getOption("recharts.template.dir"), "js"), root.dir, recursive = TRUE )
			localHTML <- readLines(file)
			localHtml <- gsub("http://echarts.baidu.com/doc/example/www", ".", localHTML)
			write(localHtml, file = file)
			#.url <- file.path(root.dir, basename(file))
			.url <- file
		}else{
			.url <- sprintf("http://127.0.0.1:%s/custom/recharts/%s", 
					tools:::httpdPort, basename(file))
		}
		if (interactive()) {
			browseURL(.url, ...)
		}
		else {
			browseURL(.url, browser = "false", ...)
		}
		invisible(file)
	}
	else {
		if ("recharts" %in% class(x)) {
			return(print(x, tag = tag))
		}
		else {
			return(print(x))
		}
	}
}

#' recharts print fucntion
#'
#' An shell function for printing of the recharts object.
#'
#' @param x    recharts print object.
#' @param tag   whether print the recharts object to browser or string.
#' @param ...   default parameter.
#' @return The HTML code as a character string.
#' @export 


print.recharts <- function (x, tag = NULL, file = "", ...) 
{
	
    if (is.null(tag))
        tag <- getOption("recharts.print.tag")
    if (!tag %in% getOption("recharts.tags"))
        stop(paste(tag, "is not a valid option. Set tag to NULL or one of the following:\n", 
            paste(getOption("recharts.tags"), collapse = ", ")))
    tag <- ifelse(tag %in% c("chartid", "type", "html"), tag, 
        paste(".", tag, sep = ""))
    output <- unlist(x$outList)
	#print(tag)
	if (exists("jsLoaderFlag")){
		if (jsLoaderFlag && tag==".chart"){
			output <- gsub("<script src='http://echarts.baidu.com/doc/example/www/js/echarts.js'></script>","",output) 
		}
		jsLoaderFlag <<- TRUE
	}
    tag.names <- names(output)
    .id <- apply(t(tag), 2, function(y) grep(paste("\\", y, sep = ""), 
        tag.names))
    cat(output[.id], file = file, ...)
}


#' Reports whether x is a option object
#' @param x An object to test
#' @export
plainPlot <- function(str){
	if (missing(tag))
		tag <- getOption("recharts.plot.tag")
	if (is.null(tag) | !("recharts" %in% class(x))) {
		if (!.isServerRunning()) {
			tools:::startDynamicHelp()
		}
		env <- get(".httpd.handlers.env", asNamespace("tools"))
		env[["recharts"]] <- .recharts.httpd.handler
		root.dir <- tempdir()
		print(paste("chart path", root.dir))
		if (!file.exists(root.dir)) dir.create(root.dir, recursive = TRUE)
		if (x$outList$type == "geoVis") {
			file.copy(getOption("recharts.geoData.dir"), root.dir, recursive = TRUE)
		}
		
		if ("recharts" %in% class(x)) {
			chart.txt <- "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n        \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <title>%s</title>\n  <meta http-equiv=\"content-type\" content=\"text/html;charset=GBK\" />\n  <style type=\"text/css\">\n    body {\n          color: #444444;\n          font-family: Arial,Helvetica,sans-serif;\n          font-size: 75%%;\n    }\n    a {\n          color: #4D87C7;\n          text-decoration: none;\n    }\n  </style>\n</head>\n<body>\n<p>\n  You find below the HTML code of the visualisation.<br />\n  You can copy and paste the code into an existing HTML page.<br />\n  For more information see also <a href=\"/library/googleVis/html/gvisMethods.html\">?print.recharts</a></p>\n<p><textarea rows=\"50\" name=\"html\" cols=\"80\">\n%s\n</textarea>\n</p>\n</body>\n</html>\n"
			chart.txt <- sprintf(chart.txt, x$outList$chartid, gsub(">", 
							"&gt;", gsub("<", "&lt;", paste(unlist(x$outList$html$chart), 
											collapse = "\n"))))
			cat(chart.txt, file = file.path(root.dir, paste("Chart_", 
									x$outList$chartid, ".html", sep = "")))
			file <- file.path(root.dir, paste(x$outList$chartid, ".html", 
							sep = ""))
		}else {
			basex <- basename(x)
			if (length(grep("htm", substr(basex, nchar(basex) - 
											3, nchar(basex)))) < 1)
				warning("The file does not appear to be an html file.\n")
			file.copy(from = x, to = file.path(root.dir, basex), 
					...)
			file <- file.path(root.dir, basex)
		}
		print(x, file = file)
		
		if (Local){
			file.copy(file.path(getOption("recharts.template.dir"), "js"), root.dir, recursive = TRUE )
			localHTML <- readLines(file)
			localHtml <- gsub("http://echarts.baidu.com/doc/example/www", ".", localHTML)
			write(localHtml, file = file)
			#.url <- file.path(root.dir, basename(file))
			.url <- file
		}else{
			.url <- sprintf("http://127.0.0.1:%s/custom/recharts/%s", 
					tools:::httpdPort, basename(file))
		}
		if (interactive()) {
			browseURL(.url, ...)
		}
		else {
			browseURL(.url, browser = "false", ...)
		}
		invisible(file)
	}
	else {
		if ("recharts" %in% class(x)) {
			return(print(x, tag = tag))
		}
		else {
			return(print(x))
		}
	}
	
}


#' Reports whether x is a option object
#' @param x An object to test
#' @export
is.option <- function(x) inherits(x, "option")

#' Set recharts option
#' 
#' @export
#'
option <- function(...) {

	elements <- list(...)
	structure(elements, class ="option")

}

#' Set recharts option
#' 
#' @export
#'
eTitle = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eOption = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eToolbox = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eCalculable = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eLegend = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eTooltip = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eDataRange = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eAxis.X = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eAxis.Y = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
ePolar = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}
eDataZoom = function(...){
	elements <- list(...)
	structure(elements, class ="option")
}


"setFunctionName" <- function(e2name){
	e2name <- strstrip(e2name)
	functionName = gsub("\\(.*", "", e2name)
	print(functionName)
	setFuncList <- c("eOption", "eTitle", "eToolbox", "eCalculable", "eLegend", "eTooltip", "eDataRange",
		"eAxis.X", "eAxis.Y", "ePolar", "eDataZoom", "option")
	if (!functionName %in% setFuncList){
		stop(paste("unspported eCharts setting function inputs", functionName))
		return(FALSE)
	}else{
		return(functionName)
	}
}

#' Modify a recharts by adding on new components.
#' 
#' @param e1 An object of class \code{recharts}
#' @param e2 A component to add to \code{e1}
#'
#' @export
#'
#' @seealso \code{\link{set}}
#' @method + recharts
"+.recharts" <- function(e1, e2){
	#print(e1)
	#print("e2")
	#print(e2)
	#print("go")
	e2name <- deparse(substitute(e2))
	
	optType <- setFunctionName(e2name)

	switch(optType,
		eTitle = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eTitleSet(e1, optionList=e2))
			}
		},
		eToolbox = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eToolboxSet(e1, optionList=e2))
			}
		},		
		eCalculable = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eCalculableSet(e1, optionList=e2))
			}
		},		
		eTooltip = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eTooltipSet(e1, optionList=e2))
			}
		},		
		eLegend = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eLegendSet(e1, optionList=e2))
			}
		},		
		eDataRange = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eDataRangeSet(e1, optionList=e2))
			}
		},		
		eAxis.X = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eAxis.XSet(e1, optionList=e2))
			}
		},		
		eAxis.Y = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eAxis.YSet(e1, optionList=e2))
			}
		},		
		ePolar = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(ePolarSet(e1, optionList=e2))
			}
		},		
		eDataZoom = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(eDataZoomSet(e1, optionList=e2))
			}
		},
		eOption = {
			if ("recharts" %in% class(e1) & is.option(e2)){
				class(e2) <- "list"
				return(optionSet(e1, optionList=e2))
			}
		}
	)
}

#' @export
"%+%" <- `+.recharts`

#' Points charts
#'
#' ECharts style scatter charts. 
#'
#' @param dat    data.frame, should have two column or three colume. 
#' If three, the third colume should be factor or character, it will be treated as category labels.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' plot(ePlain(iris[,3:5]))

ePlain = function(obj, size = c(1024, 768), opt = list())
{
	### ePoint data setting,
	# preprocess data to xvar, yvar, namevar.

	jsonStr <- toJSON(obj, pretty=TRUE)
	outList <- .rechartsOutput_plain(jsonStr, charttype="ePoints", size=size)
	#opt$size = size
	output <- list(outList=outList, opt=opt)
	class(output) <- c("recharts", "ePoints", "list")
	
	### output list format
	return(output)
}



