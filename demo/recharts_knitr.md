** The data visulization for recharts package**

** This documents are maintained and developed by Taiyun Wei and Yang Zhou**



test here


```r
op <- options(recharts.plot.tag='chart')

# rForce Chart
# R script here
networkMatrix <- matrix(c(
	c(0, 1, 2, 1, 2, 3, 6, 6, 1, 1, 1 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
	c(2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0 ),
	c(1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0 ),
	c(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
	c(3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
	c(6, 0, 1, 1, 1, 1, 0, 6, 0, 1, 0 ),
	c(6, 0, 0, 1, 0, 0, 6, 0, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
	), ncol=11
)


propertyDf <- data.frame(
	category = c("a", "b", "b", "b", "b", "c",
				"c", "c", "c", "c", "c"),
	name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
			"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates",
			"Jonathan", "Tim Cook", "Wayne"),
	value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
 )

rownames(propertyDf) = propertyDf$name

recharts.eForce <- eForce(networkMatrix=networkMatrix, propertyDf=propertyDf)

plot(recharts.eForce)
```


<!-- jsHeader -->
<script src='http://echarts.baidu.com/doc/example/www/js/esl.js'></script>
<!-- jsHeader -->


<!-- divChart -->
<div id='eForceID1e2c1c0a849' style='height:500px;border:1px solid #ccc;padding:10px;'></div>

<!-- jsChart -->
<script>

   require.config({
        paths:{
            'echarts': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/bar' : 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/line': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/scatter': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/k': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/pie': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/map': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/force': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/radar': 'http://echarts.baidu.com/doc/example/www/js/echarts-map'
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
		var EChart_eForceID1e2c1c0a849 = ec.init(document.getElementById('eForceID1e2c1c0a849'))
		var option_eForceID1e2c1c0a849 =
{
	"tooltip" : {
		"trigger" : "item",
		"formatter" : "{a} : {b}"
	},
	"title" : {
		"text" : "network Matrix Ouput",
		"subtext" : "",
		"x" : "right",
		"y" : "bottom"
	},
	"series" : [
		{
			"type" : "force",
			"minRadius" : 15,
			"maxRadius" : 25,
			"density" : 0.05,
			"attractiveness" : 1.2,
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : "true",
						"textStyle" : {
							"color" : "#800080"
						}
					},
					"nodeStyle" : {
						"brushType" : "both",
						"strokeColor" : "rgba(255,215,0,0.4)",
						"lineWidth" : 8
					}
				},
				"emphasis" : {
					"label" : {
						"show" : "true"
					},
					"nodeStyle" : {
						"r" : 30
					}
				}
			},
			"categories" : [
				{
					"name" : "a",
					"itemStyle" : {
						"normal" : {
							"color" : "#F8766D"
						}
					}
				},
				{
					"name" : "b",
					"itemStyle" : {
						"normal" : {
							"color" : "#00BA38"
						}
					}
				},
				{
					"name" : "c",
					"itemStyle" : {
						"normal" : {
							"color" : "#619CFF"
						}
					}
				}
			],
			"nodes" : [
				{
					"category" : 0,
					"name" : "Steven Jobs",
					"value" : 10
				},
				{
					"category" : 1,
					"name" : "Lisa Jobs",
					"value" : 2
				},
				{
					"category" : 1,
					"name" : "Paul Jobs",
					"value" : 3
				},
				{
					"category" : 1,
					"name" : " Kalala Jobs",
					"value" : 3
				},
				{
					"category" : 1,
					"name" : "Lauren Powell",
					"value" : 7
				},
				{
					"category" : 2,
					"name" : "Steve woz Ike",
					"value" : 5
				},
				{
					"category" : 2,
					"name" : "Obama",
					"value" : 8
				},
				{
					"category" : 2,
					"name" : "Bill Gates",
					"value" : 9
				},
				{
					"category" : 2,
					"name" : "Jonathan",
					"value" : 4
				},
				{
					"category" : 2,
					"name" : "Tim Cook",
					"value" : 4
				},
				{
					"category" : 2,
					"name" : "Wayne",
					"value" : 0
				}
			],
			"links" : [
				{
					"source" : 1,
					"target" : 0,
					"weight" : 1
				},
				{
					"source" : 2,
					"target" : 0,
					"weight" : 2
				},
				{
					"source" : 3,
					"target" : 0,
					"weight" : 1
				},
				{
					"source" : 4,
					"target" : 0,
					"weight" : 2
				},
				{
					"source" : 5,
					"target" : 0,
					"weight" : 3
				},
				{
					"source" : 6,
					"target" : 0,
					"weight" : 6
				},
				{
					"source" : 7,
					"target" : 0,
					"weight" : 6
				},
				{
					"source" : 8,
					"target" : 0,
					"weight" : 1
				},
				{
					"source" : 9,
					"target" : 0,
					"weight" : 1
				},
				{
					"source" : 10,
					"target" : 0,
					"weight" : 1
				},
				{
					"source" : 3,
					"target" : 2,
					"weight" : 1
				},
				{
					"source" : 6,
					"target" : 2,
					"weight" : 1
				},
				{
					"source" : 6,
					"target" : 3,
					"weight" : 1
				},
				{
					"source" : 7,
					"target" : 3,
					"weight" : 1
				},
				{
					"source" : 6,
					"target" : 4,
					"weight" : 1
				},
				{
					"source" : 6,
					"target" : 5,
					"weight" : 1
				},
				{
					"source" : 7,
					"target" : 6,
					"weight" : 6
				},
				{
					"source" : 9,
					"target" : 6,
					"weight" : 1
				}
			]
		}
	]
}
  EChart_eForceID1e2c1c0a849.setOption(option_eForceID1e2c1c0a849);
        }
    );
