install.packages('ggplot2')
install.packages('tidyverse')

library(ggplot2)
library(tidyverse)

### Load in dataset 
pok <- read.csv('/data/datasets/pokemon.csv')

### Selecting Data
pok %>% select(attack,defense)

### Filtering Data
pok %>% filter(type1 == 'fire')

### Visualize a numeric random variable
pok %>% ggplot(aes(x=attack)) + geom_histogram()
pok %>% ggplot(aes(y=attack)) + geom_boxplot()
pok %>% ggplot(aes(y=attack,fill=type1)) + geom_boxplot()

### Challenge
pok %>% filter(type1=='fire' | type1=='water') %>% 
  ggplot(aes(y=hp, fill=type1)) + geom_boxplot()
