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

kable(empdata.des, format = "markdown") 

##use library(ggplot2) for histogram of the Employee Monthly Income
ggplot(data=empdata.tidy, aes(MonthlyInc)) + 
  geom_histogram(breaks=seq(1000, 20000, by = 2000), 
                 col="red", 
                 fill="green", 
                 alpha=.2) + 
  labs(title="Monthly Income of Employees", x="Monthly Income (In Thousands of Dollars)", y="Count")+
  theme(plot.title = element_text(hjust = 0.5))

##Historgram of the Employee Ages visually describe the company population
ggplot(data=empdata.tidy, aes(Age)) + 
  geom_histogram(breaks=seq(18, 62, by = 2), 
                 col="blue", 
                 fill="purple", 
                 alpha=.2) + 
    labs(title="Age of Employees", x="Age (In Years)", y="Count")+
  theme(plot.title = element_text(hjust = 0.5))

##Create Frequency tables for Gender, Education and Occupation (JobRoles) Using library(summarytools)
summarytools::freq(empdata.tidy$Gender, order = "freq")

edu <- matrix(c(sum(empdata.tidy$Education == "1"),
                sum(empdata.tidy$Education == "2"), 
                sum(empdata.tidy$Education == "3"), 
                sum(empdata.tidy$Education == "4"), 
                sum(empdata.tidy$Education == "5")),ncol=1,byrow=TRUE)
rownames(edu) <- c("Below College", "College", "Bachelor", "Master", "Doctor")
colnames(edu) <- c("Sums")
edu

summarytools::freq(empdata.tidy$JobRole, order = "freq")

##Management count and table
manage <- empdata.tidy %>% 
  filter(empdata.tidy$JobLevel=="5")

management <- table(as.character(manage$JobRole))
addmargins(management)

