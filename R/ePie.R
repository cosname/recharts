#' Pie charts
#'
#' ECharts style pie charts.
#'
#' @param dat    vector, names will be treated as labels
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' x = runif(6)
#' names(x) = LETTERS[1:6]
#' ePie(x)

ePie = function(dat, opt=list()){
    if(is.null(opt$toolbox$show)) {
        opt$toolbox$show = TRUE
    }

    if(is.null(opt$toolbox$feature$mark)) {
        opt$toolbox$feature$mark = TRUE
    }


    if(is.null(opt$toolbox$feature$dataView)) {
        opt$toolbox$feature$dataView = TRUE
    }

    if(is.null(opt$toolbox$feature$restore)) {
        opt$toolbox$feature$restore = TRUE
    }    
	
	if(is.null(opt$toolbox$feature$saveAsImage)) {
        opt$toolbox$feature$saveAsImage = TRUE
    }  

    if(is.null(opt$tooltip$trigger)) {
        opt$tooltip$trigger = 'item'
    }	

    if(is.null(opt$tooltip$formatter)) {
        opt$tooltip$formatter = "{b} : {c} ({d}%)"
    }	


    if(is.null(opt$legend$orient)) {
    	opt$legend$orient = 'vertical'
    }  

    if(is.null(opt$legend$x)) {
    	opt$legend$x = 'left'
    }  


    if(is.null(opt$legend$data)) {
    	opt$legend$data = names(dat)
    }  

    
    if(is.null(opt$calculable)) {
        opt$calculable = TRUE
    }


    datFrame = data.frame(value=dat, name=names(dat))
    datList = split(datFrame, 1:dim(datFrame)[1])
    names(datList) = NULL

    if(is.null(opt$series)) {
        opt$series =  vector("list", 1)
    } 
    
    if(is.null(opt$series[[1]]$type)) {
        opt$series[[1]]$type = 'pie'
    }


    if(is.null(opt$series[[1]]$data)) { 
        opt$series[[1]]$data = datList
    }
    


	jsonStr <- toJSON(opt, pretty=TRUE)
	
	outList <- .rechartsOutput(jsonStr, charttype="ePie")
	return(outList)
}