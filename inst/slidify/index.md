---
title: html5å¹»ç¯ç‰‡ç®€ä»‹ 
subtitle: åˆ©ç”¨slidify å’Œ knitråˆ›å»ºåŸºäºhtml5 çš„slides 
author: å‘¨æ‰¬ 
github: {user: ramnathv, repo: rCharts, branch: "gh-pages"}
framework: shower
mode: selfcontained
ext_widgets: {rCharts: ["libraries/morris","libraries/nvd3", "libraries/polycharts", "libraries/highcharts","libraries/xcharts", "libraries/leaflet", "libraries/rickshaw"]}
hitheme: solarized_light
logo: libraries/frameworks/minimal/images/rCharts.png
---

## html5å¹»ç¯ç‰‡æ¼”ç¤º

1. slidify æ˜¯Rè¯­è¨€ä¸‹åˆ©ç”¨markdownæ ‡è®°è¯­è¨€ç”Ÿæˆhtml5 slides çš„åŒ…ã€‚
2. ä¸»è¦çš„ç‰¹ç‚¹åŒ…æ‹¬ï¼šå¯äº¤äº’ã€å¯é‡å¤å’Œé¿å…ç›´æ¥ä½¿ç”¨htmlæ ‡è®°è¯­è¨€ã€‚
3. ä½¿ç”¨ä¸‰ä¸ªå‡å·â€œ-â€ ä½œä¸ºä¸åŒé¡µé¢é—´çš„åˆ‡æ¢ã€‚
4. å¯çµæ´»è°ƒç”¨ç¬¬ä¸‰æ–¹çš„jsåº“å’Œæ¨¡æ¿ã€‚

--- .class #id 

## Slide 2
###å½“ç„¶ï¼Œæœ€é…·çš„æ˜¯ï¼Œæˆ‘ä»¬å¯ä»¥å°†åŠ¨æ€å¯äº¤äº’çš„å›¾å½¢åµŒå…¥å¹»ç¯ç‰‡ä¸­ã€‚
###å°±ç”¨recharts æ¥è¯•ä¸€è¯•å§ï¼Ÿ

---
## Slide 3


<!-- jsHeader -->
<script src='http://echarts.baidu.com/doc/example/www/js/esl.js'></script>
<!-- jsHeader -->


<!-- divChart -->
<div id='eForceID308cb2778d8' style='width:800px; height:400px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eForceID308cb2778d8 = ec.init(document.getElementById('eForceID308cb2778d8'))
		var option_eForceID308cb2778d8 = 
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
		"trigger" : "trigger"
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
  EChart_eForceID308cb2778d8.setOption(option_eForceID308cb2778d8);
        }
    );
</script>


---
## Slide 4


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eLineID308cb6d188f' style='width:800px; height:400px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eLineID308cb6d188f = ec.init(document.getElementById('eLineID308cb6d188f'))
		var option_eLineID308cb6d188f = 
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
		"trigger" : "trigger"
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
			"N.Amer",
			"Europe",
			"Asia",
			"S.Amer",
			"Oceania",
			"Africa",
			"Mid.Amer"
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
			"1951",
			"1956",
			"1957",
			"1958",
			"1959",
			"1960",
			"1961"
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
		"type" : "value",
		"boundaryGap" : [
			0,
			0
		]
	},
	"series" : [
		{
			"type" : "line",
			"name" : "N.Amer",
			"data" : [
				45939,
				60423,
				64721,
				68484,
				71799,
				76036,
				79831
			]
		},
		{
			"type" : "line",
			"name" : "Europe",
			"data" : [
				21574,
				29990,
				32510,
				35218,
				37598,
				40341,
				43173
			]
		},
		{
			"type" : "line",
			"name" : "Asia",
			"data" : [
				2876,
				4708,
				5230,
				6662,
				6856,
				8220,
				9053
			]
		},
		{
			"type" : "line",
			"name" : "S.Amer",
			"data" : [
				1815,
				2568,
				2695,
				2845,
				3000,
				3145,
				3338
			]
		},
		{
			"type" : "line",
			"name" : "Oceania",
			"data" : [
				1646,
				2366,
				2526,
				2691,
				2868,
				3054,
				3224
			]
		},
		{
			"type" : "line",
			"name" : "Africa",
			"data" : [
				89,
				1411,
				1546,
				1663,
				1769,
				1905,
				2005
			]
		},
		{
			"type" : "line",
			"name" : "Mid.Amer",
			"data" : [
				555,
				733,
				773,
				836,
				911,
				1008,
				1076
			]
		}
	]
}
  EChart_eLineID308cb6d188f.setOption(option_eLineID308cb6d188f);
        }
    );
