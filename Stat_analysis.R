#Load required library
library(ggplot2)
library(readr)
install.packages("plotly")
install.packages("ggrepel")
library(ggrepel)
library(plotly)
install.packages("ggsci")
library(ggsci)
#Set working directory for importing file.
setwd("/home/chrf/KPN_R_Code")
data<- read_csv("convergence_scatter__res_0-3_vir_0-5.csv",na="NA")
View(data)
ggplot(data, aes(y=mean_res, x=mean_vir)) + 
  geom_point(aes(size=data$total,color=total))+ scale_fill_lancet()+theme_bw()+theme(legend.position="none")+
  geom_label_repel(aes(label = ST),
                   box.padding   = 0.35, 
                   point.padding = 0.5,max.overlaps=20,
                   segment.color = 'grey50')+ylim(0,2.5)
  
 



 
