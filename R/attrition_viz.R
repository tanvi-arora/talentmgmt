####################################
# Script name : attrition_viz.R
# Created By  : Anne Francomano, Tanvi Arora 
# Created Dt  : 08/04/2018
# Description : Create plots for Attrition 
# Source File : empdata.tidy.multfact
###################################

##@knitr plot_attr

#create frequency and percentage table
empdata.attr <- as.data.frame(empdata.tidy.multfact %>% group_by(Attrition) %>%tally() %>% arrange(desc(n)) %>% mutate(prop = percent(n/sum(n))) )
colnames( empdata.attr) <- c("Attrition","freq","percent")

#plot attrition rate
ggplot(empdata.attr, aes(x="", y=freq, fill=Attrition)) + geom_bar(width = 1, stat= "identity") + theme(axis.line = element_blank(), plot.title = element_text(hjust=0.5)) +  labs(fill="Attrition", x=NULL, y=NULL, title="Attrition Rate", caption="Source: empdata.attr") + coord_polar(theta = "y", start=0) + geom_label_repel(aes(label=percent), size=5, show.legend=FALSE, nudge_x=1) 
#+ scale_fill_brewer(palette="Dark2")
  #scale_fill_manual(values=c("skyblue","orange"))


##@knitr plot_attr_ot

# Analyze talent lost
empdata.attr.yes <- empdata.tidy.multfact %>% filter(Attrition == "Yes")

dim(empdata.attr.yes)

# How many did overtime ?
empdata.attr.yes.ot <- empdata.attr.yes %>% group_by(OverTime) %>%tally() %>% mutate(prop = percent(n/sum(n))) %>% mutate(prop = replace(prop,str_detect(prop,"$"),""))
colnames( empdata.attr.yes.ot) <- c("OverTime","freq","percent")

empdata.attr.yes.ot$percent <- as.numeric(empdata.attr.yes.ot$percent)
#plot attrition rate
ggplot(empdata.attr.yes.ot, aes(x="", y=freq, fill=OverTime)) + geom_bar(width = 1, stat= "identity") + theme(axis.line = element_blank(), plot.title = element_text(hjust=0.5)) +  labs(fill="Attrition", x=NULL, y=NULL, title="Attrition Rate", caption="Source: empdata.attr") + coord_polar(theta = "y", start=0) + geom_text(aes(y=percent,label=percent), size=5)
  #geom_label_repel(aes(label=percent), size=5, show.legend=FALSE, nudge_x=1) 



##@knitr plot_attr_inv



##@knitr plot_attr_env