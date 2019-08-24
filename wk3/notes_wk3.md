# Notes Wk3

Defining a new datatype:

```sml
datatype mytype = TwoInts of int * int
                | Str of string
				| Pizza
```
TwoInts, Str, and Pizza are tags which are called __constructors__.

Constructors can be either a function or a value. It is a function if the variant has `MyConstructor of t` in it, it is a function returning type t.

---

To recover the values of the newly defined type, `mytype`, define a function such as

```sml
fun f x =
    case x of
        Pizza => 3
      | TwoInts(i1, i2) => i1 + i2
      | Str s => String.size s
```

---

How to get value from options using pattern-matching:

Suppose myfunc returns an option (NONE or SOME value), to get its results using pattern-matching:

```
case myfunc(x) of
	NONE => some_val
	SOME z => z
```

---

# Questions:

1. How does a list [1,2,3] map to the constructor x::xs' in the List and Options are Datatypes video?