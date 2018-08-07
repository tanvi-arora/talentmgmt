### Code book for R/life_sat_analysis.R
**Author :** Anjli Solsi

R source code to create data visualizations of factors contributing to overall work-life satisfaction

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
1. *lm()*: linear model function used to create a simple linear regression
2. *as.data.frame()*: convert data into class data frame 
3. *groupby()*: converts existing table into grouped table where operations are performed 
4. *summarise()*: used on grouped data 
5. *mutate()*: adds new variables while preserving exisitng variables 
6. *grid.arrange()*: set up layout for multiple graphs from ggplot

**Plots Created**

Plot attritbutes 
labs = define title caption for source of image
xlab = label for x axis
ylab = label for y axis
theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) : to place title of plot in the centre and make background of plot as blank with no color
fill = desired factor percentage
scale_fill_gradient = color gradient created using two specified colors
guides = hide the legends 

**Plot 1**
create frequency and percentage table for factor Work Life Balance
*Datasets*
empdata.WorkLifeBal = describe data

*plot* - histogram

**Plot 2**
create frequency and percentage table for factor Environment Satisfaction
*Datasets*
empdata.EnvirSatisf = describe data

*plot* - histogram

**Plot 3**
create frequency and percentage table for factor Job Involvement
*Datasets*
empdata.Job Involvmnt = describe data

*plot* - histogram

**Plot 4**
create frequency and percentage table for factor Job Satisfaction
*Datasets*
empdata.JobSatisf = describe data

*plot* - histogram

**Plot 5**
create frequency and percentage table for factor Performance Rating
*Datasets*
empdata.PerforRating = describe data

*plot* - histogram

**Plot 6**
create frequency and percentage table for factor RelshipSatis
*Datasets*
empdata.RelshipSatis = describe data

*plot* - histogram
