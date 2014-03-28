library(slidify)
setwd(system.file("slidify", package = "recharts"))
slidify("index.Rmd")
browseURL("index.html")