# data source: Zillow : http://www.zillow.com/research/data/

library(readr)
library(tidyr)
library(dplyr)

#setwd("/Users/brun/Data/Zillow")
setwd('/Users/mccullough/Documents/postdoc-training/postdoc-training/11-advanced-R/data/Zillow')

# read the data ----
# Listing Price
price_listing_median <- read_csv("Zip_MedianListingPrice_AllHomes.csv")
price_listing_median

# Sale price
price_sale_median <- read_csv("Zip_MedianSoldPrice_AllHomes.csv")
price_sale_median

colnames(price_listing_median)
colnames(price_sale_median)

ls()

# Listed price ----

# To convert these messy data into tidy data
# we need two verbs. First we need to gather
# together all the columns that aren't variables
price_listing2 <- price_listing_median %>%
  gather(date, price_list_med, 7:83, na.rm = TRUE)
price_listing2

# Then separate the date variable into
# year and month
price_listing3 <- price_listing2 %>%
  separate(date, c("year", "month"), "-")
price_listing3

# Sale Price ----
cols <- c(1:7, 173:249) # correspond to all desired columns
price_sale_truncate <- price_sale_median[,cols]

# gather all columns that aren't variables
price_sale2 <- price_sale_truncate %>% 
  gather(date, price_sale_med, 8:84, na.rm = TRUE)
price_sale2

# Then separate the date variable into
# year and month
price_sale3 <- price_sale2 %>%
  separate(date, c("year", "month"), "-")
price_sale3

#### join list price and sale price tables ####
#summarise(price_listing3)

# concatentate year and month column to create yearmonth column on which to perform join
price_sale3$yearmonth <- 
price_listing3$yearmonth <- 