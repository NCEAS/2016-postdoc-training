---
layout: lesson
root: ../..
title: Coding best practices and tips
author: "Julien Brun"
date: "June, 2016"
output: ioslides_presentation

---

Coding best practices and tips
===============================

## Scripting languages

Compared to other programming languages (such as C), scripting languages do not require to be compiled to be executable. One consequence is that generally scripts will execute slowler than a compiled executable because they need an interpreter. However, the more natural language oriented syntax make them easier to learn and use.

## Don't start coding without planning!

It is important to stress that scientits write scripts to help them to investigate the scientific question(s) we are trying to answer. Therefore it is important that scripting does not drive our analysis and thinking. We strongly recommend you take the time to plan the steps you need to accomplish to conduct your analysis. Developping the **scientific worklfow** of your analyis will then allow you to develop a **pseudo code** that will help you to narrow down the tasks that need to be accomplished to move further your analaysis.

## Structure of a script

A script can be divided in several sections. Each scripting language as its own syntax and style, but this main blocks are generally accepted:

From the top to the bottom of your script:

>- Comment explaining the **purpose of the script**
- **Attribution**: authors, contributors, date of last update, contact info
- Import of **external modules** / packages
- **Constant** definitions
- **Function** definitions (respecting the order in which they are called)
- **main code** calling the different functions

## Few important principles

>- **Comment your code**. It will allow you to document what your code do both for your collaborators and your future self
- **Use variables and constants** instead of hard links
- Choose **intuitives names for your variable and functions**, not generic. If you store a list of files, dod not use `x` for the variable name, use instead `files`. Even better use `input_files` if you are listing the files you are importing.
- Be consistant in terms of style you use to name your variables, functions, ...
- **Keep it simple (KISS)**. Do not create too complicated statement. Implement your taks in several lines instead of embedding a lot of executions in one line. It will save you time while debugging and make your code more readable to others

## Few important principles

>- **Go modular**! break down taks into small code fragments such as functions. It will make your code reusable for you and others (if well documented). Keep your function simple, they should only implement one or few (realted) tasks
- **Don't Repeat Yourself (DRY)**. If you start copy pasting part of your code changing few parameters => write a function and call it several times with different parameters. Add flow control such as loops and conditions. It will be easier to debug, change and maintain
- **Test your code**. Test your code against values you would expect or computed with another software. Try hedge cases, such as NA, negative values, .... and try to handle errors in your code
- **Iterates with small steps**, implement few changes at the time to your code. Test, fix and move forward!


## Functions

One of the fundamental way of making your code modular and reusable is to create functions that you can call to do a task.

### Defining a function

Is is important to note that The statements in a function definition are not executed as the interpreter first passes over the lines. The function needs to be called for these statement to be exectuted. In other words, if you have a bug in your function statements, but your main code never call this function, the script will run just fine. Only when you call the function you will discover the problem. Keep that in my mind while debugging.

## R function defition
```r
my_function_name <- function(argument1, argument2, opt_arg=default_value) {
    statements
    return(object) # not always necessary
}
```
Note it is specific to R that fuctions are defined using the regular assignment operator `<-`.

## Python function definition
```python

def my_function_name(argument1, argument2, optional_arg=default_value):
	statements
	return object
```
Python uses the `def` keyword to signal the definiton of a function

## Calling a function

### R
```r
my_results <- my_function_name(1,2)

# want to call the fucntion with parameters out of order?
my_results <- my_function_name(argument2=2, argument1=1)
```

### Python
```python
my_results = my_function_name(1,2)

# want to call the fucntion with parameters out of order?
my_results = my_function_name(argument2=2, argument1=1)
```

## ![challenge](images/challengeproblemred_scribble.png) Challenge


1. Write a function that compute the percentage of a number: `n*p/100`
2. Make the ratio factor a argiument so we can also use it to compute 1/1000
3. On the same script write a second function to compute a<sup>2</sup>-b<sup>2</sup>
4. Modify your function to compute the square root: sqrt(a<sup>2</sup>-b<sup>2</sup>). 
5. Find potential values that could make the function to crash and add necessary error handling
6. Comment your functions



## Scope: Global vs. Local Environment

All variables in a program may not be accessible at all locations in that program. This depends on where you have declared a variable.

Variables that are defined inside a function body have a local scope, and those defined outside have a global scope.

This means that local variables can be only be accessed inside the function in which they are declared. Thus, any ordinary assignments done within the function are local and temporary and are lost after exit from the function; whereas global variables can be accessed throughout the program body by all functions.

## ![challenge](images/challengeproblemred_scribble.png) Challenge

Try to predict what will be outputed byt the following:

```r
foo <- function() {
    bar <- 1
}
foo()
bar
```

```r
bar <- 2
foo <- function() {
    bar <- 1
}
foo()
bar
```
## ![challenge](images/challengeproblemred_scribble.png) Challenge
```r
foo <- function() {
    bar <<- 1  #hein?!
}
foo()
bar
```
## One last one:

```r
bar <- "global"
foo <- function(){
    bar <- "in foo"
    baz <- function(){
        bar <- "in baz - before <<-"
        bar <<- "in baz - after <<-"
        print(bar)
    }
    print(bar)
    baz()
    print(bar)
}
```
Although `<<-` is a specificty of R, the general concept of global and local scope is valid for Python and others.

## Local Scope

This also means that there is one more reason to use functions!! All the temporary variables you define in a function are automatically deleted when you exit the function, freeing up the computer memory.


## Note about loading libraries in R

>- First: is a package a library? 
- Not until it is installed on your system using (install.packages("this_awsome_package_I_need")! see [here](http://www.r-bloggers.com/packages-v-libraries-in-r/) for more details.

## Namespace

In R you use the command `library(mypackage)` to load a library. Each library has its own `namespace`. 

For example, if you use `dplyr::union` *dplyr* is the **namespace** and *union* is the **function**. Namespace attribution is a great way to be sure that functions from different packages sharing the same name will not overwritte each others.

## Namespace

However when you load a library, you might have noticed/ignored similar messages:

```r
library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union
```

## ![challenge](images/challengeproblemred_scribble.png) Challenge

1. What does it means?
2. Does the order you use to load library matters in R?
3. How can you check what you are using?


## References

- Introduction to Software Engineering by Jason Coposky: https://github.com/NCEAS/training/blob/master/2014-oss/day-09/IntroductionToSoftwareClass.pdf
- Functional programming in R: http://adv-r.had.co.nz/Functional-programming.html#functional-programming
- Scoping in R: http://adv-r.had.co.nz/Functions.html
- https://www.quora.com/What-is-the-difference-between-programming-languages-markup-languages-and-scripting-languages
- http://stackoverflow.com/questions/17253545/scripting-language-vs-programming-language
- More advanced information about scope and closure in R: https://darrenjw.wordpress.com/2011/11/23/lexical-scope-and-function-closures-in-r/

### R styling
- [A good overview by H. Wickham](http://adv-r.had.co.nz/Style.html) of the best practices regarding best syntax to us in R from Hadley Wickham.
- Standardized comments: https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html

### Python styling
- [the Hitchhiker's guide](http://docs.python-guide.org/en/latest/writing/style/)
- try this from the Python console: 

 ```python
 import this
 ```


