recharts
========

A R interface to [ECharts](https://github.com/ecomfe/echarts) for data visualization.


## Installation
You can install `recharts` from github using the `devtools` package

```r
require(devtools)
install_github('recharts', 'taiyun')
```
## Features


## Examples


### Line Plot
```r
eLine(iris[,1:4], filename = 'irisLine')
eLine(iris[,1:4], opt=list(dataZoom=list(show=TRUE,end=35)), 
      filename = 'irisLineZoom')
```
![Line Plot](./screenshots/irisLine.png)

![Line Zoom Plot](screenshots/irisLineZoom.png)

### Area Plot
```r
eArea(iris[,1:4], filename = 'irisArea')
```
![Area Plot](screenshots/irisArea.png)

### Scatter Plot
```r
ePoints(iris[,3:5], filename = 'irisPoints')
```
![Scatter Plot](screenshots/irisPoints.png)


### Pie Plot
```r
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x, filename = 'xPie')
```
![Pie Plot](screenshots/xPie.png)

### Bar Plot
```r
eBar(head(iris[,1:4]), filename = 'irisBar')
```
![Bar Plot](screenshots/irisBar.png)


### Map
```r
options(encoding="UTF-8")
Sys.setlocale("LC_CTYPE","chs")
load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
eMap(ChinaGDP, opt=list(title=list(text='2008~2010年大陆各省GDP占全国百分数')), filename = 'ChinaGDP')
```
![Map](screenshots/irisChinaMap.png)
