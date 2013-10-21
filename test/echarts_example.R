# Line Plot
eLine(iris[,1:4], only = TRUE)


# Area Plot
eArea(iris[,1:4], only = TRUE)


# Scatter Plot
ePoints(iris[,3:5], only = TRUE)


# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x, only = TRUE)


# Bar Plot
eBar(iris[1:5,1:4], only = TRUE)


# Map
options(encoding="UTF-8")
Sys.setlocale("LC_CTYPE","chs")
data(ChinaGDP)

eMap(ChinaGDP, opt=list(title=list(text='2008~2010年大陆各省GDP占全国百分数')), only = TRUE)

