** The data visulization for recharts package**

** This documents are maintained and developed by Taiyun Wei and Yang Zhou**



test here

[1] "English_United Kingdom.1252"

<!-- jsHeader -->
<script src='http://echarts.baidu.com/doc/example/www/js/esl.js'></script>
<!-- jsHeader -->


<!-- divChart -->
<div id='eForceIDacc6efdab5' style='width:1024px; height:768px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eForceIDacc6efdab5 = ec.init(document.getElementById('eForceIDacc6efdab5'))
		var option_eForceIDacc6efdab5 = 
{
	"title" : {
		"text" : "",
		"subtext" : "",
		"x" : "center",
		"y" : "top"
	},
	"calculable" : false,
	"tooltip" : {
		"show" : true,
		"trigger" : "item"
	},
	"toolbox" : {
		"show" : true,
		"x" : "right",
		"y" : "top",
		"orient" : "horizontal",
		"feature" : {
			"mark" : true,
			"dataZoom" : false,
			"magicType" : false,
			"restore" : true,
			"saveAsImage" : true
		}
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
						"show" : true,
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
						"show" : true
					},
					"nodeStyle" : {
						"r" : 25
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
	],
	"legend" : {
		"show" : true,
		"orient" : "horizontal",
		"x" : "left",
		"y" : "top",
		"data" : [
			"a",
			"b",
			"c"
		]
	}
}
  EChart_eForceIDacc6efdab5.setOption(option_eForceIDacc6efdab5);
        }
    );
</script>

体能好坏跟哪些因素有关？如果说跟人种有关的话，我们不跟欧非美比，韩国，日本，朝鲜。同样是我们东亚的，体能哪一个不比我们强？我就不懂，中国每一次大赛都发现大面积的抽筋，去年对香港，有个球迷调侃说海东那是“战术抽筋！”不管老的小的，体能没有一个棒的，李铁引以为豪的体能优势一去英超就根本体现不出来！有些在26，7岁当打之年的球员也抽筋，简直可笑！我真的很羡慕韩国人02世界杯上的“跑不死”，没有体能做保证也不可能连克诸强！虽然有黑哨嫌疑，不是我看不起我们自己的足球，就是裁判想帮我们忙，恐怕都找不出机会来的！
中国经常出现黑色3分钟，70分钟以后丢球，这跟体能差有很大关系！中国球员的职业精神实在是不敢恭维，在国内出点小名气就开始享受，消极训练，饱食终日，一点上进心都没有，状态说下划就下划！
悲哀呀！要想成为世界足球强国，必须从内部做起，自己做起！体能只是一方面，基础！
这里我想起了蒋委员长的一句话：
攘外必须先安内！

```r
op <- options(recharts.plot.tag='chart')
# force lite demo
library(recharts)
library(tmcn)
options(shiny.transcode.json = FALSE)
setwd("E:/kuaipan/git/recharts/inst/shiny/recharts_shiny_football/")
load("football.rda")
stateData <- table_state[,c(1, 10:13 )]
playerData <- table_player[ , c(1, 10:13) ]
names(stateData) <- toUTF8(c("球队名","上半场第一阶段","上半场第二阶段","下半场第一阶段","下半场第二阶段"))
names(playerData) <- toUTF8(c("球员名","上半场第一阶段","上半场第二阶段","下半场第一阶段","下半场第二阶段"))
outputData <- list(stateData=stateData, playerData = playerData)
plotDf <- outputData
stateDf <- plotDf$stateData
rownames(stateDf) <- stateDf[,1]
stateDf <- stateDf[,-1]

eBarOutput <- eBar(stateDf, size= c(800,648), ylim = c(0,5000))
plot(eBarOutput)
```


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eBarIDacc6c467cea' style='width:800px; height:648px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eBarIDacc6c467cea = ec.init(document.getElementById('eBarIDacc6c467cea'))
		var option_eBarIDacc6c467cea = 
{
	"title" : {
		"text" : "",
		"subtext" : "",
		"x" : "center",
		"y" : "top"
	},
	"calculable" : true,
	"tooltip" : {
		"show" : true,
		"trigger" : "item"
	},
	"toolbox" : {
		"show" : true,
		"x" : "right",
		"y" : "top",
		"orient" : "horizontal",
		"feature" : {
			"mark" : true,
			"dataZoom" : false,
			"magicType" : [
				"line",
				"bar"
			],
			"restore" : true,
			"dataView" : {
				"readOnly" : false
			},
			"saveAsImage" : true
		}
	},
	"legend" : {
		"show" : true,
		"orient" : "horizontal",
		"x" : "left",
		"y" : "top",
		"data" : [
			"上半场第一阶段",
			"上半场第二阶段",
			"下半场第一阶段",
			"下半场第二阶段"
		]
	},
	"xAxis" : {
		"position" : "bottom",
		"name" : "",
		"nameLocation" : "start",
		"scale" : true,
		"precision" : 2,
		"power" : 2,
		"axisLine" : {
			"show" : true
		},
		"axisTick" : {
			"show" : false
		},
		"axisLable" : {
			"show" : true
		},
		"splitLine" : {
			"show" : true
		},
		"splitArea" : {
			"show" : false
		},
		"type" : "category",
		"data" : [
			"中国",
			"韩国",
			"日本",
			"德国",
			"多特蒙德",
			"意大利",
			"西班牙",
			"英格兰",
			"巴西",
			"阿根廷",
			"美国",
			"荷兰"
		],
		"boundaryGap" : true
	},
	"yAxis" : {
		"position" : "left",
		"name" : "",
		"nameLocation" : "start",
		"scale" : true,
		"precision" : 2,
		"power" : 2,
		"axisLine" : {
			"show" : true
		},
		"axisTick" : {
			"show" : false
		},
		"axisLable" : {
			"show" : true
		},
		"splitLine" : {
			"show" : true
		},
		"splitArea" : {
			"show" : false
		},
		"max" : 5000,
		"min" : 0,
		"type" : "value",
		"boundaryGap" : [
			0,
			0
		]
	},
	"series" : [
		{
			"type" : "bar",
			"name" : "上半场第一阶段",
			"data" : [
				3309.1,
				3200,
				2564,
				2525,
				2625,
				2550,
				2665.6,
				2274.6,
				2810,
				2819.1,
				2891.3,
				2991.3
			]
		},
		{
			"type" : "bar",
			"name" : "上半场第二阶段",
			"data" : [
				2673.1,
				2700,
				2842,
				2542,
				2642,
				2789,
				2682.4,
				2570.5,
				2470.4,
				2774.7,
				2668.7,
				2768.7
			]
		},
		{
			"type" : "bar",
			"name" : "下半场第一阶段",
			"data" : [
				2632.6,
				3400,
				2465,
				2546,
				2646,
				2970,
				2376.9,
				2452.4,
				2554.7,
				2934.4,
				3023.3,
				3123.3
			]
		},
		{
			"type" : "bar",
			"name" : "下半场第二阶段",
			"data" : [
				1832.2,
				3242,
				2755,
				2782,
				2882,
				2880,
				2542.5,
				2624.5,
				2935,
				2614,
				2810.3,
				2910.3
			]
		}
	]
}
  EChart_eBarIDacc6c467cea.setOption(option_eBarIDacc6c467cea);
        }
    );
