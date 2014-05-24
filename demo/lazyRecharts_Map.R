
# Line Plot
require(recharts)

Sys.setlocale("LC_CTYPE","chs")
cityDF = read.csv(system.file( "tooltip", "cityDF.csv", package="recharts"), stringsAsFactor=F)
recharts.eMap <- eMap(cityDF, namevar=1, datavar = 2, title='2008~2010 GDP Data Visulization')
lazyPlot(recharts.eMap)
