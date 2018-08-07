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
coord_flip() = to flip x axis and y axis

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
  plot2 = barchart on OverTime vs Department
  grid.arrange(plot1,plot2, nrow=2,ncol=1) = this will add plot1 and plot2 in a grid of 2 rows and 1 col
  
  **plot_attr_inv**
  
  *Note* - detach("package:plyr", unload=TRUE) was used to detach 'plyr' pkg, since it was overriding summarise function from dplyr and the outputs were unpredictable. plyr pkg is used for other code within the project and so it is detached for the following section
  
  *Datasets*
  empdata.attr.inv = dataset for frequency and percent on Attrition and StockOptLvl
  
  *plot* - funnel plot
   For each stock options, Attrition percentage is evaluated and shown at the same level in opposite direction
   ggplot options modified - y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent) : this puts percent w.r.t Attrition = yes on the positive y axis and percent w.r.t Attrition = No on negative y axis
   scale_y_continuous(labels = abs, limits = max(empdata.attr.inv$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) = This option will modify y axis with values of percent available in the input data with breaks of 10%
  
  **corr_attr_inv**
  
  
  *Datasets*
  empdata.cor1.ds - dataset of stockoptions, joblevel and Yrs at firm
  empdata.cor1 - chek for correlation
  *plot*  None
  
  
  **plot_Attr_invc_areas**
  
  *Datasets* : None
  *plot* - side by side Bubble plot
  plot3 = stock options vs Job level
  plot4 = stock options vs Yrs at Firm
  
  plot options - 
  geom_count - count number of employees in each section
  
  **plot_attr_env**
  
  *Datasets*
  empdata.attr.env = frequency and percent of employees  grouped on Attrition and EnvironmentSatisfaction
  *plot* - diverging dot plot
  
  Options -
  
  y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent) : will place points with Attrition = Yes in positive y axis and points with Attrition = No in negative y axis
  geom_point(stat="identity", aes(col=Attrition), size=10) : plot a point or a dot of size 10 and color based on Attrition
  scale_y_continuous(labels = abs, limits = max(empdata.attr.env$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60))  : pcreate y axis of + and '-' with max range = (-max percent, max percent) from input dataset and scale of 10% difference
  geom_text(label=round(empdata.attr.env$percent,0), size = 3, color="black") - display percent value rounded of to nearest integer within the dots with a size =3




 
