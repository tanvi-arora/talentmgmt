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
empdata.attr.yes <- empdata.tidy.multfact.orig %>% filter(Attrition == "Yes")

dim(empdata.attr.yes)

# How many did overtime ?
empdata.attr.yes.ot <- as.data.frame(empdata.attr.yes %>% group_by(OverTime) %>%tally() %>% arrange(desc(n)) %>% mutate(percent = round(n*100/sum(n),2)))
colnames( empdata.attr.yes.ot) <- c("OverTime","freq","percent")
empdata.attr.yes.ot$percent = as.factor(empdata.attr.yes.ot$percent)
theme_set(theme_bw())  # pre-set the bw theme.
pal <- brewer.pal(8,"Set1")
#ggplot(data= empdata.attr.yes.ot, aes(x=OverTime)) + geom_bar(aes(y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99")) + coord_flip() + labs( title="OverTime within Attrition", caption="Source: empdata.attr.yes.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")

ggplot(data= empdata.attr.yes.ot) + geom_bar(aes(x=OverTime,y = freq, fill = percent), stat = "identity",position="stack") + scale_fill_manual(values=c("#CC6666", "#9999CC", "#66CC99")) + coord_flip() + labs( title="OverTime within Attrition", caption="Source: empdata.attr.yes.ot") +xlab("OverTime Indicator") + ylab("Count of Employee")


#fill <- c("#5F9EA0", "#E1B378")
#p4 <- p4 + scale_fill_manual(values=fill)

##@knitr plot_attr_inv



##@knitr plot_attr_env