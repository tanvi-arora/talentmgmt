####################################
# Script name : attrition_viz.R
# Created By  : Anne Francomano, Tanvi Arora 
# Created Dt  : 08/04/2018
# Description : Create plots for Attrition 
# Source File : empdata.tidy.multfact
###################################

##@knitr plot_attr

#create frequency and percentage table
empdata.attr <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition) %>%tally() %>%  mutate(percent = round(n*100/sum(n),2)) )
colnames( empdata.attr) <- c("Attrition","freq","percent")

#select colors
fill_attr <- c("mediumaquamarine", "plum4")

#plot attrition rate
ggplot(empdata.attr, aes(x="", y=freq, fill=Attrition)) + geom_bar(width = 1, stat= "identity") + theme(axis.line = element_blank(), plot.title = element_text(hjust=0.5), panel.background = element_blank()) +  labs(fill="Attrition", x=NULL, y=NULL, title="Attrition Rate", caption="Source: empdata.attr") + coord_polar(theta = "y", start=0) + geom_label_repel(aes(label=percent), size=5, show.legend=FALSE, nudge_x=1) +scale_fill_manual(values=fill_attr)


##@knitr plot_attr_ot

# Analyze talent lost

# How many did overtime ?
# get counts and percent of people with Overtime where Attrition = Yes
empdata.attr.yes.ot <- as.data.frame(empdata.tidy.multfact.orig %>% filter(Attrition == "Yes") %>% group_by(OverTime) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))
colnames( empdata.attr.yes.ot) <- c("OverTime","freq","percent")

empdata.attr.no.ot <- as.data.frame(empdata.tidy.multfact.orig %>% filter(Attrition == "No") %>% group_by(OverTime) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))
colnames( empdata.attr.no.ot) <- c("OverTime","freq","percent")

#for plotting convert percent to factor
empdata.attr.yes.ot$percent = as.factor(empdata.attr.yes.ot$percent)
empdata.attr.no.ot$percent = as.factor(empdata.attr.no.ot$percent)
#theme_set(theme_bw())  # pre-set the bw theme.

# create stacked bar chart 
ggplot(data= empdata.attr.yes.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#5F9EA0", "#E1B378")) + coord_flip() + labs( title="OverTime within Attrition", caption="Source: empdata.attr.yes.ot") +xlab("OverTime Indicator") + ylab("Count of Employee") + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())


#ggplot(data= empdata.attr.no.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99")) + coord_flip() + labs( title="OverTime within Retention", caption="Source: empdata.attr.no.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")  + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())
ggplot(data= empdata.attr.no.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#5F9EA0", "#E1B378")) + coord_flip() + labs( title="OverTime within Retention", caption="Source: empdata.attr.no.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")  + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())


##@knitr plot_attr_ot_areas
#plot OverTime within JobRole
plot1 <- ggplot(data= empdata.tidy, aes(x=empdata.tidy$JobRole,fill = empdata.tidy$Attrition)) + geom_bar() + scale_fill_manual(values=c("#5F9EA0", "#E1B378")) + coord_flip() + labs( title="OverTime within Job Roles", caption="Source: empdata.tidy") +xlab("Job Roles") + ylab("Count of Employee") + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())

#plot OverTime within Departments
plot2 <- ggplot(data= empdata.tidy, aes(x=empdata.tidy$Department,fill = empdata.tidy$Attrition)) + geom_bar() + scale_fill_manual(values=c("#5F9EA0", "#E1B378")) + coord_flip() + labs( title="OverTime within Job Roles", caption="Source: empdata.tidy") +xlab("Department") + ylab("Count of Employee") + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())

grid.arrange(plot1,plot2, nrow=2,ncol=1)
##@knitr plot_attr_inv

#create frequency and percent for stockoptions and Attrition

detach("package:plyr", unload=TRUE) 
empdata.attr.inv <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition,StockOptLvl) %>% summarise( n=n()) %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))

empdata.attr.inv 

# Plot
fill <- c("#5F9EA0", "#E1B378")
ggplot(data = empdata.attr.inv, mapping = aes(x = StockOptLvl, fill = Attrition, y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent))) + geom_bar(stat="identity") + scale_y_continuous(labels = abs, limits = max(empdata.attr.inv$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) +  scale_fill_manual(values=fill) +coord_flip() + labs( title="StockLevel Options vs Attrition", caption="Source: empdata.attr.inv") +xlab("Stock Level Options") + ylab("Percentage of Employee")  + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank())


##@knitr corr_attr_inv

#Correlation between Stock Options and Job Level and Years at Firm
empdata.cor1.ds <- data.frame(as.numeric(empdata.tidy.multfact$StockOptLvl),as.numeric(empdata.tidy.multfact$JobLevel),as.numeric(empdata.tidy.multfact$YrsAtFirm))
names(empdata.cor1.ds) <- c("StockOptLvl","JobLevel","YrsAtFirm")

empdata.cor1 <- cor(empdata.cor1.ds)
corrplot.mixed(empdata.cor1)

##@knitr plot_Attr_invc_areas

#plot stockoptions at job level
plot3 <- ggplot(empdata.tidy.multfact, aes(x=StockOptLvl,y=JobLevel)) + geom_count(col="grey59", show.legend=T) + labs( title="StockLevel Options within Job Levels", caption="Source: empdata.tidy.multfact") +xlab("Stock Level Options") + ylab("Job Level")  + theme( plot.title = element_text(hjust=0.5))

#plot stockoptions by Yrs at Firm
plot4 <- ggplot(empdata.tidy.multfact, aes(x=StockOptLvl,y=YrsAtFirm)) + geom_count(col="grey59", show.legend=T) + labs( title="StockLevel Options by  YrsAtFirm", caption="Source: empdata.tidy.multfact") +xlab("Stock Level Options") + ylab("Yrs at Firm")  + theme( plot.title = element_text(hjust=0.5))

grid.arrange(plot3,plot4, nrow=1,ncol=2)
##@knitr plot_attr_env

#create frequency and percent for Environment Satisfaction and Attrition
empdata.attr.env <- as.data.frame(empdata.tidy %>% group_by(Attrition,EnvirSatDesc) %>% summarise( n=n()) %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))


cbbPalette <- c("seagreen","gold")
ggplot(data = empdata.attr.env, mapping = aes(x = EnvirSatDesc, fill = Attrition, y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent))) + geom_point(stat="identity", aes(col=Attrition), size=10) + scale_y_continuous(labels = abs, limits = max(empdata.attr.env$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) + labs(y="percent", x="Environment Satisfaction") + scale_colour_manual(values=cbbPalette) + geom_text(label=round(empdata.attr.env$percent,0), size = 3, color="black") + labs( title="Environment Satisfaction vs Attrition", caption="Source: empdata.attr.env") +xlab("Environment Satisfaction") + ylab("Percentage of Employee")  + theme( plot.title = element_text(hjust=0.5), panel.background = element_blank()) + theme_bw ()

