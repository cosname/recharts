#' recharts initial for knitr
#'
#' An shell function for initializing knitr.
#'
#' Only the first chuck of recharts plot needs this function, 
#' the rest chuck mustn't include this function.
#' 
#' @export 
#' 

recharts.init <- function(){
	jsLoaderFlag <<- FALSE
}

#' render recharts for shiny
#'
#' An shell function for rendering recharts.
#'
#' 
#' @export 
#' 
renderEcharts <- function (expr, env = parent.frame(), quoted = FALSE) 
{
    func <- shiny::exprToFunction(expr, env, quoted)
    function() {
        chart <- func()
        paste(chart$outList$html$chart, collapse = "\n")
    }
}



#' recharts initial for knitr
#'
#' An shell function for initializing knitr.
#' which include the script head for html output.
#' 
#' @export 
recharts.shiny.init <- function(){
	return(file.path(system.file("shiny", package = "recharts"),  "rechartsWidget.html" ))

}


#' recharts demo pause function
#'
#' An function for pausing the command between two chunks of demo codes.
#'
#' @export 
pause <- function(){
  invisible(readline("\nPress <return> to continue: "))
}


matchPos.x <- function(x){
	X <- tryCatch({
		x <- as.numeric(x)
		x <- ifelse(is.na(x), "", x)
		return(x)
	},warning = function(w){
		match.arg(x,c("center", "left", "right"))
	})
	return(X)
}

matchPos.y <- function(y){
	Y <- tryCatch({
		y <- as.numeric(y)
		y <- ifelse(is.na(y), "", y)
		return(y)
	},warning = function(w){
		match.arg(y,c("bottom", "center", "top"))
	})
	return(Y)
}

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

.rechartsOutput <- function(jsonStr, charttype="default", size=c(1024,768)){
	# json format => replace "false" with false
	jsonStr <- gsub('"false"', "false", jsonStr)
	jsonStr <- gsub('"true"', "true", jsonStr)
	templatedir = getOption("recharts.template.dir")
	chartid <- paste(charttype, basename(tempfile(pattern = "")), sep = "ID")
	
	localeSet <- Sys.getlocale("LC_CTYPE")
	#if(grepl("Chinese", localeSet)){
	#	headerHtml <- readLines(file.path(templatedir, "header_GBK.html"))
	#}else{
	#	headerHtml <- readLines(file.path(templatedir, "header.html"))
	#}
	headerHtml <- readLines(file.path(templatedir, "header.html"))
	footerHtml <- readLines(file.path(templatedir, "footer.html"))
	captionHtml <- readLines(file.path(templatedir, "caption.html"))
	chartHtml <- readLines(file.path(templatedir, "chart.recharts.html"))

	headerStr <- gsub("HEADER", chartid, headerHtml)
	footerStr <- footerHtml
	captionStr <- gsub("CHARTID", chartid, captionHtml)
	chartStr <- gsub("TEMPID", chartid, chartHtml)
	plotCSS <- sprintf("width:%spx; height:%spx;", size[1],size[2])
	chartStr <- gsub("DIVSIZE", plotCSS, chartStr)
	chartStr <- gsub("<!--JSONHERE-->", jsonStr, chartStr)
	
	headerStr <- paste(headerStr, collapse = "\n")
	footerStr <- paste(footerStr, collapse = "\n")
	captionStr <- paste(captionStr, collapse = "\n")
	chartStr <- paste(chartStr, collapse = "\n")
	
	outList <- list()
	outList$type <- charttype
	outList$chartid <- chartid
	outList$html <- list(header = headerStr, chart = chartStr, caption = captionStr, footer = footerStr)

	class(outList) <- c("recharts", charttype, "list")
	return(outList)

}

