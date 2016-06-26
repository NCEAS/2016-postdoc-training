# Script from Hadley Wickahm, for the RStudio webinar Piplines for data analysis
# https://www.rstudio.com/resources/webinars/pipelines-for-data-analysis-in-r/ 

library(tidyr)
library(readr)
library(dplyr, warn.conflicts = FALSE)

# Load the data
tb <- read_csv("tb.csv")
tb

class(tb)
# tbl_df just changes printing method

# To convert this messy data into tidy data
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
