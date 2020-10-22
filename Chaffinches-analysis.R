#read in the data (have it in a data folder to organise directory)

chaff <- read.table("~/R Workshop/Chaffinches/data/chaff.txt", header = T)

library(tidyverse)
library(dplyr)
library(ggplot2)

#tidying the data
chaff2 <- gather(data = chaff, key = sex, value = mass)
#write the tidied date into a new file 
write.table(chaff2, file = '~/R Workshop/Chaffinches/data/tidychaff.txt', row.names = FALSE)

#summarising the data
chaff2 %>% group_by(sex) %>% 
  summarise(mean = mean(mass),
            n = length(n),
            sd = sd(mass))

#t test to compare the means of males and females
t.test(data = chaff2,
       mass ~ sex,
       var.equal = T)
#p = 0.01175 so there is a significant difference in the mean mass of males compared to females

#defaults for saving a graph as an image
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

#basic boxplot
chaff2 %>% ggplot(aes(x = sex, y = mass)) +
  geom_boxplot()

#polished boxplot
 fig1 <- ggplot(data = chaff2, aes(x = sex, y = mass)) +
  geom_boxplot(fill = 'lightgoldenrod1') +
  theme(panel.background = element_rect(fill = "white")) +
  theme(axis.line.x = element_line(color = "black"),
        axis.line.y = element_line(color = "black")) +
  xlab('Sex') + 
  ylab('Mass') +
  scale_x_discrete(labels = c("Females", "Males")) +
  ggtitle('Mass of male and female Chaffinches') +
  theme(plot.title = element_text(hjust = 0.5))

 #saving the boxplot as an image
ggsave("~/R Workshop/Chaffinches/figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)


##hello this is emily, I like your graph :)


