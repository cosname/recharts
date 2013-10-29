#' Line charts
#'
#' ECharts style line charts.
#'
#' @param dat    data.frame.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' plot(eLine(WorldPhones))


eLine = function(dat, opt=list()) {
	
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
            opt$series[[i]]$data = unnames(dat[,i])
        } else {
            warning('You can set series:data with dat.')
        }
    }


	jsonStr <- toJSON(opt, pretty=TRUE)
	
	outList <- .rechartsOutput(jsonStr, charttype="eLine")
	return(outList)
	
}

#' Line charts
#'
#' ECharts style area charts.
#'
#' @param dat    data.frame or matrix
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' plot(eArea(WorldPhones))

eArea = function(dat, opt=list()) {
	
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


	jsonStr <- toJSON(opt, pretty=TRUE)
	
	outList <- .rechartsOutput(jsonStr, charttype="eArea")
	return(outList)
}
