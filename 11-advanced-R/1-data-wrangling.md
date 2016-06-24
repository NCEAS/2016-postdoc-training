# Data wrangling

Data wrangling is the process of converting or mapping data from one "raw" form into another format that allows for more convenient analysis of the data with the help of semi-automated tools. In fact in our data era, a very large amount of time (80-90%) of the scientific worklow is dedicated to extract, clean, transform the raw data to allow the scientist to conduct its analaysis.

Data wrangling helps you to implement the data model you have conceptualize to empower you to do your analaysis. 


## Data wrangling in R

We are going to look into two R packages `tidyr` and `dplyr` that are meant to work together to help you to do data wrangling in R. But before we go intp greater details, it is woth mentioning these packages are meant to leverage the `magrittr` operators that aims to make your code more humans readable.

![Hadley data science workflow](images/data_science_worflow.png)

### magrittr 

**magrittr pipe operator `%>%` helps you to pipes the output of a previous operation as input to the following one**. 

![magrittr](images/magrittr.png) 

The magrittr package, developped by Stefan Milton Bache, offers a set of operators which promote semantics that will improve your code by:

- structuring sequences of data operations left-to-right (as opposed to from the inside and out),
- avoiding nested function calls,
- minimizing the need for local variables and function definitions, and
- making it easy to add steps anywhere in the sequence of operations


### tidyr - strcuture your data

tidyr help you to structure your data in a "tidy" structure. For a dataset in the table format, the underlying data model is that ovbservations are rows and variables the columns. In other words, a dataset is messy or tidy depending on how rows, columns and tables are matched up with observations, variables and types. 

There are four fundamental functions of data tidying in tidyr:

![tidyr RStudio](images/tidyr.png)

- **`gather()`**: takes multiple columns, and gathers them into key-value pairs: it makes “wide” data longer
- **`spread()`**: takes two columns (key & value) and spreads in to multiple columns, it makes “long” data wider
- **`separate()`**: splits a single column into multiple columns
- **`unite()`**: combines multiple columns into a single column

#### => Open the Rscript: data/tidyr-dplyr/2-tidyr.R

### dplyr - transform your data

There are seven fundamental functions of data transformation in dplyr:

- **`select()`**: selecting variables
- **`filter()`**: provides basic filtering capabilities
- **`summarise()`** summarise data by functions of choice
- **`arrange()`** ordering data
- **`join()`** joining separate dataframes
- **`mutate()`** create new variables

Don't forget **`group by`**!! group_by() groups data by categorical levels and can be combine with other functions. We will talk more about this later.

 
## References

- Data wranfgling R cheatsheet: https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
- R for Data Science, H. Wickham: http://r4ds.had.co.nz/introduction.html
- R Programming for Data Science, Roger D. Peng: This book is for sale at http://leanpub.com/rprogramming
- Data Processing with dplyr & tidyr: https://rpubs.com/bradleyboehmke/data_wrangling
- RStudio webinar on Data wrangling: https://www.rstudio.com/resources/webinars/data-wrangling-with-r-and-rstudio/
- magrittr package: https://github.com/smbache/magrittr#----


