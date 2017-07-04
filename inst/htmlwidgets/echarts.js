HTMLWidgets.widget({
  name: 'echarts',
  type: 'output',

  initialize: function(el, width, height) {
    //return echarts.init(el);
    return null
  },
	
  renderValue: function(el, x, instance) {
    myCharts = echarts.init(el, x.theme);
    myCharts.setOption(x, true);
	//instance.setTheme(eval(x.theme + "Theme"));

  },

  resize: function(el, width, height, instance) {
    myCharts = echarts.getInstanceByDom(el);
    myCharts.resize()
  }

});
