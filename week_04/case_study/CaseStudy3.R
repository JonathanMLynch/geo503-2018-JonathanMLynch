library(gapminder)
library(dplyr)
library(ggplot2)
filter(gapminder, country != "Kuwait") %>% 
group_by(continent, year) %>% 
summarise(gdpPercap=mean(x=gdpPercap, w=pop), pop=sum(as.numeric(pop)))
ggplot(gapminder, aes(gdpPercap, pop)