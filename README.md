# talentmgmt
DDSAnalytics is an analytics company that specializes in talent management solutions for Fortune 1000 companies. Talent management is defined as the iterative process of developing and retaining employees. It may include workforce planning, employee training programs, identifying high-potential employees and reducing/preventing voluntary employee turnover (attrition). 

TARA Pharma Corp. (TARA), headquartered in Seattle, WA, develops, manufactures and markets a range of dietary supplement product lines. With 4,000 employees and 2 billion USD (FY 2017) in revenue, it must maintain its global brand integrity and continue its financial growth. To gain a competitive edge over its rivals, TARA is evaluating the role a data science approach to talent management could play as part of its overall business strategy. TARA's CIO has contracted DDS Analytics to conduct the proof-of-concept analysis as part of evaluating an analytics-centric talent management intiative. The proof-of-concept analysis aims to illustrate how applying data analytics to employee data would provide insight for employee retention and in turn contribute to the justification for the executive management team to invest in the initiative.

## Platform version : 
R version 3.4.3 (2017-11-30) 
Java SDK-10


## Directory Structure : 
Code is written in R . Below R packages will need to be installed - 
1) knitr \
knitr package is used along with R markdown to share results and code in HTML format for reproducible research. 
2) ggplot2 \
ggplot2 is a data visualization package for the statistical programming language R. Created by Hadley Wickham in 2005.
3) scales \
scale graphical scales map data to aesthetics, and provide methods for automatically determining breaks and labels for axes and legends in R. Created by Hadley Wickham in 2016. 
4) xlsx \
This package helps load xlsx files as is received from source. xlsx is not a widely accepted format and should encourage using source files in base formats like csv.This package requires java SDK and JAVA_HOME to be set up in the environment variables.
5) plyr \
A set of tools that solves a common set of problems: here we used it to summarise data by panels or collapse high-dimensional arrays to simpler summary statistics. 
6) dplyr \
dplyr provides a flexible grammar of data manipulation. It's the next iteration of plyr, focused on tools for working with data frames (hence the d in the name).
7) caret \
caret library is needed for varImp function. THs function was used to get importance of variables in the prediction model
8) corrplot \
required to get correlations between predictors
9) ggrepel 
\This package contains extra geoms for ggplot2 to help with labeling.
10) randomcoloR \
This package is used to generate different appealing palettes of random colors for plots. 
11) gridExtra \
This package provides functions to work with graphics and arrange multiple on a sheet.
12) ggthemes \
This package aides ggplot2 by providing extra themes, scales, and geoms to create intricate plots. 
13) psych  \
A general purpose toolbox for personality, psychometric theory and experimental psychology provide basic descriptive statistics.
14) kableExtra \
Build complex HTML or 'LaTeX' tables using 'kable()' from 'knitr' and the piping syntax from 'magrittr'.
15) summarytools \
Data frame summaries, cross-tabulations, weight-enabled frequency tables and common univariate statistics in concise tables available in a variety of formats (plain ASCII, Markdown and HTML).

Below R code installs above packages 

--install.packages("library_name")\

Sometimes there are some pre-requisites to a library. Use below R code for the same -
-- install.packages("library_name", dependencies = c("Depends", "Suggests"))

Or you may face error for package not found -
install.packages("library_name", repos="http://cran.rstudio.com/")


## Directory Structure  and important Files :
1) README.md - Contains general information about the project and how to use it. 
2) Main.Rmd - This is a cummulative report on the analysis . It references R code within this project wherever necessary to display the output. 
3) Main.html - This is the html output of the Main.Rmd Rmarkdown file.
4) Data - Data directory contains source files 
5) R - Code directory contains all R source code as *.R files and each R code has a codebook with its name saved as a *.md file
6) Images - contains any images used for presentation


## Owners :
Files                          | Created By        | Modified By
-------------------------------|-------------------|----------------
README.md                      | Tanvi Arora       | Anjli Solsi , Anne Francomano , Rebecca Holsapple
Main.Rmd                       | Tanvi Arora       | Anjli Solsi , Anne Francomano , Rebecca Holsapple
R/feature_sel_stepwise.R       | Tanvi Arora       |
R/attrition_viz.R              | Tanvi Arora       |
R/age_inc_analysis.R           | Anjli Solsi       |
R/life_sat_analysis.R          | Anjli Solsi       |
R/load_dataset.R               | Anne Francomano   |
R/tidy_dataset.R               | Anne Francomano   |
R/dept_attrpct.R               | Anne Francomano   |
R/desc_stat.R                  | Rebecca Holsapple |


## Report :
[Main.Rmd](https://github.com/tanvi-arora/talentmgmt/blob/master/Main.Rmd)


## Recommended future changes / To do's :

1) Use better or more complex prediction algorithms to get better predictions with lower statistics.



**Authors :**

Anne Francomano  
Anjli Solsi  
Rebecca Holsapple  
Tanvi Arora  

