###########################################################################################
# R data wrangling with Zillow housing data
# Date modified: 7-5-16
# Authors: Julien Brun (brun@nceas.ucsb.edu) and Ian McCullough (imccullough@bren.ucsb.edu)
###########################################################################################

# R packages
library(readr)
library(tidyr)
library(dplyr)

# Set your working directory (contains folders with necessary data)
#setwd("/Users/brun/Data/Zillow")
setwd('/Users/mccullough/Documents/postdoc-training/postdoc-training/11-advanced-R/data/Zillow')

# read the data ----
# data source: Zillow : http://www.zillow.com/research/data/
# Listing Price
price_listing_median <- read_csv("Zip_MedianListingPrice_AllHomes.csv")
View(price_listing_median)

# Sale price
price_sale_median <- read_csv("Zip_MedianSoldPrice_AllHomes.csv")
View(price_sale_median)

###### Main program ######
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

# concatentate columns to create common column on which to perform join
price_sale3$joinfield <- paste0(price_sale3$RegionName,'-',price_sale3$City,'-',price_sale3$year,'-',price_sale3$month)
price_listing3$joinfield <- paste0(price_listing3$RegionName,'-',price_listing3$City,'-',price_listing3$year,'-',price_listing3$month)

# generate final table and calculate difference between list and sale price
final_table <- left_join(price_sale3, price_listing3, by='joinfield')
final_table <- na.omit(final_table)
final_table$CostDiff <- final_table$price_list_med - final_table$price_sale_med

#### plot time series of median list price for Santa Barbara County ####
# subset final table to extract only Santa Barbara County data
SB_subset <- subset(final_table, CountyName.x == 'Santa Barbara')

# Make numeric year column (had been automatically converted to character format)
SB_subset$Year <- as.numeric(SB_subset$year.x)

# create basic plots of list price
plot(price_list_med ~ Year, data = SB_subset, type='l',
     main = 'Median List Price for Houses in Santa Barbara County, CA',
     xlab = 'Year', ylab = 'Median List Price ($)', xaxt='n', ylim=c(1e5,5e6))
axis(side=1,at=c(2013,2014,2015,2016), tick=T) # having suppressed xaxis with xaxt='n', we create our own axis with only the whole numbered years

boxplot(price_list_med ~ Year, data = SB_subset,
        main = 'Median List Price for Houses in Santa Barbara County, CA',
        xlab = 'Year', ylab = 'Median List Price ($)', ylim=c(1e5,5e6))

# create basic plots of sale price
plot(price_sale_med ~ Year, data = SB_subset, type='l',
     main = 'Median Sale Price for Houses in Santa Barbara County, CA',
     xlab = 'Year', ylab = 'Median Sale Price ($)', xaxt='n', ylim=c(1e5,5e6))
axis(side=1,at=c(2013,2014,2015,2016), tick=T)

boxplot(price_sale_med ~ Year, data = SB_subset,
        main = 'Median Sale Price for Houses in Santa Barbara County, CA',
        xlab = 'Year', ylab = 'Median List Price ($)', ylim=c(1e5,5e6))
