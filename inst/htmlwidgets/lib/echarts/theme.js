var macaronsTheme = {
		// 默认色板
		color: [
			'#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
			'#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
			'#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
			'#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
		],

		// 图表标题
		title: {
			itemGap: 8,
			textStyle: {
				fontWeight: 'normal',
				color: '#008acd'          // 主标题文字颜色
			}
		},
		
		// 图例
		legend: {
			itemGap: 8
		},
		
		// 值域
		dataRange: {
			itemWidth: 15,
			//color:['#1e90ff','#afeeee']
			color: ['#2ec7c9','#b6a2de']
		},

		toolbox: {
			color : ['#1e90ff', '#1e90ff', '#1e90ff', '#1e90ff'],
			effectiveColor : '#ff4500',
			itemGap: 8
		},

		// 提示框
		tooltip: {
			backgroundColor: 'rgba(50,50,50,0.5)',     // 提示背景颜色，默认为透明度为0.7的黑色
			axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
				lineStyle : {          // 直线指示器样式设置
					color: '#008acd'
				},
				crossStyle: {
					color: '#008acd'
				},
				shadowStyle : {                     // 阴影指示器样式设置
					color: 'rgba(200,200,200,0.2)'
				}
			}
		},

		// 区域缩放控制器
		dataZoom: {
			dataBackgroundColor: '#efefff',            // 数据背景颜色
			fillerColor: 'rgba(182,162,222,0.2)',   // 填充颜色
			handleColor: '#008acd',    // 手柄颜色
		},

		// 网格
		grid: {
			borderColor: '#eee'
		},

		// 类目轴
		categoryAxis: {
			axisLine: {            // 坐标轴线
				lineStyle: {       // 属性lineStyle控制线条样式
					color: '#008acd'
				}
			},
			splitLine: {           // 分隔线
				lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					color: ['#eee']
				}
			}
		},

		// 数值型坐标轴默认参数
		valueAxis: {
			axisLine: {            // 坐标轴线
				lineStyle: {       // 属性lineStyle控制线条样式
					color: '#008acd'
				}
			},
			splitArea : {
				show : true,
				areaStyle : {
					color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
				}
			},
			splitLine: {           // 分隔线
				lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					color: ['#eee']
				}
			}
		},

		polar : {
			axisLine: {            // 坐标轴线
				lineStyle: {       // 属性lineStyle控制线条样式
					color: '#ddd'
				}
			},
			splitArea : {
				show : true,
				areaStyle : {
					color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
				}
			},
			splitLine : {
				lineStyle : {
					color : '#ddd'
				}
			}
		},

		timeline : {
			lineStyle : {
				color : '#008acd'
			},
			controlStyle : {
				normal : { color : '#008acd'},
				emphasis : { color : '#008acd'}
			},
			symbol : 'emptyCircle',
			symbolSize : 3
		},

		// 柱形图默认参数
		bar: {
			itemStyle: {
				normal: {
					borderRadius: 5
				},
				emphasis: {
					borderRadius: 5
				}
			}
		},

		// 折线图默认参数
		line: {
			smooth : true,
			symbol: 'emptyCircle',  // 拐点图形类型
			symbolSize: 3           // 拐点图形大小
		},
		
		// K线图默认参数
		k: {
			itemStyle: {
				normal: {
					color: '#d87a80',       // 阳线填充颜色
					color0: '#2ec7c9',      // 阴线填充颜色
					lineStyle: {
						width: 1,
						color: '#d87a80',   // 阳线边框颜色
						color0: '#2ec7c9'   // 阴线边框颜色
					}
				}
			}
		},
		
		// 散点图默认参数
		scatter: {
			symbol: 'circle',    // 图形类型
			symbolSize: 4        // 图形大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
		},

		// 雷达图默认参数
		radar : {
			symbol: 'emptyCircle',    // 图形类型
			symbolSize:3
			//symbol: null,         // 拐点图形类型
			//symbolRotate : null,  // 图形旋转控制
		},

		map: {
			itemStyle: {
				normal: {
					areaStyle: {
						color: '#ddd'
					},
					label: {
						textStyle: {
							color: '#d87a80'
						}
					}
				},
				emphasis: {                 // 也是选中样式
					areaStyle: {
						color: '#fe994e'
					},
					label: {
						textStyle: {
							color: 'rgb(100,0,0)'
						}
					}
				}
			}
		},
		
		force : {
			itemStyle: {
				normal: {
					linkStyle : {
						strokeColor : '#1e90ff'
					}
				}
			}
		},

		chord : {
			padding : 4,
			itemStyle : {
				normal : {
					lineStyle : {
						width : 1,
						color : 'rgba(128, 128, 128, 0.5)'
					},
					chordStyle : {
						lineStyle : {
							width : 1,
							color : 'rgba(128, 128, 128, 0.5)'
						}
					}
				},
				emphasis : {
					lineStyle : {
						width : 1,
						color : 'rgba(128, 128, 128, 0.5)'
					},
					chordStyle : {
						lineStyle : {
							width : 1,
							color : 'rgba(128, 128, 128, 0.5)'
						}
					}
				}
			}
		},

		gauge : {
			startAngle: 225,
			endAngle : -45,
			axisLine: {            // 坐标轴线
				show: true,        // 默认显示，属性show控制显示与否
				lineStyle: {       // 属性lineStyle控制线条样式
					color: [[0.2, '#2ec7c9'],[0.8, '#5ab1ef'],[1, '#d87a80']], 
					width: 10
				}
			},
			axisTick: {            // 坐标轴小标记
				splitNumber: 10,   // 每份split细分多少段
				length :15,        // 属性length控制线长
				lineStyle: {       // 属性lineStyle控制线条样式
					color: 'auto'
				}
			},
			axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
				textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					color: 'auto'
				}
			},
			splitLine: {           // 分隔线
				length :22,         // 属性length控制线长
				lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					color: 'auto'
				}
			},
			pointer : {
				width : 5,
				color : 'auto'
			},
			title : {
				textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					color: '#333'
				}
			},
			detail : {
				textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					color: 'auto'
				}
			}
		},
		
		textStyle: {
			fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
		}
	}
	  
