library(dplyr)
library(data.table)

list_files <- list.files(path = '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/output/',pattern=".csv$") #creates a list of all files with .csv extension in the directory

path = '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/output/'
readdata <- function(x)
{
  f <- file.path(path, x)
  mydata <- fread(f)
  return(mydata)
}
datalist <- lapply(list_files, readdata)

datalist_binded = do.call(rbind, datalist)
datalist_binded


#normalização feita por localidade. Este é o certo?
#afinal a mesma localidade vai ser comparada de acordo com
#os cenários

#seleção por cenário
belem = datalist_binded[datalist_binded$location=='belem']

itacoatiara = datalist_binded[datalist_binded$location=='itacoatiara']

manaus = datalist_binded[datalist_binded$location=='manaus']

silves =datalist_binded[datalist_binded$location=='silves']

#padronização dos dados
#belem
f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

belem$aleaf_s = f_minmax(belem$aleaf)

belem$awood_s = f_minmax(belem$awood)

belem$aroot_s = f_minmax(belem$aroot)

belem$tleaf_s = f_minmax(belem$tleaf)

belem$twood_s = f_minmax(belem$twood)

belem$troot_s = f_minmax(belem$troot)

belem_standard = belem[,7:14]

#itacoatiara
f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

itacoatiara$aleaf_s = f_minmax(itacoatiara$aleaf)

itacoatiara$awood_s = f_minmax(itacoatiara$awood)

itacoatiara$aroot_s = f_minmax(itacoatiara$aroot)

itacoatiara$tleaf_s = f_minmax(itacoatiara$tleaf)

itacoatiara$twood_s = f_minmax(itacoatiara$twood)

itacoatiara$troot_s = f_minmax(itacoatiara$troot)

itacoatiara_standard = itacoatiara[,7:14] 

#manaus
f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

manaus$aleaf_s = f_minmax(manaus$aleaf)

manaus$awood_s = f_minmax(manaus$awood)

manaus$aroot_s = f_minmax(manaus$aroot)

manaus$tleaf_s = f_minmax(manaus$tleaf)

manaus$twood_s = f_minmax(manaus$twood)

manaus$troot_s = f_minmax(manaus$troot)

manaus_standard = manaus[,7:14]

#silves
f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

silves$aleaf_s = f_minmax(silves$aleaf)

silves$awood_s = f_minmax(silves$awood)

silves$aroot_s = f_minmax(silves$aroot)

silves$tleaf_s = f_minmax(silves$tleaf)

silves$twood_s = f_minmax(silves$twood)

silves$troot_s = f_minmax(silves$troot)

silves_standard = silves[,7:14]

#bind the rows of all standardized traits by location

traits_standard = rbind(belem_standard,itacoatiara_standard,manaus_standard,silves_standard)

write.csv(traits_standard, '/home/bianca/backup/Moara/cmip5_CAETE_DVM2/output/traits_standard.csv')

#normalização feita por cenário(acho que é errado)


hist = datalist_binded[datalist_binded$scenario=='hist',]
hist

rcp26 = datalist_binded[datalist_binded$scenario=='rcp26',]
rcp26

rcp60 = datalist_binded[datalist_binded$scenario=='rcp60',]
rcp60

rcp85 = datalist_binded[datalist_binded$scenario=='rcp85',]
rcp85

f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

hist$aleaf_n = f_minmax(hist$aleaf)

hist$awood_n = f_minmax(hist$awood)

hist$aroot_n = f_minmax(hist$aroot)

hist$tleaf_n = f_minmax(hist$tleaf)

hist$twood_n = f_minmax(hist$twood)

hist$troot_n = f_minmax(hist$troot)


rcp26$aleaf_n = f_minmax(rcp26$aleaf)

rcp26$awood_n = f_minmax(rcp26$awood)

rcp26$aroot_n = f_minmax(rcp26$aroot)

rcp26$tleaf_n = f_minmax(rcp26$tleaf)

rcp26$twood_n = f_minmax(rcp26$twood)

rcp26$troot_n = f_minmax(rcp26$troot)


rcp60$aleaf_n = f_minmax(rcp60$aleaf)

rcp60$awood_n = f_minmax(rcp60$awood)

rcp60$aroot_n = f_minmax(rcp60$aroot)

rcp60$tleaf_n = f_minmax(rcp60$tleaf)

rcp60$twood_n = f_minmax(rcp60$twood)

rcp60$troot_n = f_minmax(rcp60$troot)


rcp85$aleaf_n = f_minmax(rcp85$aleaf)

rcp85$awood_n = f_minmax(rcp85$awood)

rcp85$aroot_n = f_minmax(rcp85$aroot)

rcp85$tleaf_n = f_minmax(rcp85$tleaf)

rcp85$twood_n = f_minmax(rcp85$twood)

rcp85$troot_n = f_minmax(rcp85$troot)
