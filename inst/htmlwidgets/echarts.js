HTMLWidgets.widget({
  name: 'echarts',
  type: 'output',

  initialize: function(el, width, height) {
    return echarts.init(el);
  },

  renderValue: function(el, x, instance) {
    instance.setOption(x);
  },

  resize: function(el, width, height, instance) {
  }

});