var blueTheme = {
    // 默认色板
    color: [
        '#1790cf','#1bb2d8','#99d2dd','#88b0bb',
        '#1c7099','#038cc4','#75abd0','#afd6dd'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#1790cf'
        }
    },
    
    // 值域
    dataRange: {
        color:['#1178ad','#72bbd0']
    },

    // 工具箱
    toolbox: {
        color : ['#1790cf','#1790cf','#1790cf','#1790cf']
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(0,0,0,0.5)',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#1790cf',
                type: 'dashed'
            },
            crossStyle: {
                color: '#1790cf'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#eee',            // 数据背景颜色
        fillerColor: 'rgba(144,197,237,0.2)',   // 填充颜色
        handleColor: '#1790cf'     // 手柄颜色
    },
    
    // 网格
    grid: {
        borderWidth: 0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#1790cf'
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#1790cf'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#1790cf'
        },
        controlStyle : {
            normal : { color : '#1790cf'},
            emphasis : { color : '#1790cf'}
        }
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#1bb2d8',          // 阳线填充颜色
                color0: '#99d2dd',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#1c7099',   // 阳线边框颜色
                    color0: '#88b0bb'   // 阴线边框颜色
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#99d2dd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#1790cf'
                }
            }
        }
    },
    
    chord : {
        padding : 4,
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#1bb2d8'],[0.8, '#1790cf'],[1, '#1c7099']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var darkTheme = {
    // 全图默认背景
    backgroundColor: '#1b1b1b',

    // 默认色板
    color: [
        '#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
        '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
        '#B5C334'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#fff'          // 主标题文字颜色
        }
    },

    // 图例
    legend: {
        textStyle: {
            color: '#ccc'          // 图例文字颜色
        }
    },

    // 值域
    dataRange: {
        itemWidth: 15,
        color: ['#FFF808','#21BCF9'],
        textStyle: {
            color: '#ccc'          // 值域文字颜色
        }
    },

    toolbox: {
        color : ['#fff', '#fff', '#fff', '#fff'],
        effectiveColor : '#FE8463',
        disableColor: '#666'
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(250,250,250,0.8)',     // 提示背景颜色，默认为透明度为0.7的黑色
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#aaa'
            },
            crossStyle: {
                color: '#aaa'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.2)'
            }
        },
        textStyle: {
            color: '#333'
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#555',            // 数据背景颜色
        fillerColor: 'rgba(200,200,200,0.2)',   // 填充颜色
        handleColor: '#eee'     // 手柄颜色
    },

    // 网格
    grid: {
        borderWidth: 0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        axisTick: {            // 坐标轴小标记
            show: false
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#ccc'
            }
        },
        splitLine: {           // 分隔线
            show: false
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        axisTick: {            // 坐标轴小标记
            show: false
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#ccc'
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#aaa'],
                type: 'dashed'
            }
        },
        splitArea: {           // 分隔区域
            show: false
        }
    },

    polar : {
        name : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#ccc'
            }
        },
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#ddd'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
            }
        },
        splitLine : {
            lineStyle : {
                color : '#ddd'
            }
        }
    },

    timeline : {
        label: {
            textStyle:{
                color: '#ccc'
            }
        },
        lineStyle : {
            color : '#aaa'
        },
        controlStyle : {
            normal : { color : '#fff'},
            emphasis : { color : '#FE8463'}
        },
        symbolSize : 3
    },

    // 折线图默认参数
    line: {
        smooth : true
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#FE8463',       // 阳线填充颜色
                color0: '#9BCA63',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#FE8463',   // 阳线边框颜色
                    color0: '#9BCA63'   // 阴线边框颜色
                }
            }
        }
    },

    // 雷达图默认参数
    radar : {
        symbol: 'emptyCircle',    // 图形类型
        symbolSize:3
        //symbol: null,         // 拐点图形类型
        //symbolRotate : null,  // 图形旋转控制
    },

    pie: {
        itemStyle: {
            normal: {
                borderWidth: 1,
                borderColor : 'rgba(255, 255, 255, 0.5)'
            },
            emphasis: {
                borderWidth: 1,
                borderColor : 'rgba(255, 255, 255, 1)'
            }
        }
    },

    map: {
        itemStyle: {
            normal: {
                borderColor:'rgba(255, 255, 255, 0.5)',
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        // color: '#ccc'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#FE8463'
                },
                label: {
                    textStyle: {
                        // color: 'ccc'
                    }
                }
            }
        }
    },

    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#fff'
                }
            }
        }
    },

    chord : {
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(228, 228, 228, 0.2)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(228, 228, 228, 0.2)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(228, 228, 228, 0.9)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(228, 228, 228, 0.9)'
                    }
                }
            }
        }
    },

    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#9BCA63'],[0.8, '#60C0DD'],[1, '#D7504B']],
                width: 3,
                shadowColor : '#fff', //默认透明
                shadowBlur: 10
            }
        },
        axisTick: {            // 坐标轴小标记
            length :15,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto',
                shadowColor : '#fff', //默认透明
                shadowBlur: 10
            }
        },
        axisLabel: {            // 坐标轴小标记
            textStyle: {       // 属性lineStyle控制线条样式
                fontWeight: 'bolder',
                color: '#fff',
                shadowColor : '#fff', //默认透明
                shadowBlur: 10
            }
        },
        splitLine: {           // 分隔线
            length :25,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                width:3,
                color: '#fff',
                shadowColor : '#fff', //默认透明
                shadowBlur: 10
            }
        },
        pointer: {           // 分隔线
            shadowColor : '#fff', //默认透明
            shadowBlur: 5
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 20,
                fontStyle: 'italic',
                color: '#fff',
                shadowColor : '#fff', //默认透明
                shadowBlur: 10
            }
        },
        detail : {
            shadowColor : '#fff', //默认透明
            shadowBlur: 5,
            offsetCenter: [0, '50%'],       // x, y，单位px
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                color: '#fff'
            }
        }
    },

    funnel : {
        itemStyle: {
            normal: {
                borderColor : 'rgba(255, 255, 255, 0.5)',
                borderWidth: 1
            },
            emphasis: {
                borderColor : 'rgba(255, 255, 255, 1)',
                borderWidth: 1
            }
        }
    },

    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var defaultTheme = {}