cnformat <- function (cnstring) {
	# this function is copied from tmcn(Author: Jian Li)
	# since the tmcn package is not available from Git or Cran.
	
	isUTF8 <- function (string, combine = FALSE) 
	{
		string <- .verifyChar(string)
		if (length(string) == 1) {
			OUT <- .C("CWrapper_encoding_isutf8", characters = as.character(string), 
				numres = 2L)
			OUT <- as.logical(OUT$numres)
		}
		else {
			if (combine) {
				OUT <- isUTF8(paste(string, collapse = ""))
			}
			else {
				OUT <- as.vector(sapply(string, isUTF8))
			}
		}
		return(OUT)
	}
	
	isGB2312 <- function (string, combine = FALSE) 
	{
		string <- .verifyChar(string)
		if (length(string) == 1) {
			OUT <- .C("CWrapper_encoding_isgb2312", characters = as.character(string), 
				numres = 2L)
			OUT <- as.logical(OUT$numres)
		}
		else {
			if (combine) {
				OUT <- isGB2312(paste(string, collapse = ""))
			}
			else {
				OUT <- as.vector(sapply(string, isGB2312))
			}
		}
		return(OUT)
	}
	isBIG5 <- function (string, combine = FALSE) 
	{
		string <- .verifyChar(string)
		if (length(string) == 1) {
			OUT <- .C("CWrapper_encoding_isbig5", characters = as.character(string), 
				numres = 2L)
			OUT <- as.logical(OUT$numres)
		}
		else {
			if (combine) {
				OUT <- isBIG5(paste(string, collapse = ""))
			}
			else {
				OUT <- as.vector(sapply(string, isBIG5))
			}
		}
		return(OUT)
	}	
	isGBK <- function (string, combine = FALSE) 
	{
		string <- .verifyChar(string)
		if (length(string) == 1) {
			OUT <- .C("CWrapper_encoding_isbig5", characters = as.character(string), 
				numres = 2L)
			OUT <- as.logical(OUT$numres)
		}
		else {
			if (combine) {
				OUT <- isBIG5(paste(string, collapse = ""))
			}
			else {
				OUT <- as.vector(sapply(string, isBIG5))
			}
		}
		return(OUT)
	}

	.verifyChar <- function (vec){
		if (!is.atomic(vec)) 
			stop("Must be an atomic vector!", call. = FALSE)
		OUT <- as.character(vec)
		return(OUT)
	}
    cnstring <- .verifyChar(cnstring)
	
    strenc <- Encoding(cnstring)[which(Encoding(cnstring) != 
        "unknown")][1]
    if (isUTF8(cnstring, TRUE)) {
        OUT <- cnstring
        Encoding(OUT) <- "UTF-8"
        return(OUT)
    }
    else if (isGB2312(cnstring, TRUE)) {
        strenc <- "gb2312"
    }
    else if (isBIG5(cnstring, TRUE)) {
        strenc <- "big5"
    }
    else if (isGBK(cnstring, TRUE)) {
        strenc <- "GBK"
    }
    else {
        if (is.na(strenc)) 
            strenc <- "GBK"
    }
    OUT <- iconv(cnstring, strenc, "UTF-8")
    return(OUT)
}

strstrip <- function(string, side = c("both", "left", "right")) {
	side <- match.arg(side)
	pattern <- switch(side, left = "^\\s+", right = "\\s+$", both = "^\\s+|\\s+$")
	OUT <- gsub(pattern, "", string)
	return(OUT)
}

.list2JSON <- function(x){
	classArray <- class(x)
	size = x$opt$size
	x$opt$size = NULL
	
	jsonStr <- toJSON(x$opt, pretty=TRUE)
	outList <- .rechartsOutput(jsonStr, charttype="eForce", size=size)
	x$opt$size = size
	output <- list(outList=outList, opt=x$opt)
	class(output) <- classArray
	return(output)
}

tooltipFormat <- function(){
	library(tmcn)
	Sys.setlocale("LC_ALL", "chs")
	tooltipTable <- read.csv("E:/kuaipan/git/recharts/inst/tooltip/tooltip.csv", stringsAsFactors=F)
	script_template <- "$('#%s').attr('title', '%s')"
	script_template_2 <- "$('label[for=%s]').attr('title', '%s')"
	write("",file="E:/kuaipan/git/recharts/inst/tooltip/tooltip.js", sep="\n", append =F)
	for (i in 1:length(tooltipTable[,1])){
		tooltip = tooltipTable[i,]
		name = tooltip["ID"]
		tipstr = capture.output(catUTF8(paste0("默认值：", tooltip["defaultValue"], "\\n", tooltip['description'])))

		script_tooltip <- sprintf(script_template, name, tipstr)
		script_tooltip_2 <- sprintf(script_template_2, name, tipstr)
		#print( script_tooltip)
		write(script_tooltip,file="E:/kuaipan/git/recharts/inst/tooltip/tooltip.js", sep="\n", append =T)
		write(script_tooltip_2,file="E:/kuaipan/git/recharts/inst/tooltip/tooltip.js", sep="\n", append =T)
		
	}
}
