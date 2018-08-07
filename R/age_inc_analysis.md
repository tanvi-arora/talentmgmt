### Code book for R/age_inc_analysis.R
**Author :** Anjli Solsi

R source code to create data visualiations of variables Age and Monthly Income while accounting for Gender

**Source Datafile :** 
Data/CaseStudy2-data.xlsx

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

**Objects Used :**
1) beer - contains the original data from the beer dataset
	  Dimensions: 2410 rows, 7 columns
2) breweries - contains the original data from the breweries dataset
		Dimensions: 558 rows, 4 columns

**Objects Created :**
No objects were created
empdata.WorkLifeBal......the rest of them 

**Functions Used :**
1. *colnames()*: change column names of an object


