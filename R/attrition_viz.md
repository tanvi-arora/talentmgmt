### Code book for R/attrition.R
**Author :** Tanvi Arora

R source code to create a plots for attrition

**source dataset :** 
Data/CaseStudy2-data.xlsx

**Plots created**

Basic plot attritbutes 
labs = define titlem caption for source of image
xlab = label for x axis
ylab = label for y axis
theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) : to place title of plot in the centre and make background of plot as blank with no color

**plot_attr**

create frequency and percentage table
*Datasets*
empdata.attr = get number of employees within attrition (Yes/No ) and their percent

*plot*  - piechart
Besides the basic cosmetic features, 
1- ggplot :
  data - empdata.attr
  fill color = Attrition (yes/No)
  coord_polar(theta = "y", start=0) : converts bar chart to pie chart by defining thetha = frequency
  geom_label_repel(aes(label=percent), size=5, show.legend=FALSE, nudge_x=1) : will display percent value outside the piechart with proper arrows
  
  
  **plot_attr_ot**
  
  Factor for analysis - OverTime
  *Datasets*
  empdata.attr.yes.ot : employee count with attrition = Yes, frequency and percent 
  empdata.attr.no.ot : employee count with attrition = No, frequency and percent
  
  *plot* - barchart
  1) data = empdata.attr.yes.ot
  2) data = empdata.attr.no.ot
  
  
  **plot_attr_ot_areas**
  
  *Datasets*
  empdata.tidy - base dataset from tidy
  
  *plot*  - side by side 2 barcharts
  plot1  = barchart on OverTime vs JobRole
  
  
  
  
  *Datasets*
  *plot*
  
  
  
  
  *Datasets*
  *plot*
  
  
  
  
  *Datasets*
  *plot*
  
  
  
  *Datasets*
  *plot*
  
  
  
  *Datasets*
  *plot*
  
  
  
  *Datasets*
  *plot*





 
