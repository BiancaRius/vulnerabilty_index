import glob
import pandas as pd
import os

# import traits table
traits = pd.read_csv('/home/bianca/backup/Moara/pls_attrs_TASK5/pls_attrs.csv')
#select the columns with the traits of interest
traits_table = traits[['tleaf','twood','troot','aleaf','awood','aroot']]
#print columns name:
for col in traits_table.columns:
    print(col)


#creates a function to open the files of interest (hist/rcps) considering each experiment location
def create_csv(folder):
    
    df = pd.DataFrame() #creates an empty data frame to be filled with data
    
    #loop to get the the files
    #{folder} indicates wich location will be got
    # f"" indicates that a string will be used together with an object
    # recursive = True is used to access folders inside the main folder
    # ** glob library feature to access all folders
    for f in glob.glob(f"input/{folder}/**/hist_lastday.csv", recursive = True):
    
    #read the files of interest
        df_hist = pd.read_csv(f)

    #exclude the 1st column and the 1st line
        df_area = df_hist.iloc[1:, -1]
    #bind files correspondent to the four models for each location 
        df = pd.concat([df, df_area], axis = 1)
    # transforms df from objetc to float in order to make math operations 
        df = df.astype(float)
    # creates the column 'mean' and calculates the mean of rows 
        df['mean'] = df.mean(axis = 1)
    # exlude the rows lower than 0 # .index maintain the original index
        df = df.drop(df[df['mean'] <= 0].index)
    #write the csv file only considering the 'mean' column/ .lower = lower case
        df.to_csv(f"output/{folder.lower()}_mean_hist.csv", index = False, columns = ['mean'])

#list all the diretories inside input folder 
folders = os.listdir(f"{os.getcwd()}/input")
 
#loop to write all the csv files through calling the function create_csv
for folder in folders:
    create_csv(folder)
