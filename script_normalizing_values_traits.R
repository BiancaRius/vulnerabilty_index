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
