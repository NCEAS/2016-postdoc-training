---
layout: lesson
root: ../..
title: Quick dive into Python
author: "Julien Brun"
date: "June, 2016"
output: ioslides_presentation
---

# QUICK DIVE INTO PYTHON

# How do I start Python?

## At the command line (shell, terminal, command prompt):

```
python
Python 2.7.10 (default, Oct 23 2015, 19:19:21) 
[GCC 4.2.1 Compatible Apple LLVM 7.0.0 (clang-700.0.59.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```
To finish your session type:

```python
>>> quit()
```
Note that you can also use  an end-of-file character (Control-D on Unix-like, Control-Z on Windows) at the primary prompt causes the interpreter to exit with a zero exit status.

We recommand to install ***IPython*** that offers a more interactive environement with history caching, access to the shell commands and more advanced autocompletion and help among others. It also provide the kernel for using online notebook (another topic). 

To install your IPython (and any other module) we recommand to use **pip**. pip is a package management system used to install and manage software packages. On Unix-like systems use sudo to install packages at the system level:

```
(sudo) pip install ipython
```
See [here](https://pip.pypa.io/en/stable/installing/) if you don't have pip installed.

You can launch ipython the same way:

```python
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

There are many python oriented IDE out [there](https://wiki.python.org/moin/IntegratedDevelopmentEnvironments). We recommand several:

* [Eclipse](https://eclipse.org/) with the [Pydev](http://www.pydev.org/) module ([see installtion notes](http://www.pydev.org/manual_101_install.html))
* [Spyder](https://github.com/spyder-ide/spyder) which is geared towards the scientific community 
* [pyCharm CE](https://www.jetbrains.com/pycharm/download/)


***On Aurora, you will find both Spyder and Eclipse already installed.***


---
# Quick note for R users

There are few fondamentals differences that a R user starting Python should now:

- Indentation in your code matters in Python; it moslty replaces {} in R
- R Package equivalent is called module. Although the import of the module is pretty similar, in Python modules need to be installed from outside Python
- In Python, ```.``` is an operator (as in other object oriented Programming languages), not a "space filler" like in R. Do not use ```.``` in names! [more here](https://www.codecademy.com/en/forum_questions/5170307264a7402d9a0012f5)
- "<-" does not exists in Python
- The indexing in lists, array, ... starts at 0, e.g. 

```python
l = ["a","b","c"]
l[1]
# b
```
- In Python, loops are cool
- In Python, there is no data strucutre similar to dataframe, you need a specific module called [pandas](http://pandas.pydata.org/pandas-docs/stable/10min.html). However you have dictionaries that associate keys and values.


---

# Basics

##Numbers

The interpreter acts as a simple calculator: you can type an expression at it and it will write the value. Expression syntax is straightforward: the operators ```+```, ```-```, ```*``` and ```/``` work just like in most other languages (for example, Pascal or C); parentheses (```()```) can be used for grouping. For example:

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

The integer numbers (e.g. 2, 4, 20) have type ```int```, the ones with a fractional part (e.g. 5.0, 1.6) have type ```float```. We will see more about numeric types later in the tutorial.

The return type of a division (```/```) operation depends on its operands. If both operands are of type ```int```, floor division is performed and an ```int``` is returned. If either operand is a ```float```, classic division is performed and a ```float``` is returned. The ```//``` operator is also provided for doing floor division no matter what the operands are. The remainder can be calculated with the ```%``` operator:

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

With Python, it is possible to use the ```**``` operator to calculate powers

```python
5 ** 2  # 5 squared
# 25
2 ** 7  # 2 to the power of 7
# 128
```

The equal sign (```=```) is used to assign a value to a variable. Afterwards, no result is displayed before the next interactive prompt:

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

There is full support for floating point; operators with mixed type operands convert the integer operand to floating point:

```python
3 * 3.75 / 1.5
# 7.5
7.0 / 2
#3.5
```

**In interactive mode, the last printed expression is assigned to the variable ```_```**. This means that when you are using Python as a desk calculator, it is somewhat easier to continue calculations, for example:

```python
tax = 12.5 / 100
price = 100.50
price * tax
# 12.5625
price + _
# 113.0625
round(_, 2)
# 113.06
```

This variable should be treated as read-only by the user. Don’t explicitly assign a value to it — you would create an independent local variable with the same name masking the built-in variable with its magic behavior.

In addition to ```int``` and ```float```, Python supports other types of numbers, such as ```Decimal``` and ```Fraction```. Python also has built-in support for ```complex numbers```, and uses the ```j``` or ```J``` suffix to indicate the imaginary part (e.g. ```3+5j```).

---

## Strings

Besides numbers, Python can also manipulate strings, which can be expressed in several ways. They can be enclosed in single quotes (```'...'```) or double quotes (```"..."```) with the same result. ```\``` can be used to escape quotes:

```python
>>> 'spam eggs'  # single quotes
'spam eggs'
>>> 'doesn\'t'  # use \' to escape the single quote...
"doesn't"
>>> "doesn't"  # ...or use double quotes instead
"doesn't"
>>> '"Yes," he said.'
'"Yes," he said.'
>>> "\"Yes,\" he said."
'"Yes," he said.'
>>> '"Isn\'t," she said.'
'"Isn\'t," she said.'
```

In the interactive interpreter, the output string is enclosed in quotes and special characters are escaped with backslashes. While this might sometimes look different from the input (the enclosing quotes could change), the two strings are equivalent. The string is enclosed in double quotes if the string contains a single quote and no double quotes, otherwise it is enclosed in single quotes. The ```print``` statement produces a more readable output, by omitting the enclosing quotes and by printing escaped and special characters:

```python
>>> '"Isn\'t," she said.'
'"Isn\'t," she said.'
>>> print '"Isn\'t," she said.'
"Isn't," she said.
>>> s = 'First line.\nSecond line.'  # \n means newline
>>> s  # without print(), \n is included in the output
'First line.\nSecond line.'
>>> print s  # with print, \n produces a new line
First line.
Second line.
```

If you don’t want characters prefaced by ```\``` to be interpreted as special characters, you can use **raw strings** by adding an ```r``` before the first quote:

```python
>>> print 'C:\some\name'  # here \n means newline!
C:\some
ame
>>> print r'C:\some\name'  # note the r before the quote
C:\some\name
```

It as simple to create **unicode sctrings** by adding an ```u``` before the first quote. Unicode has the advantage of providing one ordinal for every character in every script used in modern and ancient texts.

```python
u'Hello World !'
u'Hello World !'
```

String literals can span multiple lines. One way is using triple-quotes: ```"""..."""``` or ```'''...'''```. End of lines are automatically included in the string, but it’s possible to prevent this by adding a ```\``` at the end of the line. The following example:

```
print """\
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
"""
```

produces the following output (note that the initial newline is not included):

```
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
```

Strings can be concatenated (glued together) with the ```+``` operator, and repeated with ```*```:

```
>>> # 3 times 'un', followed by 'ium'
>>> 3 * 'un' + 'ium'
'unununium'
```

Two or more string literals (i.e. the ones enclosed between quotes) next to each other are automatically concatenated.

```
>>> 'Py' 'thon'
'Python'
```

This only works with two literals though, not with variables or expressions:

```
>>> prefix = 'Py'
>>> prefix 'thon'  # can't concatenate a variable and a string literal
  ...
SyntaxError: invalid syntax
>>> ('un' * 3) 'ium'
  ...
SyntaxError: invalid syntax
```

If you want to concatenate variables or a variable and a literal, use ```+```:

```
>>> prefix + 'thon'
'Python'
```

This feature is particularly useful when you want to break long strings:

```
>>>
>>> text = ('Put several strings within parentheses '
            'to have them joined together.')
>>> text
'Put several strings within parentheses to have them joined together.'
```

Strings can be indexed (subscripted), with the first character having index 0. There is no separate character type; a character is simply a string of size one:

```
>>>
>>> word = 'Python'
>>> word[0]  # character in position 0
'P'
>>> word[5]  # character in position 5
'n'
```

Indices may also be negative numbers, to start counting from the right:

```
>>> word[-1]  # last character
'n'
>>> word[-2]  # second-last character
'o'
>>> word[-6]
'P'
```

Note that since -0 is the same as 0, negative indices start from -1.

In addition to indexing, slicing is also supported. While indexing is used to obtain individual characters, slicing allows you to obtain a substring:

```
>>> word[0:2]  # characters from position 0 (included) to 2 (excluded)
'Py'
>>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
'tho'
```

Note how the start is always included, and the end always excluded. This makes sure that ```s[:i] + s[i:]``` is always equal to ```s```:

```
>>> word[:2] + word[2:]
'Python'
>>> word[:4] + word[4:]
'Python'
```

Slice indices have useful defaults; an omitted first index defaults to zero, an omitted second index defaults to the size of the string being sliced.

```
>>>
>>> word[:2]  # character from the beginning to position 2 (excluded)
'Py'
>>> word[4:]  # characters from position 4 (included) to the end
'on'
>>> word[-2:] # characters from the second-last (included) to the end
'on'
```

One way to remember how slices work is to think of the indices as pointing between characters, with the left edge of the first character numbered 0. Then the right edge of the last character of a string of n characters has index n, for example:

```
 +---+---+---+---+---+---+
 | P | y | t | h | o | n |
 +---+---+---+---+---+---+
 0   1   2   3   4   5   6
-6  -5  -4  -3  -2  -1
```

The first row of numbers gives the position of the indices 0...6 in the string; the second row gives the corresponding negative indices. The slice from i to j consists of all characters between the edges labeled i and j, respectively.

For non-negative indices, the length of a slice is the difference of the indices, if both are within bounds. For example, the length of ```word[1:3]``` is 2.

Attempting to use a index that is too large will result in an error:

```
>>>
>>> word[42]  # the word only has 7 characters
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: string index out of range
```

However, out of range slice indexes are handled gracefully when used for slicing:

```
>>>
>>> word[4:42]
'on'
>>> word[42:]
''
```

Python strings cannot be changed — they are immutable. Therefore, assigning to an indexed position in the string results in an error.
The built-in function ```len()``` returns the length of a string:

```
>>> s = 'supercalifragilisticexpialidocious'
>>> len(s)
34
```

---

# Main Data Structures
## Lists
In Python, Lists are defined using squared brackets. Elements are separated by commas.

```python
# An empty list
>>> l = []

# A list of numbers
>>> my_list_n = [1,2,3,4,5]

# A List of strings
>>> my_list_s = ['a','b','c','d','e']
```
Like strings (and all other built-in sequence type), lists can be indexed and sliced:

```python
>>>
>>> my_list_n[0]  # indexing returns the item
1
>>> my_list_n[-1]
5
>>> my_list_n[-3:]  # slicing returns a new list
[3, 4, 5]
```
Like strings, it can be concatenated:
```python
>>> my_list_n + [6, 7, 8, 9, 10]
[1,2,3,4,5,6,7,8,9,10]
```

Very important Lists are mutable, i.e. it is possible to change their content:

```python
>>> my_list_n[0] = 0
>>> my_list
[0,2,3,4,5,6,7,8,9,10]
```
 
Lists can be nested (list of lists):
 

```python
>>> a = ['a', 'b', 'c']
>>> n = [1, 2, 3]
>>> x = [a, n]
>>> x
[['a', 'b', 'c'], [1, 2, 3]]
>>> x[0]
['a', 'b', 'c']
>>> x[0][1]
'b'
```
### Methods
**list.append(x)**
Add an item to the end of the list; equivalent to a[len(a):] = [x].

**list.extend(L)**
Extend the list by appending all the items in the given list; equivalent to a[len(a):] = L.

**list.insert(i, x)**
Insert an item at a given position. The first argument is the index of the element before which to insert, so a.insert(0, x) inserts at the front of the list, and a.insert(len(a), x) is equivalent to a.append(x).

**list.remove(x)**
Remove the first item from the list whose value is x. It is an error if there is no such item.

**list.pop([i])**
Remove the item at the given position in the list, and return it. If no index is specified, a.pop() removes and returns the last item in the list. (The square brackets around the i in the method signature denote that the parameter is optional, not that you should type square brackets at that position. You will see this notation frequently in the Python Library Reference.)

**list.index(x)**
Return the index in the list of the first item whose value is x. It is an error if there is no such item.

**list.count(x)**
Return the number of times x appears in the list.

**list.sort(cmp=None, key=None, reverse=False)**
Sort the items of the list in place (the arguments can be used for sort customization, see sorted() for their explanation).

**list.reverse()**
Reverse the elements of the list, in place.

List comprehensions provide a concise way to create lists. Common applications are to make new lists where each element is the result of some operations applied to each member of another sequence or iterable, or to create a subsequence of those elements that satisfy a certain condition.

```python
>>> squares = [x**2 for x in range(10)]
>>> squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

## Tuples
A tuple consists of a number of values separated by commas and generally surrounded by parentheses. 

```python
>>> my_tuple = (1,2,3,4,5)
>>> my_tuple
(1,2,3,4,5)
``` 
Though tuples may seem similar to lists, they are often used in different situations and for different purposes. Tuples are immutable, and usually contain a heterogeneous sequence of elements that are accessed via indexing or unpacking:

```python
>>> a,b,c,d,e = my_tuple
>>> a
1
```
Lists are mutable, and their elements are usually homogeneous and are accessed by iterating over the list.

## Sets
Python also includes a data type for sets. A set is an unordered collection with no duplicate elements. Basic uses include membership testing and eliminating duplicate entries. Set objects also support mathematical operations like union, intersection, difference, and symmetric difference.

```python
>>> basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
>>> fruit = set(basket)               # create a set without duplicates
>>> fruit
set(['orange', 'pear', 'apple', 'banana'])
```

## Dictionnaries
It is best to think of a dictionary as an unordered set of key: value pairs, with the requirement that the keys are unique (within one dictionary). Dictionaries are indexed by keys, which can be any immutable type; strings and numbers can always be keys.

```python
>>> tel = {'jack': 4098, 'sape': 4139}
>>> tel['guido'] = 4127
>>> tel
{'sape': 4139, 'guido': 4127, 'jack': 4098}
```
or

```python
>>> dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
{'sape': 4139, 'jack': 4098, 'guido': 4127}
```

---
# Few words about Python syntax

## Identation
**Code blocks are defined by their indentation**. By "code block", I mean functions, if statements, for loops, while loops, and so forth. Indenting starts a block and unindenting ends it. They have no explicit begin or end, and no curly braces to mark where the function code starts and stops. The only delimiter is a colon (:) and the indentation of the code itself.

## What is this ```if __name__=='__main__':``` !?!

This condition allows you to differentiate what is executed when you script is ran from the Python Interpreter (command line: python my_script.py) or imported as a module within another script.

When you script is ran from the Interpreter ```__name__```, a built-in variable, is set to ```__main__```. However, if a module is being imported from another module, then ```__name__``` instead is set to the to the module's name.

See [here](http://stackoverflow.com/a/20158605/4668450) for more details 

## Code Style

Check out the [Zen of Python](https://www.python.org/dev/peps/pep-0020/):

```python
import this
```

I recommend also to read the hitcher's guide section about [this] (http://docs.python-guide.org/en/latest/)

## Script Structure

A Python script should be from top to bottom:

1. Import the modules
2. declare the constants
3. define the Classes and function
4. main code sequence under ```if __name__=='__main__':```

Note function should be declared in the order of their first use

## Importing a module

If you want to import a whole modules under its namespace:

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

Import as specific Class of a module in your current name space

```python
from pandas import Dataframe
``` 

Then to use the module:
```python
my_dataframe = Dataframe()
```

Should I care? Yes. To not "pollute" your current namespace and avoid name collision, it is generally recommended to prefer the 2 first. Nice overstack comments on [this](http://stackoverflow.com/questions/9916878/importing-modules-in-python-best-practice) 


---
# More Programmatic Insight


## Flow control

### Loop
#### For
Python’s for statement iterates over the items of any sequence (a list or a string), in the order that they appear in the sequence. 

```python
>>> words = ['cat', 'window', 'defenestrate']
>>> for w in words:
...    print w, len(w)
...
cat 3
window 6
defenestrate 12
```

When looping through a sequence, the position index and corresponding value can be retrieved at the same time using the enumerate() function.

```python
>>> for i, v in enumerate(['tic', 'tac', 'toe']):
...     print i, v
...
0 tic
1 tac
2 toe
```
When looping through dictionaries, the key and corresponding value can be retrieved at the same time using the iteritems() method.

```python
>>> knights = {'gallahad': 'the pure', 'robin': 'the brave'}
>>> for k, v in knights.iteritems():
...     print k, v
...
gallahad the pure
robin the brave
```
To loop over two or more sequences at the same time, the entries can be paired with the zip() function.

```python
>>> questions = ['name', 'quest', 'favorite color']
>>> answers = ['lancelot', 'the holy grail', 'blue']
>>> for q, a in zip(questions, answers):
...     print 'What is your {0}?  It is {1}.'.format(q, a)
...
What is your name?  It is lancelot.
What is your quest?  It is the holy grail.
What is your favorite color?  It is blue.
```

#### While
While loops can be used to loop through a process until a condition is fulfilled


```python
>>> b = 5 
>>> While b >0:
...     print b
...	     b = b - 1
5
4
3
2
1
```
Note it is easy to create an infinite loop with while
---


### *if ... else*

```python
>>> x = int(raw_input("Please enter an integer: "))
Please enter an integer: 42
>>> if x < 0:
...     x = 0
...     print 'Negative changed to zero'
... elif x == 0:
...     print 'Zero'
... elif x == 1:
...     print 'Single'
... else:
...     print 'More'
...
More
```
There can be zero or more elif parts, and the else part is optional. The keyword ‘elif‘ is short for ‘else if’, and is useful to avoid excessive indentation. An if ... elif ... elif ... sequence is a substitute for the switch or case statements found in other languages.

### *break* and *continue* Statements

*break* can be used to exit a loop on a condition

*continue* can be used to move to the next iteration

### *pass* Statement

The pass statement is just a place older, it does nothing.  It is used when a statement is required syntactically but the program requires no action. For example: 

```python
>>> def initlog(*args):
...     pass   # Remember to implement this!
...
```


# Functions

## Function definition

The keyword **def** starts the function declaration, followed by the function name, followed by the arguments in parentheses. Multiple arguments are separated with commas.

```python
def myfunction(param1,param2=0):
	return param1+param2
```
Note here that param2 is given a default value of 0, making the parameter facultative, i.e. ```myfunction(1)``` will work.  

## Function documentation

You can simply document a Python function by giving it a doc string.

```python
def myfunction(params):
    """Build a connection string from a dictionary of parameters
    Returns string."""
```

---
# References

## Main tutorials

* [Python Tutorials](https://docs.python.org/2.7/tutorial/)
* [How To Think Like a Computer Scientist](http://openbookproject.net/thinkcs/python/english2e/)
* [Dive into Python](http://www.diveintopython.net)
* [The Hitcher's guide to Python](http://docs.python-guide.org/en/latest/)
* [Python Glossay](https://docs.python.org/2/glossary.html#term-generator)


## Sources