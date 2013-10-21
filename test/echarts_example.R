# Line Plot
eLine(iris[,1:4], filename = 'irisLine')
eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)), 
      filename = 'irisLineZoom')


# Area Plot
eArea(iris[,1:4], filename = 'irisArea')


# Scatter Plot
ePoints(iris[,3:5], filename = 'irisPoints')


# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x, filename = 'xPie')


# Bar Plot
eBar(head(iris[,1:4]), filename = 'irisBar')


# Map
options(encoding="UTF-8")
Sys.setlocale("LC_CTYPE","chs")
load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
eMap(ChinaGDP, opt=list(title=list(text='2008~2010年大陆各省GDP占全国百分数')), filename = 'ChinaGDP')


