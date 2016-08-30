require(recharts)

df2 <- data.frame(
	saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
	seller=c(rep("小黄",7), rep("小红",7), rep("小白",7)),
	weekDay = c(rep(c("周一","周二","周三","周四","周五","周六","周日"),3))
)

eBar(df2, ~weekDay, ~saleNum, ~seller)




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

