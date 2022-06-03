library(TPD)
library(dplyr)
library(tidyverse)
library(dslabs)

#import traits table 
traits_table = read.csv('/home/bianca/backup/Moara/pls_attrs_TASK5/pls_attrs.csv', header = TRUE)

#importing data from IPCC model - GFDL_ESM2M -belem

hist_GFDL_ESM2M_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/historical.csv')

rcp26_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp26.csv')

rcp60_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp60.csv')

rcp85_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp85.csv')

#importing data from IPCC model - HadGEM2-ES -belem
hist_HadGEM2_ES_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/historical.csv')

rcp26_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp26.csv')

rcp60_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp60.csv')

rcp85_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp85.csv')

#importing data from IPCC model - IPSL-CM5A-LR - belem

hist_IPSL_CM5A_LR_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/historical.csv')

rcp26_IPSL_CM5A_LR_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp26.csv')

rcp60_IPSL_CM5A_LR_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp60.csv')

rcp85_IPSL_CM5A_LR_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp85.csv')

#importing data from IPCC model - MIROC5 - belem
hist_MIROC5_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/historical.csv')

rcp26_MIROC5_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/rcp26.csv')

rcp60_MIROC5_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/rcp60.csv')

rcp85_MIROC5_belem = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/rcp85.csv')


  #importing data from IPCC model - GFDL_ESM2M -itacoatiara

hist_GFDL_ESM2M_ita = read.csv ('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/historical.csv')

rcp26_GFDL_ESM2M_ita = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp26.csv')

rcp60_GFDL_ESM2M_ita = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp60.csv')

rcp85_GFDL_ESM2M_ita = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp85.csv')

## selecting the last day of GFDL_ESM2M -BELEM

hist_GFDL_ESM2M_belem_lastday = hist_GFDL_ESM2M_belem[38351, 2:2001]  

rcp26_GFDL_ESM2M_belem_lastday = rcp26_GFDL_ESM2M_belem[34333, 2:2001]

rcp60_GFDL_ESM2M_belem_lastday = rcp60_GFDL_ESM2M_belem[34333, 2:2001]

rcp85_GFDL_ESM2M_belem_lastday = rcp85_GFDL_ESM2M_belem[34333, 2:2001]

## selecting the last day of HadGEM2-ES -BELEM
hist_HadGEM2_ES_belem_lastday = hist_HadGEM2_ES_belem[38351, 2:2001]  

rcp26_HadGEM2_ES_belem_lastday = rcp26_HadGEM2_ES_belem[34333, 2:2001]

rcp60_HadGEM2_ES_belem_lastday = rcp60_HadGEM2_ES_belem[34333, 2:2001]

rcp85_HadGEM2_ES_belem_lastday = rcp85_HadGEM2_ES_belem[34333, 2:2001]

## selecting the last day of IPSL-CM5A-LR -BELEM
hist_IPSL_CM5A_LR_belem_lastday = hist_IPSL_CM5A_LR_belem[38351, 2:2001]  

rcp26_IPSL_CM5A_LR_belem_lastday = rcp26_IPSL_CM5A_LR_belem[34333, 2:2001]

rcp60_IPSL_CM5A_LR_belem_lastday = rcp60_IPSL_CM5A_LR_belem[34333, 2:2001]

rcp85_IPSL_CM5A_LR_belem_lastday = rcp85_IPSL_CM5A_LR_belem[34333, 2:2001]

## selecting the last day of MIROC5 -BELEM
hist_MIROC5_belem_lastday = hist_MIROC5_belem[38351, 2:2001]  

rcp26_MIROC5_belem_lastday = rcp26_MIROC5_belem[34333, 2:2001]

rcp60_MIROC5_belem_lastday = rcp60_MIROC5_belem[34333, 2:2001]

rcp85_MIROC5_belem_lastday = rcp85_MIROC5_belem[34333, 2:2001]


## selecting the last day of GFDL_ESM2M - ITA

hist_GFDL_ESM2M_ita_lastday = hist_GFDL_ESM2M_ita[38351, 2:2001] 

rcp26_GFDL_ESM2M_ita_lastday = rcp26_GFDL_ESM2M_ita[34333, 2:2001]

rcp60_GFDL_ESM2M_ita_lastday = rcp60_GFDL_ESM2M_ita[34333, 2:2001]

rcp85_GFDL_ESM2M_ita_lastday = rcp85_GFDL_ESM2M_ita[34333, 2:2001]


# #flipping the table and save for lighter tables - GFDL - belem

