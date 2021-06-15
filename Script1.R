# install packages
install.packages("dplyr")
install.packages("blockrand")

library(blockrand) #for randomization lists
library(dplyr) #for syntax

# Instruction: create a stratified randomization list for 3 groups, 2 treatments, with block sizes of 2 and 4 for 80 patients

# Strata 1
Center1 <- blockrand(n=26, #minimum number of patients
                     num.levels = 2,
                     id.prefix='patient_',
                     stratum = 'Center1',
                     block.sizes = c(1,2), #block size = 2 and 4
                     levels=c("Ttt1", "Ttt2"),
                     uneq.beg = F,
                     uneq.mid = F,
                     uneq.min = 0)

# Strata 2
Center2 <- blockrand(n=26, #minimum number of patients
                     num.levels = 2,
                     id.prefix='patient_',
                     stratum = 'Center2',
                     block.sizes = c(1,2),
                     levels=c("Ttt1", "Ttt2"),
                     uneq.beg = F,
                     uneq.mid = F,
                     uneq.min = 0)

# Strata 3
Center3 <- blockrand(n=27, #minimum number of patients
                     num.levels = 2,
                     id.prefix='patient_',
                     stratum = 'Center3',
                     block.sizes = c(1,2),
                     levels=c("Ttt1", "Ttt2"),
                     uneq.beg = F,
                     uneq.mid = F,
                     uneq.min = 0)

# Merge the 3 randomization lists
RandomList <- rbind(Center1, Center2, Center3)

# List for 80 first patients only
RandomList80 <- RandomList %>%
  head(80) 

RandomList80

# Check if we have a ratio 1:1
RandomList80$treatment %>%
  summary #be careful that the number of treatment is equal to 40 in each group

# Save the randomization list into a csv file
write.csv2(RandomList80, "randomization_list.csv", row.names = F)