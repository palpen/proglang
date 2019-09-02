(*
Coursera Programming Languages, Part A
Homework 3
Author: Palermo Penano
*)

(* Part 1 *)

exception NoAnswer

(* 1 *)
val only_capitals = List.filter (fn x => Char.isUpper (String.sub (x,0)))

(* 2 *)
val longest_string1 = List.foldl (fn (cur,a) => if String.size a < String.size cur
                                                then cur
                                                else a) ""

(* 3 *)
val longest_string2 = List.foldl (fn (cur,a) => if String.size a <= String.size cur
                                                then cur else a) ""
(* Explanation:
- Type of List.foldl: fn : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
- It takes a function of type ('a * 'b -> 'b) as an input
- and returns a function of type 'b -> ('a list -> 'b)
- The input of List.foldl above is (fn (cur,a) => ...)
- This returns the function 'b -> ('a list -> 'b) where 'b in this case is a string
- Finally, the function List.foldl (fn (cur,a) => ...) "" is type 'a list -> 'b
 *)

(* 4 *)
fun longest_string_helper f =
    List.foldl (fn (cur,a) => if f (String.size cur, String.size a)
                              then cur else a) ""
val longest_string3 = longest_string_helper (fn (a,b) => a>b)
val longest_string4 = longest_string_helper (fn (a,b) => a>=b)

(* 5 *)
val longest_capitalized = longest_string1 o only_capitals

(* 6 *)
val rev_string = implode o rev o explode

(* 7 *)
fun first_answer f s =
    case s of
        [] => raise NoAnswer
      | h::t  => case f h of
                     NONE => first_answer f t
                  |  SOME i => i

(* 8 *)
fun all_answers f s =
    let
        fun helper(s,acc) =
            case s of
                [] => SOME acc
              | h::t => case f h of
                            NONE => NONE
                          | SOME i => helper(t,acc@i)
    in
       helper(s,[])
    end

(* Part 2 *)
datatype valu = Const of int
	            | Unit
	            | Tuple of valu list
	            | Constructor of string * valu

datatype pattern = Wildcard
		             | Variable of string
		             | UnitP
		             | ConstP of int
		             | TupleP of pattern list
		             | ConstructorP of string * pattern


fun g f1 f2 p =
    let
	      val r = g f1 f2
    in
	      case p of
            Wildcard          => f1 ()
          | Variable x        => f2 x
	        | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	        | ConstructorP(_,p) => r p
	        | _                 => 0
    end

(*
Example of pattern types:
TupleP [Wildcard, Variable "s", TupleP [Wildcard]];
ConstructorP ("ccc", Wildcard)

Examples of valu types:
Constructor ("ccccc", Const 7);

Example usage of g:
g (fn ()=> 1) (fn (x:string) => 1) Wildcard = 1;
g (fn ()=> 1) (size) (Variable "ccc") = 3;
g (fn ()=> 1) (size) UnitP = 0;
g (fn ()=> 1) (size) ConstP = 0;
val a = TupleP [Wildcard, Variable "s"];
g (fn ()=> 1) (size) a = 2;
*)

(* 9 *)
val count_wildcards = g (fn () => 1) (fn x => 0)
val count_wild_and_variable_lengths = g (fn () => 1) (String.size)
fun count_some_var (s, vp) =
    g (fn () => 0) (fn x => if x = s then 1 else 0) vp

(* 10 *)
fun get_var_strings p =
    case p of
        Variable x => [x]
      | TupleP ps => List.foldl (fn (p', acc) => (get_var_strings p') @ acc) [] ps
      | ConstructorP (_,p) => get_var_strings p
      | _ => []

fun contains_duplicates (sl: string list) =
    let
        fun aux (l,acc) =
            case l of
                [] => false
              | h::t => List.exists (fn x: string => x=h) acc
                        orelse aux (t,h::acc)
    in
        aux (sl,[])
    end

val check_pat = not o contains_duplicates o get_var_strings


(* 11 *)
fun match (v,p) =
    case (v,p) of
       (_, Wildcard) => SOME []
     | (c, Variable x) => SOME [(x, c)]
     | (Unit, UnitP) => SOME []
     | (Const i, ConstP ii) => if i==ii then SOME [] else NONE
     | (Tuple vl, TupleP ps) => if length vl = length ps
                                then let val pairs = ListPair.zip (vl,ps)
                                     in all_answers match pairs
                                     end
                                else NONE
     | (Constructor(s1,v), ConstructorP(s2,p)) => if s1 = s2
                                                  then match (v,p)
                                                  else NONE
     | _ => NONE

(* 12 *)
(* How to handle exceptions: e1 handle exn => e2 *)
fun first_match v lp = (* v*lp -> (string * valu) list option *)
    SOME (first_answer (fn p => match(v,p)) lp) handle NoAnswer => NONE
