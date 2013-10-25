# Line Plot
eLine(WorldPhones, outfile = 'WorldPhonesLine')


# Area Plot
eArea(WorldPhones, outfile = 'WorldPhonesArea')


# Scatter Plot
ePoints(iris[,3:5], outfile = 'irisPoints')


# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x, outfile = 'xPie')


# Bar Plot
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
eBar(dat, outfile = 'irisBar')
eBar(dat, horiz = TRUE, outfile = 'irisBarHoriz')


# Radar PLot
require(plyr)
dat = ddply(iris, .(Species), colwise(mean)) 
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
eRadar(dat, outfile = 'irisRadar')


# Map
options(encoding="UTF-8")
Sys.setlocale("LC_CTYPE","chs")
load(url('http://yzhou.org/recharts/ChinaGDP.RData'))
eMap(ChinaGDP, opt=list(title=list(text='2008~2010年大陆各省GDP占全国百分数')), outfile = 'ChinaGDP')


# Force Network
options(encoding="UTF-8")
Sys.setlocale("LC_CTYPE","chs")
networkMatrix <- matrix(c(
	c(0, 1, 2, 1, 2, 3, 6, 6, 1, 1, 1 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
	c(2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0 ),
	c(1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0 ),
	c(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
	c(3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
	c(6, 0, 1, 1, 1, 1, 0, 6, 0, 1, 0 ),
	c(6, 0, 0, 1, 0, 0, 6, 0, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ),
	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
	), ncol=11
)

propertyDf <- data.frame(
	category = c("人物", "家人", "家人", "家人", "家人", "朋友", 
				"朋友", "朋友", "朋友", "朋友", "朋友"),
	name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
			"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates", 
			"Jonathan", "Tim Cook", "Wayne"),
	value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
 )

rownames(propertyDf) = propertyDf$name

eForce(networkMatrix=networkMatrix, propertyDf=propertyDf, outfile='Jobs')


# A lite example for Force network
testData <- matrix(1:25, nrow=5)
eForce(testData, outfile='network')