</script>

---

## Slide 5


<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='ePieID308c1782718a' style='width:800px; height:400px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_ePieID308c1782718a = ec.init(document.getElementById('ePieID308c1782718a'))
		var option_ePieID308c1782718a = 
{
	"title" : {
		"text" : "Pie Chart",
		"subtext" : "",
		"x" : "center",
		"y" : "top"
	},
	"calculable" : true,
	"tooltip" : {
		"show" : true,
		"trigger" : "trigger"
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
			"A",
			"B",
			"C",
			"D"
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
					"value" : 1,
					"name" : "A"
				},
				{
					"value" : 2,
					"name" : "B"
				},
				{
					"value" : 4,
					"name" : "C"
				},
				{
					"value" : 3,
					"name" : "D"
				}
			]
		}
	]
}
  EChart_ePieID308c1782718a.setOption(option_ePieID308c1782718a);
        }
    );
</script>

---

<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eBarID308c37af4b01' style='width:800px; height:400px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eBarID308c37af4b01 = ec.init(document.getElementById('eBarID308c37af4b01'))
		var option_eBarID308c37af4b01 = 
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
		"trigger" : "trigger"
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
			"Sepal.Length",
			"Sepal.Width",
			"Petal.Length",
			"Petal.Width"
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
			"setosa",
			"versicolor",
			"virginica"
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
		"type" : "value",
		"boundaryGap" : [
			0,
			0
		]
	},
	"series" : [
		{
			"type" : "bar",
			"name" : "Sepal.Length",
			"data" : [
				5.006,
				5.936,
				6.588
			]
		},
		{
			"type" : "bar",
			"name" : "Sepal.Width",
			"data" : [
				3.428,
				2.77,
				2.974
			]
		},
		{
			"type" : "bar",
			"name" : "Petal.Length",
			"data" : [
				1.462,
				4.26,
				5.552
			]
		},
		{
			"type" : "bar",
			"name" : "Petal.Width",
			"data" : [
				0.246,
				1.326,
				2.026
			]
		}
	]
}
  EChart_eBarID308c37af4b01.setOption(option_eBarID308c37af4b01);
        }
    );
</script>


---

[1] "2010ÄêGDP°Ù·Ö±È"
[1] "2009ÄêGDP°Ù·Ö±È"
[1] "2008ÄêGDP°Ù·Ö±È"

<!-- jsHeader -->

<!-- jsHeader -->


