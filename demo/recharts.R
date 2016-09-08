require(recharts)

# eMap plot
# province Name = c("北京", "江苏", "上海")
mapData <- data.frame(province=c("\u5317\u4EAC", "\u6C5F\u82CF",  "\u4E0A\u6D77"), "value"=c(100, 200,  500), "val2"=c(200,300,200), val3=c(1,2,5), stringsAsFactors=F)
# China Map
eMap(mapData, namevar=~province, datavar = ~value+val2)
pause()

# ProvinceMap
# city Name = c("扬州市", "苏州市", "南京市")
provinceMapData <- data.frame(city=c("\u626C\u5DDE\u5E02", "\u5357\u4EAC\u5E02", "\u82CF\u5DDE\u5E02"), value=c(100, 200, 300), val2=c(200,300,400), val3=c(1,2,3), stringsAsFactors=F)
# region = "江苏"
eMap(provinceMapData, namevar=~city, datavar = ~value+val2, region="\u6C5F\u82CF")
pause()

# Bar Plot
df2 <- data.frame(
	saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
	seller=c(rep("Yellow",7), rep("Red",7), rep("White",7)),
	weekDay = c(rep(c("Mon","Tue","Wed","Fri","Fri","Sat","Sun"),3))
)

recharts.eBar2 = eBar(df2, ~weekDay, ~saleNum, ~seller)
recharts.eBar2
pause()



# Line Plot
require(recharts)
recharts.eLine <- eLine(WorldPhones)
pause()


#  Area Plot
eArea(WorldPhones)
pause()


# Scatter Plot
ePoints(iris[,3:5])
pause()

# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x)
pause()

# Radar PLot
eRadar(xtabs( saleNum~ seller+weekDay, df2))
pause()

# multiple plot in one page...
recharts.eBar2 & recharts.eLine
pause()
# change the output page size.
# size should be 500*400
ePie(x) + eOption(size=c(500,400))

pause()
# force Chart # need to updates
# networkMatrix <- matrix(c(
# 	c(0, 1, 2, 1, 2, 3, 6, 6, 1, 1, 1 ),
# 	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
# 	c(2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0 ),
# 	c(1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0 ),
# 	c(2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
# 	c(3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ),
# 	c(6, 0, 1, 1, 1, 1, 0, 6, 0, 1, 0 ),
# 	c(6, 0, 0, 1, 0, 0, 6, 0, 0, 0, 0 ),
# 	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ),
# 	c(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ),
# 	c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
# 	), ncol=11
# )
# 
# propertyDf <- data.frame(
# 	category = c("A", "B", "B", "B", "B", "C", 
# 					"C", "C", "C", "C", "C"),
# 	name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
# 			"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates", 
# 			"Jonathan", "Tim Cook", "Wayne"),
# 	value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
#  )
# 
# rownames(propertyDf) = propertyDf$name
# 
# eForce(networkMatrix=networkMatrix, propertyDf=propertyDf)

# force lite demo
# testData <- matrix(1:25, nrow=5)
# recharts.eForceLite  <- eForce(testData)
# 
# recharts.eForceLite

