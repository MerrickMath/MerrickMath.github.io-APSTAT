# Load Packages and Datasets 
library(tidyverse)
# install.packages('reshape2')
library(reshape2)

# lego <- read_csv()

# Take a look at the dataset
glimpse(lego)

# Price across various themes 
lego %>% ggplot(aes(fill=theme, y=Price)) + geom_boxplot()
lego %>% group_by(theme) %>% 
  summarize(avg=mean(Price)) %>% 
  arrange(desc(avg))

lego %>% filter(theme=='Star Wars™' | theme=='Juniors') %>% 
  ggplot(aes(x=theme, y=Price)) + geom_boxplot()

lego %>% filter(theme=='Star Wars™' | theme=='Juniors') %>% 
  ggplot(aes(x=Price, fill=theme)) + geom_density(alpha=0.3)

lego %>% filter(theme=='Angry Birds™' | theme=='Friends') %>% 
  ggplot(aes(x=theme, y=pieces)) + geom_boxplot()

# Two numeric Variables
p <- lego %>% select_if(is.numeric) %>% 
  na.omit() %>% 
  cor() %>% 
  melt()
p %>% ggplot(aes(x=Var1, y=Var2, fill=value)) + geom_tile()

lego %>% ggplot(aes(x=pieces, y=Price)) + geom_point(alpha=0.2) + 
  geom_smooth(method='lm')

lego_model <- lm(Price~pieces, data=lego)
summary(lego_model)

plot(lego_model)