</script>

```r

#
#knit2html("E:/kuaipan/recharts/recharts/inst/demo/recharts_knitr.Rmd")
```



```r
op <- options(recharts.plot.tag='chart')
# force lite demo
testData <- matrix(1:25, nrow=5)
recharts.eForceLite  <- eForce(testData)

plot(recharts.eForceLite)
```


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eForceID1e2c1bf25b4a' style='height:500px;border:1px solid #ccc;padding:10px;'></div>

<!-- jsChart -->
<script>

   require.config({
        paths:{
            'echarts': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/bar' : 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/line': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/scatter': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/k': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/pie': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/map': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/force': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/radar': 'http://echarts.baidu.com/doc/example/www/js/echarts-map'
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
		var EChart_eForceID1e2c1bf25b4a = ec.init(document.getElementById('eForceID1e2c1bf25b4a'))
		var option_eForceID1e2c1bf25b4a =
{
	"tooltip" : {
		"trigger" : "item",
		"formatter" : "{a} : {b}"
	},
	"title" : {
		"text" : "network Matrix Ouput",
		"subtext" : "",
		"x" : "right",
		"y" : "bottom"
	},
	"series" : [
		{
			"type" : "force",
			"minRadius" : 15,
			"maxRadius" : 25,
			"density" : 0.05,
			"attractiveness" : 1.2,
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : "true",
						"textStyle" : {
							"color" : "#800080"
						}
					},
					"nodeStyle" : {
						"brushType" : "both",
						"strokeColor" : "rgba(255,215,0,0.4)",
						"lineWidth" : 8
					}
				},
				"emphasis" : {
					"label" : {
						"show" : "true"
					},
					"nodeStyle" : {
						"r" : 30
					}
				}
			},
			"categories" : [
				{
					"name" : "默认类别",
					"itemStyle" : {
						"normal" : {
							"color" : "#F8766D"
						}
					}
				}
			],
			"nodes" : [
				{
					"category" : 0,
					"name" : "1",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "2",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "3",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "4",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "5",
					"value" : 0
				}
			],
			"links" : [
				{
					"source" : 1,
					"target" : 0,
					"weight" : 2
				},
				{
					"source" : 2,
					"target" : 0,
					"weight" : 3
				},
				{
					"source" : 3,
					"target" : 0,
					"weight" : 4
				},
				{
					"source" : 4,
					"target" : 0,
					"weight" : 5
				},
				{
					"source" : 2,
					"target" : 1,
					"weight" : 8
				},
				{
					"source" : 3,
					"target" : 1,
					"weight" : 9
				},
				{
					"source" : 4,
					"target" : 1,
					"weight" : 10
				},
				{
					"source" : 3,
					"target" : 2,
					"weight" : 14
				},
				{
					"source" : 4,
					"target" : 2,
					"weight" : 15
				},
				{
					"source" : 4,
					"target" : 3,
					"weight" : 20
				}
			]
		}
	]
}
  EChart_eForceID1e2c1bf25b4a.setOption(option_eForceID1e2c1bf25b4a);
        }
    );
