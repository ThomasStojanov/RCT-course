# install packages
install.packages("dplyr")
install.packages("stddiff")

library(dplyr) #for syntax
library(stddiff) #for standardized difference

# creation of fictious variables for 10 patients
age <- c(18,23,41,32,25,48,59,70,90,50) %>% as.numeric()
gender <- c("F","M","M","F","M","F","M","M","F","F") %>% as.factor
ttt <- c(0,1,0,1,0,1,0,1,0,1)

# creation of a fictious dataset for 10 patients
df <- data.frame(
  age,
  gender,
  ttt
)

#calculation of stddiff for numeric factor
Agestd <- stddiff.numeric(
  df,
  gcol = "ttt", #variable treatment
  vcol = "age" #variable numeric
)[7] #the seventh item of the function gives the stddiff, have a look at ?stddiff.numeric for more info

#calculation of stddfiff for binary factor
Genderstd <- stddiff.binary(
  df,
  gcol = "ttt", #variable treatment
  vcol = "gender" #variable category
)[5] #the fifth item of this function gives the stddiff, have a look at ?stddiff.factor for more info

Genderstd