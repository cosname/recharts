require(recharts)

df2 <- data.frame(
	saleNum=c(10,20,30,40,50,60,70,15,25,35,45,55,65,75,25,35,45,55,65,75,85),
	seller=c(rep("Yellow",7), rep("Red",7), rep("White",7)),
	weekDay = c(rep(c("Mon","Tue","Wed","Fri","Fri","Sat","Sun"),3))
)

eBar(df2, ~weekDay, ~saleNum, ~seller)




# Line Plot
require(recharts)
recharts.eLine <- eLine(WorldPhones)



#  Area Plot
eArea(WorldPhones)



# Scatter Plot
ePoints(iris[,3:5])


# Pie Plot
x = sample(4)
names(x) = LETTERS[1:4]
ePie(x)





recharts.eBar2 <- eBar(dat, horiz = TRUE)
recharts.eBar2



# Radar PLot
eRadar(xtabs( saleNum~ seller+weekDay, df2))



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

