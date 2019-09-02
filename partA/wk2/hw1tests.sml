(*
Programming Languages, Part A
Tests for Homework 1
Author: Palermo Penano

todo
- Test each function for empty lists
*)

(* is_older
val is_older0 = is_older ((1,2,3), (2,3,4)) = true
val is_older1 = is_older ((5,2,3), (2,3,4)) = false
val is_older2 = is_older ((5,2,3), (5,2,5)) = true
val is_older3 = is_older ((1,2,3), (1,2,3)) = false
 *)

(* number_in_month
val number_in_month0 = number_in_month ([(1,2,3), (3,2,5)], 2) = 2
val number_in_month1 = number_in_month ([(1,3,3), (3,2,5)], 2) = 1
val number_in_month2 = number_in_month ([(1,2,3), (3,2,5)], 1) = 0
 *)

(* number_in_months
val number_in_months0 = number_in_months ([(1,1,3), (3,2,5)], [1, 2]) = 2
val number_in_months1 = number_in_months ([(1,1,3), (3,2,5)], [3, 3]) = 0
val number_in_months2 = number_in_months ([(1,5,3), (3,1,5)], [1, 2]) = 1
val number_in_months3 = number_in_months ([(1,2,3), (3,2,5)], [1, 2]) = 2
*)

(* dates_in_month
val dates_in_month0 = dates_in_month ([(1,2,3), (2,2,2)], 2) = [(1,2,3), (2,2,2)]
val dates_in_month1 = dates_in_month ([(1,2,3), (2,1,2)], 2) = [(1,2,3)]
val dates_in_month2 = dates_in_month ([(1,2,3), (2,1,2)], 3) = []
(* val dates_in_month1 = dates_in_month ([(), ()], 3) = [] *)
 *)

(* dates_in_months
val dates_in_months0 = dates_in_months ([(1,2,3), (2,2,2)], [1,2]) = [(1,2,3), (2,2,2)]
val dates_in_months1= dates_in_months ([(1,1,3), (2,2,2)], [1,2]) = [(1,1,3), (2,2,2)]
val dates_in_months2= dates_in_months ([(1,1,3), (2,2,2)], [1]) = [(1,1,3)]
val dates_in_months3 = dates_in_months ([(1,2,3), (2,2,2)], [1,3]) = []
val dates_in_months4 = dates_in_months ([(1,2,3), (2,2,2)], []) = []
 *)

(* get_nth
val get_nth0 = get_nth (["hi", "there"], 2) = "there"
val get_nth1 = get_nth (["hi", "there"], 1) = "hi"
val get_nth2 = get_nth (["hi", "there", "buddy"], 3) = "buddy"
val get_nth3 = get_nth (["hi", "there", ""], 3) = ""
 *)

(* date_to_string 
val date_to_string0 = date_to_string (2019, 10, 25) = "October 25, 2019"
*)

(* number_before_reaching_sum
val nbrs0 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val nbrs1 = number_before_reaching_sum (10, [1,2,30]) = 2
val nbrs2 = number_before_reaching_sum (10, [10,2]) = 0
val nbrs3 = number_before_reaching_sum (10, [15,2]) = 0
*)

(* what_month *)
(*
val what_month0 = what_month(70) = 3
val what_month1 = what_month(365) = 12
val what_month2 = what_month(1) = 1
val what_month3 = what_month(59) = 2
 *)

(* month_range *)
(*
val month_range0 = month_range (31, 34) = [1,2,2,2]
val month_range1 = month_range (31, 31) = [1]
val month_range2 = month_range (272, 276) = [9,9,10,10,10]
*)

(* oldest *)
(*
val oldest0 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
 *)
val oldest0 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val oldest1 = oldest([(2012,2,28),(2011,3,31)]) = SOME (2011,3,31)
val oldest2 = oldest([(2011,3,31)]) = SOME (2011,3,31)
