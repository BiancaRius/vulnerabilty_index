###########
library(dplyr)
library(data.table)

list_files <- list.files(pattern="\\.csv$") #creates a list of all files with .csv extension in the directory

list_files

read_data <- function(z){
  dat <- fread(z)#, skip = 1, select = 1)
  return(dat[nrow(dat),])#1:(nrow(dat)-1),])
}

datalist <- lapply(list_files, read_data)

hist = as.data.frame(datalist[1])
hist_f = t(hist)
write.csv(hist_f,'hist_lastday.csv')

rcp26 = as.data.frame(datalist[2])
rcp26_f = t(rcp26)
write.csv(rcp26_f, 'rcp26_lastday.csv')

rcp60 = as.data.frame(datalist[3])
rcp60_f = t(rcp60)
write.csv(rcp60_f, 'rcp60_lastday.csv')

rcp85 = as.data.frame(datalist[4])
rcp85_f = t(rcp85)
write.csv(rcp85_f, 'rcp85_lastday.csv')

###########################################










library(tidyverse)
library(data.table)
library(R.utils)

my_f = countLines('/home/bianca/backup/Moara/cmip5_CAETE_DVM2/BELEM/GFDL-ESM2M/historical.csv')

#select the path where your data are
arquivos = list.files(pattern = "*.csv",recursive = TRUE) #recursive indicates that subfolders are considered
tbl_fread <- 
  list.files(pattern = "*.csv",recursive = TRUE) %>% 
  map_df(~fread(.))
data1 = (read.csv(list_files[1]))[38351, 2:2001] 
