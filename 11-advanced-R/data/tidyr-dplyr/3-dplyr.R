options(digits = 3)
library(dplyr)
library(babynames)

babynames

# Basic verbs ------------------------------------------------------------------

babynames %>% select(-prop)
babynames %>% select(year:n)
# starts_with(), ends_with(), contains()

babynames %>% filter(name == "Hadley")
babynames %>% filter(year == 1900, sex == "F")
babynames %>% filter(year == 2013, sex == "F")

babynames %>%
  mutate(
    first = tolower(substr(name, 1, 1)),
    last = substr(name, nchar(name), nchar(name))
  )

babynames %>%
  arrange(desc(prop))

babynames %>%
  summarise(n = sum(n))

# Group by -----------------------------------------------------------------

babynames %>%
  group_by(name) %>%
  summarise(n = sum(n))
  
babynames %>%
  filter(name %in% c("John", "Mary", "William")) %>%
  group_by(name, sex) %>%
  summarise(n = sum(n))

babynames %>%
  group_by(year, sex) %>%
  mutate(rank = min_rank(desc(n))) %>%
  tail()

# Combining to answer more complex questions -----------------------------------

# How many Hadley's?
babynames %>%
  filter(name == "Hadley") %>%
  group_by(sex) %>%
  summarise(n = sum(n))

# The travesty
library(ggplot2)
babynames %>%
  filter(name == "Hadley") %>%
  ggplot(aes(year, n)) + 
    geom_line(aes(colour = sex))
