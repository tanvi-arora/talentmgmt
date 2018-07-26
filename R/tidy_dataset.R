###########################################################################################
# Script name : tidy_dataset.R 
# Created By  : Anne Francomano
# Created Dt  : 07/22/2018
# Description : R code clean the employee data provided by Qualtrics
# Source File : This script uses the source file EmployeeData201807.csv
###########################################################################################
##@knitr tidy_dataset

# Verify number of rows and columns in empdata dataframe
dim(empdata.raw)
# Verify the structure of empdata dataframe
str(empdata.raw)
# Reviewed each data colum and determined that multiple fields need to be converted from INT class to FACTOR class
#     Class of Education field should be FACTOR not INT
empdata.raw[,'Education']<-factor(empdata.raw[,'Education'])

#     Class of EnvironmentSatisfaction field should be FACTOR not INT
empdata.raw[,'EnvironmentSatisfaction']<-factor(empdata.raw[,'EnvironmentSatisfaction'])

#     Class of JobInvolvement field should be FACTOR not INT
empdata.raw[,'JobInvolvement']<-factor(empdata.raw[,'JobInvolvement'])

#     Class of JobLevel field should be FACTOR not INT
empdata.raw[,'JobLevel']<-factor(empdata.raw[,'JobLevel'])

#     Class of JobSatisfaction field should be FACTOR not INT
empdata.raw[,'JobSatisfaction']<-factor(empdata.raw[,'JobSatisfaction'])

#     Class of PerformanceRating field should be FACTOR not INT
empdata.raw[,'PerformanceRating']<-factor(empdata.raw[,'PerformanceRating'])

#     Class of RelationshipSatisfaction field should be FACTOR not INT
empdata.raw[,'RelationshipSatisfaction']<-factor(empdata.raw[,'RelationshipSatisfaction'])

#     Class of StockOptionLevel field should be FACTOR not INT
empdata.raw[,'StockOptionLevel']<-factor(empdata.raw[,'StockOptionLevel'])

#     class of WorkLifeBalance field should be FACTOR not INT
empdata.raw[,'WorkLifeBalance']<-factor(empdata.raw[,'WorkLifeBalance'])

# Verify the updated structure of empdata dataframe
str(empdata.raw)

# Verify that there is no data missing from the dataframe
sum(is.na(empdata.raw))

# Shorten dataframe column names that exceed 12 characters
#
empdata.updcolnames <- empdata.raw
# Note that the respective original column name is in comment below for reference if needed.
#
colnames(empdata.updcolnames)[3] <- "BusinessTrvl"     # BusinessTravel
colnames(empdata.updcolnames)[6] <- "DistFromHome"     # DistanceFromHome
colnames(empdata.updcolnames)[8] <- "EducationFld"     # EducationField
colnames(empdata.updcolnames)[9] <- "EmployeeCnt"      # EmployeeCount
colnames(empdata.updcolnames)[10] <- "EmployeeNum"     # EmployeeNumber
colnames(empdata.updcolnames)[11] <- "EnvirSatisf"     # EnvironmentSatisfaction
colnames(empdata.updcolnames)[14] <- "JobInvolvmnt"    # JobInvolvement
colnames(empdata.updcolnames)[17] <- "JobSatisf"       # JobSatisfaction
colnames(empdata.updcolnames)[18] <- "MaritalStat"     # MaritalStatus
colnames(empdata.updcolnames)[19] <- "MonthlyInc"      # MonthlyIncome
colnames(empdata.updcolnames)[21] <- "NumFirmsWrkd"    # NumCompaniesWorked
colnames(empdata.updcolnames)[24] <- "PctSalryHike"    # PercentSalaryHike
colnames(empdata.updcolnames)[25] <- "PerforRating"    # PerformanceRating
colnames(empdata.updcolnames)[26] <- "RelshipSatis"    # RelationshipSatisfaction
colnames(empdata.updcolnames)[27] <- "StandardHrs"     # StandardHours
colnames(empdata.updcolnames)[28] <- "StockOptLvl"     # StockOptionLevel
colnames(empdata.updcolnames)[29] <- "TotlWrkngYrs"    # TotalWorkingYears
colnames(empdata.updcolnames)[30] <- "TrnCntLastYr"    # TrainingTimesLastYear
colnames(empdata.updcolnames)[31] <- "WorkLifeBal"     # WorkLifeBalance
colnames(empdata.updcolnames)[32] <- "YrsAtFirm"       # YearsAtCompany
colnames(empdata.updcolnames)[33] <- "YrsInCurRole"    # YearsInCurrentRole
colnames(empdata.updcolnames)[34] <- "YrsSncePromo"    # YearsSinceLastPromotion
colnames(empdata.updcolnames)[35] <- "YrsWthCurMgr"    # YearsWithCurrentManager

