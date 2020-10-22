#read in the data (have it in a data folder to organise directory)

chaff <- read.table("~/R Workshop/Chaffinches/data/chaff.txt", header = T)

library(tidyverse)
library(dplyr)

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