</script>



那么让我们来看一下2013年中国队的体能分配情况。

```r
op <- options(recharts.plot.tag='chart')
playerDf <- plotDf$playerData

outputDf <- apply(playerDf[,2:5], 2, mean)

#print(playerDf)
names(outputDf) <- toUTF8(c("上半场第一阶段","上半场第二阶段","下半场第一阶段","下半场第二阶段"))

ePieOutput <- ePie(outputDf, size= c(500,500), title=toUTF8("中国球员体能分配"), title.y=30, legend.y="b")
#ePieOutput$html$chart <- gsub("http://echarts.baidu.com/doc/example/www", ".", ePieOutput$html$chart)

plot(ePieOutput)
```


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='ePieIDacc241a3673' style='width:500px; height:500px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_ePieIDacc241a3673 = ec.init(document.getElementById('ePieIDacc241a3673'))
		var option_ePieIDacc241a3673 = 
{
	"title" : {
		"text" : "中国球员体能分配",
		"subtext" : "",
		"x" : "center",
		"y" : 30
	},
	"calculable" : true,
	"tooltip" : {
		"show" : true,
		"trigger" : "item"
	},
	"toolbox" : {
		"show" : true,
		"x" : "right",
		"y" : "top",
		"orient" : "horizontal",
		"feature" : {
			"mark" : true,
			"dataZoom" : false,
			"magicType" : [
				"line",
				"bar"
			],
			"restore" : true,
			"dataView" : {
				"readOnly" : false
			},
			"saveAsImage" : true
		}
	},
	"legend" : {
		"show" : true,
		"orient" : "horizontal",
		"x" : "left",
		"y" : "bottom",
		"data" : [
			"上半场第一阶段",
			"上半场第二阶段",
			"下半场第一阶段",
			"下半场第二阶段"
		]
	},
	"series" : [
		{
			"name" : "pie chart",
			"type" : "pie",
			"radius" : [
				20,
				110
			],
			"center" : [
				"50%",
				"200"
			],
			"roseType" : "",
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : true
					},
					"labelLine" : {
						"show" : true
					}
				},
				"emphasis" : {
					"label" : {
						"show" : false
					},
					"labelLine" : {
						"show" : false
					}
				}
			},
			"data" : [
				{
					"value" : 2954.6,
					"name" : "上半场第一阶段"
				},
				{
					"value" : 2396.4,
					"name" : "上半场第二阶段"
				},
				{
					"value" : 2356.4,
					"name" : "下半场第一阶段"
				},
				{
					"value" : 1649.4,
					"name" : "下半场第二阶段"
				}
			]
		}
	]
}
  EChart_ePieIDacc241a3673.setOption(option_ePieIDacc241a3673);
        }
    );
</script>




