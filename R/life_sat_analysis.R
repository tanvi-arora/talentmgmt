#####################################################################################################
# Script name : life_sat_analysis.R 
# Created By  : Anjli Solsi
# Created Dt  : 08/4/2018
# Description : R code to analyze the relationship between variables related to Work Life Satisfaction
# Source File : This script uses the cleaned data from tidy_dataset.R (empdata.tidy)
#####################################################################################################
##@knitr life_sat_analysis

#examine linear regression model of the data with variables attributed to work life satisfaction
trial <- lm((formula = as.numeric(WorkLifeBal) ~ EnvirSatisf + JobInvolvmnt + JobSatisf + PerforRating + RelshipSatis), data = empdata.tidy)
plot(trial)

#get percentages for each rating of Work Life Balance
empdata.WorkLifeBal <- as.data.frame(empdata.tidy %>% group_by(WorkLifeBal) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.WorkLifeBal

#get percentages for each rating of Environment Satisfaction
empdata.EnvirSatisf <- as.data.frame(empdata.tidy %>% group_by(EnvirSatisf) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.EnvirSatisf

#get percentages for each rating of Job Involvement
empdata.JobInvolvmnt <- as.data.frame(empdata.tidy %>% group_by(JobInvolvmnt) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.JobInvolvmnt

#get percentages for each rating of Job Satisfaction
empdata.JobSatisf <- as.data.frame(empdata.tidy %>% group_by(JobSatisf) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.JobSatisf

#get percentages for each rating of Performance Rating
empdata.PerforRating <- as.data.frame(empdata.tidy %>% group_by(PerforRating) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.PerforRating

#get percentages for each rating of Work Relationship Satisfaction
empdata.RelshipSatis <- as.data.frame(empdata.tidy %>% group_by(RelshipSatis) %>% summarise( n=n()) %>% mutate(percent = round(n*100/sum(n),2)))
empdata.RelshipSatis

#bar plot showing ratings of Work Life Balance and percentage of employees for each rating
plot1 <- ggplot(data = empdata.WorkLifeBal, aes(x = empdata.WorkLifeBal$WorkLifeBal, y = empdata.WorkLifeBal$percent, fill = empdata.WorkLifeBal$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs(title="Work Life Balance") + xlab("Rating") + ylab("% of Employees")  + 
  theme(plot.title = element_text(hjust=0.5), panel.background = element_blank())

#bar plot showing ratings of Environment Satisfaction and percentage of employees for each rating
plot2 <- ggplot(data = empdata.EnvirSatisf, aes(x = empdata.EnvirSatisf$EnvirSatisf, y = empdata.EnvirSatisf$percent, fill = empdata.EnvirSatisf$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs( title="Environment Satisfaction") + xlab("Rating") + ylab("% of Employees")  + 
  theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())

#bar plot showing ratings of Job Involvement and percentage of employees for each rating
plot3 <- ggplot(data = empdata.JobInvolvmnt, aes(x = empdata.JobInvolvmnt$JobInvolvmnt, y = empdata.JobInvolvmnt$percent, fill = empdata.JobInvolvmnt$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs( title="Job Involvement") + xlab("Rating") + ylab("% of Employees")  + 
  theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) 

#bar plot showing ratings of Job Satisfaction and percentage of employees for each rating
plot4 <- ggplot(data = empdata.JobSatisf, aes(x = empdata.JobSatisf$JobSatisf, y = empdata.JobSatisf$percent, fill = empdata.JobSatisf$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs( title="Job Satisfaction") + xlab("Rating") + ylab("% of Employees")  + 
  theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) 

#bar plot showing ratings of Performance Rating and percentage of employees for each rating
plot5 <- ggplot(data = empdata.PerforRating, aes(x = empdata.PerforRating$PerforRating, y = empdata.PerforRating$percent, fill = empdata.PerforRating$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs( title="Performance Rating") + xlab("Rating") + ylab("% of Employees")  + 
  theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) 

#bar plot showing ratings of Work Relationship Satisfaction and percentage of employees for each rating
plot6 <- ggplot(data = empdata.RelshipSatis, aes(x = empdata.RelshipSatis$RelshipSatis, y = empdata.RelshipSatis$percent, fill = empdata.RelshipSatis$percent)) + 
  geom_bar(stat="identity") + scale_fill_gradient(low = "#FFCC99", high = "#990000") + guides(fill=FALSE) +
  labs( title="Relationship Satisfaction") + xlab("Rating") + ylab("% of Employees")  + 
  theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) 

#display all 6 plots together 
grid.arrange(plot1, plot2, plot3, plot4, plot5, plot6, ncol=2, nrow=3)



