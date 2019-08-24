
https://courses.cs.washington.edu/courses/cse341/04wi/lectures/03-ml-functions.html

* All values in ML are first-class.
* __Functions are values__. All values can be bound to names. Therefore, functions can be bound to names, which evaluate to their bound value exactly the same way that any other name evaluates:

- val addOne = fn x => x + 1;
val addOne = fn : int -> int
- addOne;
val it = fn : int -> int

Since it is so common to bind function values to names, ML has syntactic sugar for function declarations:

- fun addOne x = x + 1;
val addOne = fn : int -> int
Notice that SML/NJ echoes the desugared form of the val declaration. The two syntactic forms are semantically equivalent in every way.

# Map and filter types
* Map type: ('a -> 'b) * 'a list -> 'b list
* Filter type: ('a -> bool) * 'a list -> 'a list

# Return type in SML REPL
	* t1 -> t2 -> t3 is always read as t1 -> (t2 -> t3)
	* t1 is a function that returns a function of type t2 ->t3

# Using print statements for debugging
	* See Closures and recomputation video at around 5 minute mark
	```
	(print i; e1)
	```
	* Evaluate `print i` then throw away the result, then evaluate e1
	* More generally: `e0;e1` where e0 and e1 are any expressions

# Function composition and handling exceptions
* See Closure idiom: Combining Functions around 8:30 mark
* `fun backup2 (f,g) = fn x => f x handle _ => g x`

# Currying and uncurrying
	* Suppose function f is an uncurried function of two args: f(x,y). To curry this function do `fun curry f x y = f (x,y)`
	* Alternatively, suppose f is a curried function but we want to uncurry it. To do this, `fun uncurry f (x,y) = f x y`


# Questions
* What is a closure?
	* The pair of "things" associated with a function: it's code and the environment in which it is defined