var greenTheme = {
    // 默认色板
    color: [
        '#408829','#68a54a','#a9cba2','#86b379',
        '#397b29','#8abb6f','#759c6a','#bfd3b7'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#408829'
        }
    },
    
    // 值域
    dataRange: {
        color:['#1f610a','#97b58d']
    },

    // 工具箱
    toolbox: {
        color : ['#408829','#408829','#408829','#408829']
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(0,0,0,0.5)',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#408829',
                type: 'dashed'
            },
            crossStyle: {
                color: '#408829'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#eee',            // 数据背景颜色
        fillerColor: 'rgba(64,136,41,0.2)',   // 填充颜色
        handleColor: '#408829'     // 手柄颜色
    },
    
    // 网格
    grid: {
        borderWidth: 0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#408829'
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#408829'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#408829'
        },
        controlStyle : {
            normal : { color : '#408829'},
            emphasis : { color : '#408829'}
        }
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#68a54a',          // 阳线填充颜色
                color0: '#a9cba2',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#408829',   // 阳线边框颜色
                    color0: '#86b379'   // 阴线边框颜色
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#99d2dd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#408829'
                }
            }
        }
    },
    
    chord : {
        padding : 4,
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#86b379'],[0.8, '#68a54a'],[1, '#408829']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var romaTheme = {
    color: ['#E01F54','#b8d2c7','#f5e8c8','#001852','#c6b38e',
            '#a4d8c2','#f3d999','#d3758f','#dcc392','#2e4783',
            '#82b6e9','#ff6347','#a092f1','#0a915d','#eaf889',
            '#6699FF','#ff6666','#3cb371','#d5b158','#38b6b6'],
    dataRange: {
        color:['#e01f54','#e7dbc3'],
        textStyle: {
            color: '#333'
        }
    },
    k: {
        itemStyle: {
            normal: {
                color: '#e01f54',          
                color0: '#001852',      
                lineStyle: {
                    width: 1,
                    color: '#f5e8c8',
                    color0: '#b8d2c7'   
                }
            }
        }
    },
    pie: {
        itemStyle: {
            normal: {
                
                borderColor: '#fff',
                borderWidth: 1,
                label: {
                    show: true,
                    position: 'outer',
                  textStyle: {color: '#1b1b1b'},
                  lineStyle: {color: '#1b1b1b'}
                    
                },
                labelLine: {
                    show: true,
                    length: 20,
                    lineStyle: {
                        
                        width: 1,
                        type: 'solid'
                    }
                }
            },
            emphasis: {
                
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 20,
                    lineStyle: {
                        width: 1,
                        type: 'solid'
                    }
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                borderColor: '#fff',
                borderWidth: 1,
                areaStyle: {
                    color: '#ccc'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            },
            emphasis: {                 
                
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                areaStyle: {
                    color: '#f3d999'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                label: {
                    show: false
                },
                nodeStyle : {
                    brushType : 'both',
                    strokeColor : '#5182ab'
                },
                linkStyle : {
                    strokeColor : '#5182ab'
                }
            },
            emphasis: {
                label: {
                    show: false
                },
                nodeStyle : {},
                linkStyle : {}
            }
        }
    },

    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#E01F54'],[0.8, '#b8d2c7'],[1, '#001852']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    }
}

var redTheme = {
    // 默认色板
    color: [
        '#d8361b','#f16b4c','#f7b4a9','#d26666',
        '#99311c','#c42703','#d07e75'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#d8361b'
        }
    },
    
    // 值域
    dataRange: {
        color:['#bd0707','#ffd2d2']
    },

    // 工具箱
    toolbox: {
        color : ['#d8361b','#d8361b','#d8361b','#d8361b']
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(0,0,0,0.5)',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#d8361b',
                type: 'dashed'
            },
            crossStyle: {
                color: '#d8361b'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#eee',            // 数据背景颜色
        fillerColor: 'rgba(216,54,27,0.2)',   // 填充颜色
        handleColor: '#d8361b'     // 手柄颜色
    },
    
    // 网格
    grid: {
        borderWidth: 0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#d8361b'
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#d8361b'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#d8361b'
        },
        controlStyle : {
            normal : { color : '#d8361b'},
            emphasis : { color : '#d8361b'}
        }
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#f16b4c',          // 阳线填充颜色
                color0: '#f7b4a9',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#d8361b',   // 阳线边框颜色
                    color0: '#d26666'   // 阴线边框颜色
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#99d2dd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#d8361b'
                }
            }
        }
    },
    
    chord : {
        padding : 4,
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#f16b4c'],[0.8, '#d8361b'],[1, '#99311c']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};


var mTheme = {
    // 全图默认背景
    // backgroundColor: 'rgba(0,0,0,0)',
    
    // 默认色板
    color: ['#8aedd5','#93bc9e','#cef1db','#7fe579','#a6d7c2',
            '#bef0bb','#99e2vb','#94f8a8','#7de5b8','#4dfb70'],

    
    
    // 值域
    dataRange: {
        color:['#93bc92','#bef0bb']
    },

    // K线图默认参数
    k: {
        // barWidth : null          // 默认自适应
        // barMaxWidth : null       // 默认自适应 
        itemStyle: {
            normal: {
                color: '#8aedd5',          // 阳线填充颜色
                color0: '#7fe579',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#8aedd5',   // 阳线边框颜色
                    color0: '#7fe579'   // 阴线边框颜色
                }
            },
            emphasis: {
                // color: 各异,
                // color0: 各异
            }
        }
    },
    
    // 饼图默认参数
    pie: {
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                label: {
                    show: true,
                    position: 'outer',
                  textStyle: {color: '#1b1b1b'},
                  lineStyle: {color: '#1b1b1b'}
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                labelLine: {
                    show: true,
                    length: 20,
                    lineStyle: {
                        // color: 各异,
                        width: 1,
                        type: 'solid'
                    }
                }
            }
        }
    },
    
    map: {
        mapType: 'china',   // 各省的mapType暂时都用中文
        mapLocation: {
            x : 'center',
            y : 'center'
            // width    // 自适应
            // height   // 自适应
        },
        showLegendSymbol : true,       // 显示图例颜色标识（系列标识的小圆点），存在legend时生效
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                areaStyle: {
                    color: '#ccc'//rgba(135,206,250,0.8)
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                // color: 各异,
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                areaStyle: {
                    color: '#f3f39d'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {
                    brushType : 'both',
                    strokeColor : '#49b485'
                },
                linkStyle : {
                    strokeColor : '#49b485'
                }
            },
            emphasis: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {},
                linkStyle : {}
            }
        }
    },

    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#93bc9e'],[0.8, '#8aedd5'],[1, '#a6d7c2']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    }
};
     
