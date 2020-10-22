#read in the data (have it in a data folder to organise directory)

chaff <- read.table("~/R Workshop/Chaffinches/data/chaff.txt", header = T)

library(tidyverse)

#tidying the data
chaff2 <- gather(data = chaff, key = sex, value = mass)
#write the tidied date into a new file 
write.table(chaff2, file = '~/R Workshop/Chaffinches/data/tidychaff.txt', row.names = FALSE)











