# Script from Hadley Wickham, for the RStudio webinar Pipelines for data analysis
# https://www.rstudio.com/resources/webinars/pipelines-for-data-analysis-in-r/ 

#install.packages('tidyr') #uncomment and run if: Error in library(tidyr) : there is no package called ‘tidyr’
library(tidyr)
#install.packages('readr')
library(readr)
#install.packages('dplyr')
library(dplyr, warn.conflicts = FALSE)

# set your working directory (folder where this script is found)
#Mac:
setwd('/Users/mccullough/Documents/postdoc-training/postdoc-training/11-advanced-R/data/tidyr-dplyr')
#PC:
#setwd('C:/Users/mccullough/Documents/postdoc-training/postdoc-training/11-advanced-R/data/tidyr-dplyr')

# Load the data
tb <- read_csv("tb.csv")
tb

class(tb)
# tbl_df just changes printing method

# To convert these messy data into tidy data
# we need two verbs. First we need to gather
# together all the columns that aren't variables
tb2 <- tb %>%
  gather(demographic, n, m04:fu, na.rm = TRUE)
tb2

# Then separate the demographic variable into
# sex and age
tb3 <- tb2 %>%
  separate(demographic, c("sex", "age"), 1)
tb3

tb4 <- tb3 %>%
  rename(country = iso2) %>%
  arrange(country, year, sex, age)
tb4
