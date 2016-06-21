# Coding best practices and tips

## Scripting languages

Compared to other programming languages (such as C), scripting languages do not require to be compiled to be executable. One consequence is that generally scripts will execute slowler than a compiled executable because they need an interpreter. 

## Don't start coding without planning!

It is important to stress that scientits write scripts to help them to investigate the scientific question(s) we are trying to answer. Therefore it is important that scripting does not drive our analysis and thinking. We strongly recommend you take the time to plan the steps you need to accomplish to conduct your analysis. Developping the **scientific worklfow** of your analyis will then allow you to develop a **pseudo code** that will help you to narrow down the tasks that need to be accomplished to move further your analaysis.

## Few important principles

* **Comment your code**. It will allow you to document what your code do for your collaborators and your future self
* **Use variables** instead of hard links
* Choose **names for your variable and functions that are explicit** and not generic. if you store a list of files, dod not use ```x``` for the variable name, use instead ```files```. Even better use ```input_files``` if you are listing the files you areimporting in your code.
* **Keep it simple (KISS)**. Do not create too complicated statement. Do it in several lines instead of embedding a lot of executions in one line. It will save you time while debugging and make your code more readable to others
* **Go modular**! break down taks into samll code fragments such as functions. It will make your code reusable for you and others (if well documented). Keep your function simple, they should only do few (if possible realted) tasks
* **Don't Repeat Yourself (DRY)**. If you start copy pasting part of your code changing few parameters => write a function and call it several times with different parameters. Add flow control such as loops and conditions. It will be easier to change and maintain
* **Test your code**. Try hedge cases, such as NA, negative values, ....
* **Iterates with small steps**, implement few changes at the time


## Functions

One of the fundamental way of making your code modular and reusable is to create functions that you can call to do a task.

### Global vs. local variables





# R styling
[A good overview](http://adv-r.had.co.nz/Style.html) of the best practices regarding best syntax to us in R from Hadley Wickham.

# Python styling


## Sources
- Introduction to Software Engineering by Jason Coposky: https://github.com/NCEAS/training/blob/master/2014-oss/day-09/IntroductionToSoftwareClass.pdf
- https://www.quora.com/What-is-the-difference-between-programming-languages-markup-languages-and-scripting-languages
- http://stackoverflow.com/questions/17253545/scripting-language-vs-programming-language