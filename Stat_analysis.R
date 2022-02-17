library(ggplot2)
library(readr)
install.packages("plotly")
install.packages("ggrepel")
library(ggrepel)
library(plotly)
install.packages("ggsci")
library(ggsci)
setwd("/home/chrf/KPN_R_Code")
data<- read_csv("convergence_scatter__res_0-3_vir_0-5.csv",na="NA")
View(data)
ggplot(data, aes(y=mean_res, x=mean_vir)) + 
  geom_point(aes(size=data$total,color=total))+ scale_fill_lancet()+theme_bw()+theme(legend.position="none")+
  geom_label_repel(aes(label = ST),
                   box.padding   = 0.35, 
                   point.padding = 0.5,max.overlaps=20,
                   segment.color = 'grey50')+ylim(0,2.5)
  
  
ggplot(data, aes(y= mean_res, x= mean_vir, colour="green", label=ST,color="blue"))+
    geom_point(aes(size=data$total)) +geom_text(hjust=0.5, vjust=0)

#####new data for more analysis

dt<- merged_570_kleb_metadata
View(dt)
ggplot(dt,aes(x=dt$AdmissionYear,y=dt$ST))+geom_point()+
  theme(legend.position="top")

 new<-table(dt$AdmissionYear,dt$ST)                  
 View(new)
install.packages("writexl") 
library("writexl")
new<-data.frame(new)
write_xlsx(new,"/home/chrf/KPN_R_Code/new.xlsx")
table(dt$ST)
library(dplyr)
st<-as.factor(dt$ST)
dt %>%
  count(ST) %>%
  group_by(dt$AdmissionYear) 
