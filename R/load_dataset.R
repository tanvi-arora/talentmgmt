####################################
# Script name : load_dataset.R
# Created By  : Anne Francomano
# Created Dt  : 07/26/2018
# Description : R code to load and clean the employee data provided by Qualtrics
# Source File : This script uses the source file CaseStudy2-data.xlsx
###################################
##@knitr load_dataset

# Load the Qualtrics datafile into R
empdata.raw <- read.xlsx("Data/CaseStudy2-data.xlsx", sheetName = "HR-employee-attrition Data", stringAsFactors = F, header = T)
head(empdata.raw)

