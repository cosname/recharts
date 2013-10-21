#' Line charts
#'
#' ECharts style line charts.
#'
#' @param dat    data.frame or matrix.
#' @param opt    option of ECharts.
#' @param filename   logical or character. If TRUE or a chacacter, output a html that contains echarts; 
#' if a character, the name of html file will be named. If FALSE, return div and script environment in html.
#' @param local  logical, online or local.
#' @param style  character,  div style.
#' @return The HTML code as a character string.
#' @export
#' @examples
#'  eLine(iris[,1:4], filename = 'irisLine')
#'  eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)), 
#'        filename = 'irisLineZoom')

eLine = function(dat, opt=list(), filename=FALSE, local=FALSE, style=NULL) {
    
    if(is.null(opt$legend$data)) {
        opt$legend$data = colnames(dat)
    }

    if(is.null(opt$toolbox$show)) {
        opt$toolbox$show = TRUE
    }

    if(is.null(opt$toolbox$feature$mark)) {
        opt$toolbox$feature$mark = TRUE
    }

    if(is.null(opt$toolbox$feature$dataView)) {
        opt$toolbox$feature$dataView = TRUE
    }
    
    if(is.null(opt$toolbox$feature$magicType)) {
        opt$toolbox$feature$magicType = c('line', 'bar')
    }

    if(is.null(opt$toolbox$feature$restore)) {
        opt$toolbox$feature$restore = TRUE
    }    
	
	if(is.null(opt$toolbox$feature$saveAsImage)) {
        opt$toolbox$feature$saveAsImage = TRUE
    }  
	
    if(is.null(opt$tooltip$trigger)) {
		opt$tooltip$trigger = 'axis'
    }
	
	if(is.null(opt$xAxis$type)) {
		opt$xAxis$type = 'category'
	}

	if(is.null(opt$xAxis$boundaryGap)) {
		opt$xAxis$boundaryGap = FALSE
	}
		
    if(is.null(opt$xAxis$data)) {
        opt$xAxis$data = rownames(dat)
	} else {
        warning('You can set xAxis:data with rownames(dat).')
    }

    if(is.null(opt$series)) {
        opt$series =  vector("list", ncol(dat))
    } else if(length(opt$series)!=ncol(dat)) {
        stop('Lengh of opt:series should be the same with nol(dat).')
    }
    
    for(i in 1:dim(dat)[2]) {
        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'line'
        }

        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = colnames(dat)[i]
        } else {
            warning('You can set series:name with dat.')
        }
        
        if(is.null(opt$series[[i]]$data)) {
            opt$series[[i]]$data = dat[,i]
        } else {
            warning('You can set series:data with dat.')
        }
    }


    optJSON = RJSONIO::toJSON(opt)
    if(is.null(style)) {
        style = "height:500px;border:1px solid #ccc;padding:10px;"
    }

    invisible(configHtml(opt=optJSON, filename=filename, local=local, style=style))
}

#' Line charts
#'
#' ECharts style area charts.
#'
#' @param dat    data.frame or matrix
#' @param opt    option of ECharts.
#' @param filename   logical or character. If TRUE or a chacacter, output a html that contains echarts; 
#' if a character, the name of html file will be named. If FALSE, return div and script environment in html.
#' @param local  logical, online or local.
#' @param style  character,  div style.
#' @return The HTML code as a character string.
#' @export
#' @examples
#'  eArea(iris[,1:4], filename = 'irisArea')

eArea = function(dat, opt=list(), filename=FALSE, local=FALSE, style=NULL) {
   if(is.null(opt$series)) {
        opt$series =  vector("list", ncol(dat))
    } else if(length(opt$series)!=ncol(dat)) {
        stop('Lengh of opt:series should be the same with nol(dat).')
    }
    
    for(i in 1:dim(dat)[2]) {
        if(is.null(opt$series[[i]]$stack)) {
            opt$series[[i]]$stack = 'SUM'
        }

        if(is.null(opt$series[[i]]$itemStyle$normal$areaStyle$type)) {
            opt$series[[i]]$itemStyle$normal$areaStyle$type = 'default'
        }   
    }

    eLine(dat=dat, opt=opt, filename=filename, local=local, style=style)
}
