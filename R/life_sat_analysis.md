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
1. *lm()*: linear model function used to create a simple linear regression
2. *as.data.frame()*: convert data into class data frame 
3. *groupby()*: converts existing table into grouped table where operations are performed 
4. *summarise()*: used on grouped data 
5. *mutate()*: adds new variables while preserving exisitng variables 
6. *grid.arrange()*: set up layout for multiple graphs from ggplot

**Plots Created**

Basic plot attritbutes 
labs = define title caption for source of image
xlab = label for x axis
ylab = label for y axis
theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) : to place title of plot in the centre and make background of plot as blank with no color

**Pfd**

create frequency and percentage table
*Datasets*
empdata.attr = describe data

*plot*  - piechart
Besides the basic cosmetic features, 
1- ggplot :
  data - 
  fill color = 
  specifics of ggplot used
  
  
  **PLOT2**
  
  Factor for analysis - life satisfaction: all the factors
  *Datasets*
  empdata.tidy - base dataset from cleaning data
  
  *plot* - barchart
  1) data = empdata.attr.yes.ot
  plot1
  plot2
  plot3
  plot4
  plot5
  plot6