hist_GFDL_ESM2M_belem_lastday_flipped = t(hist_GFDL_ESM2M_belem_lastdday)
write.csv(hist_GFDL_ESM2M_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/hist_GFDL_ESM2M_belem_lastday.csv')

rcp26_GFDL_ESM2M_belem_lastday_flipped = t(rcp26_GFDL_ESM2M_belem_lastday)
write.csv(rcp26_GFDL_ESM2M_belem_lastday_flipped, '/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp26_GFDL_ESM2M_belem_lastday.csv')

rcp60_GFDL_ESM2M_belem_lastday_flipped = t(rcp60_GFDL_ESM2M_belem_lastday)
write.csv(rcp60_GFDL_ESM2M_belem_lastday_flipped, '/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp60_GFDL_ESM2M_belem_lastday.csv')

rcp85_GFDL_ESM2M_belem_lastday_flipped = t(rcp85_GFDL_ESM2M_belem_lastday)
write.csv(rcp85_GFDL_ESM2M_belem_lastday_flipped, '/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp85_GFDL_ESM2M_belem_lastday.csv')

# #flipping the table and save for lighter tables - HadGEM2-ES - belem
hist_HadGEM2_ES_belem_lastday_flipped = t(hist_HadGEM2_ES_belem_lastday)
write.csv(hist_HadGEM2_ES_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/hist_HadGEM2_ES_belem_lastday.csv')

rcp26_HadGEM2_ES_belem_lastday_flipped = t(rcp26_HadGEM2_ES_belem_lastday)
write.csv(rcp26_HadGEM2_ES_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp26_HadGEM2_ES_belem_lastday.csv')

rcp60_HadGEM2_ES_belem_lastday_flipped = t(rcp60_HadGEM2_ES_belem_lastday)
write.csv(rcp60_HadGEM2_ES_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp60_HadGEM2_ES_belem_lastday.csv')

rcp85_HadGEM2_ES_belem_lastday_flipped = t(rcp85_HadGEM2_ES_belem_lastday)
write.csv(rcp85_HadGEM2_ES_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp85_HadGEM2_ES_belem_lastday.csv')

# #flipping the table and save for lighter tables - IPSL-CM5A-LR - belem
hist_IPSL_CM5A_LR_belem_lastday_flipped = t(hist_IPSL_CM5A_LR_belem_lastday)
write.csv(hist_IPSL_CM5A_LR_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/hist_IPSL_CM5A_LR_belem_lastday.csv')

rcp26_IPSL_CM5A_LR_belem_lastday_flipped = t(rcp26_IPSL_CM5A_LR_belem_lastday)
write.csv(rcp26_IPSL_CM5A_LR_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp26_IPSL_CM5A_LR_belem_lastday.csv')

rcp60_IPSL_CM5A_LR_belem_lastday_flipped = t(rcp60_IPSL_CM5A_LR_belem_lastday)
write.csv(rcp60_IPSL_CM5A_LR_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp60_IPSL_CM5A_LR_belem_lastday.csv')

rcp85_IPSL_CM5A_LR_belem_lastday_flipped = t(rcp85_IPSL_CM5A_LR_belem_lastday)
write.csv(rcp85_IPSL_CM5A_LR_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp85_IPSL_CM5A_LR_belem_lastday.csv')

# #flipping the table and save for lighter tables - IPSL-CM5A-LR - belem
hist_MIROC5_belem_lastday_flipped = t(hist_MIROC5_belem_lastday)
write.csv(hist_MIROC5_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/hist_MIROC5_belem_lastday.csv')

rcp26_MIROC5_belem_lastday_flipped = t(rcp26_MIROC5_belem_lastday)
write.csv(rcp26_MIROC5_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp26_MIROC5_belem_lastday.csv')

rcp60_MIROC5_belem_lastday_flipped = t(rcp60_MIROC5_belem_lastday)
write.csv(rcp60_MIROC5_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp60_MIROC5_belem_lastday.csv')

rcp85_MIROC5_belem_lastday_flipped = t(rcp85_MIROC5_belem_lastday)
write.csv(rcp85_MIROC5_belem_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp85_MIROC5_belem_lastday.csv')



# #flipping the table and save for lighter tables - GFDL - ita
hist_GFDL_ESM2M_ita_lastday_flipped = t(hist_GFDL_ESM2M_ita_lastday)
write.csv(hist_GFDL_ESM2M_ita_lastday_flipped,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/hist_GFDL_ESM2M_ita_lastday.csv')

rcp26_GFDL_ESM2M_ita_lastday_flipped = t(rcp26_GFDL_ESM2M_ita_lastday)
write.csv(rcp26_GFDL_ESM2M_ita_lastday_flipped, '/home/bianca/back up/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp26_GFDL_ESM2M_ita_lastday.csv')

rcp60_GFDL_ESM2M_ita_lastday_flipped = t(rcp60_GFDL_ESM2M_ita_lastday)
write.csv(rcp60_GFDL_ESM2M_ita_lastday_flipped, '/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp60_GFDL_ESM2M_ita_lastday.csv')

rcp85_GFDL_ESM2M_ita_lastday_flipped = t(rcp85_GFDL_ESM2M_ita_lastday)
write.csv(rcp85_GFDL_ESM2M_ita_lastday_flipped, '/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp85_GFDL_ESM2M_ita_lastday.csv')


#import historical data - belem

hist_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/hist_GFDL_ESM2M_belem_lastday.csv')

hist_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/hist_HadGEM2_ES_belem_lastday.csv')

hist_IPSL_CM5A_LR_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/hist_IPSL_CM5A_LR_belem_lastday.csv')

hist_MIROC5_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/hist_MIROC5_belem_lastday.csv')

#import rcp26 data - belem

rcp26_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp26_GFDL_ESM2M_belem_lastday.csv')

rcp26_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp26_HadGEM2_ES_belem_lastday.csv')

rcp26_IPSL_CM5A_LR_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp26_IPSL_CM5A_LR_belem_lastday.csv')

rcp26_MIROC5_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/rcp26_MIROC5_belem_lastday.csv')

#import rcp60 data - belem

rcp60_GFDL_ESM2M_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp60_GFDL_ESM2M_belem_lastday.csv')

rcp60_HadGEM2_ES_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/HadGEM2-ES/rcp60_HadGEM2_ES_belem_lastday.csv')

rcp60_IPSL_CM5A_LR_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/IPSL-CM5A-LR/rcp60_IPSL_CM5A_LR_belem_lastday.csv')

rcp60_MIROC5_belem = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/MIROC5/rcp60_MIROC5_belem_lastday.csv')

#bind hist data - belem

hist_belem = cbind(hist_GFDL_ESM2M_belem$hist,hist_HadGEM2_ES_belem$X38351, hist_IPSL_CM5A_LR_belem$X38351, hist_MIROC5_belem$X38351)

hist_belem = as.data.frame(hist_belem)

hist_belem_mean = mutate(hist_belem, hist_mean=rowMeans(hist_belem))

#bind rcp26 data - belem
rcp26_belem = cbind(rcp26_GFDL_ESM2M_belem$X34333,rcp26_HadGEM2_ES_belem$X34333, rcp26_IPSL_CM5A_LR_belem$X34333, rcp26_MIROC5_belem$X34333)

rcp26_belem = as.data.frame(rcp26_belem)

rcp26_belem_mean = mutate(rcp26_belem, rcp26_mean=rowMeans(rcp26_belem))

#bind rcp60 data - belem

rcp60_belem = cbind(rcp60_GFDL_ESM2M_belem$X34333,rcp60_HadGEM2_ES_belem$X34333, rcp60_IPSL_CM5A_LR_belem$X34333, rcp60_MIROC5_belem$X34333 )

rcp60_belem = as.data.frame(rcp60_belem)

rcp60_belem_mean = mutate(rcp60_belem, rcp60_mean=rowMeans(rcp60_belem))



#select trait and incorporate at the table - aroot
aroot = as.data.frame(traits_table$aroot)

hist_belem_mean_aroot = mutate(hist_belem_mean, aroot = aroot)

rcp26_belem_mean_aroot = mutate(rcp26_belem_mean, aroot = aroot)

rcp60_belem_mean_aroot = mutate(rcp60_belem_mean, aroot = aroot)


#select trait and incorporate at the table - aleaf

aleaf = as.data.frame(traits_table$aleaf)

hist_belem_mean_aleaf = mutate(hist_belem_mean, aleaf = aleaf)

rcp26_belem_mean_aleaf = mutate(rcp26_belem_mean, aleaf = aleaf)

rcp60_belem_mean_aleaf = mutate(rcp60_belem_mean, aleaf = aleaf)

#select trait and incorporate at the table - awood
awood = as.data.frame(traits_table$awood)

hist_belem_mean_awood = mutate(hist_belem_mean, awood = awood)

rcp26_belem_mean_awood = mutate(rcp26_belem_mean, awood = awood)

rcp60_belem_mean_awood = mutate(rcp60_belem_mean, awood = awood)

#select trait and incorporate at the table - troot
troot = as.data.frame(traits_table$troot)

hist_belem_mean_troot = mutate(hist_belem_mean, troot = troot)

rcp26_belem_mean_troot = mutate(rcp26_belem_mean, troot = troot)

rcp60_belem_mean_troot = mutate(rcp60_belem_mean, troot = troot)

#select trait and incorporate at the table - tleaf
tleaf = as.data.frame(traits_table$tleaf)

hist_belem_mean_tleaf = mutate(hist_belem_mean, tleaf = tleaf)

rcp26_belem_mean_tleaf = mutate(rcp26_belem_mean, tleaf = tleaf)

rcp60_belem_mean_tleaf = mutate(rcp60_belem_mean, tleaf = tleaf)

#select trait and incorporate at the table - twood
twood = as.data.frame(traits_table$twood)

hist_belem_mean_twood = mutate(hist_belem_mean, twood = twood)

rcp26_belem_mean_twood = mutate(rcp26_belem_mean, twood = twood)

rcp60_belem_mean_twood = mutate(rcp60_belem_mean, twood = twood)

#multiple trait mean by area - hist
hist_belem_aroot = mutate(hist_belem_mean_aroot, aroot_area = hist_belem_mean_aroot$hist_mean*hist_belem_mean_aroot$aroot)

hist_belem_aleaf = mutate(hist_belem_mean_aleaf, aleaf_area = hist_belem_mean_aleaf$hist_mean*hist_belem_mean_aleaf$aleaf)

hist_belem_awood = mutate(hist_belem_mean_awood, awood_area = hist_belem_mean_awood$hist_mean*hist_belem_mean_awood$awood)

hist_belem_troot = mutate(hist_belem_mean_troot, troot_area = hist_belem_mean_troot$hist_mean*hist_belem_mean_troot$troot)

hist_belem_tleaf = mutate(hist_belem_mean_tleaf, tleaf_area = hist_belem_mean_tleaf$hist_mean*hist_belem_mean_tleaf$tleaf)

hist_belem_twood = mutate(hist_belem_mean_twood, twood_area = hist_belem_mean_twood$hist_mean*hist_belem_mean_twood$twood)

#multiple trait mean by area - rcp26

rcp26_belem_aroot = mutate(rcp26_belem_mean_aroot, aroot_area = rcp26_belem_mean_aroot$rcp26_mean*rcp26_belem_mean_aroot$aroot)

rcp26_belem_aleaf = mutate(rcp26_belem_mean_aleaf, aleaf_area = rcp26_belem_mean_aleaf$rcp26_mean*rcp26_belem_mean_aleaf$aleaf)

rcp26_belem_awood = mutate(rcp26_belem_mean_awood, awood_area = rcp26_belem_mean_awood$rcp26_mean*rcp26_belem_mean_awood$awood)

rcp26_belem_troot = mutate(rcp26_belem_mean_troot, troot_area = rcp26_belem_mean_troot$rcp26_mean*rcp26_belem_mean_troot$troot)

rcp26_belem_tleaf = mutate(rcp26_belem_mean_tleaf, tleaf_area = rcp26_belem_mean_tleaf$rcp26_mean*rcp26_belem_mean_tleaf$tleaf)

rcp26_belem_twood = mutate(rcp26_belem_mean_twood, twood_area = rcp26_belem_mean_twood$rcp26_mean*rcp26_belem_mean_twood$twood)


#multiply trait mean by area - rcp26

rcp60_belem_aroot = mutate(rcp60_belem_mean_aroot, aroot_area = rcp60_belem_mean_aroot$rcp60_mean*rcp60_belem_mean_aroot$aroot)

rcp60_belem_aleaf = mutate(rcp60_belem_mean_aleaf, aleaf_area = rcp60_belem_mean_aleaf$rcp60_mean*rcp60_belem_mean_aleaf$aleaf)

rcp60_belem_awood = mutate(rcp60_belem_mean_awood, awood_area = rcp60_belem_mean_awood$rcp60_mean*rcp60_belem_mean_awood$awood)

rcp60_belem_troot = mutate(rcp60_belem_mean_troot, troot_area = rcp60_belem_mean_troot$rcp60_mean*rcp60_belem_mean_troot$troot)

rcp60_belem_tleaf = mutate(rcp60_belem_mean_tleaf, tleaf_area = rcp60_belem_mean_tleaf$rcp60_mean*rcp60_belem_mean_tleaf$tleaf)

rcp60_belem_twood = mutate(rcp60_belem_mean_twood, twood_area = rcp60_belem_mean_twood$rcp60_mean*rcp60_belem_mean_twood$twood)

#cbind traits for each condition

#hist
hist = cbind(hist_belem_aroot$aroot_area, hist_belem_aleaf$aleaf_area, hist_belem_awood$awood_area, hist_belem_troot$troot_area, hist_belem_tleaf$tleaf_area, hist_belem_twood$twood_area)
hist = mutate(hist, condition = 'hist')

#rcp26
rcp26 = cbind(rcp26_belem_aroot$aroot_area, rcp26_belem_aleaf$aleaf_area, rcp26_belem_awood$awood_area, rcp26_belem_troot$troot_area, rcp26_belem_tleaf$tleaf_area, rcp26_belem_twood$twood_area)
rcp26 = mutate(rcp26, condition = 'rcp26')

##rcp60
rcp60 = cbind(rcp60_belem_aroot$aroot_area, rcp60_belem_aleaf$aleaf_area, rcp60_belem_awood$awood_area, rcp60_belem_troot$troot_area, rcp60_belem_tleaf$tleaf_area, rcp60_belem_twood$twood_area)
rcp60 = mutate(rcp60, condition = 'rcp60')

#rbind all the conditions

belem = rbind(hist,rcp26,rcp60)

belem_surv = belem %>% filter_at(vars(1:6), any_vars(. > 0))

belem_surv_trees = belem_surv[belem_surv$`traits_table$awood`>0,]

belem_surv_grass = belem_surv[belem_surv$`traits_table$awood`==0,]

#save table
write.csv(belem_surv_trees,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/belem_trees.csv')

write.csv(belem_surv_grass,'/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/belem_grass.csv')





#import table according to location (contain mean values for models and hist data)
aroot_GFDL_ESM2M = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/tabela_traits/aroot_GFDL_ESM2M_belem.csv')

f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

trait = f_minmax(aroot_GFDL_ESM2M$mean_abundance_aroot)
trait = as.data.frame(trait)
species = aroot_GFDL_ESM2M$condition

binded = cbind(trait,species)

TPD_aroot_GFDL_ESM2M = TPDs(species = binded$species , traits = binded$trait, alpha = 1)

plotTPD(TPD_aroot_GFDL_ESM2M)

###PLOTS
#####PLS
#####allocation
#aroot
x = TPD_aroot_GFDL_ESM2M[['data']][["evaluation_grid"]]
y1 = TPD_aroot_GFDL_ESM2M[["TPDs"]][["hist"]]
y2 = TPD_aroot_GFDL_ESM2M[["TPDs"]][["models"]]
y3 = TPD_aroot_GFDL_ESM2M[["TPDs"]][["rcp26"]]
y4 = TPD_aroot_GFDL_ESM2M[["TPDs"]][["rcp60"]]
y5 = TPD_aroot_GFDL_ESM2M[["TPDs"]][["rcp85"]]

b=list(
  family = "Arial, sans-serif",
  size = 12,
  color = "black")
a <- list(title='eixo',
          zeroline = FALSE,
          showline = TRUE,
          ticks='outside',
          showticklabels = TRUE,
          showgrid = FALSE, tickfont=b, range=list(-0.2,1.2))
c<-list(title='eixo',
        zeroline = FALSE,
        showline = TRUE,
        ticks='outside',
        showticklabels = TRUE,
        showgrid = FALSE, tickfont=b, range=list(0.,0.012))

fig_aroot=plot_ly(x=x,y=y1,type="scatter",mode="lines",fill="tozeroy",name ="hist")

fig_aroot <- fig_aroot %>% add_trace(x =x, y = y2, name = 'mean_projections', fill = 'tozeroy')

fig_aroot <- fig_aroot %>% add_trace(x =x, y = y3, name = 'rcp26', fill = 'tozeroy')

fig_aroot <- fig_aroot %>% add_trace(x =x, y = y4, name = 'rcp60.', fill = 'tozeroy')

fig_aroot <- fig_aroot %>% add_trace(x =x, y = y5, name = 'rcp85', fill = 'tozeroy' )

fig_aroot <- fig_aroot %>% layout(xaxis = a,
                                          yaxis = c)
fig_aroot <- fig_aroot %>% layout(showlegend = TRUE)
fig_aroot











# importing traits table
traits_table = read.csv('/home/bianca/backup/Moara/pls_attrs_TASK5/pls_attrs.csv', header = TRUE)

#import lighter tables - GFDL_ESM2M - belem
hist_GFDL_ESM2M_belem2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/hist_GFDL_ESM2M_belem_lastday.csv')

rcp26_GFDL_ESM2M_belem2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp26_GFDL_ESM2M_belem_lastday.csv')

rcp60_GFDL_ESM2M_belem2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp60_GFDL_ESM2M_belem_lastday.csv')

rcp85_GFDL_ESM2M_belem2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/BELEM/GFDL-ESM2M/rcp85_GFDL_ESM2M_belem_lastday.csv')

#import lighter tables - GFDL_ESM2M - itacoatiara
hist_GFDL_ESM2M_ita2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/hist_GFDL_ESM2M_ita_lastday.csv')

rcp26_GFDL_ESM2M_ita2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp26_GFDL_ESM2M_ita_lastday.csv')

rcp60_GFDL_ESM2M_ita2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp60_GFDL_ESM2M_ita_lastday.csv')

rcp85_GFDL_ESM2M_ita2 = read.csv('/home/bianca/backup/Moara/TASK5_CMIP5-ISIMIP2b/ITACOATIARA/GFDL-ESM2M/rcp85_GFDL_ESM2M_ita_lastday.csv')


#turning into df - GFDL_ESM2M - belem
hist_GFDL_ESM2M_belem_df = as.data.frame(hist_GFDL_ESM2M_belem2)

rcp26_GFDL_ESM2M_belem_df = as.data.frame(rcp26_GFDL_ESM2M_belem2)

rcp60_GFDL_ESM2M_belem_df = as.data.frame(rcp60_GFDL_ESM2M_belem2)

rcp85_GFDL_ESM2M_belem_df = as.data.frame(rcp85_GFDL_ESM2M_belem2)

#turning into df - GFDL_ESM2M - ita
hist_GFDL_ESM2M_ita_df = as.data.frame(hist_GFDL_ESM2M_ita2)

rcp26_GFDL_ESM2M_ita_df = as.data.frame(rcp26_GFDL_ESM2M_ita2)

rcp60_GFDL_ESM2M_ita_df = as.data.frame(rcp60_GFDL_ESM2M_ita2)

rcp85_GFDL_ESM2M_ita_df = as.data.frame(rcp85_GFDL_ESM2M_ita2)


#include the column of site/climate condition in the data frame- belem
hist_GFDL_ESM2M_belem = mutate(hist_GFDL_ESM2M_belem_df, local_condition = 'hist_GFDL_ESM2M_belem')

rcp26_GFDL_ESM2M_belem =  mutate(rcp26_GFDL_ESM2M_belem_df, local_condition = 'rcp26_GFDL_ESM2M_belem')

rcp60_GFDL_ESM2M_belem =  mutate(rcp60_GFDL_ESM2M_belem_df, local_condition = 'rcp60_GFDL_ESM2M_belem')

rcp85_GFDL_ESM2M_belem =  mutate(rcp85_GFDL_ESM2M_belem_df, local_condition = 'rcp85_GFDL_ESM2M_belem')

#include the column of site/climate condition in the data frame -ita
hist_GFDL_ESM2M_ita = mutate(hist_GFDL_ESM2M_ita_df, local_condition = 'hist_GFDL_ESM2M_ita')

rcp26_GFDL_ESM2M_ita = mutate(rcp26_GFDL_ESM2M_ita_df, local_condition = 'rcp26_GFDL_ESM2M_ita')

rcp60_GFDL_ESM2M_ita = mutate(rcp60_GFDL_ESM2M_ita_df, local_condition = 'rcp60_GFDL_ESM2M_ita')

rcp85_GFDL_ESM2M_ita = mutate(rcp85_GFDL_ESM2M_ita_df, local_condition = 'rcp85_GFDL_ESM2M_ita')

#selecting the desired functional trait
aroot_trait = traits_table$aroot

#concatenate the traits vector and the abundance vector -GFDL_ESM2M -belem
hist_GFDL_ESM2M_belem_aloc_aroot = cbind(aroot_trait,hist_GFDL_ESM2M_belem)

rcp26_GFDL_ESM2M_belem_aloc_aroot = cbind(aroot_trait,rcp26_GFDL_ESM2M_belem)

rcp60_GFDL_ESM2M_belem_aloc_aroot = cbind(aroot_trait,rcp60_GFDL_ESM2M_belem)

rcp85_GFDL_ESM2M_belem_aloc_aroot = cbind(aroot_trait,rcp85_GFDL_ESM2M_belem)

#concatenate the traits vector and the abundance vector -GFDL_ESM2M - ita
hist_GFDL_ESM2M_ita_aloc_aroot = cbind(aroot_trait,hist_GFDL_ESM2M_ita)

rcp26_GFDL_ESM2M_ita_aloc_aroot = cbind(aroot_trait,rcp26_GFDL_ESM2M_ita)

rcp60_GFDL_ESM2M_ita_aloc_aroot = cbind(aroot_trait,rcp60_GFDL_ESM2M_ita)

rcp85_GFDL_ESM2M_ita_aloc_aroot = cbind(aroot_trait,rcp85_GFDL_ESM2M_ita)

#changing the name of conlumn - GFDL_ESM2M - belem
hist_GFDL_ESM2M_belem_aloc_root = rename(hist_GFDL_ESM2M_belem_aloc_aroot, 'abundance_hist'= `X38351`)

rcp26_GFDL_ESM2M_belem_aloc_root = rename(rcp26_GFDL_ESM2M_belem_aloc_aroot, 'abundance_rcp26'= `X34333`)

rcp60_GFDL_ESM2M_belem_aloc_root = rename(rcp60_GFDL_ESM2M_belem_aloc_aroot, 'abundance_rcp60'= `X34333`)

rcp85_GFDL_ESM2M_belem_aloc_root = rename(rcp85_GFDL_ESM2M_belem_aloc_aroot, 'abundance_rcp85'= `X34333`)

#changing the name of conlumn - GFDL_ESM2M - ita
hist_GFDL_ESM2M_ita_aloc_root = rename(hist_GFDL_ESM2M_ita_aloc_aroot, 'abundance_hist'= `X38351`)

rcp26_GFDL_ESM2M_ita_aloc_root = rename(rcp26_GFDL_ESM2M_ita_aloc_aroot, 'abundance_rcp26'= `X34333`)

rcp60_GFDL_ESM2M_ita_aloc_root = rename(rcp60_GFDL_ESM2M_ita_aloc_aroot, 'abundance_rcp60'= `X34333`)

rcp85_GFDL_ESM2M_ita_aloc_root = rename(rcp85_GFDL_ESM2M_ita_aloc_aroot, 'abundance_rcp85'= `X34333`)



#concatenate tables - GFDL_ESM2M - belem
#tables_concat_GFDL_ESM2M = rbind(hist_GFDL_ESM2M_belem_aloc_root,rcp26_GFDL_ESM2M_belem_aloc_root,
                      #rcp60_GFDL_ESM2M_belem_aloc_root,rcp85_GFDL_ESM2M_belem_aloc_root)
tables_concat_GFDL_ESM2M_models = cbind(rcp26_GFDL_ESM2M_belem_aloc_root,
                                 rcp60_GFDL_ESM2M_belem_aloc_root,rcp85_GFDL_ESM2M_belem_aloc_root)
tables_concat_GFDL_ESM2M_hist = hist_GFDL_ESM2M_belem_aloc_root

#compute the mean abundance of models
tables_concat_GFDL_ESM2M_models$mean_abundance_models  = rowMeans(tables_concat_GFDL_ESM2M_models[,c('abundance_rcp26','abundance_rcp60','abundance_rcp85')])

#concatenate tables - GFDL_ESM2M - ita
tables_concat_GFDL_ESM2M_ita = rbind(hist_GFDL_ESM2M_ita_aloc_root,rcp26_GFDL_ESM2M_ita_aloc_root,
                                 rcp60_GFDL_ESM2M_ita_aloc_root,rcp85_GFDL_ESM2M_ita_aloc_root)


#selecting PLS's with abundance > 0 - GFDL_ESM2M -belem - models
tables_concat_surv_GFDL_ESM2M_models = tables_concat_GFDL_ESM2M_models[tables_concat_GFDL_ESM2M_models$mean_abundance>0.,]

#multiplying abundance and trait_values - models
tables_concat_surv_GFDL_ESM2M_models$abundance_trait = tables_concat_surv_GFDL_ESM2M_models$mean_abundance_models*
  tables_concat_surv_GFDL_ESM2M_models$aroot_trait

#selecting PLS's with abundance > 0 - GFDL_ESM2M -belem - hist
tables_concat_surv_GFDL_ESM2M_hist = tables_concat_GFDL_ESM2M_hist[tables_concat_GFDL_ESM2M_hist$abundance_hist>0.,]

#multiplying abundance and trait_values - hist
tables_concat_surv_GFDL_ESM2M_hist$abundance_trait = tables_concat_surv_GFDL_ESM2M_hist$abundance_hist*
  tables_concat_surv_GFDL_ESM2M_hist$aroot_trait

#selecting PLS's with abundance > 0 - GFDL_ESM2M - ita
tables_concat_surv_GFDL_ESM2M_ita = tables_concat_GFDL_ESM2M_ita[tables_concat_GFDL_ESM2M_ita$abundance>0.,]


#selecting columns


#naming operators - GFDL_ESM2M -belem

aroot_GFDL_ESM2M = tables_concat_surv_GFDL_ESM2M$aroot_trait


abundance_trait_GFDL_ESM2M = aroot_GFDL_ESM2M*abundance_GFDL_ESM2M

local_condition_GFDL_ESM2M = tables_concat_surv_GFDL_ESM2M$local_condition

#naming operators - GFDL_ESM2M -ita

aroot_GFDL_ESM2M_ita = tables_concat_surv_GFDL_ESM2M_ita$aroot_trait

abundance_GFDL_ESM2M_ita = tables_concat_surv_GFDL_ESM2M_ita$abundance

abundance_trait_GFDL_ESM2M_ita = aroot_GFDL_ESM2M_ita*abundance_GFDL_ESM2M_ita

local_condition_GFDL_ESM2M_ita = tables_concat_surv_GFDL_ESM2M_ita$local_condition

#naming operators - GFDL_ESM2M -belem and ita

aroot_GFDL_ESM2M = table_concat$aroot_trait

abundance_GFDL_ESM2M = table_concat$abundance

abundance_trait_GFDL_ESM2M = aroot_GFDL_ESM2M*abundance_GFDL_ESM2M

local_condition_GFDL_ESM2M = table_concat$local_condition

#include the column of trait value * abundance -GFDL_ESM2M -belem
table_abund_GFDL_ESM2M = mutate(tables_concat_surv_GFDL_ESM2M,abundance_trait_GFDL_ESM2M)

#include the column of trait value * abundance -GFDL_ESM2M -ita
table_abund_GFDL_ESM2M_ita = mutate(tables_concat_surv_GFDL_ESM2M_ita,abundance_trait_GFDL_ESM2M_ita)

#include the column of trait value * abundance -GFDL_ESM2M -ita
table_abund_GFDL_ESM2M = mutate(table_concat,abundance_trait_GFDL_ESM2M)

#normalizing the values of abundance - GFDL_ESM2M
f_minmax <- function(x){
  return((x - min(x))/(max(x)-min(x)))
}

##normalizing the values of abundance - GFDL_ESM2M -belem
abundance_norm_GFDL_ESM2M = f_minmax(abundance_trait_GFDL_ESM2M)

##normalizing the values of abundance - GFDL_ESM2M - ita
abundance_norm_GFDL_ESM2M_ita = f_minmax(abundance_trait_GFDL_ESM2M_ita)

##normalizing the values of abundance - GFDL_ESM2M - ita and belem
abundance_norm_GFDL_ESM2M = f_minmax(abundance_trait_GFDL_ESM2M)

#include the column of abundance_norm -GFDL_ESM2M-belem
table_abund_norm_GFDL_ESM2M = mutate(table_abund_GFDL_ESM2M,abundance_trait_norm_GFDL_ESM2M = abundance_norm_GFDL_ESM2M)

#include the column of abundance_norm -GFDL_ESM2M -ita
table_abund_norm_GFDL_ESM2M_ita = mutate(table_abund_GFDL_ESM2M_ita,abundance_trait_norm_GFDL_ESM2M_ita = abundance_norm_GFDL_ESM2M_ita)

#include the column of abundance_norm -GFDL_ESM2M -ita and belem
table_abund_norm_GFDL_ESM2M = mutate(table_abund_GFDL_ESM2M,abundance_trait_norm_GFDL_ESM2M = abundance_norm_GFDL_ESM2M)
###
##### Creating the TPDs (Trait Probability Density) for calculating functional diversity - GFDL_ESM2M

#select local and condition (to be used for comparison) - GFDL_ESM2M - belem
sp_hist_GFDL_ESM2M_belem = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='hist_GFDL_ESM2M_belem']

sp_rcp26_GFDL_ESM2M_belem = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp26_GFDL_ESM2M_belem']

sp_rcp85_GFDL_ESM2M_belem = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp85_GFDL_ESM2M_belem']

#select local and condition (to be used for comparison) - GFDL_ESM2M - ita
sp_hist_GFDL_ESM2M_ita = local_condition_GFDL_ESM2M_ita[local_condition_GFDL_ESM2M_ita=='hist_GFDL_ESM2M_ita']

sp_rcp26_GFDL_ESM2M_ita = local_condition_GFDL_ESM2M_ita[local_condition_GFDL_ESM2M_ita=='rcp26_GFDL_ESM2M_ita']

sp_rcp60_GFDL_ESM2M_ita = local_condition_GFDL_ESM2M_ita[local_condition_GFDL_ESM2M_ita=='rcp60_GFDL_ESM2M_ita']

sp_rcp85_GFDL_ESM2M_ita = local_condition_GFDL_ESM2M_ita[local_condition_GFDL_ESM2M_ita=='rcp85_GFDL_ESM2M_ita']

#select local and condition (to be used for comparison) - GFDL_ESM2M - ita nad belem
sp_hist_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='hist_GFDL_ESM2M_ita']

sp_hist_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='hist_GFDL_ESM2M_belem']

sp_rcp26_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp26_GFDL_ESM2M_ita']

sp_rcp26_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp26_GFDL_ESM2M_belem']

sp_rcp60_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp60_GFDL_ESM2M_ita']

sp_rcp60_GFDL_ESM2M = local_condition_GFDL_ESM2M[local_condition_GFDL_ESM2M=='rcp60_GFDL_ESM2M_belem']

sp_rcp85_GFDL_ESM2M = local_condition_GFDL_ESM2M_ita[local_condition_GFDL_ESM2M_ita=='rcp85_GFDL_ESM2M_ita']



#calculating TPD - GFDL - belem
TPD_aroot_belem_GFDL_ESM2M = TPDs(species = table_abund_norm_GFDL_ESM2M$local_condition , table_abund_norm_GFDL_ESM2M$abundance_trait_norm,alpha=1)
plotTPD(TPD_aroot_belem_GFDL_ESM2M)

#calculating TPD - GFDL - ita
TPD_aroot_ita_GFDL_ESM2M = TPDs(species = table_abund_norm_GFDL_ESM2M_ita$local_condition , table_abund_norm_GFDL_ESM2M_ita$abundance_trait_norm,alpha=1)
plotTPD(TPD_aroot_ita_GFDL_ESM2M)


#calculating TPD - GFDL - ita and belem
TPD_aroot_GFDL_ESM2M = TPDs(species = table_abund_norm_GFDL_ESM2M$local_condition , table_abund_norm_GFDL_ESM2M$abundance_trait_norm,alpha=1)
plotTPD(TPD_aroot_GFDL_ESM2M)




#functional diversity parameters - belem
REND(TPDs = TPD_aroot_belem_GFDL_ESM2M)

#functional diversity parameters - ita
REND(TPDs = TPD_aroot_ita_GFDL_ESM2M)

#functional diversity parameters - belem and ita
REND(TPDs= TPD_aroot_GFDL_ESM2M)

#dissimilarities -belem
dissim(TPD_aroot_belem_GFDL_ESM2M)

#dissimilarities -belem
dissim(TPD_aroot_ita_GFDL_ESM2M)
