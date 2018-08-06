###########################################################################################
# Script name : age_inc_analysis.R 
# Created By  : Anjli Solsi
# Created Dt  : 07/30/2018
# Description : R code to analyze the relationship between variables Age and Income
# Source File : This script uses the cleaned data from tidy_dataset.R (empdata.tidy)
###########################################################################################
##@knitr age_inc_analysis

#first bar plot representation of Total Monthly Income by Age
options(scipen = 999)
brks <- seq(-500000, 500000, 50000)
lbls <- paste0(as.character(c(seq(500, 0, -50), seq(50, 500, 50))), "k")
ggplot(empdata.tidy, aes(x=reorder(Age, Age), y=MonthlyInc, fill=Gender)) + 
  geom_bar(stat="identity", width=.7, position="stack") + scale_y_continuous(breaks=brks, labels=lbls) +
  coord_flip() + labs(title="Total Monthly Income by Age", x="Age", y="Total Monthly Income (Dollars)") + 
  theme_tufte() + theme(plot.title = element_text(hjust=.5), axis.ticks = element_blank()) +
  scale_fill_brewer(palette = "Set1")

#second bar plot representation of Total Monthly Income by Age
options(scipen = 999)
ggplot(empdata.tidy, aes(x=reorder(Age, Age), y=MonthlyInc, fill=Gender)) + 
  geom_bar(stat="identity", position = "stack", size =.3) + 
  scale_fill_brewer(palette="Set1") + theme_gray() + 
  labs(title="Total Monthly Employee Income by Age", x="Age of Employee", y="Total Monthly Income (Dollars)") + 
  theme(plot.title = element_text(hjust=0.5)) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

#scatterplot of Total Monthly Income by Age with a linear model fit line and 99% confidence level interval
ggplot(empdata.tidy, aes(Age, MonthlyInc)) + geom_point(aes(shape=Gender, colour = Gender)) + theme_bw() +
  geom_smooth(method=lm, linetype="dashed", color="yellow", level=0.99) + 
  labs(title="Monthly Employee Income by Age", x="Age of Employee", y="Monthly Income (Dollars)") + 
  theme(plot.title = element_text(hjust=0.5)) 


