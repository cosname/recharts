# make sure htmlwidgets:::toJSON() turns list() to {} in JSON, instead of []
.emptyList = setNames(list(), character())
emptyList = function() .emptyList

# evaluate a formula using `data` as the environment, e.g. evalFormula(~ z + 1,
# data = data.frame(z = 1:10))
evalFormula = function(x, data) {
  if (!inherits(x, 'formula')) return(x)
  if (length(x) != 2) stop('The formula must be one-sided: ', deparse(x))
  eval(x[[2]], data, environment(x))
}

# automatic labels from function arguments
autoArgLabel = function(arg, auto) {
  if (is.null(arg)) return('')
  if (inherits(arg, 'formula')) return(deparse(arg[[2]]))
  auto
}

# merge two lists by names, e.g. x = list(a = 1, b = 2), mergeList(x, list(b =
# 3)) => list(a = 1, b = 3)
mergeList = function(x, y) {
  if (!is.list(y) || length(y) == 0) return(x)
  yn = names(y)
  if (length(yn) == 0 || any(yn == '')) {
    warning('The second list to be merged into the first must be named')
    return(x)
  }
  for (i in yn) {
    xi = x[[i]]
    yi = y[[i]]
    if (is.list(xi)) {
      if (is.list(yi)) x[[i]] = mergeList(xi, yi)
    } else x[[i]] = yi
  }
  x
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
	
	#jsonStr <- toJSON(x$opt, pretty=TRUE)
	#outList <- .rechartsOutput(jsonStr, charttype="eForce", size=size)
	x$opt$size = size
	output <- list(opt=x$opt)
	class(output) <- classArray
	return(output)
}

