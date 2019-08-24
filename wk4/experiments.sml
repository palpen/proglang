
(* fun map(f,xs) = *)
(*     case xs of *)
(*         [] => [] *)
(*       | x::xs' => (f x)::map(f,xs') *)

(* val x1 = map((fn x => ~x), [1,2,3]) *)

fun sorted3_tupled (x,y,z) = z >= y andalso y >= x
val t1 = sorted3_tupled (7,9,11)

val sorted3 = fn x => fn y => fn z => z >= andalso y >= x
