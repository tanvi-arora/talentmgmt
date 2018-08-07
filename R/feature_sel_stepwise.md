### Code book for R/feature_sel_stepwise.R
**Author :** Tanvi Arora

R source code to create a prediction model and determine important predictors/factors

**source dataset :** 
1) Data/CaseStudy2-data.xlsx

**tidy dataset**
empdata.tidy

**Data modifications**
1) As part of data tidying , few descriptive fields have been added. Sine these fields are duplicate of the original fields they represent, these fields were removed. For ex JobSatisfaction value of '4' is indicative of 'Very High' Satisfaction 
2) lm does not accept identity features and so features that have same values were also removed. For Ex EmployeeCnt = 1 for all , StandarfHrs = 80 for all 
3) lm runs on quantitative predictors but we have many categorical features. R creates indicator variables for them as part of 'lm'. Factor values with spaces like "Laboratory Technician" give error, so some of the categorical fields were modified to remove these whitespaces

*dataset with above data modifications - empdata.tidy.multfact.spaceless*

**Model selection**
1) use glm , it allows us to give option of defining response variable as binomial
2) Initial model is created using glm


**project datasets used :**
1) beer.breweries.state - This dataset is created in Merge_Beers_Breweries.R and combines beer dataset with breweries and stateinfo.

**objects created :**
1. glmMod = Initial model , response variable = Attrition, predictors = all , family = binomial for the logical response variable having only 2 outputs yes/No
2. reducedMod = Reduced model obtained after applying stepwise selection method on the initial model 
3. all_vars = all predictors from the reduced model
4. summ = summary of the reduced model
5. not_significant = all predictors from the reduced model with pval > 0.1
6. empdata.varimp = variable importance of all the predictors from the reduced model
7. empdata.varimp.sort = all predictors in decreasing order of their variable improtance


   
**plots created :**
R package used is ggplot2

1. Barplot to map states to its median ABV% value stored in beer.stateABV
2. Barplot to map states to its median IBU value stored in beer.stateIBU

*Parameters of barplot for ABV :* 
1. ggplot  
   1. source dataset - empdata.varimp.sort[1:10,] = only top 10 variables from this list
   2. variables used - varName , varImp
  
2. geom_point - plots a dot plot  
    
3. coord_flip - owing to the large number of states( 50), flipped the plot to put the group on y-axis and plot the bars horizontally 
4. theme_bw() - bw theme allows to create a white background and use black boxes around the graph 
5. ggtitle -  Title of the graph 
6. ylab - y-label is the label of the continuous variable - median , which after flipping shows on the x-axis 
7. xab - x-label is the label of the grouped variable - State, which after flipping shows on the y-axis 



