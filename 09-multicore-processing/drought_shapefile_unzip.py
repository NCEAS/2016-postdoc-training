# This Scriprt download an zip archive from the drought monitoring website for the year 2016
# unzip the archive and a all the contained shapefile
#
# Julien Brun, June 2016


# Import the modules
import os
import zipfile
import requests
import multiprocessing

# Set the number of threads
#nb_proc = multiprocessing.cpu_count()/2 #use half of the cores
nb_proc = 4
pool = multiprocessing.Pool(nb_proc)


# set your working directory
path = "~/GitHubnceas/SNAPP/postdoc-training/08-multicore-processing"
data_dir = "~/GitHubnceas/SNAPP/postdoc-training/08-multicore-processing/data/2016/"

# create a data folder in it (handles the case where the folder already exists)
if not os.path.exists(data_dir):
	os.makedirs(data_dir)

# Download the data for 2016
full_url <- "http://droughtmonitor.unl.edu/data/shapefiles_m/2016_USDM_M.zip"
request = requests.get('full_url')

# Extract the shapefiles
request.read().extractall(data_dir)

# If you want to write the file
#output = open("2016_USDM_M.zip", "wb")
#output.write(request.read())
#output.close()

# Create the directory to store the shapefiles
if not os.path.exists(data_dir+"SHP"):
	os.makedirs(data_dir+"SHP")

# list the weekly files
for zip_file in os.listdir(data_dir):
	if zip_file.endswith('.zip'):
        zip_to_extract = zipfile.ZipFile(data_dir + zip_file, 'r')
        zip_to_extract.extractall(data_dir + "SHP")
        zip_to_extract.close()


##############################
# Leveraging multiprocessing #
##############################

# First we need to transform our for loop inta a function
def unzipper(zip_file):
	if zip_file.endswith('.zip'):
        zip_to_extract = zipfile.ZipFile(data_dir + zip_file, 'r')
        zip_to_extract.extractall(data_dir + "SHP")
        zip_to_extract.close()
    else:
    	print("this file is not a zipfile")

# Second we call the fucntion using map from the multiprocessing module
# Create the list of the zipfiles
zip_files = os.listdir(data_dir)

# Call the function
pool.map(unzipper,my_list_of_parameters) #in the example above, filenames



