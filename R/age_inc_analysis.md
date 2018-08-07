### Code book for R/age_inc_analysis.R
**Author :** Anjli Solsi

R source code to create data visualiations of variables Age and Monthly Income while accounting for Gender

**Source Datafile :** 
Data/CaseStudy2-data.xlsx

**Objects Used :**
1) empdata.tidy - contains the tidied original data to use for analysis
	 Dimensions: x rows, x columns

**Objects Created :**
1. brks - create a varibale to set limits for the plot
2. lbls - define labels for the plot  

**Functions Used :**
1. *seq()*: generate regular sequences 
2. *paste0()*: concatenate vectors after converting to character
3. *as.character()*: convert to character
4. *ggplot()*: create graphs/plots 

**Plots Created**
Basic plot attritbutes:
aes = specify inputs/variables to plot on x and y axis
labs = define lables for x-axis, y-axis, and title 
theme(plot.title = element_text(hjust=0.5)) = place title in the center of the plot

**Plot 1**
representation of Total Monthly Income by Age for each Gender
*Datasets*
empdata.tidy - base dataset from cleaning data

*plot*  - bar plot
ggplot :
 fill = Gender 
 geom_bar = stacked, specify width of bars
 scale_y_continuous = scale of axes and labels
 coord_flip = flip x and y axes
 theme_tufte = specific theme to use
 scale_fill_brewer = set color scheme selected
  
**Plot 2**
representation of Total Monthly Income by Age for each Gender
create frequency and percentage table
*Datasets*
empdata.tidy - base dataset from cleaning data

*plot* - bar plot
ggplot :
 fill = Gender
 geom_bar = stacked, specify width of bars
 scale_fill_brewer = set color scheme selected
 theme_gray = specfic theme to use
 
**Plot 3**
represenation of Monthly Income by Age for each Gender 
*Datasets*
empdata.tidy - base dataset from cleaning data
  
*plot* - scatterplot
ggplot :
 colour = different color for Gender
 theme_bw() = specific theme to use
 geom_smooth = specifics for linear regression line/fit line
 





