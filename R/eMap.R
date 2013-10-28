#' Map charts
#'
#' ECharts style map charts. Only support CHINA now.
#'
#' @param dat    data.frame, rownames are province names.
#' @param opt    option of ECharts.
#' @return The HTML code as a character string.
#' @export
#' @examples
#' options(encoding="UTF-8")
#' Sys.setlocale("LC_CTYPE","chs")
#' load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
#' ChinaGDP
#' plot(eMap(ChinaGDP))

eMap = function(dat, opt=list()) {

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


    names = colnames(dat)
    if(is.null(opt$legend$data)) {
    	opt$legend$data = names
     }  

    if(is.null(opt$dataRange$min)) {
    	opt$dataRange$min = min(dat, na.rm = TRUE)
     }  

    if(is.null(opt$dataRange$max)) {
    	opt$dataRange$max = max(dat, na.rm = TRUE)
     }  

     if(is.null(opt$dataRange$text)) {
    	opt$dataRange$text = c('High','Low')
     }  
         
     if(is.null(opt$dataRange$calculable)) {
    	opt$dataRange$calculable = TRUE
     }  
             
    
    if(is.null(opt$series)) {
        opt$series =  vector("list", length(names))
    } else if(length(opt$series)!=length(names)) {
        stop('Lengh of opt:series should be the same with nol(y).')
    }

    for(i in 1:length(names)) {

    	datFrame = data.frame(name=rownames(dat), value=dat[,i]) 
    	datList = split(datFrame, 1:dim(datFrame)[1])
    	names(datList) = NULL

        if(is.null(opt$series[[i]]$name)) {
            opt$series[[i]]$name = names[i]
        }

        if(is.null(opt$series[[i]]$type)) {
            opt$series[[i]]$type = 'map'
        }

        if(is.null(opt$series[[i]]$mapType)) {
            opt$series[[i]]$mapType = 'china'
        }


        if(is.null(opt$series[[i]]$itemStyle$normal$label$show)) {
            opt$series[[i]]$itemStyle$normal$label$show = TRUE
        }

        if(is.null(opt$series[[i]]$itemStyle$emphasis$label$show)) {
            opt$series[[i]]$itemStyle$emphasis$label$show = TRUE
        }

        if(is.null(opt$series[[i]]$data)) { 
            opt$series[[i]]$data = datList
        }
    }


	jsonStr <- toJSON(opt, pretty=TRUE)
	
	outList <- .rechartsOutput(jsonStr, charttype="eMap")
	return(outList)
}