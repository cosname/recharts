# make sure htmlwidgets:::toJSON() turns list() to {} in JSON, instead of []
.emptyList = setNames(list(), character())
emptyList = function() .emptyList



# evaluate a formula using `data` as the environment, e.g. evalFormula(~ z + 1,
# data = data.frame(z = 1:10))
evalFormula = function(x, data) {
	# x = ~value; data = mapData
  if (!inherits(x, 'formula')) return(x)
  if (length(x) != 2) stop('The formula must be one-sided: ', deparse(x))
  x_formula = terms.formula(x)
  if (length(attr(x_formula, "term.labels")) == 1){
	eval(x[[2]], data, environment(x))
  }else{
	as.data.frame(sapply(attr(x_formula, "term.labels"),function(tmpTerm){
		return(eval(as.name(tmpTerm), data, environment(x)))
	}),stringsAsFactors=F)
  }
}


#' importFrom DT convertIdx
convertIdx = function (i, names, n = length(names), invert = FALSE) 
{
    if (!is.character(i)) 
        return({
            if (invert) {
                if (is.numeric(i)) -i else if (is.logical(i)) !i else {
                  stop("Indices must be either character, numeric, or logical")
                }
            } else i
        })
    if (is.null(names)) 
        stop("The data must have column names")
    o = setNames(seq_len(n), names)
    i = o[i]
    if (any(is.na(i))) 
        stop("Some column names in the 'escape' argument not found in data")
    if (invert) 
        o[-i]
    else i
}

#' importFrom DT escapeData
escapeData <- function (data, i, colnames) 
{
	if (is.null(data) || prod(dim(data)) == 0 || identical(i, 
		FALSE)) 
		return(data)
	i = convertIdx(i, colnames, ncol(data))
	data[i] = lapply(data[i], function(x) {
		if (is.character(x) || is.factor(x)) 
		htmlEscape(x)
		else x
	})
	data
}

# automatic labels from function arguments
autoArgLabel = function(arg, auto) {
  if (is.null(arg)) return('')
  if (inherits(arg, 'formula')) {
    arg_formula = terms.formula(arg)
	if(length(attr(arg_formula, "term.labels")) == 1){
	  return(deparse(arg[[2]]))
	}else{
	  return(attr(arg_formula, "term.labels"))
	}
  }else{
	auto
  }
}

# df2List function to realize unname(alply(valDf, 1, unlist))
df2List = function(valDf){
	#
	nameArray = colnames(valDf)
	outputList = lapply(1:length(valDf[,1]), FUN=function(tmpIndex){
		# tmpIndex = 1
		return(as.list( valDf[tmpIndex,]))
	})
	return(outputList)
}

# region formatter function, to make sure the given place name could be 
# matched to the standard name.
regionFormat = function(regionName){
	#print(regionName)
	regionName = stringr::str_trim(regionName)
	cnFixed = grepl(regionName, mapInfoDf$cnName_full, fixed=TRUE)
	enFixed = grepl(regionName, mapInfoDf$enName_full, fixed=TRUE)
	if(any(cnFixed)){
		return(mapInfoDf[which(cnFixed)[1], "enName"])
	}else if(any(enFixed)){
		return(mapInfoDf[which(enFixed)[1], "enName"])
	}else{
		# if the number of character is odd, add one space char for utf-8 error...
		charBreak = "　"
		if(nchar(regionName) %% 2 == 1){
			return(paste0(regionName, charBreak))
		} 
			
	}
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
  ind <- grep("%",x)
  if(length(ind) > 0){
    X <- x 
  } else {
    X <- tryCatch({
      x <- as.numeric(x)
      x <- ifelse(is.na(x), "", x)
      return(x)
    },warning = function(w){
      match.arg(x,c("center", "left", "right"))
    })
  }
	return(X)
}

matchPos.y <- function(y){
  ind <- grep("%",y)
  if(length(ind) > 0){
    Y <- y 
  } else {
    Y <- tryCatch({
      y <- as.numeric(y)
      y <- ifelse(is.na(y), "", y)
      return(y)
    },warning = function(w){
      match.arg(y,c("bottom", "center", "top"))
    })
  }
	return(Y)
}

strstrip <- function(string, side = c("both", "left", "right")) {
	side <- match.arg(side)
	pattern <- switch(side, left = "^\\s+", right = "\\s+$", both = "^\\s+|\\s+$")
	OUT <- gsub(pattern, "", string)
	return(OUT)
}

.addClass <- function(chart, className){
	class(chart) <- c(class(chart), className )
	return(chart)
}

unnames = function(x){
	names(x) = NULL
	return(x)
}

addThemeDependencies = function(chart){
  if(chart$x$theme != 'customed'){
    chart$dependencies <- c(chart$dependencies,
                            themeDependencies(chart$x$theme))
  }
  return(chart)
}