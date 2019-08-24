datatype mytype = TwoInts of int * int
               |  Str of string
               | Pizza

fun f x =
    case x of
        Pizza => 3
      | TwoInts(i1, i2) => i1 + i2
      | Str s => String.size s


(*
datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp
fun eval e = (* fn: exp -> int *)
    case e of
        Constant i => i
     | Negate e2 => ~ (eval e2)
     | Add(e1,e2) => (eval e1) + (eval e2)
     | Multiply(e1,e2) => (eval e1) * (eval e2)
 *)

(*
fun sum_list xs =
    case xs of
        [] => 0
     | x::xs' => x + sum_list xs'
 *)

(*
exception ListLengthMismatch


fun zip3 list_triple =
    case list_triple of
        ([],[],[]) => []
      | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1,hd2,hd3)::zip3(tl1,tl2,tl3)
      | _ => raise ListLengthMismatch

                   fun unzip3 lst
val lt = ([1,2,3],[4,5,6],[7,8,9])
val ltr = zip3 lt
 *)

(*
fun sum_triple (triple: int*int*int) =
    let val (x,y,z) = triple
    in
        x+y+z
    end
 *)

                             (*
fun nondecreasing xs =
    case xs of
        [] => true
      | x::[] => true
      | head::(neck::rest) => head <= neck andalso nondecreasing (neck::rest)
                              *)
