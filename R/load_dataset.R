####################################
# Script name : load_dataset.R
# Created By  : Anne Francomano
# Created Dt  : 07/26/2018
# Description : R code to load and clean the employee data provided by Qualtrics
# Source File : This script uses the source file EmployeeData201807.csv 
###################################
##@knitr load_dataset

# Note manual preparation steps for excel workbook data prior to loading into R:
#     -- Copy excel sheet to a new excel workbook
#     -- Delete the two extra worksheets that are created by default
#     -- Save the excel file as an MSDOS CSV file with the name EmployeeData201807.csv

# Load the state size file data into R
#empdata.raw <- read.csv(file="Data/EmployeeData201807.csv", header=TRUE, sep=",")
empdata.raw <- read.xlsx("Data/CaseStudy2-data.xlsx", sheetName = "HR-employee-attrition Data", stringAsFactors = F, header = T)
head(empdata.raw)

summary(empdata.raw)