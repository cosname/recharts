HTMLWidgets.widget({
  name: 'echarts',
  type: 'output',

  initialize: function(el, width, height) {
    return echarts.init(el);
  },
	
  renderValue: function(el, x, instance) {

	require.config({
		paths:{ 
			'theme': './lib/echarts-2.2.3/theme/'
		}
	});
    instance.setOption(x);
	
	require(['theme/' + x.theme], function(tarTheme){
		curTheme = tarTheme;
		instance.setTheme(curTheme);
	})
  },

  resize: function(el, width, height, instance) {
  }

});
