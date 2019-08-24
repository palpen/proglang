(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

(*
val test10 = all_except_option ("a", ["a","b","c","d"])  (*should return [b,c,d]*)
val test11 = all_except_option ("a", ["b","c","a","d"])  (*should return [b,c,d]*)
val test12 = all_except_option ("a", ["b","c","d"])  (*should return NONE*)
 *)

(*
val test20 = get_substitutions1 ([], "foo") (*should return []*)
val test21 = get_substitutions1 ([["foo"],["there"]], "foo") (*should return []*)
val test22 = get_substitutions1 ([["a","b"],["c","a"],["d","e"]], "a") (*should return [b,c]*)
val test23 = get_substitutions1 ([["a","b"],["b","c","a"],["d","e"]], "a") (*should return [b,b,c]*)
*)

(*
val test30 = get_substitutions2 ([], "foo") (*should return []*)
val test31 = get_substitutions2 ([["foo"],["there"]], "foo") (*should return []*)
val test32 = get_substitutions2 ([["a","b"],["c","a"],["d","e"]], "a") (*should return [b,c]*)
val test33 = get_substitutions2 ([["a","b"],["b","c","a"],["d","e"]], "a") (*should return [b,b,c]*)
*)

(*
val test40 = similar_names ([["a","b"],["c","d"],["a","e"]], {first="a", middle="w", last="s"})
val test41 = similar_names ([["a","b"],["c","d"],["a","e"]], {first="a", middle="w", last="s"}) =
	          [{first="a", last="s", middle="w"}, {first="e", last="s", middle="w"}, {first="b", last="s", middle="w"}]
val test42 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
 *)

(*
val test50 = card_color (Clubs, Num 2) = Black
val test51 = card_color (Hearts, Num 2) = Red
val test52 = card_color (Clubs, Num 10) = Black
*)

(*
val test60 = card_value (Clubs, Num 2) = 2
val test61 = card_value (Clubs, Ace) = 11
val test62 = card_value (Clubs, Jack) = 10

val test70 = remove_card ([(Hearts,Ace)], (Hearts,Ace), IllegalMove) = []
val test71 = remove_card ([(Hearts,Ace),(Spades,King)], (Clubs,King), IllegalMove)
val test72 = remove_card ([], (Hearts, Ace), IllegalMove)

val test80 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test81 = all_same_color [] = true
val test82 = all_same_color [(Hearts, Ace), (Diamonds, Ace)] = true
val test83 = all_same_color [(Diamonds, Ace)] = true

val test90 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test91 = sum_cards [] = 0

val test100 = score ([(Hearts, Num 2),(Clubs, Num 4)],10)  (*ans: 4*)
val test101 = score ([(Hearts, Num 2),(Clubs, Num 4)],3)  (*ans: 9*)
val test102 = score ([(Hearts, Num 2),(Diamonds, Num 4)],3)  (*ans: 4*)
val test103 = score ([(Hearts, Num 2),(Diamonds, Num 4)],10)  (*ans: 2*)
*)

val test110 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test112 = officiate ([],[], 15) = 7
val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],42) = 3
val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

(*
val test14_0 = officiate([(Hearts,Ace),(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[Draw,Draw,Draw,Draw,Draw,Draw],42) = 6;
val test14 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[Draw,Draw,Draw,Draw,Draw],42) = 3
val test15 = officiate([(Hearts,Ace),(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[Draw,Draw,Draw,Draw,Draw,Draw],42) = 6
val test16 = officiate([(Clubs,Ace),(Clubs,King),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[Draw,Draw,Draw,Draw,Draw,Draw],42)
val test17 = officiate([(Clubs,Ace),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[Draw,Draw,Draw,Draw,Draw,Draw],40) = 3
val test18 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[Draw,Draw,Draw],42) = 4
val test19 = officiate([(Hearts,Ace),(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[Draw,Draw,Draw],42) = 9
val test20 = officiate([(Clubs,Ace),(Clubs,King),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[Draw,Draw,Draw],42) = 5
val test21 = officiate([(Clubs,Ace),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[Draw,Draw,Draw],40) = 4
val test22 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[],42) = 21
val test23 = officiate([(Hearts,Ace),(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],[],42) = 21
val test24 = officiate([(Clubs,Ace),(Clubs,King),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[],42) = 21
val test25 = officiate([(Clubs,Ace),(Spades,Queen),(Clubs,King),(Hearts,Queen)],[],40) = 20
*)
