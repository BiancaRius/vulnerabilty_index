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

pca_test=fviz_pca_ind(pca,habillage = location_scenario,label='none',geom.var=c('arrow','text'))
pca_test

mydf=summary(pca)
pca$rotation
pca$center
pca$scale

new_variables<-pca$x
df_new_variables<-as.data.frame(new_variables)
colnames(df_new_variables)
final_table<-bind_cols(table,df_new_variables)
write.csv(final_table, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/table_pcs.csv', row.names = FALSE)

#hypervolume
#importing table with the PCs values
table_pcs = read.csv('/home/bianca/backup/Moara/cmip5_CAETE_DVM2/table_pcs.csv')

####BELEM
##BELEM HIST
belem_hist = table_pcs[table_pcs$location_scenario=='belem_hist']
#see column numbers - get PC1:PC4
t(colnames(belem_hist))
belem_hist = belem_hist[,10:13]
#checking the choice of columns
head(belem_hist)
#calculates the hypervolume
hv_belem_hist = hypervolume(belem_hist, method = "gaussian")
#summary of the hypervolume
hv_belem_hist
#plot hypervolume
plot.Hypervolume(hv_belem_hist)

#### BELEM rcp26 #####
belem_rcp26 = table_pcs[table_pcs$location_scenario=='belem_rcp26',]
#see column numbers - get PC1:PC4
t(colnames(belem_rcp26))
belem_rcp26 = belem_rcp26[,10:13]
#checking the choice of columns
head(belem_rcp26)
#calculates the hypervolume
hv_belem_rcp26 = hypervolume(belem_rcp26, method = "gaussian")
#summary of the hypervolume
hv_belem_rcp26
#plot hypervolume
#plot.Hypervolume(hv_belem_rcp26)

#### BELEM rcp60 #####
belem_rcp60 = table_pcs[table_pcs$location_scenario=='belem_rcp60',]
#see column numbers - get PC1:PC4
t(colnames(belem_rcp60))
belem_rcp60 = belem_rcp60[,10:13]
#checking the choice of columns
head(belem_rcp60)
#calculates the hypervolume
hv_belem_rcp60 = hypervolume(belem_rcp60, method = "gaussian")
#summary of the hypervolume
hv_belem_rcp60
#plot hypervolume
#plot.Hypervolume(hv_belem_rcp60)

#### BELEM rcp85 #####
belem_rcp85 = table_pcs[table_pcs$location_scenario=='belem_rcp85',]
#see column numbers - get PC1:PC4
t(colnames(belem_rcp85))
belem_rcp85 = belem_rcp85[,10:13]
#checking the choice of columns
head(belem_rcp85)
#calculates the hypervolume
hv_belem_rcp85 = hypervolume(belem_rcp85, method = "gaussian")
#summary of the hypervolume
hv_belem_rcp85
#plot hypervolume
#plot.Hypervolume(hv_belem_rcp85)

#saving volume values#

belem_hvs = as.data.frame(c(hv_belem_hist@Volume, hv_belem_rcp26@Volume, hv_belem_rcp60@Volume, hv_belem_rcp85@Volume))

write.csv(belem_hvs, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/belem_hvs.csv')


#statistics results#
##hist_x_rcp26
set_belem_hist_rcp26 = hypervolume_set(hv_belem_hist, hv_belem_rcp26, check.memory = FALSE)

ovlp_hist_rcp26 = hypervolume_overlap_statistics(set_belem_hist_rcp26)
ovlp_hist_rcp26 = as.data.frame(ovlp_hist_rcp26)

hv_dist_hist_rcp26 = hypervolume_distance(hv_belem_hist, hv_belem_rcp26,type='centroid')
hv_dist_hist_rcp26 = as.data.frame(hv_dist_hist_rcp26)

cbind_hist_rcp26 = cbind(ovlp_hist_rcp26, hv_dist_hist_rcp26)

##hist_x_rcp60
set_belem_hist_rcp60 = hypervolume_set(hv_belem_hist, hv_belem_rcp60, check.memory = FALSE)

ovlp_hist_rcp60 = hypervolume_overlap_statistics(set_belem_hist_rcp60)
ovlp_hist_rcp60 = as.data.frame(ovlp_hist_rcp60)

hv_dist_hist_rcp60 = hypervolume_distance(hv_belem_hist, hv_belem_rcp60,type='centroid')
hv_dist_hist_rcp60 = as.data.frame(hv_dist_hist_rcp60)

cbind_hist_rcp60 = cbind(ovlp_hist_rcp60, hv_dist_hist_rcp60)


###hist_rcp_85###
set_belem_hist_rcp85 = hypervolume_set(hv_belem_hist, hv_belem_rcp85, check.memory = FALSE)

ovlp_hist_rcp85 = hypervolume_overlap_statistics(set_belem_hist_rcp85)
ovlp_hist_rcp85 = as.data.frame(ovlp_hist_rcp85)

hv_dist_hist_rcp85 = hypervolume_distance(hv_belem_hist, hv_belem_rcp85,type='centroid')
hv_dist_hist_rcp85 = as.data.frame(hv_dist_hist_rcp85)

cbind_hist_rcp85 = cbind(ovlp_hist_rcp85, hv_dist_hist_rcp85)

##
#bind the results
cbind_belem = cbind(cbind_hist_rcp26,cbind_hist_rcp60,cbind_hist_rcp85)

write.csv(cbind_belem, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/belem_ovlp_dist.csv')


####itaCOATIARA####
#### itaCOATIATA HIST #####
ita_hist = table_pcs[table_pcs$location_scenario=='ita_hist',]
#see column numbers - get PC1:PC4
t(colnames(ita_hist))
#checking the location and the scenario
ita_hist$location_scenario
#selecting the PC's column
ita_hist = ita_hist[,10:13]
#checking the choice of columns
head(ita_hist)
#calculates the hypervolume
hv_ita_hist = hypervolume(ita_hist, method = "gaussian")
#summary of the hypervolume
get_volume(hv_ita_hist)
#plot hypervolume
plot.Hypervolume(hv_ita_hist)

#### itaCOATIATA rcp 26 #####
ita_rcp26 = table_pcs[table_pcs$location_scenario=='ita_rcp26',]
#see column numbers - get PC1:PC4
t(colnames(ita_rcp26))
#checking the location and the scenario
ita_rcp26$location_scenario
#selecting the PC's column
ita_rcp26 = ita_rcp26[,10:13]
#checking the choice of columns
head(ita_rcp26)
#calculates the hypervolume
hv_ita_rcp26 = hypervolume(ita_rcp26, method = "gaussian")
#summary of the hypervolume
get_volume(hv_ita_rcp26)
#plot hypervolume
plot.Hypervolume(hv_ita_rcp26)

ita_hvs = as.data.frame(hv_ita_hist@Volume)

#### itaCOATIATA rcp 60 #####
ita_rcp60 = table_pcs[table_pcs$location_scenario=='ita_rcp60',]
#see column numbers - get PC1:PC4
t(colnames(ita_rcp60))
#checking the location and the scenario
ita_rcp60$location_scenario
#selecting the PC's column
ita_rcp60 = ita_rcp60[,10:13]
#checking the choice of columns
head(ita_rcp60)
#calculates the hypervolume
hv_ita_rcp60 = hypervolume(ita_rcp60, method = "gaussian")
#summary of the hypervolume
get_volume(hv_ita_rcp60)
#plot hypervolume
plot.Hypervolume(hv_ita_rcp60)

#### itaCOATIATA rcp 85 #####
ita_rcp85 = table_pcs[table_pcs$location_scenario=='ita_rcp85',]
#see column numbers - get PC1:PC4
t(colnames(ita_rcp85))
#checking the location and the scenario
ita_rcp85$location_scenario
#selecting the PC's column
ita_rcp85 = ita_rcp85[,10:13]
#checking the choice of columns
head(ita_rcp85)
#calculates the hypervolume
hv_ita_rcp85 = hypervolume(ita_rcp85, method = "gaussian")
#summary of the hypervolume
get_volume(hv_ita_rcp85)
#plot hypervolume
plot.Hypervolume(hv_ita_rcp85)

#saving values
ita_hvs = as.data.frame(c(hv_ita_hist@Volume, hv_ita_rcp26@Volume, hv_ita_rcp60@Volume, hv_ita_rcp85@Volume))

write.csv(ita_hvs, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/ita_hvs.csv')

#statistics results#
##hist_x_rcp26
set_ita_hist_rcp26 = hypervolume_set(hv_ita_hist, hv_ita_rcp26, check.memory = FALSE)

ovlp_ita_hist_rcp26 = hypervolume_overlap_statistics(set_ita_hist_rcp26)
ovlp_ita_hist_rcp26 = as.data.frame(ovlp_ita_hist_rcp26)

hv_ita_dist_hist_rcp26 = hypervolume_distance(hv_ita_hist, hv_ita_rcp26,type='centroid')
hv_ita_dist_hist_rcp26 = as.data.frame(hv_ita_dist_hist_rcp26)

cbind_ita_hist_rcp26 = cbind(ovlp_ita_hist_rcp26, hv_ita_dist_hist_rcp26)

##hist_x_rcp60
set_ita_hist_rcp60 = hypervolume_set(hv_ita_hist, hv_ita_rcp60, check.memory = FALSE)

ovlp_ita_hist_rcp60 = hypervolume_overlap_statistics(set_ita_hist_rcp60)
ovlp_ita_hist_rcp60 = as.data.frame(ovlp_ita_hist_rcp60)

hv_ita_dist_hist_rcp60 = hypervolume_distance(hv_ita_hist, hv_ita_rcp60,type='centroid')
hv_ita_dist_hist_rcp60 = as.data.frame(hv_ita_dist_hist_rcp60)

cbind_ita_hist_rcp60 = cbind(ovlp_ita_hist_rcp60, hv_ita_dist_hist_rcp60)


###hist_rcp_85###
set_ita_hist_rcp85 = hypervolume_set(hv_ita_hist, hv_ita_rcp85, check.memory = FALSE)

ovlp_ita_hist_rcp85 = hypervolume_overlap_statistics(set_ita_hist_rcp85)
ovlp_ita_hist_rcp85 = as.data.frame(ovlp_ita_hist_rcp85)

hv_ita_dist_hist_rcp85 = hypervolume_distance(hv_ita_hist, hv_ita_rcp85,type='centroid')
hv_ita_dist_hist_rcp85 = as.data.frame(hv_ita_dist_hist_rcp85)

cbind_ita_hist_rcp85 = cbind(ovlp_ita_hist_rcp85, hv_ita_dist_hist_rcp85)

##
#bind the results
cbind_ita = cbind(cbind_ita_hist_rcp26,cbind_ita_hist_rcp60,cbind_ita_hist_rcp85)

write.csv(cbind_ita, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/ita_ovlp_dist.csv')

####MANAUS####
#### MANAUS HIST #####
manaus_hist = table_pcs[table_pcs$location_scenario=='manaus_hist',]
#see column numbers - get PC1:PC4
t(colnames(manaus_hist))
#checking the location and the scenario
manaus_hist$location_scenario
#selecting the PC's column
manaus_hist = manaus_hist[,10:13]
#checking the choice of columns
head(manaus_hist)
#calculates the hypervolume
hv_manaus_hist = hypervolume(manaus_hist, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_manaus_hist)
#plot hypervolume
#plot.Hypervolume(hv_manaus_hist)

#### manausCOATIATA rcp 26 #####
manaus_rcp26 = table_pcs[table_pcs$location_scenario=='manaus_rcp26',]
#see column numbers - get PC1:PC4
t(colnames(manaus_rcp26))
#checking the location and the scenario
manaus_rcp26$location_scenario
#selecting the PC's column
manaus_rcp26 = manaus_rcp26[,10:13]
#checking the choice of columns
head(manaus_rcp26)
#calculates the hypervolume
hv_manaus_rcp26 = hypervolume(manaus_rcp26, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_manaus_rcp26)
#plot hypervolume
#plot.Hypervolume(hv_manaus_rcp26)


#### MANAUS rcp 60 #####
manaus_rcp60 = table_pcs[table_pcs$location_scenario=='manaus_rcp60',]
#see column numbers - get PC1:PC4
t(colnames(manaus_rcp60))
#checking the location and the scenario
manaus_rcp60$location_scenario
#selecting the PC's column
manaus_rcp60 = manaus_rcp60[,10:13]
#checking the choice of columns
head(manaus_rcp60)
#calculates the hypervolume
hv_manaus_rcp60 = hypervolume(manaus_rcp60, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_manaus_rcp60)
#plot hypervolume
#plot.Hypervolume(hv_manaus_rcp60)

#### MANAUS rcp 85 #####
manaus_rcp85 = table_pcs[table_pcs$location_scenario=='manaus_rcp85',]
#see column numbers - get PC1:PC4
t(colnames(manaus_rcp85))
#checking the location and the scenario
manaus_rcp85$location_scenario
#selecting the PC's column
manaus_rcp85 = manaus_rcp85[,10:13]
#checking the choice of columns
head(manaus_rcp85)
#calculates the hypervolume
hv_manaus_rcp85 = hypervolume(manaus_rcp85, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_manaus_rcp85)
#plot hypervolume
#plot.Hypervolume(hv_manaus_rcp85)

#saving values
manaus_hvs = as.data.frame(c(hv_manaus_hist@Volume, hv_manaus_rcp26@Volume, hv_manaus_rcp60@Volume, hv_manaus_rcp85@Volume))

write.csv(manaus_hvs, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/manaus_hvs.csv')

#statistics results#
##hist_x_rcp26
set_manaus_hist_rcp26 = hypervolume_set(hv_manaus_hist, hv_manaus_rcp26, check.memory = FALSE)

ovlp_manaus_hist_rcp26 = hypervolume_overlap_statistics(set_manaus_hist_rcp26)
ovlp_manaus_hist_rcp26 = as.data.frame(ovlp_manaus_hist_rcp26)

hv_manaus_dist_hist_rcp26 = hypervolume_distance(hv_manaus_hist, hv_manaus_rcp26,type='centroid')
hv_manaus_dist_hist_rcp26 = as.data.frame(hv_manaus_dist_hist_rcp26)

cbind_manaus_hist_rcp26 = cbind(ovlp_manaus_hist_rcp26, hv_manaus_dist_hist_rcp26)

##hist_x_rcp60
set_manaus_hist_rcp60 = hypervolume_set(hv_manaus_hist, hv_manaus_rcp60, check.memory = FALSE)

ovlp_manaus_hist_rcp60 = hypervolume_overlap_statistics(set_manaus_hist_rcp60)
ovlp_manaus_hist_rcp60 = as.data.frame(ovlp_manaus_hist_rcp60)

hv_manaus_dist_hist_rcp60 = hypervolume_distance(hv_manaus_hist, hv_manaus_rcp60,type='centroid')
hv_manaus_dist_hist_rcp60 = as.data.frame(hv_manaus_dist_hist_rcp60)

cbind_manaus_hist_rcp60 = cbind(ovlp_manaus_hist_rcp60, hv_manaus_dist_hist_rcp60)


###hist_rcp_85###
set_manaus_hist_rcp85 = hypervolume_set(hv_manaus_hist, hv_manaus_rcp85, check.memory = FALSE)

ovlp_manaus_hist_rcp85 = hypervolume_overlap_statistics(set_manaus_hist_rcp85)
ovlp_manaus_hist_rcp85 = as.data.frame(ovlp_manaus_hist_rcp85)

hv_manaus_dist_hist_rcp85 = hypervolume_distance(hv_manaus_hist, hv_manaus_rcp85,type='centroid')
hv_manaus_dist_hist_rcp85 = as.data.frame(hv_manaus_dist_hist_rcp85)

cbind_manaus_hist_rcp85 = cbind(ovlp_manaus_hist_rcp85, hv_manaus_dist_hist_rcp85)

##
#bind the results
cbind_manaus = cbind(cbind_manaus_hist_rcp26,cbind_manaus_hist_rcp60,cbind_manaus_hist_rcp85)

write.csv(cbind_manaus, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/manaus_ovlp_dist.csv')


####SILVES####
#### SILVES HIST #####
silves_hist = table_pcs[table_pcs$location_scenario=='silves_hist',]
#see column numbers - get PC1:PC4
t(colnames(silves_hist))
#checking the location and the scenario
silves_hist$location_scenario
#selecting the PC's column
silves_hist = silves_hist[,10:13]
#checking the choice of columns
head(silves_hist)
#calculates the hypervolume
hv_silves_hist = hypervolume(silves_hist, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_silves_hist)
#plot hypervolume
#plot.Hypervolume(hv_silves_hist)

#### SILVES rcp 26 #####
silves_rcp26 = table_pcs[table_pcs$location_scenario=='silves_rcp26',]
#see column numbers - get PC1:PC4
t(colnames(silves_rcp26))
#checking the location and the scenario
silves_rcp26$location_scenario
#selecting the PC's column
silves_rcp26 = silves_rcp26[,10:13]
#checking the choice of columns
head(silves_rcp26)
#calculates the hypervolume
hv_silves_rcp26 = hypervolume(silves_rcp26, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_silves_rcp26)
#plot hypervolume
#plot.Hypervolume(hv_silves_rcp26)


#### SILVES rcp 60 #####
silves_rcp60 = table_pcs[table_pcs$location_scenario=='silves_rcp60',]
#see column numbers - get PC1:PC4
t(colnames(silves_rcp60))
#checking the location and the scenario
silves_rcp60$location_scenario
#selecting the PC's column
silves_rcp60 = silves_rcp60[,10:13]
#checking the choice of columns
head(silves_rcp60)
#calculates the hypervolume
hv_silves_rcp60 = hypervolume(silves_rcp60, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_silves_rcp60)
#plot hypervolume
#plot.Hypervolume(hv_silves_rcp60)

#### SILVES rcp 85 #####
silves_rcp85 = table_pcs[table_pcs$location_scenario=='silves_rcp85',]
#see column numbers - get PC1:PC4
t(colnames(silves_rcp85))
#checking the location and the scenario
silves_rcp85$location_scenario
#selecting the PC's column
silves_rcp85 = silves_rcp85[,10:13]
#checking the choice of columns
head(silves_rcp85)
#calculates the hypervolume
hv_silves_rcp85 = hypervolume(silves_rcp85, method = "gaussian")
#summary of the hypervolume
#get_volume(hv_silves_rcp85)
#plot hypervolume
#plot.Hypervolume(hv_silves_rcp85)

#saving values
silves_hvs = as.data.frame(c(hv_silves_hist@Volume, hv_silves_rcp26@Volume, hv_silves_rcp60@Volume, hv_silves_rcp85@Volume))

write.csv(silves_hvs, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/silves_hvs.csv')

#statistics results#
##hist_x_rcp26
set_silves_hist_rcp26 = hypervolume_set(hv_silves_hist, hv_silves_rcp26, check.memory = FALSE)

ovlp_silves_hist_rcp26 = hypervolume_overlap_statistics(set_silves_hist_rcp26)
ovlp_silves_hist_rcp26 = as.data.frame(ovlp_silves_hist_rcp26)

hv_silves_dist_hist_rcp26 = hypervolume_distance(hv_silves_hist, hv_silves_rcp26,type='centroid')
hv_silves_dist_hist_rcp26 = as.data.frame(hv_silves_dist_hist_rcp26)

cbind_silves_hist_rcp26 = cbind(ovlp_silves_hist_rcp26, hv_silves_dist_hist_rcp26)

##hist_x_rcp60
set_silves_hist_rcp60 = hypervolume_set(hv_silves_hist, hv_silves_rcp60, check.memory = FALSE)

ovlp_silves_hist_rcp60 = hypervolume_overlap_statistics(set_silves_hist_rcp60)
ovlp_silves_hist_rcp60 = as.data.frame(ovlp_silves_hist_rcp60)

hv_silves_dist_hist_rcp60 = hypervolume_distance(hv_silves_hist, hv_silves_rcp60,type='centroid')
hv_silves_dist_hist_rcp60 = as.data.frame(hv_silves_dist_hist_rcp60)

cbind_silves_hist_rcp60 = cbind(ovlp_silves_hist_rcp60, hv_silves_dist_hist_rcp60)


###hist_rcp_85###
set_silves_hist_rcp85 = hypervolume_set(hv_silves_hist, hv_silves_rcp85, check.memory = FALSE)

ovlp_silves_hist_rcp85 = hypervolume_overlap_statistics(set_silves_hist_rcp85)
ovlp_silves_hist_rcp85 = as.data.frame(ovlp_silves_hist_rcp85)

hv_silves_dist_hist_rcp85 = hypervolume_distance(hv_silves_hist, hv_silves_rcp85,type='centroid')
hv_silves_dist_hist_rcp85 = as.data.frame(hv_silves_dist_hist_rcp85)

cbind_silves_hist_rcp85 = cbind(ovlp_silves_hist_rcp85, hv_silves_dist_hist_rcp85)

##
#bind the results
cbind_silves = cbind(cbind_silves_hist_rcp26,cbind_silves_hist_rcp60,cbind_silves_hist_rcp85)

write.csv(cbind_silves, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/results/silves_ovlp_dist.csv')



