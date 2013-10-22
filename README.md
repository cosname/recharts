recharts
========

A R interface to [ECharts](https://github.com/ecomfe/echarts) for data visualization.


## Installation
You can install `recharts` from github using the `devtools` package

```coffee
require(devtools)
install_github('recharts', 'taiyun')
```
## Features


## Examples


### Line Plot
```coffee
eLine(iris[,1:4], outfile = 'irisLine')
eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)), 
      outfile = 'irisLineZoom')
```
![Line Plot](screenshots/irisLine.PNG)

![Line Zoom Plot](screenshots/irisLineZoom.PNG)

### Area Plot
```coffee
eArea(iris[,1:4], outfile = 'irisArea')
```
![Area Plot](screenshots/irisArea.PNG)

### Scatter Plot
```coffee
ePoints(iris[,3:5], outfile = 'irisPoints')
```
![Scatter Plot](screenshots/irisPoints.PNG)


### Pie Plot
```coffee
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x, outfile = 'xPie')
```
![Pie Plot](screenshots/xPie.PNG)

### Bar Plot
```coffee
eBar(head(iris[,1:4]), outfile = 'irisBar')
```
![Bar Plot](screenshots/irisBar.PNG)


### Map
```coffee
options(encoding="UTF-8")
Sys.setloc?ale("LC_CTYPE","chs")
load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
eMap(ChinaGDP, opt=list(title=list(text='2008~2010年大陆各省GDP占全国百分数')), outfile = 'ChinaGDP')
```
![Map](screenshots/irisChinaMap.PNG)
