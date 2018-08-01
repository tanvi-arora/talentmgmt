###########################################################################################
# Script name : desc_stat.R 
# Created By  : Rebecca Holsapple
# Created Dt  : 07/26/2018
# Description : R code creates descriptive statistics and displays them in a table
# Source File : This script uses the source file empdata.tidy
###########################################################################################
##@knitr empdata.tidy

empdata.tidy.des.stat<- describe(empdata.tidy[,c("Age","Gender","Education","MaritalStat", "DailyRate", "HourlyRate", "MonthlyInc", "MonthlyRate", "JobRole")])

kable(empdata.tidy.des.stat)

kable(empdata.tidy.des.stat) %>%
  kable_styling("striped", full_width = F) %>%
  row_spec(0, angle = -45)

hist(empdata.tidy$DailyRate)
hist(empdata.tidy$MonthlyInc)
hist(empdata.tidy$MonthlyRate)

library(plyr)

gender <- count(empdata.tidy, 'Gender')
education <- count(empdata.tidy, 'Education')
occupation <- count(empdata.tidy, 'JobRole')

management.count<-count(empdata.tidy$JobLevel==5)
management.count