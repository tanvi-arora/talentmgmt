### Code book for R/life_sat_analysis.R
**Author :** Anjli Solsi

R source code to create data visualiations of factors contributing to overall work-life satisfaction

**Source Datafile :** 
Data/CaseStudy2-data.xlsx

**Objects Used :**
1) empdata.tidy - contains the tidied original data to use for analysis
	      Dimensions: x rows, x columns

**Objects Created :**
1. trial - linear regression model of variables attributed to work life satisfaction
2. empdata.WorkLifeBal - get number and percentages for each rating of Work Life Balance
3. empdata.EnvirSatisf - get number and percentages for each rating of Environment Satisfaction
4. empdata.JobInvlvmnt - get number and percentages for each rating of Job Involvement
5. empdata.JobSatisf - get number and percentages for each rating of Job Satisfaction
6. empdata.PerforRating - get number and percentages for each rating of Performance Rating
7. empdata.RelshipSatis - get number and percentages for each rating of Relationship Status 

**Functions Used :**
1. *colnames()*: change column names of an object
