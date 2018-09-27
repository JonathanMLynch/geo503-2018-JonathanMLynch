library(spData)
library(sf)
library(tidyverse)
# library(units) #this one is optional, but can help with unit conversions.
#load 'world' data from spData package
data(world)  
# load 'states' boundaries from spData package
data(us_states)
# plot(world[1])  #plot if desired
# plot(us_states[1]) #plot if desired
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
rename(world, geometry = geom)
Canada <- filter(world, name_long == "Canada")
Canada <- st_transform(Canada, albers)
buf <- st_buffer(Canada, dist = 10000)
US <- st_transform(us_states, albers)
NewYork <- filter(us_states, name =="New York")
plot("NewYork)