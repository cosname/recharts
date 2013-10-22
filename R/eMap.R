#' Map charts
#'
#' ECharts style map charts. Only support CHINA now.
#'
#' @param dat    data.frame or matrix, rownames are province names.
#' @param opt    option of ECharts.
#' @param outfile   logical or character. If TRUE or a chacacter, output a html that contains echarts; 
#' if a character, the name of html file will be named. If FALSE, return div and script environment in html.
#' @param jsdir,  character, directory where esl JS and echarts JS in. The default directory is
#'  'http://efe.baidu.com/echarts/doc/example/www/js/'
#' @param style  character,  div style.
#' @return The HTML code as a character string.
#' @export
#' @examples
#'  options(encoding="UTF-8")
#'  Sys.setlocale("LC_CTYPE","chs")
#'  load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
#'  ChinaGDP
#'  eMap(ChinaGDP, outfile = 'ChinaGDP')

eMap = function(dat, opt=list(), outfile=FALSE, jsdir=NULL, style=NULL) {

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
    	opt$dataRange$min = min(dat)
     }  

    if(is.null(opt$dataRange$max)) {
    	opt$dataRange$max = max(rowSums(dat))
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

	optJSON = RJSONIO::toJSON(opt, pretty=TRUE)
    if(is.null(style)) {
        style = "height:500px;border:1px solid #ccc;padding:10px;"
    }

    invisible(configHtml(opt=optJSON, outfile=outfile, jsdir=jsdir, style=style))
}