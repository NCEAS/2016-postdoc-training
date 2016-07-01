# Script from Hadley Wickham, for the RStudio webinar Pipelines for data analysis
# https://www.rstudio.com/resources/webinars/pipelines-for-data-analysis-in-r/ 

##install.packages('dplyr') #uncomment and run if: Error in library(dplyr) : there is no package called ‘dplyr’
library(dplyr)
#install.packages('babynames')
library(babynames)

babynames

# Basic verbs ------------------------------------------------------------------

babynames %>% select(-prop) #selects all but prop column
babynames %>% select(year:n) #selects columns year:n
# starts_with(), ends_with(), contains()

babynames %>% filter(name == "Hadley")
babynames %>% filter(year == 1900, sex == "F")
babynames %>% filter(year == 2013, sex == "F")

babynames %>%
  mutate(
    first = tolower(substr(name, 1, 1)),
    last = substr(name, nchar(name), nchar(name))
  ) #adds columns "first" and "last" to existing table

babynames %>%
  arrange(desc(prop)) #arranges rows in descending order of values in prop column

babynames %>%
  summarise(n = sum(n)) #summarises the n column into single value by function sum

# Group by -----------------------------------------------------------------
# groups a table by one or more variables

babynames %>%
  group_by(name) %>% #group by name column
  summarise(n = sum(n)) #get sum of values for each name
  
babynames %>%
  filter(name %in% c("John", "Mary", "William")) %>% #select these three names
  group_by(name, sex) %>% #group by name and sex
  summarise(n = sum(n)) #get sum of values for each combination of name and sex (based on filter)

babynames %>%
  group_by(year, sex) %>% #group by year and sex
  mutate(rank = min_rank(desc(n))) %>% #create rank column based on minimum rank of n column in descending order
  tail()

# Combining to answer more complex questions -----------------------------------

# How many Hadleys?
babynames %>%
  filter(name == "Hadley") %>% #Or, try it with your own name!
  group_by(sex) %>%
  summarise(n = sum(n))

# The travesty
#install.packages('ggplot2')
library(ggplot2)
babynames %>%
  filter(name == "Hadley") %>% #if you changed the name above, don't forget to change here too
  ggplot(aes(year, n)) + 
    geom_line(aes(colour = sex))
