library(tidyverse)
library(reprex)
library(sf)
library(spData)
library(dplyr)

data(world)

ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
   geom_density(alpha=0.5,color=F)
