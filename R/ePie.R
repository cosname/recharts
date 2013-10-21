ePie = function(dat, opt=list(), only=FALSE, local=FALSE, style=NULL){
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
    

    optJSON = RJSONIO::toJSON(opt)
    if(is.null(style)) {
        style = "height:500px;border:1px solid #ccc;padding:10px;"
    }

    invisible(configHtml(opt=optJSON, only=only, local=local, style=style))
}