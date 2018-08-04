###########################################################################################
# Script name : age_inc_analysis.R 
# Created By  : Anjli Solsi
# Created Dt  : 07/30/2018
# Description : R code to analyze the relationship between variables Age and Income
# Source File : This script uses the cleaned data from tidy_dataset.R (empdata.tidy)
###########################################################################################
##@knitr age_inc_analysis


#bar plot of Monthly Income by Age
ggplot(empdata.tidy, aes(x=reorder(Age, -Age), y=MonthlyInc, fill=Gender)) + geom_bar(color="black", stat="identity") + 
  scale_fill_brewer(palette="Set1") + theme_gray()+ labs(title="Monthly Employee Income by Age", x="Age of Employee", y="Monthly Income (Dollars)") + 
  theme(plot.title = element_text(hjust=0.5)) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

#scatterplot of Monthly Income by Age
ggplot(empdata.tidy, aes(Age, MonthlyInc)) + geom_point(aes(shape=Gender, colour = Gender)) + theme_bw() +
  geom_smooth(method=lm, linetype="dashed", color="yellow", level=0.99) + 
  labs(title="Monthly Employee Income by Age", x="Age of Employee", y="Monthly Income (Dollars)") + 
  theme(plot.title = element_text(hjust=0.5)) 



