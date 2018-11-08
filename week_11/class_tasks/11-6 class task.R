library(tidyverse)
library(spData)
library(sf)

## New Packages
library(foreach)
library(doParallel)
registerDoParallel(2)
getDoParWorkers() # check registered cores

#define working projection (EASE-Grid, https://nsidc.org/data/ease)
proj="+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"

world.trans <- st_transform(world, crs=proj)

result <- foreach(i=world.trans$name_long, .combine = rbind) %do%
  st_is_within_distance(world.trans, world.trans, dist = 100000, sparse = FALSE)
  