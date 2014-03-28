configHtml = function(opt, outfile, jsdir, style) {


	id = paste('ID', format(Sys.time(), "%Y%m%d%H%M%S"), proc.time()[3]*100, sep="_")
	Sys.sleep(0.02)

	if(is.null(jsdir)) {
		jsdir = 'http://echarts.baidu.com/doc/asset/js/esl/'
	}

	jsdir = gsub('/$', '', jsdir)
	eJS = paste(jsdir, 'echarts-map', sep = '/')
	esl = paste(jsdir, 'esl.js', sep = '/')


	echartsIn = "
<div id='ID' style='STYLE'></div>
    
<script type='text/javascript'>
    // Step:3 conifg ECharts's path, link to echarts.js from current page.
    require.config({
        paths:{ 
            'echarts': 'eJS',
            'echarts/chart/bar' : 'eJS',
            'echarts/chart/line': 'eJS',
            'echarts/chart/scatter': 'eJS',
            'echarts/chart/k': 'eJS',
            'echarts/chart/pie': 'eJS',
            'echarts/chart/map': 'eJS',
            'echarts/chart/force': 'eJS',
            'echarts/chart/radar': 'eJS'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/scatter',
            'echarts/chart/k',
            'echarts/chart/pie',
            'echarts/chart/map',
            'echarts/chart/force',
            'echarts/chart/radar'
        ],
        function(ec) {
            var EChart_ID = ec.init(document.getElementById('ID'));
            var option_ID = OPT            
            EChart_ID.setOption(option_ID);
        }
    );
</script>
	"

	echartsOut = echartsIn

	echartsOut = gsub("ID", id, echartsOut)
	echartsOut = gsub("eJS", eJS, echartsOut)
	echartsOut = gsub("STYLE", style, echartsOut)
	echartsOut = gsub("OPT", opt, echartsOut)


	if(outfile==FALSE) {
        cat(echartsOut)
		return(echartsOut)
	}

	head = "		
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8'>
    <title>ECharts</title>
    <!--Step:1 Import a module loader, such as esl.js or require.js-->
    <script src='esl'></script>
</head>

<body>
"
	foot = "
</body>
</html>
"
	head = gsub('esl', esl, head)
	echartsOut = paste(head, echartsOut, foot, sep='\n\n\n')
	
    
    outfile = ifelse(is.character(outfile), outfile, id)
	outfile = gsub('.html$', '', outfile)
    outfile = paste(outfile, '.html' , sep='')
	cat(echartsOut, file=outfile)
	browseURL(outfile)
    cat(paste('Out file: ', '"', getwd(), '/', outfile, '"', '.\n', sep=''))
}


unnames = function(x){
	names(x) = NULL
	return(x)
}