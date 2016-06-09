# Tips using the R raster package

By default, the raster package stores temporary files in the system temp folder. In a server environment, generally the temp flder is pretty small. We therfore want to specify another location to store these temporary files that can be really big.


```{r  echo=FALSE}
#install.packages("raster")
library(raster)
```

## Knowing your current settings

```{r  echo=TRUE}
rasterOptions()
```

## Temporary directory
### Setting your temp directory
Add these line at the beginning of your script (after loading the raster package)

```{r  echo=FALSE}
# Define your temp folder
my_tmpdir='/home/brun/tmpRaster'

# Create it (handles the case where the folder already exists)
dir.create(my_tmpdir, showWarnings=F)

# Set the raster option to this folder
rasterOptions(tmpdir= my_tmpdir)
```

### Cleaning up your temp directory

At the end of your processing, when your processing is done and you do not need the temporary files, you can add this line to clean up your temp directory

```{r  echo=FALSE}
# remove all temporary files
unlink(my_tmpdir, recursive = TRUE)
```

## Maximum Memory
Often servers have more RAM than desktop. Therefore the mamximum amount of memory that can be allocated to process a raster can be increased. Aurora has a lot of RAM (384GB), so we recommend to use the following settings:

```{r  echo=FALSE}
# Maxixmum size of a raster that can be fully processed in RAM
rasterOtpions(maxmemory =1e+09)
# Maximum number of cells to read/write in a single chunk
rasterOtpions(chunksize=1e+08)
```


## References
* Raster package documentation: https://cran.r-project.org/web/packages/raster/raster.pdf
* Raster Options: http://www.inside-r.org/packages/cran/raster/docs/Options
* Two StackOverflow posts on this topic:
	* http://stackoverflow.com/questions/18955305/setting-an-overwriteable-temporary-file-for-rasters-in-r
	* http://r-forge.r-project.org/forum/forum.php?thread_id=30946&forum_id=995&group_id=302
