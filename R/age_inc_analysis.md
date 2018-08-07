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
1. *colnames()*: change column names of an object

**Plots Created**

Basic plot attritbutes 
labs = define title caption for source of image
xlab = label for x axis
ylab = label for y axis
theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) : to place title of plot in the centre and make background of plot as blank with no color

**PLOT**

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




