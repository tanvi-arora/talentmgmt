###########################################################################################
# Script name : desc_stat.R 
# Created By  : Rebecca Holsapple
# Created Dt  : 07/26/2018
# Description : R code creates descriptive statistics and displays them in a table
# Source File : This script uses the source file empdata.tidy
###########################################################################################
##@knitr desc_stat

empdata.tidy.des.stat<- describe(empdata.tidy[,c("Age","Gender","Education","MaritalStat", "DailyRate", "HourlyRate", "MonthlyInc", "MonthlyRate", "JobRole")])

kable(empdata.tidy.des.stat) %>%
  kable_styling("striped", full_width = F) %>%
  row_spec(0, angle = -45)

kable(empdata.tidy.des.stat, "latex", booktabs = T, align = "c") %>%
  kable_styling(latex_options = "striped", full_width = F) %>%
  row_spec(0, angle = 45)

hist(empdata.tidy$MonthlyInc)
hist(empdata.tidy$MonthlyRate)

gender <- count(empdata.tidy, 'Gender')
gender
education <- count(empdata.tidy, 'Education')
education
occupation <- count(empdata.tidy, 'JobRole')
occupation

management.count<-count(empdata.tidy$JobLevel==5)
management.count