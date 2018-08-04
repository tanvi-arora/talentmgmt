####################################
# Script name : feature_sel_stepwise.R
# Created By  : Tanvi Arora 
# Created Dt  : 07/26/2018
# Description : select model that explains the Attrition and find important variables from there
# Source File : empdata.tidy.multfact
###################################
##@knitr feat_sel_init

#stepwise regression
empdata.tidy.multfact <- empdata.tidy[, !(colnames(empdata.tidy) %in% c("EmployeeCnt","StandardHrs", "Over18","stringAsFactors","EducDesc","EnvirSatDesc","JobInvlvDesc","JobSatDesc","RlshpSatDesc","PerfRtgDesc","WkLifBalDesc"))]
empdata.tidy.multfact$Attrition <-  as.numeric(empdata.tidy.multfact$Attrition)-1

#remove white spaces from values in factors
empdata.tidy.multfact.spaceless <- empdata.tidy.multfact
empdata.tidy.multfact.spaceless[,c("BusinessTrvl","Department","EducationFld","JobRole")] <- as.data.frame(apply(empdata.tidy.multfact.spaceless[,c("BusinessTrvl","Department","EducationFld","JobRole")],2,function(x)gsub('\\s+', '',x)))


## caret pkg has varImp function
#library(caret)

#use glm , it allows us to give option of defining response variable as binomial
# Initial model
glmMod <- glm(as.numeric(Attrition) ~ . , data = empdata.tidy.multfact.spaceless, binomial)

# summary of initial model

summary(glmMod)

# Intial model statistics

glmMod$aic

##@knitr feat_sel_step

# perform stepwise on the glm 
reducedMod <- step(glmMod)

#summary of the selectedmodel
summary(reducedMod)

# reduced model statistics
reducedMod$aic


##@knitr feat_sel_varimp

all_vars <- names(reducedMod[[1]])[-1]  # names of all X variables
# Get the non-significant vars
summ <- summary(reducedMod)  # model summary
pvals <- summ[[12]][, 4]  # get all p values
not_significant <- character()  # init variables that aren't statsitically significant
not_significant <- names(which(pvals > 0.1))
not_significant <- not_significant[!not_significant %in% "(Intercept)"]  # remove 'intercept'. Optional!

##not significant predictors
not_significant



#determine importance of predictors
empdata.varimp <- varImp(reducedMod)

#sort in decreasing order of variable importance

empdata.varimp.sort <- cbind(data.frame(empdata.varimp[rev(order(empdata.varimp$Overall)),]),data.frame(rownames(empdata.varimp)[order(empdata.varimp$Overall, decreasing = TRUE)[]]))
names(empdata.varimp.sort) <- c("varImp","varName")
head(empdata.varimp.sort,10)


##@knitr feat_sel_plot
theme_set(theme_classic())

ggplot(empdata.varimp.sort[1:10,], aes(x=unlist(varName), y=varImp)) + geom_point( col="tomato2", size=3) + scale_y_continuous(expand = c(0,0)) + geom_segment(aes(x=unlist(varName), xend = unlist(varName), y=min(varImp), yend=max(varImp)), linetype="dashed", size=0.1) + labs(title="Variable importance in Reduced model", subtitle="varName vs varImp", caption="source:empdata.varimp.sort") + coord_flip()


