(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val test10 = only_capitals ["A","B","C"] = ["A","B","C"]
val test11 = only_capitals ["Aaa","bbb","C"] = ["Aaa","C"]
val test12 = only_capitals [] = []
val test13 = only_capitals ["bbb"] = []

val test20 = longest_string1 ["A","bc","C"] = "bc"
val test21= longest_string1 ["A","bc","aa","C"] = "bc"
val test22 = longest_string1 [] = ""

val test30 = longest_string2 ["A","bc","C"] = "bc"
val test31= longest_string2 ["A","bc","aa","C"] = "aa"

val test4a = longest_string3 ["A","bc","C"] = "bc"
val test4b = longest_string4 ["A","B","C"] = "C"

val test50 = longest_capitalized ["A","bc","Cc"] = "Cc"
val test51 = longest_capitalized [] = ""

val test6 = rev_string "abc" = "cba"

val test70 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test71 = ((first_answer (fn x => if x > 10 then SOME x else NONE) [1,2,3]); false) handle NoAnswer => true

val cond0 = fn x => if x = 1 then SOME [x] else NONE
val test80 = all_answers (cond0) [2,3,4,5,6,7] = NONE
val cond1 = fn x => if x > 1 then SOME [x] else NONE
val test81 = all_answers (cond1) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]
val test82 = all_answers (cond1) [] = SOME []

val test9a = count_wildcards Wildcard = 1
val test9b0 = count_wild_and_variable_lengths (Variable("a")) = 1
val a = TupleP [Wildcard, Variable "sss", Wildcard, Wildcard, Wildcard];
val test9b1 = count_wild_and_variable_lengths a = 7
val test9c = count_some_var ("x", Variable("x")) = 1

val test100 = check_pat (Variable("x")) = true
val test101 = check_pat (Variable("")) = true
val a = TupleP [Wildcard, Variable "ss", Variable "sss", Variable "ss"];
val test102 = check_pat (a) = false
val aa = TupleP [Wildcard, Variable "sss", Variable "ss"];
val test103 = check_pat (aa) = true
val test104 = check_pat (ConstructorP ("hi",TupleP[Variable "x",Variable "x"])) = false
val test105 = check_pat (ConstructorP ("hi",TupleP[Variable "x",ConstructorP ("yo",TupleP[Variable "x",UnitP])])) = false

val test110 = match (Const(1), UnitP) = NONE
val test111 = match (Const 1, Variable "x") = SOME [("x", Const 1)]
val a = Tuple [Const 1, Const 2]
val b = TupleP [Variable "x", Variable "y"]
val a1 = [Const 1, Const 2]
val b1 = [Variable "x", Variable "y"]
val test112 = match (a,b)

val test120 = first_match Unit [UnitP] = SOME []
val lp = [Variable "x", Wildcard];
val test121 = first_match (Const 1) lp = SOME [("x", Const 1)]
val test122 = first_match (Const 1) [] = NONE

