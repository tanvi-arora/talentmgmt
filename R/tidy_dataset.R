###########################################################################################
## R code to load and clean the employee data provided by Qualtrics 
## Author : Anne Francomano
## Created Date : 07/22/2018
## This script uses the source file EmployeeData201807.csv 
###########################################################################################
##@knitr tidy_dataset
# Note manual preparation steps for excel workbook data prior to loading into R:
#     -- Copy excel sheet to a new excel workbook
#     -- Delete the two extra worksheets that are created by default
#     -- Save the excel file as an MSDOS CSV file
# Load the state size file data into R
empdata <- read.csv(file="Data/EmployeeData201807.csv", header=TRUE, sep=",")
# Verify number of rows and columns in empdata dataframe
dim(empdata)
# Verify the structure of empdata dataframe
str(empdata)
# Reviewed each data colum and determined that multiple fields need to be converted from INT class to FACTOR class
#     Class of Education field should be FACTOR not INT
empdata[,'Education']<-factor(empdata[,'Education'])

#     Class of EnvironmentSatisfaction field should be FACTOR not INT
empdata[,'EnvironmentSatisfaction']<-factor(empdata[,'EnvironmentSatisfaction'])

#     Class of JobInvolvement field should be FACTOR not INT
empdata[,'JobInvolvement']<-factor(empdata[,'JobInvolvement'])

#     Class of JobLevel field should be FACTOR not INT
empdata[,'JobLevel']<-factor(empdata[,'JobLevel'])

#     Class of JobSatisfaction field should be FACTOR not INT
empdata[,'JobSatisfaction']<-factor(empdata[,'JobSatisfaction'])

#     Class of PerformanceRating field should be FACTOR not INT
empdata[,'PerformanceRating']<-factor(empdata[,'PerformanceRating'])

#     Class of RelationshipSatisfaction field should be FACTOR not INT
empdata[,'RelationshipSatisfaction']<-factor(empdata[,'RelationshipSatisfaction'])

#     Class of StockOptionLevel field should be FACTOR not INT
empdata[,'StockOptionLevel']<-factor(empdata[,'StockOptionLevel'])

#     class of WorkLifeBalance field should be FACTOR not INT
empdata[,'WorkLifeBalance']<-factor(empdata[,'WorkLifeBalance'])

# Verify the updated structure of empdata dataframe
str(empdata)

# Verify that there is no data missing from the dataframe
sum(is.na(empdata))

# Shorten dataframe column names that exceed 12 characters
# Note that the respective original column name is in comment below for reference if needed.
colnames(empdata)[3] <- "BusinessTrvl"     # BusinessTravel
colnames(empdata)[6] <- "DistFromHome"     # DistanceFromHome
colnames(empdata)[8] <- "EducationFld"     # EducationField
colnames(empdata)[9] <- "EmployeeCnt"      # EmployeeCount
colnames(empdata)[10] <- "EmployeeNum"     # EmployeeNumber
colnames(empdata)[11] <- "EnvirSatisf"     # EnvironmentSatisfaction
colnames(empdata)[14] <- "JobInvolvmnt"    # JobInvolvement
colnames(empdata)[17] <- "JobSatisf"       # JobSatisfaction
colnames(empdata)[18] <- "MaritalStat"     # MaritalStatus
colnames(empdata)[19] <- "MonthlyInc"      # MonthlyIncome
colnames(empdata)[21] <- "NumFirmsWrkd"    # NumCompaniesWorked
colnames(empdata)[24] <- "PctSalryHike"    # PercentSalaryHike
colnames(empdata)[25] <- "PerforRating"    # PerformanceRating
colnames(empdata)[26] <- "RelshipSatis"    # RelationshipSatisfaction
colnames(empdata)[27] <- "StandardHrs"     # StandardHours
colnames(empdata)[28] <- "StockOptLvl"     # StockOptionLevel
colnames(empdata)[29] <- "TotlWrkngYrs"    # TotalWorkingYears
colnames(empdata)[30] <- "TrnCntLastYr"    # TrainingTimesLastYear
colnames(empdata)[31] <- "WorkLifeBal"     # WorkLifeBalance
colnames(empdata)[32] <- "YrsAtFirm"       # YearsAtCompany
colnames(empdata)[33] <- "YrsInCurRole"    # YearsInCurrentRole
colnames(empdata)[34] <- "YrsSncePromo"    # YearsSinceLastPromotion
colnames(empdata)[35] <- "YrsWthCurMgr"    # YearsWithCurrentManager

#Verify column name updates to empdata dataframe
str(empdata)

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
empdata1 <- set_educdescrip(empdata, "Education", "EducDesc")

#    Create and Populate a new Environment Satisfaction Description field
empdata2 <- set_low2veryhighdescrip(empdata1, "EnvirSatisf", "EnvirSatDesc")
#    Create and Populate a new Job Involvement Description field
empdata3 <- set_low2veryhighdescrip(empdata2, "JobInvolvmnt", "JobInvlvDesc")
#    Create and Populate a new Job Satisfaction Description field
empdata4 <- set_low2veryhighdescrip(empdata3, "JobSatisf", "JobSatDesc")
#    Create and Populate a new Relationship Satisfaction Description field
empdata5 <- set_low2veryhighdescrip(empdata4, "RelshipSatis", "RlshpSatDesc")

#    Create and Populate a new Performance Rating Description field
empdata6 <- set_low2outstanddescrip(empdata5, "PerforRating", "PerfRtgDesc")

#    Create and Populate a new WorkLifeBalance Description field
empdatafinal <- set_bad2bestdescrip(empdata6, "WorkLifeBal", "WkLifBalDesc")

#Verify structure of final dataframe
str(empdatafinal)

#TEAM QUESTION:   do we need to convert the new level and rating Description fields to factors??