<!-- divChart -->
<div id='eMapID308c5cf845e6' style='width:800px; height:400px; ;border:1px solid #ccc;padding:10px;'></div>

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
		var EChart_eMapID308c5cf845e6 = ec.init(document.getElementById('eMapID308c5cf845e6'))
		var option_eMapID308c5cf845e6 = 
{
	"legend" : {
		"show" : true,
		"orient" : "horizontal",
		"x" : "left",
		"y" : "top",
		"data" : [
			"2010ÄêGDP°Ù·Ö±È",
			"2009ÄêGDP°Ù·Ö±È",
			"2008ÄêGDP°Ù·Ö±È"
		]
	},
	"title" : {
		"text" : "",
		"subtext" : "",
		"x" : "center",
		"y" : "top"
	},
	"calculable" : false,
	"tooltip" : {
		"show" : true,
		"trigger" : "trigger"
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
	"dataRange" : {
		"show" : true,
		"text" : [
			"high",
			"low"
		],
		"x" : "left",
		"y" : "bottom",
		"calculable" : true,
		"color" : [
			"#1e90ff",
			"#f0ffff"
		],
		"precision" : 1,
		"orient" : "horizontal",
		"max" : 20,
		"min" : 0
	},
	"series" : [
		{
			"name" : "2010ÄêGDP°Ù·Ö±È",
			"type" : "map",
			"mapType" : "china",
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : true
					}
				}
			},
			"data" : [
				{
					"name" : "¹ã¶«",
					"value" : 11.46,
					"selected" : false
				},
				{
					"name" : "½­ËÕ",
					"value" : 10.32,
					"selected" : false
				},
				{
					"name" : "É½¶«",
					"value" : 9.76,
					"selected" : false
				},
				{
					"name" : "Õã½­",
					"value" : 6.9,
					"selected" : false
				},
				{
					"name" : "ºÓÄÏ",
					"value" : 5.75,
					"selected" : false
				},
				{
					"name" : "ºÓ±±",
					"value" : 5.08,
					"selected" : false
				},
				{
					"name" : "ÁÉÄş",
					"value" : 4.6,
					"selected" : false
				},
				{
					"name" : "ÉÏº£",
					"value" : 4.28,
					"selected" : false
				},
				{
					"name" : "ËÄ´¨",
					"value" : 4.28,
					"selected" : false
				},
				{
					"name" : "ºşÄÏ",
					"value" : 3.99,
					"selected" : false
				},
				{
					"name" : "ºş±±",
					"value" : 3.98,
					"selected" : false
				},
				{
					"name" : "¸£½¨",
					"value" : 3.67,
					"selected" : false
				},
				{
					"name" : "±±¾©",
					"value" : 3.52,
					"selected" : false
				},
				{
					"name" : "°²»Õ",
					"value" : 3.08,
					"selected" : false
				},
				{
					"name" : "ÄÚÃÉ¹Å",
					"value" : 2.91,
					"selected" : false
				},
				{
					"name" : "ºÚÁú½­",
					"value" : 2.58,
					"selected" : false
				},
				{
					"name" : "ÉÂÎ÷",
					"value" : 2.52,
					"selected" : false
				},
				{
					"name" : "¹ãÎ÷",
					"value" : 2.38,
					"selected" : false
				},
				{
					"name" : "½­Î÷",
					"value" : 2.35,
					"selected" : false
				},
				{
					"name" : "Ìì½ò",
					"value" : 2.3,
					"selected" : false
				},
				{
					"name" : "É½Î÷",
					"value" : 2.29,
					"selected" : false
				},
				{
					"name" : "¼ªÁÖ",
					"value" : 2.16,
					"selected" : false
				},
				{
					"name" : "ÖØÇì",
					"value" : 1.97,
					"selected" : false
				},
				{
					"name" : "ÔÆÄÏ",
					"value" : 1.8,
					"selected" : false
				},
				{
					"name" : "ĞÂ½®",
					"value" : 1.35,
					"selected" : false
				},
				{
					"name" : "¹óÖİ",
					"value" : 1.15,
					"selected" : false
				},
				{
					"name" : "¸ÊËà",
					"value" : 1.03,
					"selected" : false
				},
				{
					"name" : "º£ÄÏ",
					"value" : 0.51,
					"selected" : false
				},
				{
					"name" : "ÄşÏÄ",
					"value" : 0.42,
					"selected" : false
				},
				{
					"name" : "Çàº£",
					"value" : 0.34,
					"selected" : false
				},
				{
					"name" : "Î÷²Ø",
					"value" : 0.13,
					"selected" : false
				}
			]
		},
		{
			"name" : "2009ÄêGDP°Ù·Ö±È",
			"type" : "map",
			"mapType" : "china",
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : true
					}
				}
			},
			"data" : [
				{
					"name" : "¹ã¶«",
					"value" : 11.58,
					"selected" : false
				},
				{
					"name" : "½­ËÕ",
					"value" : 10.11,
					"selected" : false
				},
				{
					"name" : "É½¶«",
					"value" : 9.94,
					"selected" : false
				},
				{
					"name" : "Õã½­",
					"value" : 6.74,
					"selected" : false
				},
				{
					"name" : "ºÓÄÏ",
					"value" : 5.71,
					"selected" : false
				},
				{
					"name" : "ºÓ±±",
					"value" : 5.06,
					"selected" : false
				},
				{
					"name" : "ÁÉÄş",
					"value" : 4.46,
					"selected" : false
				},
				{
					"name" : "ÉÏº£",
					"value" : 4.41,
					"selected" : false
				},
				{
					"name" : "ËÄ´¨",
					"value" : 4.15,
					"selected" : false
				},
				{
					"name" : "ºşÄÏ",
					"value" : 3.83,
					"selected" : false
				},
				{
					"name" : "ºş±±",
					"value" : 3.8,
					"selected" : false
				},
				{
					"name" : "¸£½¨",
					"value" : 3.59,
					"selected" : false
				},
				{
					"name" : "±±¾©",
					"value" : 3.56,
					"selected" : false
				},
				{
					"name" : "°²»Õ",
					"value" : 2.95,
					"selected" : false
				},
				{
					"name" : "ÄÚÃÉ¹Å",
					"value" : 2.86,
					"selected" : false
				},
				{
					"name" : "ºÚÁú½­",
					"value" : 2.52,
					"selected" : false
				},
				{
					"name" : "ÉÂÎ÷",
					"value" : 2.4,
					"selected" : false
				},
				{
					"name" : "¹ãÎ÷",
					"value" : 2.28,
					"selected" : false
				},
				{
					"name" : "½­Î÷",
					"value" : 2.25,
					"selected" : false
				},
				{
					"name" : "Ìì½ò",
					"value" : 2.21,
					"selected" : false
				},
				{
					"name" : "É½Î÷",
					"value" : 2.16,
					"selected" : false
				},
				{
					"name" : "¼ªÁÖ",
					"value" : 2.14,
					"selected" : false
				},
				{
					"name" : "ÖØÇì",
					"value" : 1.92,
					"selected" : false
				},
				{
					"name" : "ÔÆÄÏ",
					"value" : 1.81,
					"selected" : false
				},
				{
					"name" : "ĞÂ½®",
					"value" : 1.25,
					"selected" : false
				},
				{
					"name" : "¹óÖİ",
					"value" : 1.15,
					"selected" : false
				},
				{
					"name" : "¸ÊËà",
					"value" : 0.99,
					"selected" : false
				},
				{
					"name" : "º£ÄÏ",
					"value" : 0.49,
					"selected" : false
				},
				{
					"name" : "ÄşÏÄ",
					"value" : 0.4,
					"selected" : false
				},
				{
					"name" : "Çàº£",
					"value" : 0.32,
					"selected" : false
				},
				{
					"name" : "Î÷²Ø",
					"value" : 0.13,
					"selected" : false
				}
			]
		},
		{
			"name" : "2008ÄêGDP°Ù·Ö±È",
			"type" : "map",
			"mapType" : "china",
			"itemStyle" : {
				"normal" : {
					"label" : {
						"show" : true
					}
				}
			},
			"data" : [
				{
					"name" : "¹ã¶«",
					"value" : 11.72,
					"selected" : false
				},
				{
					"name" : "½­ËÕ",
					"value" : 9.87,
					"selected" : false
				},
				{
					"name" : "É½¶«",
					"value" : 9.85,
					"selected" : false
				},
				{
					"name" : "Õã½­",
					"value" : 6.83,
					"selected" : false
				},
				{
					"name" : "ºÓÄÏ",
					"value" : 5.74,
					"selected" : false
				},
				{
					"name" : "ºÓ±±",
					"value" : 5.1,
					"selected" : false
				},
				{
					"name" : "ÁÉÄş",
					"value" : 4.35,
					"selected" : false
				},
				{
					"name" : "ÉÏº£",
					"value" : 4.48,
					"selected" : false
				},
				{
					"name" : "ËÄ´¨",
					"value" : 4.01,
					"selected" : false
				},
				{
					"name" : "ºşÄÏ",
					"value" : 3.68,
					"selected" : false
				},
				{
					"name" : "ºş±±",
					"value" : 3.61,
					"selected" : false
				},
				{
					"name" : "¸£½¨",
					"value" : 3.45,
					"selected" : false
				},
				{
					"name" : "±±¾©",
					"value" : 3.54,
					"selected" : false
				},
				{
					"name" : "°²»Õ",
					"value" : 2.82,
					"selected" : false
				},
				{
					"name" : "ÄÚÃÉ¹Å",
					"value" : 2.71,
					"selected" : false
				},
				{
					"name" : "ºÚÁú½­",
					"value" : 2.65,
					"selected" : false
				},
				{
					"name" : "ÉÂÎ÷",
					"value" : 2.33,
					"selected" : false
				},
				{
					"name" : "¹ãÎ÷",
					"value" : 2.24,
					"selected" : false
				},
				{
					"name" : "½­Î÷",
					"value" : 2.22,
					"selected" : false
				},
				{
					"name" : "Ìì½ò",
					"value" : 2.14,
					"selected" : false
				},
				{
					"name" : "É½Î÷",
					"value" : 2.33,
					"selected" : false
				},
				{
					"name" : "¼ªÁÖ",
					"value" : 2.05,
					"selected" : false
				},
				{
					"name" : "ÖØÇì",
					"value" : 1.84,
					"selected" : false
				},
				{
					"name" : "ÔÆÄÏ",
					"value" : 1.81,
					"selected" : false
				},
				{
					"name" : "ĞÂ½®",
					"value" : 1.33,
					"selected" : false
				},
				{
					"name" : "¹óÖİ",
					"value" : 1.13,
					"selected" : false
				},
				{
					"name" : "¸ÊËà",
					"value" : 1.01,
					"selected" : false
				},
				{
					"name" : "º£ÄÏ",
					"value" : 0.48,
					"selected" : false
				},
				{
					"name" : "ÄşÏÄ",
					"value" : 0.38,
					"selected" : false
				},
				{
					"name" : "Çàº£",
					"value" : 0.32,
					"selected" : false
				},
				{
					"name" : "Î÷²Ø",
					"value" : 0.13,
					"selected" : false
				}
			]
		}
	]
}
  EChart_eMapID308c5cf845e6.setOption(option_eMapID308c5cf845e6);
        }
    );
</script>



