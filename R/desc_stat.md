### Code book for R/desc_stat.R
**Author :** Rebecca Holsapple

R source code to create data visualiations of Preliminary Analysis

**Source Datafile :** 
Data/CaseStudy2-data.xlsx

**Objects Used :**
1) empdata.tidy - contains the tidied original data to use for analysis
	 Dimensions: x rows, x columns

**Objects Created :**
1. empdata.tidy.des - create a dataframe to pull specfic variables
2. lbls - define labels for the plot  

**Functions Used :**
1. *describe()*: generate descriptive statistics
2. *kable()*: converts clean table for HTLM
3. *ggplot()*: create graphs/plots
4. *summarytools::freq()*: Displays frequencies, including counts and proportions 
5. *table()*: build a contingency table

**Plots Created**
Basic plot attritbutes:
aes = specify inputs/variables to plot on x and y axis
labs = define lables for x-axis, y-axis, and title 
theme(plot.title = element_text(hjust=0.5)) = place title in the center of the plot

**objects created :**
1. empdata.tidy.des = Initial dataframe, variables "Age","Gender","Education","MaritalStat","DailyRate", "HourlyRate", "MonthlyInc", "MonthlyRate","JobRole"          
2. des = Descriptive Statistics table 
3. edu = Education frequency matrix
4. management = Management Count table

**plots created :**
R package used is ggplot2

1. Histogram to visualize Monthly Income distribution
2. Histogram to visualize Age distribution

 