var macarons2Theme = {
    // 全图默认背景
    // backgroundColor: 'rgba(0,0,0,0)',
    
    // 默认色板
    color: ['#ed9678','#e7dac9','#cb8e85','#f3f39d','#c8e49c',
            '#f16d7a','#f3d999','#d3758f','#dcc392','#2e4783',
            '#82b6e9','#ff6347','#a092f1','#0a915d','#eaf889',
            '#6699FF','#ff6666','#3cb371','#d5b158','#38b6b6'],
    
    // 值域
    dataRange: {
        color:['#cb8e85','#e7dac9'],//颜色 
        //text:['高','低'],         // 文本，默认为数值文本
        textStyle: {
            color: '#333'          // 值域文字颜色
        }
    },


    // 柱形图默认参数
    bar: {
        barMinHeight: 0,          // 最小高度改为0
        // barWidth: null,        // 默认自适应
        barGap: '30%',            // 柱间距离，默认为柱形宽度的30%，可设固定值
        barCategoryGap : '20%',   // 类目间柱形距离，默认为类目间距的20%，可设固定值
        itemStyle: {
            normal: {
                // color: '各异',
                barBorderColor: '#fff',       // 柱条边线
                barBorderRadius: 0,           // 柱条边线圆角，单位px，默认为0
                barBorderWidth: 1,            // 柱条边线线宽，单位px，默认为1
                label: {
                    show: false
                    // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                    //           'inside'|'left'|'right'|'top'|'bottom'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                }
            },
            emphasis: {
                // color: '各异',
                barBorderColor: 'rgba(0,0,0,0)',   // 柱条边线
                barBorderRadius: 0,                // 柱条边线圆角，单位px，默认为0
                barBorderWidth: 1,                 // 柱条边线线宽，单位px，默认为1
                label: {
                    show: false
                    // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                    //           'inside'|'left'|'right'|'top'|'bottom'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                }
            }
        }
    },

    // 折线图默认参数
    line: {
        itemStyle: {
            normal: {
                // color: 各异,
                label: {
                    show: false
                    // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                    //           'inside'|'left'|'right'|'top'|'bottom'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                lineStyle: {
                    width: 2,
                    type: 'solid',
                    shadowColor : 'rgba(0,0,0,0)', //默认透明
                    shadowBlur: 5,
                    shadowOffsetX: 3,
                    shadowOffsetY: 3
                }
            },
            emphasis: {
                // color: 各异,
                label: {
                    show: false
                    // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                    //           'inside'|'left'|'right'|'top'|'bottom'
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                }
            }
        },
        //smooth : false,
        //symbol: null,         // 拐点图形类型
        symbolSize: 2,          // 拐点图形大小
        //symbolRotate : null,  // 拐点图形旋转控制
        showAllSymbol: false    // 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
    },
    
    // K线图默认参数
    k: {
        // barWidth : null          // 默认自适应
        // barMaxWidth : null       // 默认自适应 
        itemStyle: {
            normal: {
                color: '#fe9778',          // 阳线填充颜色
                color0: '#e7dac9',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#f78766',   // 阳线边框颜色
                    color0: '#f1ccb8'   // 阴线边框颜色
                }
            },
            emphasis: {
                // color: 各异,
                // color0: 各异
            }
        }
    },

    // 饼图默认参数
    pie: {
        center : ['50%', '50%'],    // 默认全局居中
        radius : [0, '75%'],
        clockWise : false,          // 默认逆时针
        startAngle: 90,
        minAngle: 0,                // 最小角度改为0
        selectedOffset: 10,         // 选中是扇区偏移量
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                label: {
                    show: true,
                    position: 'outer',
                  textStyle: {color: '#1b1b1b'},
                  lineStyle: {color: '#1b1b1b'}
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                labelLine: {
                    show: true,
                    length: 20,
                    lineStyle: {
                        // color: 各异,
                        width: 1,
                        type: 'solid'
                    }
                }
            }
        }
    },
    
    map: {
        mapType: 'china',   // 各省的mapType暂时都用中文
        mapLocation: {
            x : 'center',
            y : 'center'
            // width    // 自适应
            // height   // 自适应
        },
        showLegendSymbol : true,       // 显示图例颜色标识（系列标识的小圆点），存在legend时生效
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                areaStyle: {
                    color: '#ccc'//rgba(135,206,250,0.8)
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                // color: 各异,
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                areaStyle: {
                    color: '#f3f39d'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {
                    brushType : 'both',
                    strokeColor : '#a17e6e'
                },
                linkStyle : {
                    strokeColor : '#a17e6e'
                }
            },
            emphasis: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {},
                linkStyle : {}
            }
        }
    },

    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#ed9678'],[0.8, '#e7dac9'],[1, '#cb8e85']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    }
};
                
