library(dplyr)
library(factoextra)
library(gridExtra)
library(hypervolume)
library(ggplot2)

table = read.csv('/home/bianca/backup/Moara/cmip5_CAETE_DVM2/traits_standard.csv')

location_scenario = as.factor(table$location_scenario)

location = as.factor(table$location)

scenario = as.factor(table$scenario)

table_traits = table[,4:9]

pca = prcomp(table_traits, scale = TRUE)

names(table_traits) = c("Leaf allocation","Woody allocation", "Root allocation","Leaf residence time", "Woody residence time","Root residence time")

pca2=fviz_pca_biplot(pca,geom=c("point"),pointshape=21 ,labelsize=6,pointsize=0.5,geom.var = c("arrow","text"),col.ind=location_scenario,fill.ind=location_scenario,alpha.ind=0.5,repel=TRUE,legend.title= "",col.var="black", title = "")
