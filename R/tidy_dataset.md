### Code book for R/tidy_dataset.R
**Author :** Anne Francomano

R source code to determine the tidy the employee attrition data provided by Qualtrics.

**source dataset :** 
1) CaseStudy2-data.xlsx

**project datasets used :**
1) empdata.raw

**objects created :**
1. empdata.updcolnames \ Datafrme; A copy of empdata.raw dataframe which is then modified by renaming its column names so that they do not exceed 12 characters. 
2. empdata.okcolnames \  Dataframe; the final updated version of empdata.updcolnames once its column names no longer exceed 12 characters.
3. set_educdescrip \  Function that creates and populates a new column containing the description of education level based on a numeric value in a source column in the same dataframe. \
        arguments - dataframe, sourcecol, newcol \
        dataframe - name of a datafram object \
        sourcecol - string name of the column in the dataframe that contains a number representation of the employee education level \
        newcol - string name of the new column that will be added to the input dataframe and will be populated with the education level description corresponding to the number in the dataframe's sourcecol. \
    2. output  - returns a modified input dataframe with an additional column called newcol, that contains the education level description that corresponds to the number in the dataframe's sourcecol 
4. set_low2veryhighdescrip - function ..  
    1. arguments -
    2. output  -
