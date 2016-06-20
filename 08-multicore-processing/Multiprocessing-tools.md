# Optimizing your code

## Where are the bottle necks?


# Tools to use multiple cores 

Well, you are now working on a server, congrats!! so What's the big deal?! Well you have a lot of cores waiting to help you to conduct you analysis. Awesome, well wait... are not scripting languages going through my codes sequentially by default?! Don't tell me I need to rewrite all my scripts!!!!

No, you don't have to. There are low hanging fruits available to you to take advantages of multiple cores in your processing. Any for loop is an opportunity to distribute you work accross multiple cores. In R, any use of the apply family function might be an opportunity of leveraging multiprocessing. How? well as for most of the tasks there are packages and modules available to help you to do so.

## R
To do multiprocessing you need to have multiple cores/CPUs available on you machine. If you do not know how many cores are available to you, you can use this:

```r
library(doParallel)
detectCores()
```
### mclapply 
_Do not work on Windows!!_ [here](https://en.wikipedia.org/wiki/Fork–exec) to know why.

```mclapply``` is the multiple core version of ```lapply```. It means anywhere you are using ```lapply```, you can try to substitute it with ```mclapply```.

```{r}
system.time(lapply(1e6:1e7, sqrt))

system.time(mclapply(1e6:1e7, sqrt, mc.cores = 4))
```

A more serious example:

```{r}
library(doParallel)

# Create a list of squared matrices
mat_list <- lapply(1:500, function(x) matrix(1:x^2, x, x))

# Compute the eigen values
system.time(lapply(mat_list,eigen))
#   user  system elapsed 
# 58.867   1.637  60.602 

# Compute the eigen values using multiple cores
system.time(mclapply(mat_list,eigen,mc.cores=4))
#   user  system elapsed 
# 15.378   3.049  18.470 
```

### foreach

The foreach package provides a new looping construct for executing R code repeatedly. With moderate modification to you code, you can transform a serial execution of a for loop into a parallel execution. Here is a simple example: 

We are going to download the shapefiles produced by the [United States Drought Monitor](http://droughtmonitor.unl.edu) for the year 2016. There is one shapefile produced per week capturing the drought conditions over the contiguous US using a qualitative scale.

![](images/Drought_Monitoring_example.png)

```r
# libraries
#install.packages(downloader)
library(downloader)
library(foreach)
library(doParallel)

# Create the cluster of 4 workers/cores
cl <- makeCluster(4)
registerDoParallel(cl)


# set your working directory
setwd("~/GitHubnceas/SNAPP/postdoc-training/08-multicore-processing")

# create a data folder in it (handles the case where the folder already exists)
dir.create("data", showWarnings = F)

# Download the data for 2016
full_url <- "http://droughtmonitor.unl.edu/data/shapefiles_m/2016_USDM_M.zip"
download(full_url, dest = file.path("data","2016_USDM_M.zip"), mode = "wb")

# unzip the yearly archive
unzip(file.path("data","2016_USDM_M.zip"), exdir="data/2016", overwrite = T)

# list the weekly files
weekly_zip_list <- list.files(path=file.path("data","2016"), 
                              pattern = "*.zip",
                              full.names = TRUE)

# Standard for loop
system.time(
   for(zip_file in weekly_zip_list) {
     unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
   }
)
#   user  system elapsed 
#  0.120   0.052   0.172 

# Foreach way
system.time(
   foreach(f= weekly_zip_list) %do%{
     unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
   }
)
#   user  system elapsed 
#  0.116   0.042   0.159
system.time(
   foreach(f= weekly_zip_list) %dopar%{
     unzip(zip_file, exdir = file.path("data","2016","SHP"), overwrite = TRUE)
   }
)
#   user  system elapsed 
#  0.011   0.001   0.048
}

# Stop the cluster
stopCluster(cl)

```
<img style="float: left;width: 50px;" src="images/challengeproblemred_scribble.png"/>


As a team of 2 take 15min to make this code better adopting the best practices we discussed earlier. Commit your changes
 

## Python

### Multiprocessing module

Simlarly in Python there is a specific module that help to implement [multiprocessing]().

```python
# Import the modules
import os
import requests
import multiprocessing

# Set the number of threads
#nb_proc = multiprocessing.cpu_count()/2 #use half of the cores
nb_proc = 4
pool = multiprocessing.Pool(nb_proc)

# Running a fuction using mulitprocessing
test = pool.map(my_function,my_list_of_parameters) #in the example above, filenames

```

See script in annexe for example. Try the same challenge: Can you improve its syntax?

## General Notes: 
- This implementation is only possible when the iterations in the for loop are independant from each others, meaning there is dependacny of the foloopwing iteration to the result of the preivous one.
- The RAM of the server is shared accross the different processes running, it can be a limitation to the number of cores you can use if you are working with large data (on one machine).
- If you have nested for loops, you generally try to parallelize the outter one
- It is harder to debug parallel execution (for example print statment are not returned). Developp and test your code on a serial version first, then once the code does what you want look into multicores options

## References
### R
- R view: https://cran.r-project.org/web/views/HighPerformanceComputing.html 

- More applied introduction to multiprocessing: http://www.glennklockwood.com/data-intensive/r/parallel-options.html 

- foreach and doParallel: 
 - Getting started with foreach and doParallel: https://cran.r-project.org/web/packages/doParallel/vignettes/gettingstartedParallel.pdf 
 - More info about foreach: https://cran.r-project.org/web/packages/foreach/vignettes/foreach.pdf 
 - Nested for loop: https://cran.r-project.org/web/packages/foreach/vignettes/nested.pdf 

- mclapply: https://stat.ethz.ch/R-manual/R-devel/library/parallel/html/mclapply.html 

- Optimising and benchmarking R code by Hadley Wickham: http://adv-r.had.co.nz/Profiling.html

- HPC taskview on CRAN: http://cran.r-project.org/web/views/ HighPerformanceComputing.html


### Python
- Official documentation: https://docs.python.org/2/library/multiprocessing.html
- Good overview of the different options: http://spartanideas.msu.edu/2014/06/20/an-introduction-to-parallel-programming-using-pythons-multiprocessing-module/
