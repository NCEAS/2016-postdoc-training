---
title: Quick dive into Python
author: "Julien Brun"
date: "June, 2016"
output: html_document
---


Revised from material prepared by Michael Stealey for OSS 14 and Python documentation.

## Why Python?

Python is a widely used scripting language with a very sleek synthax. Besides the heated debate about comparisons between R and Python for data science, the main reason of this introduction is that soon or later you might end up working with something or receive a processing using Python. In addition, there some area where Python is faster than R, especially with array manipulation. Let's dive!!


# How do I start Python?

## At the command line (shell, terminal, command prompt):

```
python
Python 2.7.10 (default, Oct 23 2015, 19:19:21) 
[GCC 4.2.1 Compatible Apple LLVM 7.0.0 (clang-700.0.59.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.

```
To finish your session type:

```python
quit()
```

Note that you can also use  an end-of-file character (Control-D on Unix-like, Control-Z on Windows) at the primary prompt causes the interpreter to exit with a zero exit status.

##Getting Python
We recommend to install ***IPython*** that offers a more interactive environment with history caching, access to the shell commands and more advanced autocompletion and help among others. It also provides the kernel for using online notebook (another topic). 

To install your IPython (and any other module) we recommand to use **pip**. pip is a package management system used to install and manage software packages. On Unix-like systems use sudo to install packages at the system level:

```
(sudo) pip install ipython
```

