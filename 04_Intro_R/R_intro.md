# R

## Data Structures


|     | Homogeneous    | Heterogeneous |
| --- | -------------  | ------------- |
| 1d  | Atomic vector  | List          |
| 2d  | Matrix         | Data frame    |
| nd  | Array          |               |

	
```str()``` is short for *structure* and it gives a compact, human readable description of any R data structure.

### Vector

Vectors have three common properties:

 * Type, typeof(), what it is.
 * Length, length(), how many elements it contains.
 * Attributes, attributes(), additional arbitrary metadata.


#### Atomic vector

You construct an atomic vector using ```c() ```.

All elements of an atomic vector must be the same type, so when you attempt to combine different types they will be **coerced** to the most flexible type. Types from least to most flexible are: logical, integer, double, and character.


#### List

You construct an atomic vector using ```list() ```.

The elements of a list can be of different types. List can be nested (list of lists). 

You can turn a list into an atomic vector with unlist(). If the elements of a list have different types, unlist() uses the same coercion rules as c().

### Matrix and array

Matrices and arrays are created with matrix() and array(), or by using the assignment form of dim().

High-dimensional generalisations:

* *length()* generalises to *nrow()* and *ncol()* for matrices, and *dim()* for arrays.

* *names()* generalises to *rownames()* and *colnames()* for matrices, and *dimnames(*), a list of character vectors, for arrays.

* *c()* generalises to *cbind()* and *rbind()* for matrices, and to *abind()* (provided by the abind package) for arrays. 

### Data frame

You construct an atomic vector using ```data.frame() ```. Note that *data.frame()*’s default behaviour which turns strings into factors. Use ```stringAsFactors = FALSE``` to suppress this behaviour


A data frame is the **most common way of storing data** in R. A data frame is in fact a list of equal-length vectors, meaning the columns can be of different types, but the row are of the same type in each column.





