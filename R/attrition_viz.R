####################################
# Script name : attrition_viz.R
# Created By  : Anne Francomano, Tanvi Arora 
# Created Dt  : 08/04/2018
# Description : Create plots for Attrition 
# Source File : empdata.tidy.multfact
###################################

##@knitr plot_attr

#create frequency and percentage table
#empdata.attr <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition) %>%tally() %>% arrange(desc(n)) %>% mutate(prop = percent(n/sum(n))) )
empdata.attr <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition) %>%tally() %>%  mutate(percent = round(n*100/sum(n),2)) )
colnames( empdata.attr) <- c("Attrition","freq","percent")

#plot attrition rate
ggplot(empdata.attr, aes(x="", y=freq, fill=Attrition)) + geom_bar(width = 1, stat= "identity") + theme(axis.line = element_blank(), plot.title = element_text(hjust=0.5)) +  labs(fill="Attrition", x=NULL, y=NULL, title="Attrition Rate", caption="Source: empdata.attr") + coord_polar(theta = "y", start=0) + geom_label_repel(aes(label=percent), size=5, show.legend=FALSE, nudge_x=1) 
#+ scale_fill_brewer(palette="Dark2")
  #scale_fill_manual(values=c("skyblue","orange"))


##@knitr plot_attr_ot

# Analyze talent lost
#empdata.attr.yes <- empdata.tidy.multfact.orig %>% filter(Attrition == "Yes")

#empdata.attr.yes <- empdata.tidy.multfact.orig %>% filter(Attrition == "Yes")

#dim(empdata.attr.yes)

# How many did overtime ?
# get counts and percent of people with Overtime where Attrition = Yes
empdata.attr.yes.ot <- as.data.frame(empdata.tidy.multfact.orig %>% filter(Attrition == "Yes") %>% group_by(OverTime) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))
colnames( empdata.attr.yes.ot) <- c("OverTime","freq","percent")

empdata.attr.no.ot <- as.data.frame(empdata.tidy.multfact.orig %>% filter(Attrition == "No") %>% group_by(OverTime) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))
colnames( empdata.attr.no.ot) <- c("OverTime","freq","percent")

#for plotting convert percent to factor
empdata.attr.yes.ot$percent = as.factor(empdata.attr.yes.ot$percent)
empdata.attr.no.ot$percent = as.factor(empdata.attr.no.ot$percent)
theme_set(theme_bw())  # pre-set the bw theme.

# create stacked bar chart 
ggplot(data= empdata.attr.yes.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99")) + coord_flip() + labs( title="OverTime within Attrition", caption="Source: empdata.attr.yes.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")


ggplot(data= empdata.attr.no.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99")) + coord_flip() + labs( title="OverTime within Retention", caption="Source: empdata.attr.no.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")

##@knitr plot_attr_inv

#create frequency and percent for stockoptions and Attrition

#empdata.attr.inv <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition,StockOptLvl) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))

detach("package:plyr", unload=TRUE) 
empdata.attr.inv <- as.data.frame(empdata.tidy.multfact.orig %>% group_by(Attrition,StockOptLvl) %>% summarise( n=n()) %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))

empdata.attr.inv 

# Plot
#ggplot(empdata.attr.inv, aes(x = StockOptLvl, y = percent, fill = Attrition)) + geom_bar(stat= "identity", width = 0.6) 
fill <- c("#5F9EA0", "#E1B378")
ggplot(data = empdata.attr.inv, mapping = aes(x = StockOptLvl, fill = Attrition, y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent))) + geom_bar(stat="identity") + scale_y_continuous(labels = abs, limits = max(empdata.attr.inv$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) + labs(y="percent", x="Stock Options") + scale_fill_manual(values=fill) +coord_flip()



##@knitr plot_attr_env

#create frequency and percent for Environment Satisfaction and Attrition
empdata.attr.env <- as.data.frame(empdata.tidy %>% group_by(Attrition,EnvirSatDesc) %>% summarise( n=n()) %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))


#ggplot(data = empdata.attr.env, mapping = aes(x = EnvirSatDesc, fill = Attrition, y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent))) + geom_bar(stat="identity") + scale_y_continuous(labels = abs, limits = max(empdata.attr.env$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) + labs(y="percent", x="Environment Satisfaction") + scale_fill_manual(values=fill) +coord_flip()

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data = empdata.attr.env, mapping = aes(x = EnvirSatDesc, fill = Attrition, y = ifelse(test = Attrition == "Yes" , yes = percent, no = -percent))) + geom_point(stat="identity", aes(col=Attrition), size=9) + scale_y_continuous(labels = abs, limits = max(empdata.attr.env$percent)* c(-1, 1), breaks = c(-10,-20,-30,-40,-50,-60,10,20,30,40,50,60)) + labs(y="percent", x="Environment Satisfaction") + scale_colour_manual(values=cbbPalette) + geom_text(label=empdata.attr.env$percent, color="white", size = 3)
#coord_flip()
