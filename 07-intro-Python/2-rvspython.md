---
title: Quick dive into Python
author: "Adapted by Julien Brun from material prepared by Michael Stealey material for the OSS14"
date: "June, 2016"
output: html_document
---

# R versus Python - Round 1

Revised from Michael Stealey material for the OSS14

##1 – Introduction

For this first challenge, we would like to select “Top 25 most violence packed films” in the history of the movie industry. We will show you how to reproduce this graph using Python and how to achieve a similar result with R. We will detail the different steps of the process and provide for each step the corresponding code (red boxes for R, green boxes for Python).

---

##2 – Step by step process

First thing first, let’s set up our working environment by loading some necessary libraries.

###R Code
```
# Load libraries
library(lattice)        # Very versatile graphics package
library(latticeExtra)   # Addition to "lattice" that makes layering graphs a 
# breeze, and I'm a lazy person, so why not
```

###Python Code
```                        
# This starts the IPython Notebook pylab module, useful for plotting and
# interactive scientific computing
%pylab inline
from pandas import read_csv
```

Now let’s load the data for today’s job. The raw data were scraped by Randy (using Python) from www.MovieBodyCounts.com and he generously provided the result of his hard work on FigShare at this address: http://dx.doi.org/10.6084/m9.figshare.889719.

###R Code
```
# Load data into a data frame
body.count.data <- read.csv("http://files.figshare.com/1332945/film_death_counts.csv")
```

###Python Code
```    
# Read the data into a pandas DataFrame
body_count_data = read_csv("http://files.figshare.com/1332945/film_death_counts.csv")
```

For each movie, the data frame contains a column for the total number of on screen deaths (“Body_Count”) and a column for the duration (“Length_Minutes”). We will now create an extra column for the number of on screen deaths per minute of each movie (“Deaths_Per_Minute”)

###R Code
```
# Compute on screen deaths per minute for each movie. 
body.count.data <- within(body.count.data, { 
  Deaths_Per_Minute <- Body_Count / Length_Minutes
  ord <- order(Deaths_Per_Minute, decreasing = TRUE)  # useful later
})
```

###Python Code
```
# Divide the body counts by the length of the film
body_count_data["Deaths_Per_Minute"] = (body_count_data["Body_Count"].apply(float).values /
                                          body_count_data["Length_Minutes"].values)
```

Now we will reorder the data frame by (descending) number of on screen deaths per minute, and select the top 25 most violent movies according to this criterion.

###R Code
```
# Reorder "body.count.data" by (descending) number of on screen deaths per minute
body.count.data <- body.count.data[body.count.data$ord,]

# Select top 25 most violent movies by number of on screen deaths per minute
body.count.data <- body.count.data[1:25,]
```

###Python Code
```
# Only keep the top 25 highest kills per minute films
body_count_data = body_count_data.sort("Deaths_Per_Minute", ascending=False)[:25]

# Change the order of the data so highest kills per minute films are on top in the plot
body_count_data = body_count_data.sort("Deaths_Per_Minute", ascending=True)
```

In Randy’s graph, the “y” axis shows the film title with the release date. We will now generate the full title for each movie following a “Movie name (year)” format, and append it to the data frame.

###R Code
```
# Combine film title and release date into a new factor column with levels
# ordered by ascending violence
body.count.data <- within(body.count.data, {
  Full_Title <- paste0(Film, " (", Year, ")")
  ord <- order(Deaths_Per_Minute, decreasing = TRUE)
  Full_Title <- ordered(Full_Title, levels = rev(unique(Full_Title[ord])))
})
```

###Python Code
```
# Generate the full titles for the movies: movie name (year)
full_title = []

for film, year in zip(body_count_data["Film"].values, body_count_data["Year"].values):
  full_title.append(film + " (" + str(year) + ")")

body_count_data["Full_Title"] = array(full_title)
```

Now we are ready to generate the barchart. We’re going to start with the default options and then we will make this thing look pretty.
