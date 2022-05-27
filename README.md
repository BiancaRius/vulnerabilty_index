# vulnerabilty_index
Repo that store script to calculates functional diversity to be included in a socio-climatic vulnerability index

File description:

1)open_table_select_lastday.R

  open original tables,select the and save the lastday for all the scenarios
  
2)script_open_tables_auto.ipynb
  
   a jupyter noteebook file that automatizes opening the folder of all localities, calculates thr mean for
   all model in each scenario. After, bind the traits table in order to calculates the trait values for each PLS
   considering their amount of occurence area. Include columns for each trait*area. Select only the rows with mean >0
   i.e. only the surviving PLS. Save sheet for each location.
