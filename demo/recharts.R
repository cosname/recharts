require(recharts)

# eMap plot
mapData <- data.frame(province=c("\u5317\u4EAC", "\u6C5F\u82CF",  "\u4E0A\u6D77"), "value"=c(100, 200,  500), "val2"=c(200,300,200), val3=c(1,2,5), stringsAsFactors=F)
# China Map
eMap(mapData, namevar=~province, datavar = ~value+val2)
pause()

# ProvinceMap
provinceMapData <- data.frame(city=c("\u626C\u5DDE\u5E02", "\u5357\u4EAC\u5E02", "\u82CF\u5DDE\u5E02"), value=c(100, 200, 300), val2=c(200,300,400), val3=c(1,2,3), stringsAsFactors=F)
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

axisList = list(
	list(index=7, type="category", data = c("low", "middle", "high")), 
	list(index=6, inverse=T, max=50, nameLocation="start")
)
eParallel(head(parallelDf, 20), series=~groupName, axisList = axisList)&
eWordcloud(wordFreqDf_chs, namevar = ~Word, datavar = ~Freq) 

eWordcloud(wordFreqDf_chs, namevar = ~Word, datavar = ~Freq) 


