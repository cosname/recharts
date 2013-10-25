## recharts demo
pause <- function(){  
  invisible(readline("\nPress <return> to continue: ")) 
}

# force Chart
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

recharts.eForce <- eForce(networkMatrix=networkMatrix, propertyDf=propertyDf)

plot(recharts.eForce)
pause()

# force lite demo
testData <- matrix(1:25, nrow=5)
recharts.eForceLite  <- eForce(testData)

plot(recharts.eForceLite)

