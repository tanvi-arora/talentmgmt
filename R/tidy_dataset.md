### Code book for R/tidy_dataset.R
**Author :** Anne Francomano

R source code to determine the tidy the employee attrition data provided by Qualtrics.

**source dataset :** 
1) CaseStudy2-data.xlsx

**project datasets used :**
1) empdata.raw

**objects created :**
1. empdata.updcolnames \
        Dataframe; A copy of empdata.raw dataframe which is then modified by renaming its column names so that they do not exceed 12 characters. 
        
2. empdata.okcolnames \
        Dataframe; the final updated version of empdata.updcolnames once its column names no longer exceed 12 characters.
        
3. set_educdescrip \
        Function that creates and populates a new column containing the description of education level from Below College to Doctor based on a numeric value in a source column in the same dataframe. \

        Three arguments = dataframe, sourcecol, newcol \
                dataframe - name of a datafram object \
                sourcecol - string name of the column in the dataframe that contains a number representation (1 to 5) of the employee education level \
                newcol - string name of the new column that will be added to the input dataframe and will be populated with the education level description corresponding to the number in the dataframe's sourcecol, from 1 to 5. \
                output  - returns a modified input dataframe with an additional column called newcol, that contains the education level description that corresponds to the number in the dataframe's sourcecol, from 1 to 5.
                
4. set_low2veryhighdescrip \
        Function that creates and populates a new column containing the description of a rating from Low to Very High based on a numeric value in a source column in the same dataframe of value 1 to 4. \

        Three arguments = dataframe, sourcecol, newcol \
                dataframe - name of a dataframe object \
                sourcecol - string name of the column in the dataframe that contains a number value from 1 to 4\
                newcol - string name of the new column that will be added to the input dataframe and will be populated with the Low to Very High level description corresponding to the number in the dataframe's sourcecol. \
                output  - returns a modified input dataframe with an additional column called newcol, that contains the Low to Very High  level description that corresponds to the number in the dataframe's sourcecol 
                
  
 5. set_bad2bestdescrip \
        Function that creates and populates a new column containing the description of a rating from Bad to Best based on a numeric value in a source column in the same dataframe of value 1 to 4. \

        Three arguments = dataframe, sourcecol, newcol \
                dataframe - name of a dataframe object \
                sourcecol - string name of the column in the dataframe that contains a number value from 1 to 4\
                newcol - string name of the new column that will be added to the input dataframe and will be populated with the Bad to Best level description corresponding to the number in the dataframe's sourcecol. \
                output  - returns a modified input dataframe with an additional column called newcol, that contains the Bad to Best level description that corresponds to the number in the dataframe's sourcecol  
                
                
                
6. set_low2outstandingdescrip \
        Function that creates and populates a new column containing the description of a rating from Low to Outstanding based on a numeric value in a source column in the same dataframe of value 1 to 4. \

        Three arguments = dataframe, sourcecol, newcol \
                dataframe - name of a dataframe object \
                sourcecol - string name of the column in the dataframe that contains a number value from 1 to 4\
                newcol - string name of the new column that will be added to the input dataframe and will be populated with the Low to Outstanding level description corresponding to the number in the dataframe's sourcecol. \
                output  - returns a modified input dataframe with an additional column called newcol, that contains the Low to Outstanding level description that corresponds to the number in the dataframe's sourcecol 

7. empdata.educdesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Education Level Description
8. empdata.envirsat \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Environment Satisfaction Level Description

9. empdata.jobinvlvdesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Job Involvement Level Description
 
10. empdata.jobsatdesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Job Satisfaction Level Description
        
11. empdata.rlshpsatdesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Relationship Satisfaction Level Description

12. empdata.perfrtgdesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Performance Rating Level Description
        
 13. empdata.wklifbaldesc \
        Dataframe; the updated version of empdata.okcolnames with additional column containing the Work Life Balance Level Description
         
 14. empdata.tidy \
        Dataframe; the updated version of empdata.okcolnames after all tidying activities are completed
