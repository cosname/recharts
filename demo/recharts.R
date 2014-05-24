
# Line Plot
require(recharts)
recharts.eLine <- eLine(WorldPhones)

bb <- recharts.eLine 
plot(bb+ eTitle(title="11", x=10, y=10))

plot(recharts.eLine)
pause()


#  Area Plot
recharts.eArea <- eArea(WorldPhones)
plot(recharts.eArea)
pause()


# Scatter Plot
recharts.ePoints <- ePoints(iris[,3:5])
plot(recharts.ePoints)
pause()


# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
recharts.ePie <- ePie(x)
plot(recharts.ePie)
pause()



# Bar Plot
require(plyr)
dat = ddply(iris, .(Species), colwise(mean))
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
recharts.eBar <- eBar(dat)
plot(recharts.eBar)
pause()


recharts.eBar2 <- eBar(dat, horiz = TRUE)
plot(recharts.eBar2)
pause()



# Radar PLot
require(plyr)
dat = ddply(iris, .(Species), colwise(mean)) 
rownames(dat) = dat[,1]
dat = dat[, -1]
dat
recharts.eRadar <-  eRadar(dat)
plot(recharts.eRadar)
pause()

# Map
recharts_oldLocal <- Sys.getlocale("LC_CTYPE")
Sys.setlocale("LC_CTYPE","chs")
cityDF = read.csv(system.file( "tooltip", "cityDF.csv", package="recharts"), stringsAsFactor=F)
recharts.eMap <- eMap(cityDF, namevar=1, datavar = 2, title='2008~2010 GDP Data Visulization')
plot(recharts.eMap)
Sys.setlocale("LC_CTYPE", recharts_oldLocal)
pause()

## recharts demo
pause <- function(){  
  invisible(readline("\nPress <return> to continue: ")) 
}

# force Chart
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
	category = c("A", "B", "B", "B", "B", "C", 
					"C", "C", "C", "C", "C"),
	name = c("Steven Jobs", "Lisa Jobs", "Paul Jobs", " Kalala Jobs",
			"Lauren Powell", "Steve woz Ike", "Obama", "Bill Gates", 
			"Jonathan", "Tim Cook", "Wayne"),
	value = c(10, 2, 3, 3, 7, 5, 8, 9, 4, 4, 0)
 )

rownames(propertyDf) = propertyDf$name

recharts.eForce <- eForce(networkMatrix=networkMatrix, propertyDf=propertyDf)

plot(recharts.eForce)
pause()

# force lite demo
testData <- matrix(1:25, nrow=5)
recharts.eForceLite  <- eForce(testData)

plot(recharts.eForceLite)

