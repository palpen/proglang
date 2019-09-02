
(* fun map(f,xs) = *)
(*     case xs of *)
(*         [] => [] *)
(*       | x::xs' => (f x)::map(f,xs') *)

(* val x1 = map((fn x => ~x), [1,2,3]) *)

(* fun sorted3_tupled (x,y,z) = z >= y andalso y >= x *)
(* val t1 = sorted3_tupled (7,9,11) *)

(* val sorted3 = fn x => fn y => fn z => z >= andalso y >= x *)

(*
Callback style programming
*)

(* val onKeyEvent = (int -> unit) -> unit *)

(* Lists of callbacks provided by client
onKeyEvent takes a function that the client
wants executed if an event were to happen

The function is saved in a mutable list (references)
*)
val cbs: (int -> unit) list ref = ref []
fun onKeyEvent f =
    cbs := f::(!cbs)  (*update cbs with provided f*)

(* Simulates an event happening
- A "keyboard" entry
- When invoked, it calls every function (registered callbacks)
stored in cbs
 *)
fun onEvent i =
    let fun loop fs =
            case fs of
                [] => ()
              | f::fs' => (f i; loop fs')
    in
        loop (!cbs)
    end


fun printIfPressed i =
    onKeyEvent (
        fn j => if i=j
                then print ("You pressed " ^ Int.toString i ^ "\n")
                else ()
    )

(* Callbacks passed in by clients
- first callback just keeps track of 
 *)
val timesPressed = ref 0
val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed) + 1)

val _ = printIfPressed 4
val _ = printIfPressed 11
val _ = printIfPressed 23
val _ = printIfPressed 4
