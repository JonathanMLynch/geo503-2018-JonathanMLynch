library(raster)
library(sf)
library(sp)
library(spData)
library(tidyverse)
data(world)  #load 'world' data from spData package
#filter out Antarctica
world2 <- filter(world, continent != "Antarctica")

conv_world2 <- as(world2, "Spatial")
#
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)

# classcomment: on extract part, make 'fun = max'