</script>

```r

```



```r
op <- options(recharts.plot.tag='chart')
# force lite demo
testData <- matrix(1:25, nrow=5)
recharts.eForceLite  <- eForce(testData)

plot(recharts.eForceLite)
```


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eForceID1e2c167654f3' style='height:500px;border:1px solid #ccc;padding:10px;'></div>

<!-- jsChart -->
<script>

   require.config({
        paths:{
            'echarts': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/bar' : 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/line': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/scatter': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/k': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/pie': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/map': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/force': 'http://echarts.baidu.com/doc/example/www/js/echarts-map',
            'echarts/chart/radar': 'http://echarts.baidu.com/doc/example/www/js/echarts-map'
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
		var EChart_eForceID1e2c167654f3 = ec.init(document.getElementById('eForceID1e2c167654f3'))
		var option_eForceID1e2c167654f3 =
{
	"tooltip" : {
		"trigger" : "item",
		"formatter" : "{a} : {b}"
	},
	"title" : {
		"text" : "network Matrix Ouput",
		"subtext" : "",
		"x" : "right",
		"y" : "bottom"
	},
	"series" : [
		{
			"type" : "force",
			"minRadius" : 15,
			"maxRadius" : 25,
			"density" : 0.05,
			"attractiveness" : 1.2,
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : "true",
						"textStyle" : {
							"color" : "#800080"
						}
					},
					"nodeStyle" : {
						"brushType" : "both",
						"strokeColor" : "rgba(255,215,0,0.4)",
						"lineWidth" : 8
					}
				},
				"emphasis" : {
					"label" : {
						"show" : "true"
					},
					"nodeStyle" : {
						"r" : 30
					}
				}
			},
			"categories" : [
				{
					"name" : "默认类别",
					"itemStyle" : {
						"normal" : {
							"color" : "#F8766D"
						}
					}
				}
			],
			"nodes" : [
				{
					"category" : 0,
					"name" : "1",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "2",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "3",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "4",
					"value" : 0
				},
				{
					"category" : 0,
					"name" : "5",
					"value" : 0
				}
			],
			"links" : [
				{
					"source" : 1,
					"target" : 0,
					"weight" : 2
				},
				{
					"source" : 2,
					"target" : 0,
					"weight" : 3
				},
				{
					"source" : 3,
					"target" : 0,
					"weight" : 4
				},
				{
					"source" : 4,
					"target" : 0,
					"weight" : 5
				},
				{
					"source" : 2,
					"target" : 1,
					"weight" : 8
				},
				{
					"source" : 3,
					"target" : 1,
					"weight" : 9
				},
				{
					"source" : 4,
					"target" : 1,
					"weight" : 10
				},
				{
					"source" : 3,
					"target" : 2,
					"weight" : 14
				},
				{
					"source" : 4,
					"target" : 2,
					"weight" : 15
				},
				{
					"source" : 4,
					"target" : 3,
					"weight" : 20
				}
			]
		}
	]
}
  EChart_eForceID1e2c167654f3.setOption(option_eForceID1e2c167654f3);
        }
    );
</script>

```r

```




