### Load packages and datsets
library(tidyverse)
library(ggplot2)

### September 26 
### Load Dataset
lego <- read.csv('/data/datasets/lego.csv')

### Visualize the price distribution for lego sets
lego %>% ggplot(aes(x=Price)) + geom_histogram()
lego %>% ggplot(aes(x=Price, fill=theme)) + geom_density(alpha=0.1)
lego %>% ggplot(aes(y=Price)) + geom_boxplot()

### Variance for Prices
var(lego$Price)

### Pairwise boxplot of Ideas vs Juniors themed pieces sets
lego %>% filter(theme=='Ideas' | theme == 'Juniors') %>% 
  ggplot(aes(y=pieces, fill=theme)) + geom_boxplot()