var infographicTheme = {
    // 默认色板
    color: [
        '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#27727B'          // 主标题文字颜色
        }
    },

    // 值域
    dataRange: {
        x:'right',
        y:'center',
        itemWidth: 5,
        itemHeight:25,
        color:['#C1232B','#FCCE10']
    },

    toolbox: {
        color : [
            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD'
        ],
        effectiveColor : '#ff4500'
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(50,50,50,0.5)',     // 提示背景颜色，默认为透明度为0.7的黑色
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#27727B',
                type: 'dashed'
            },
            crossStyle: {
                color: '#27727B'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: 'rgba(181,195,52,0.3)',            // 数据背景颜色
        fillerColor: 'rgba(181,195,52,0.2)',   // 填充颜色
        handleColor: '#27727B'    // 手柄颜色
    },

    // 网格
    grid: {
        borderWidth:0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#27727B'
            }
        },
        splitLine: {           // 分隔线
            show: false
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        splitArea : {
            show: false
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#ccc'],
                type: 'dashed'
            }
        }
    },

    polar : {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#ddd'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
            }
        },
        splitLine : {
            lineStyle : {
                color : '#ddd'
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#27727B'
        },
        controlStyle : {
            normal : { color : '#27727B'},
            emphasis : { color : '#27727B'}
        },
        symbol : 'emptyCircle',
        symbolSize : 3
    },

    // 折线图默认参数
    line: {
        itemStyle: {
            normal: {
                borderWidth:2,
                borderColor:'#fff',
                lineStyle: {
                    width: 3
                }
            },
            emphasis: {
                borderWidth:0
            }
        },
        symbol: 'circle',  // 拐点图形类型
        symbolSize: 3.5           // 拐点图形大小
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#C1232B',       // 阳线填充颜色
                color0: '#B5C334',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#C1232B',   // 阳线边框颜色
                    color0: '#B5C334'   // 阴线边框颜色
                }
            }
        }
    },

    // 散点图默认参数
    scatter: {
        itemStyle: {
            normal: {
                borderWidth:1,
                borderColor:'rgba(200,200,200,0.5)'
            },
            emphasis: {
                borderWidth:0
            }
        },
        symbol: 'star4',    // 图形类型
        symbolSize: 4        // 图形大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
    },

    // 雷达图默认参数
    radar : {
        symbol: 'emptyCircle',    // 图形类型
        symbolSize:3
        //symbol: null,         // 拐点图形类型
        //symbolRotate : null,  // 图形旋转控制
    },

    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#C1232B'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#fe994e'
                },
                label: {
                    textStyle: {
                        color: 'rgb(100,0,0)'
                    }
                }
            }
        }
    },

    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#27727B'
                }
            }
        }
    },

    chord : {
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },

    gauge : {
        center:['50%','80%'],
        radius:'100%',
        startAngle: 180,
        endAngle : 0,
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#B5C334'],[0.8, '#27727B'],[1, '#C1232B']],
                width: '40%'
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 2,   // 每份split细分多少段
            length: 5,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#fff'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#fff',
                fontWeight:'bolder'
            }
        },
        splitLine: {           // 分隔线
            length: '5%',         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: '#fff'
            }
        },
        pointer : {
            width : '40%',
            length: '80%',
            color: '#fff'
        },
        title : {
          offsetCenter: [0, -20],       // x, y，单位px
          textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            color: 'auto',
            fontSize: 20
          }
        },
        detail : {
            offsetCenter: [0, 0],       // x, y，单位px
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto',
                fontSize: 40
            }
        }
    },

    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var helianthusTheme = {
    backgroundColor: '#F2F2E6',
    // 默认色板
    color: [
        '#44B7D3','#E42B6D','#F4E24E','#FE9616','#8AED35',
        '#ff69b4','#ba55d3','#cd5c5c','#ffa500','#40e0d0',
        '#E95569','#ff6347','#7b68ee','#00fa9a','#ffd700',
        '#6699FF','#ff6666','#3cb371','#b8860b','#30e0e0'
    ],

    // 图表标题
    title: {
        backgroundColor: '#F2F2E6',
        itemGap: 10,               // 主副标题纵向间隔，单位px，默认为10，
        textStyle: {
            color: '#8A826D'          // 主标题文字颜色
        },
        subtextStyle: {
            color: '#E877A3'          // 副标题文字颜色
        }
    },

    // 值域
    dataRange: {
        x:'right',
        y:'center',
        itemWidth: 5,
        itemHeight:25,
        color:['#E42B6D','#F9AD96'],
        text:['高','低'],         // 文本，默认为数值文本
        textStyle: {
            color: '#8A826D'          // 值域文字颜色
        }
    },

    toolbox: {
        color : ['#E95569','#E95569','#E95569','#E95569'],
        effectiveColor : '#ff4500',
        itemGap: 8
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(138,130,109,0.7)',     // 提示背景颜色，默认为透明度为0.7的黑色
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#6B6455',
                type: 'dashed'
            },
            crossStyle: {          //十字准星指示器
                color: '#A6A299'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: 'rgba(130,197,209,0.6)',            // 数据背景颜色
        fillerColor: 'rgba(233,84,105,0.1)',   // 填充颜色
        handleColor: 'rgba(107,99,84,0.8)'     // 手柄颜色
    },

    // 网格
    grid: {
        borderWidth:0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#6B6455'
            }
        },
        splitLine: {           // 分隔线
            show: false
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        splitArea : {
            show: false
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#FFF'],
                type: 'dashed'
            }
        }
    },

    polar : {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#ddd'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
            }
        },
        splitLine : {
            lineStyle : {
                color : '#ddd'
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#6B6455'
        },
        controlStyle : {
            normal : { color : '#6B6455'},
            emphasis : { color : '#6B6455'}
        },
        symbol : 'emptyCircle',
        symbolSize : 3
    },

    // 柱形图默认参数
    bar: {
        itemStyle: {
            normal: {
                barBorderRadius: 0
            },
            emphasis: {
                barBorderRadius: 0
            }
        }
    },

    // 折线图默认参数
    line: {
        smooth : true,
        symbol: 'emptyCircle',  // 拐点图形类型
        symbolSize: 3           // 拐点图形大小
    },


    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#E42B6D',       // 阳线填充颜色
                color0: '#44B7D3',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#E42B6D',   // 阳线边框颜色
                    color0: '#44B7D3'   // 阴线边框颜色
                }
            }
        }
    },

    // 散点图默认参数
    scatter: {
        itemStyle: {
            normal: {
                borderWidth:1,
                borderColor:'rgba(200,200,200,0.5)'
            },
            emphasis: {
                borderWidth:0
            }
        },
        symbol: 'circle',    // 图形类型
        symbolSize: 4        // 图形大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
    },

    // 雷达图默认参数
    radar : {
        symbol: 'emptyCircle',    // 图形类型
        symbolSize:3
        //symbol: null,         // 拐点图形类型
        //symbolRotate : null,  // 图形旋转控制
    },

    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#E42B6D'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#fe994e'
                },
                label: {
                    textStyle: {
                        color: 'rgb(100,0,0)'
                    }
                }
            }
        }
    },

    force : {
        itemStyle: {
            normal: {
                nodeStyle : {
                    borderColor : 'rgba(0,0,0,0)'
                },
                linkStyle : {
                    color : '#6B6455'
                }
            }
        }
    },

    chord : {
        itemStyle : {
            normal : {
                chordStyle : {
                    lineStyle : {
                        width : 0,
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                chordStyle : {
                    lineStyle : {
                        width : 1,
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },

    gauge : {                  // 仪表盘
        center:['50%','80%'],
        radius:'100%',
        startAngle: 180,
        endAngle : 0,
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#44B7D3'],[0.8, '#6B6455'],[1, '#E42B6D']],
                width: '40%'
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 2,   // 每份split细分多少段
            length: 5,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#fff'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#fff',
                fontWeight:'bolder'
            }
        },
        splitLine: {           // 分隔线
            length: '5%',         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: '#fff'
            }
        },
        pointer : {
            width : '40%',
            length: '80%',
            color: '#fff'
        },
        title : {
          offsetCenter: [0, -20],       // x, y，单位px
          textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            color: 'auto',
            fontSize: 20
          }
        },
        detail : {
            offsetCenter: [0, 0],       // x, y，单位px
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto',
                fontSize: 40
            }
        }
    },

    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var grayTheme = {
    // 默认色板
    color: [
        '#757575','#c7c7c7','#dadada',
        '#8b8b8b','#b5b5b5','#e9e9e9'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal',
            color: '#757575'
        }
    },
    
    // 值域
    dataRange: {
        color:['#636363','#dcdcdc']
    },

    // 工具箱
    toolbox: {
        color : ['#757575','#757575','#757575','#757575']
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(0,0,0,0.5)',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#757575',
                type: 'dashed'
            },
            crossStyle: {
                color: '#757575'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.3)'
            }
        }
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#eee',            // 数据背景颜色
        fillerColor: 'rgba(117,117,117,0.2)',   // 填充颜色
        handleColor: '#757575'     // 手柄颜色
    },
    
    // 网格
    grid: {
        borderWidth: 0
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#757575'
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#757575'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#757575'
        },
        controlStyle : {
            normal : { color : '#757575'},
            emphasis : { color : '#757575'}
        }
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#8b8b8b',          // 阳线填充颜色
                color0: '#dadada',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#757575',   // 阳线边框颜色
                    color0: '#c7c7c7'   // 阴线边框颜色
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#99d2dd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#757575'
                }
            }
        }
    },
    
    chord : {
        padding : 4,
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#b5b5b5'],[0.8, '#757575'],[1, '#5c5c5c']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var shineTheme = {
    // 默认色板
    color: [
        '#c12e34','#e6b600','#0098d9','#2b821d',
        '#005eaa','#339ca8','#cda819','#32a487'
    ],

    // 图表标题
    title: {
        textStyle: {
            fontWeight: 'normal'
        }
    },
    
    // 值域
    dataRange: {
        itemWidth: 15,             // 值域图形宽度，线性渐变水平布局宽度为该值 * 10
        color:['#1790cf','#a2d4e6']
    },

    // 工具箱
    toolbox: {
        color : ['#06467c','#00613c','#872d2f','#c47630']
    },

    // 提示框
    tooltip: {
        backgroundColor: 'rgba(0,0,0,0.6)'
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#dedede',            // 数据背景颜色
        fillerColor: 'rgba(154,217,247,0.2)',   // 填充颜色
        handleColor: '#005eaa'     // 手柄颜色
    },
    
    // 网格
    grid: {
        borderWidth: 0
    },
    
    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        axisTick: {            // 坐标轴小标记
            show: false
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            show: false
        },
        axisTick: {            // 坐标轴小标记
            show: false
        },
        splitArea: {           // 分隔区域
            show: true,       // 默认不显示，属性show控制显示与否
            areaStyle: {       // 属性areaStyle（详见areaStyle）控制区域样式
                color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
            }
        }
    },
    
    timeline : {
        lineStyle : {
            color : '#005eaa'
        },
        controlStyle : {
            normal : { color : '#005eaa'},
            emphasis : { color : '#005eaa'}
        }
    },

    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#c12e34',          // 阳线填充颜色
                color0: '#2b821d',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#c12e34',   // 阳线边框颜色
                    color0: '#2b821d'   // 阴线边框颜色
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                areaStyle: {
                    color: '#e6b600'
                },
                label: {
                    textStyle: {
                        color: '#c12e34'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    color : '#005eaa'
                }
            }
        }
    },
    
    chord : {
        itemStyle : {
            normal : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                borderWidth: 1,
                borderColor: 'rgba(128, 128, 128, 0.5)',
                chordStyle : {
                    lineStyle : {
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#2b821d'],[0.8, '#005eaa'],[1, '#c12e34']], 
                width: 5
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :8,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 12,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            width : 3,
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
};

var sakuraTheme = {
    // 全图默认背景
    // backgroundColor: 'rgba(0,0,0,0)',
    
    // 默认色板
    color: ['#e52c3c','#f7b1ab','#fa506c','#f59288','#f8c4d8',
            '#e54f5c','#f06d5c','#e54f80','#f29c9f','#eeb5b7'],

    // 值域
    dataRange: {
        color:['#e52c3c','#f7b1ab']//颜色 
    },

    
    // K线图默认参数
    k: {
        // barWidth : null          // 默认自适应
        // barMaxWidth : null       // 默认自适应 
        itemStyle: {
            normal: {
                color: '#e52c3c',          // 阳线填充颜色
                color0: '#f59288',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#e52c3c',   // 阳线边框颜色
                    color0: '#f59288'   // 阴线边框颜色
                }
            },
            emphasis: {
                // color: 各异,
                // color0: 各异
            }
        }
    },
    
    // 饼图默认参数
    pie: {
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                label: {
                    show: true,
                    position: 'outer',
                  textStyle: {color: 'black'}
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                labelLine: {
                    show: true,
                    length: 20,
                    lineStyle: {
                        // color: 各异,
                        width: 1,
                        type: 'solid'
                    }
                }
            }
        }
    },
    
    map: {
        mapType: 'china',   // 各省的mapType暂时都用中文
        mapLocation: {
            x : 'center',
            y : 'center'
            // width    // 自适应
            // height   // 自适应
        },
        showLegendSymbol : true,       // 显示图例颜色标识（系列标识的小圆点），存在legend时生效
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#fff',
                borderWidth: 1,
                areaStyle: {
                    color: '#ccc'//rgba(135,206,250,0.8)
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                // color: 各异,
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                areaStyle: {
                    color: '#f3f39d'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: 'rgba(139,69,19,1)'
                    }
                }
            }
        }
    },
    
    force : {
        // 分类里如果有样式会覆盖节点默认样式
        itemStyle: {
            normal: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {
                    brushType : 'both',
                    strokeColor : '#e54f5c'
                },
                linkStyle : {
                    strokeColor : '#e54f5c'
                }
            },
            emphasis: {
                // color: 各异,
                label: {
                    show: false
                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                },
                nodeStyle : {},
                linkStyle : {}
            }
        }
    },
    
    gauge : {
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#e52c3c'],[0.8, '#f7b1ab'],[1, '#fa506c']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length : 18,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            length : '90%',
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    }
};






