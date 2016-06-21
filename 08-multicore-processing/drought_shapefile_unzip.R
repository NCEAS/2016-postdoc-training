# libraries
#install.packages('downloader')
#install.packages('foreach')
#install.packages('doParallel')
library(downloader)
library(foreach)
library(doParallel)

# Create the cluster of 4 workers/cores
cl <- makeCluster(4)
registerDoParallel(cl)


# set your working directory
setwd("~/GitHubnceas/SNAPP/postdoc-training/08_multicore_processing")

# create a data folder in it (handles the case where the folder already exists)
dir.create("data", showWarnings = F)

# Download the data for 2016
full_url <- "http://droughtmonitor.unl.edu/data/shapefiles_m/2016_USDM_M.zip"
download(full_url, dest = file.path("data","2016_USDM_M.zip"), mode = "wb")

# unzip the yearly archive
unzip(file.path("data","2016_USDM_M.zip"), exdir="data/2016", overwrite = T)

# list the weekly files
weekly_zip_list <- list.files(path=file.path("data","2016"), pattern = "*.zip",full.names = TRUE)

# Standard for loop
for (zip_file in weekly_zip_list) {
  unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
}

# Foreach way
foreach(f= weekly_zip_list) %do%{
  unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
}

foreach(f= weekly_zip_list) %dopar%{
  unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
}

stopCluster(cl)