See [here](https://pip.pypa.io/en/stable/installing/) if you don't have pip installed.

##Launching IPython
You can launch IPython the same way:

```
ipython
Python 2.7.10 (default, Oct 23 2015, 19:19:21) 
Type "copyright", "credits" or "license" for more information.

IPython 3.1.0 -- An enhanced Interactive Python.
?         -> Introduction and overview of IPython's features.
%quickref -> Quick reference.
help      -> Python's own help system.
object?   -> Details about 'object', use 'object??' for extra details.

In [1]: 
```
Note: you can end your session as previously.

## Through an Integrated Development Environment (IDE)

There are many python oriented IDE out [there](https://wiki.python.org/moin/IntegratedDevelopmentEnvironments). We recommend several:

* [Eclipse](https://eclipse.org/) with the [Pydev](http://www.pydev.org/) module ([see installtion notes](http://www.pydev.org/manual_101_install.html))
* [Spyder](https://github.com/spyder-ide/spyder) which is geared towards the scientific community 
* [pyCharm CE](https://www.jetbrains.com/pycharm/download/)


***On Aurora, you will find both Spyder and Eclipse already installed.***

## Quick note for R users

There are few fundamental differences that a R user starting Python should know:

- Indentation in your code matters in Python; it mostly replaces {} in R
- R Package equivalent is called module. Although the import of the module is pretty similar, in Python modules need to be installed from outside Python
- In Python, ```.``` is an operator (as in other object-oriented programming languages), not a "space filler" like in R. Do not use ```.``` in names! [more here](https://www.codecademy.com/en/forum_questions/5170307264a7402d9a0012f5)
- "<-" does not exists in Python

## More notes for R users
- The indexing in lists, array, ... starts at 0, e.g. 

```python
l = ["a","b","c"]
l[1]
# b
```
- In Python, loops are cool
- In Python, there is no data structure similar to dataframe, you need a specific module called [pandas](http://pandas.pydata.org/pandas-docs/stable/10min.html). However, python has "dictionaries"" that associate "keys" and values.


# Few Words about Python Syntax

## Indentation

**Code blocks are defined by their indentation**. By "code block", I mean functions, if statements, for loops, while loops, and so forth. Indenting starts a block and unindenting ends it. They have no explicit begin or end, and no curly braces to mark where the function code starts and stops. The only delimiter is a colon (:) and the indentation of the code itself.

## What is this ```if __name__=='__main__':``` !?!

This condition allows you to differentiate what is executed when your script is run from the Python Interpreter (command line: python my_script.py) or imported as a module within another script.

When your script is run from the Interpreter ```__name__```, a built-in variable, is set to ```__main__```. However, if a module is being imported from another module, then ```__name__``` instead is set to the module's name.

See [here](http://stackoverflow.com/a/20158605/4668450) for more details 

## Code Style

Check out the [Zen of Python](https://www.python.org/dev/peps/pep-0020/):

```python
import this
```

I recommend also to read the hitchhiker's guide: (http://docs.python-guide.org/en/latest/)

## Script Structure

A Python script should be from top to bottom:

1. Import the modules
2. declare the constants
3. define the Classes and function
4. main code sequence under ```if __name__=='__main__':```

Note functions should be declared in the order of their first use

# Python Basics

##Numbers

The interpreter acts as a simple calculator: you can type an expression and it will write the value. Expression syntax is straightforward: the operators `+`, `-`, `*` and `/` work just like in most other languages (for example, Pascal or C); parentheses (`()`) can be used for grouping. For example:

```python
2 + 2
# 4
50 - 5*6
# 20
(50 - 5.0*6) / 4
# 5.0
8 / 5.0
# 1.6
```

##Numbers: numeric types and operations

Integers (e.g. 2, 4, 20) have type `int` and ones with a fractional part (e.g. 5.0, 1.6) have type ```float```. We will see more about numeric types later.

The return type of division (`/`) operations depends on its operands. If both operands are type `int`, floor division is performed and an `int` is returned. If either operand is a `float`, classic division is performed and a `float` is returned. The `//` operator is also provided for doing floor division no matter what the operands are. The remainder can be calculated with the ```%``` operator:

```python
17 / 3  # int / int -> int  **!!! DIFFERENT FROM R!!!**
# 5
17 / 3.0  # int / float -> float
# 5.666666666666667
17 // 3.0  # explicit floor division discards the fractional part
# 5.0
17 % 3  # the % operator returns the remainder of the division
# 2
5 * 3 + 2  # result * divisor + remainder
# 17
```

##Numbers: power operations
With Python, use the ```**``` operator to calculate powers

```python
5 ** 2  # 5 squared
# 25
2 ** 7  # 2 to the power of 7
# 128
```

##Assigning values to variables
The equal sign (```=```) is used to assign a value to a variable. No result is displayed before the next interactive prompt:

```python
width = 20
height = 5 * 9
width * height
900
```

If a variable is not “defined” (assigned a value), trying to use it will give you an error:

```python
n  # try to access an undefined variable
# Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
# NameError: name 'n' is not defined
```

## Strings

Besides numbers, Python can also manipulate strings, which can be expressed in several ways. They can be enclosed in single quotes (```'...'```) or double quotes (```"..."```) with the same result. ```\``` can be used to escape quotes:

```python
 'spam eggs'  # single quotes
'spam eggs'
 'doesn\'t'  # use \' to escape the single quote...
"doesn't"
 "doesn't"  # ...or use double quotes instead
"doesn't"
 '"Yes," he said.'
'"Yes," he said.'
 "\"Yes,\" he said."
'"Yes," he said.'
 '"Isn\'t," she said.'
'"Isn\'t," she said.'
```

If you don’t want characters prefaced by ```\``` to be interpreted as special characters, you can use **raw strings** by adding an ```r``` before the first quote:

```python
 print 'C:\some\name'  # here \n means newline!
C:\some
ame
 print r'C:\some\name'  # note the r before the quote
C:\some\name
```


##Spanning multiple lines
String literals can span multiple lines. One way is using triple-quotes: ```"""..."""``` or ```'''...'''```. End of lines are automatically included in the string, but it’s possible to prevent this by adding a ```\``` at the end of the line. The following example:

```
print """\
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
"""
```

produces the following (note the initial newline isn't included):

```
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
```


##Indexing strings
Strings can be indexed (subscripted), with the first character having index 0. There is no separate character type; a character is simply a string of size one:

```
 word = 'Python'
 word[0]  # character in position 0
 word[5]  # character in position 5
```

Indices may be negative, to start counting from the right:
```
 word[-1]  # last character
 word[-2]  # second-last character
 word[-6]
```

##Slicing strings
One way to remember how slices work is to think of the indices as pointing between characters, with the left edge of the first character numbered 0. Then the right edge of the last character of a string of n characters has index n, for example:

```
 +---+---+---+---+---+---+
 | P | y | t | h | o | n |
 +---+---+---+---+---+---+
 0   1   2   3   4   5   6
-6  -5  -4  -3  -2  -1
```

The first row of numbers gives the position of the indices 0...6 in the string; the second row gives the corresponding negative indices. The slice from i to j consists of all characters between the edges labeled i and j, respectively.


# Main Data Structures
## Lists
In Python, lists are defined using squared brackets. Elements are separated by commas.

```python
# An empty list
 l = []

# A list of numbers
 my_list_n = [1,2,3,4,5]

# A List of strings
 my_list_s = ['a','b','c','d','e']
```

## Indexing and slicing strings

Like strings (and all other built-in sequence type), lists can be indexed and sliced:

```python

 my_list_n[0]  # indexing returns the item
 my_list_n[-1]
 my_list_n[-3:]  # slicing returns a new list
```
Like strings, lists can be concatenated:

```python
 my_list_n + [6, 7, 8, 9, 10]
```

**Very important: lists are mutable**, i.e. it is possible to change their content:

```python
 my_list_n[0] = 0
 my_list
```
 
Lists can be nested (list of lists):
 

```python
 a = ['a', 'b', 'c']
 n = [1, 2, 3]
 x = [a, n]
 x
 x[0]
 x[0][1]
```

##List methods

**list.append(x)**
Add an item to the end of the list; equivalent to a[len(a):] = [x].

**list.extend(L)**
Extend the list by appending all the items in the given list; equivalent to a[len(a):] = L.

**list.insert(i, x)**
Insert an item at a given position. The first argument is the index of the element before which to insert, so a.insert(0, x) inserts at the front of the list, and a.insert(len(a), x) is equivalent to a.append(x).

**list.remove(x)**
Remove the first item from the list whose value is x. Returns an error if there is no such item.

**list.pop([i])**
Remove the item at the given position in the list, and return it. If no index is specified, a.pop() removes and returns the last item in the list. (The square brackets around the i in the method signature denote that the parameter is optional, not that you should type square brackets at that position. You will see this notation frequently in the Python Library Reference.)

**list.index(x)**
Return the index in the list of the first item whose value is x. Returns an error if there is no such item.

**list.count(x)**
Return the number of times x appears in the list.

**list.sort(cmp=None, key=None, reverse=False)**
Sort the items of the list in place (the arguments can be used for sort customization, see sorted() for their explanation).

**list.reverse()**
Reverse the elements of the list, in place.

## List comprehension

List comprehensions provide a concise way to create lists. Common applications are to make new lists where each element is the result of some operations applied to each member of another sequence or iterable, or to create a subsequence of those elements that satisfy a certain condition.

```python
 squares = [x**2 for x in range(10)]
 squares
```

## Tuples
A tuple consists of a number of values separated by commas and generally surrounded by parentheses. 

```python
 my_tuple = (1,2,3,4,5)
 my_tuple
(1,2,3,4,5)
``` 
Though tuples may seem similar to lists, they are often used in different situations and for different purposes. Tuples are immutable, and usually contain a heterogeneous sequence of elements that are accessed via indexing or unpacking:

```python
 a,b,c,d,e = my_tuple
 a
1
```
Lists are mutable and their elements are usually homogeneous and are accessed by iterating over the list.

## Sets

Python also includes a data type for sets. A set is an unordered collection with no duplicate elements. Basic uses include membership testing and eliminating duplicate entries. Set objects also support mathematical operations like union, intersection, difference, and symmetric difference.

```python
 basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
 fruit = set(basket)               # create a set without duplicates
 fruit
set(['orange', 'pear', 'apple', 'banana'])
```

## Dictionaries 

It is best to think of a dictionary as an unordered set of keys: value pairs, with the requirement that the keys are unique (within one dictionary). Dictionaries are indexed by keys, which can be any immutable type; strings and numbers can always be keys.

```python
 tel = {'jack': 4098, 'sape': 4139}
 tel['guido'] = 4127
 tel
```
or

```python
 dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
{'sape': 4139, 'jack': 4098, 'guido': 4127}
```


## Importing a module

If you want to import a whole module under its namespace:

```python
import pandas
```

If you want to import a module under an alias (other namespace):

```python
import pandas as pd
```
then to use it:

```python
my_dataframe = pd.Dataframe()
```

# More Programmatic Insight


## Flow control

### For loop
Python’s for statement iterates over the items of any sequence (a list or a string), in the order that they appear in the sequence. 

```python
words = ['cat', 'window', 'defenestrate']
for w in words:
	print w, len(w)
```

##Looping through a sequence

When looping through a sequence, the position index and corresponding value can be retrieved at the same time using the `enumerate()` function.

```python
for i, v in enumerate(['tic', 'tac', 'toe']):
	print i, v
```

##Looping through a dictionary

When looping through dictionaries, the key and corresponding value can be retrieved at the same time using the `iteritems()` method.

```python
 knights = {'gallahad': 'the pure', 'bedevere': 'the wise'}
 for k, v in knights.iteritems():
 	print k, v
```



##while loops
While loops can be used to loop through a process until a condition is fulfilled

```python
b = 5 
while b >0:
 	print b
 	b = b - 1
```

##*if ... else* (conditional statement)

```python
 x = int(raw_input("Please enter an integer: "))
Please enter an integer: 42
if x < 0:
    x = 0
    print 'Negative changed to zero'
elif x == 0:
    print 'Zero'
elif x == 1:
    print 'Single'
else:
    print 'More'
```
##elif Statements
There can be zero or more elif parts, and the else part is optional. The keyword ‘elif‘ is short for ‘else if’, and is useful to avoid excessive indentation. An if ... elif ... elif ... sequence is a substitute for the switch or case statements found in other languages.

## *break* and *continue* Statements

*break* can be used to exit a loop on a condition

*continue* can be used to move to the next iteration

## *pass* Statement

The pass statement is just a place holder; it does nothing.  It is used when a statement is required syntactically but the program requires no action. For example: 

```python
def initlog(*args):
    pass   # Remember to implement this!
```


# Functions

## Defining functions

The keyword **def** starts the function declaration, followed by the function name, followed by the arguments in parentheses. Multiple arguments are separated with commas.

```python
def myfunction(param1,param2=0):
	return param1+param2
```
Note here that param2 is given a default value of 0, making the parameter facultative, i.e. ```myfunction(1)``` will work.  

## Documenting functions

You can simply document a Python function by giving it a doc string.

```python
def myfunction(params):
    """Build a connection string from a dictionary of parameters
    Returns string."""
```

# References

## Main tutorials

* [Python Tutorials](https://docs.python.org/2.7/tutorial/)
* [How To Think Like a Computer Scientist](http://openbookproject.net/thinkcs/python/english2e/)
* [Dive into Python](http://www.diveintopython.net)
* [The Hitchhiker's guide to Python](http://docs.python-guide.org/en/latest/)
* [Python Glossary](https://docs.python.org/2/glossary.html#term-generator)

###Scientific Python
* [SciPy.org](http://scipy.org)
* [Ipython](http://ipython.org)
* [NumPy](http://www.numpy.org), [Matplotlib](http://matplotlib.org), [SciPy library](http://scipy.org/scipylib/index.html), [Sympy](http://sympy.org/en/index.html), and [Pandas](http://pandas.pydata.org)
* [Anaconda](https://store.continuum.io/cshop/anaconda/)
* [Canopy](https://www.enthought.com/products/canopy/)

###R vs Python
* The Swarm Lab@NJIT [Round 1](http://www.theswarmlab.com/r-vs-python-round-1/), 
[Round 2](http://www.theswarmlab.com/r-vs-python-round-2/), and [Round 3](http://www.theswarmlab.com/r-vs-python-round-3/)
