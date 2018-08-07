####################################
# Script name : dept_attrpct.R
# Created By  : Anne Francomano
# Created Dt  : 08/05/2018
# Description : R code to calculate attrition rate for each department
# Source File : This script uses the source file CaseStudy2-data.xls
###################################
##@knitr dept_attrpct

#Create a matrix of the number employees who left TARA per department
dptattrqty <- matrix(c(sum(empdata.raw$Department == "Human Resources" & empdata.raw$Attrition=="Yes"),sum(empdata.raw$Department == "Research & Development" & empdata.raw$Attrition=="Yes"), sum(empdata.raw$Department == "Sales" & empdata.raw$Attrition=="Yes")),ncol=1,byrow=TRUE)
#Inspect the matrix of the number employees who left TARA per department
dptattrqty
#Create a matrix of the employee count per department
dptheadcnt <- matrix(c(sum(empdata.raw$Department == "Human Resources"),sum(empdata.raw$Department == "Research & Development"), sum(empdata.raw$Department == "Sales")),ncol=1,byrow=TRUE)
#Inspect the matrix of the employee count per department
dptheadcnt
#Create a table containing the percent attrition per department based on the above two matrices.
dptattrpct.tbl <- as.table((dptattrqty / dptheadcnt)*100)
#Assign the column name to indicate the percent attrition metric and a row name for each department
colnames(dptattrpct.tbl) = c("Percent Attrition")
rownames(dptattrpct.tbl) = c("Human Resources", "Research & Development", "Sales")
#Round the percent calculation to two decimal places
round(dptattrpct.tbl, 2)
