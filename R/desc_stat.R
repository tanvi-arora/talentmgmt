###########################################################################################
# Script name : desc_stat.R 
# Created By  : Rebecca Holsapple
# Created Dt  : 07/26/2018
# Description : R code creates descriptive statistics and displays them in a table
# Source File : This script uses the source file empdata.tidy
###########################################################################################
##@knitr desc_stat

##use library(psych) for describe function to get descriptive statistics
empdata.tidy.des<- (empdata.tidy[,c("Age","Gender","Education","MaritalStat", 
                                    "DailyRate", "HourlyRate", "MonthlyInc", "MonthlyRate", 
                                    "JobRole")])
des <- describe(empdata.tidy.des)[,c(3:5, 8:10, 13)]
empdata.des <- print(des, digit=2)

##use library(kable) for a nice table of the descriptive statistics 
kable(empdata.des, "latex", booktabs = T, align = "c") %>%
  kable_styling(latex_options = "striped", full_width = F) %>%
  row_spec(0, angle = 45)

##use library(ggplot2) for histogram of the Monthly Income with a trend overlay of the density of the employee income
ggplot(data=empdata.tidy, aes(MonthlyInc)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(1000, 20000, by = 2000), 
                 col="red", 
                 fill="green", 
                 alpha=.2) + 
  geom_density(col=2) + 
  labs(title="Monthly Income for Employees", x="Monthly Income (In Thousands of Dollars)", y="Density")+
  theme(plot.title = element_text(hjust = 0.5))

##Historgram of the Employee Ages with a trend overlay to visually describe the company population
ggplot(data=empdata.tidy, aes(Age)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(18, 62, by = 2), 
                 col="blue", 
                 fill="purple", 
                 alpha=.2) + 
  geom_density(col=2) + 
  scale_y_continuous(labels=percent)+
  labs(title="Age of Employees", x="Age (In Years)", y="Density")+
  theme(plot.title = element_text(hjust = 0.5))


gender <- count(empdata.tidy, 'Gender')
gender
education <- count(empdata.tidy, 'Education')
education
occupation <- count(empdata.tidy, 'JobRole')
occupation

management.count<-count(empdata.tidy$JobLevel==5)
management.count