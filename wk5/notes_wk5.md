
## Type inference
- SML is statically typed: every binding has a type that is determined before the program is run (at compile time)
- Type is are implicitly determined. Do not need to write down types in bindings
- Types are inferred in order they are written. Later types of bindings are inferred based on types of previous bindings
- Polymorphic type bindings are bindings where any types can apply based on how the program is written

## Mutual recursion
- SML has an idiom that allows later functions to be called by functions defined earlier in the program
- This is done by using the `and` keyword.
- Alternatively, one can use pass in the later function as an argument to the earlier function

## Modules for namespace management
- Functions that operate on list are often similar to functions that operate on strings (e.g. length of list vs length of a string)
- In the case of computing the length of these two objects, we'd like the function that calculates this to have similar names, e.g. both should be called "length"
- Using modules helps resolves this problem. Each object can "live" in their respective module with the length operator defined for them.
- Precisely, we can invoke their operators using `List.length` and `String.length` where `List` and `String` are the module names for these two data structures

## Signatures
- Types for modules
- It is a container of the value and function binding types of your module
- Additionally, Signatures is SML's way to "hide" various implementation in your module from the user
- Similar idea to functions and value bindings inside `let` expressions
- We can hide a datatype from the client using the `type` keyword inside the signature for the module. This converts the datatype into an "abstract" type
- Types in Signatures must be MORE SPECIFIC than the types of the bindings defined in the Structures (the module)

## Signatures and equivalence