#
empdata.okcolnames <- empdata.updcolnames
#Verify column name updates to empdata dataframe
str(empdata.okcolnames)

# Define set of functions to set value of a new description column for each level and rating column
#    Define function to set value of a new description column using the Education level list
set_educdescrip <- function (df, sourcecol, newcol){
  df[,newcol] = "" # created a new column
  df [,newcol][df[,sourcecol] == 1] <- "1 Below College"
  df [,newcol][df[,sourcecol] == 2] <-"2 College"
  df [,newcol][df[,sourcecol] == 3] <-"3 Bachelor"
  df [,newcol][df[,sourcecol] == 4] <-"4 Master"
  df [,newcol][df[,sourcecol] == 5] <-"5 Doctor"
  return(df)
}
#    Define function to set value of a new description column using the Low to Very High rating list
set_low2veryhighdescrip <- function (df, sourcecol, newcol){
  df[,newcol] = "" # created a new column
  df [,newcol][df[,sourcecol] == 1] <- "1 Low"
  df [,newcol][df[,sourcecol] == 2] <-"2 Medium"
  df [,newcol][df[,sourcecol] == 3] <-"3 High"
  df [,newcol][df[,sourcecol] == 4] <-"4 Very High"
  return(df)
}

#    Define function to set value of a new description column using the Bad to Best rating list
set_bad2bestdescrip <- function (df, sourcecol, newcol){
  df[,newcol] = "" # created a new column
  df [,newcol][df[,sourcecol] == 1] <- "1 Bad"
  df [,newcol][df[,sourcecol] == 2] <-"2 Good"
  df [,newcol][df[,sourcecol] == 3] <-"3 Better"
  df [,newcol][df[,sourcecol] == 4] <-"4 Best"
  return(df)
} 

#    Define function to set value of a new description column using the Low to Oustanding rating list
set_low2outstanddescrip <- function (df, sourcecol, newcol){
  df[,newcol] = "" # created a new column
  df [,newcol][df[,sourcecol] == 1] <- "1 Low"
  df [,newcol][df[,sourcecol] == 2] <-"2 Good"
  df [,newcol][df[,sourcecol] == 3] <-"3 Excellent"
  df [,newcol][df[,sourcecol] == 4] <-"4 Outstanding"
  return(df)
}

#Create and Populate new description fields for corresponding level and ratings fields 
#Note that all new field names are no longer than 12 characters long.
#    Create and Populate a new Education Description field
empdata.educdesc <- set_educdescrip(empdata.okcolnames, "Education", "EducDesc")

#    Create and Populate a new Environment Satisfaction Description field
empdata.envirsatdesc <- set_low2veryhighdescrip(empdata.educdesc, "EnvirSatisf", "EnvirSatDesc")
#    Create and Populate a new Job Involvement Description field
empdata.jobinvlvdesc <- set_low2veryhighdescrip(empdata.envirsatdesc, "JobInvolvmnt", "JobInvlvDesc")
#    Create and Populate a new Job Satisfaction Description field
empdata.jobsatdesc <- set_low2veryhighdescrip(empdata.jobinvlvdesc, "JobSatisf", "JobSatDesc")
#    Create and Populate a new Relationship Satisfaction Description field
empdata.rlshpsatdesc <- set_low2veryhighdescrip(empdata.jobsatdesc, "RelshipSatis", "RlshpSatDesc")

#    Create and Populate a new Performance Rating Description field
empdata.perfrtgdesc <- set_low2outstanddescrip(empdata.rlshpsatdesc, "PerforRating", "PerfRtgDesc")

#    Create and Populate a new WorkLifeBalance Description field
empdata.wklifbaldesc <- set_bad2bestdescrip(empdata.perfrtgdesc, "WorkLifeBal", "WkLifBalDesc")

#
empdata.tidy <- empdata.wklifbaldesc
#Verify structure of final dataframe
str(empdata.tidy)

#TEAM QUESTION:   do we need to convert the new level and rating Description fields to factors??