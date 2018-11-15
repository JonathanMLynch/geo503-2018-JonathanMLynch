library(dplyr)
library(ggplot2)
library(ggmap)
library(htmlwidgets)
library(widgetframe)
library(rnoaa)
library(xts)
library(dygraphs)

d=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("TMAX"),
                   keep_flags=T)
d$date=as.Date(d$date)

Daily_Time <- xts(d$tmax, order.by = d$date)

dygraph(Daily_Time, main = "Daily Maximum Temperature in Buffalo, NY")

# realized i needed to do this in RMarkdown to create an HTML so that the graph would work