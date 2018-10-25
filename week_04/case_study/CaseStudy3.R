library(gapminder)
library(dplyr)
library(ggplot2)
gapminder <- filter(gapminder, country != "Kuwait") 
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
  geom_point(aes(colour = factor(continent), size = pop/100000)) +
  scale_y_continuous(trans = "sqrt") +    
  facet_wrap(~year, nrow=1) +
  theme_bw() +
  labs(x = "Life Expectancy", y = "GDP per capita")
group_by(gapminder, continent, year) %>% 
  summarise(gdpPercap=mean(x=gdpPercap, w=pop), pop=sum(as.numeric(pop)))
ggplot(gapminder, aes(year, gdpPercap)) +
  geom_line() +
  facet_wrap(~continent)