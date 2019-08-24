(*
Coursera Programming Languages, Part A
Homework 2
Author: Palermo Penano
*)

(* Problem 1 *)

fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (s: string, sl: string list) =
    let
        fun get_result(lst) =
            case lst of
                [] => []
              | h::t =>
                if same_string(s, h)
                then t  (*return result of recursive call immediately if first string match*)
                else h::get_result(t)  (*otherwise, cons nonmatching string to result of recursive call*)
        val result = get_result(sl)
    in
        if result = sl
        then NONE
        else SOME result
    end

fun get_substitutions1 (l: string list list, s: string) =
    case l of
        [] => []
      | h::t =>
        let val result = get_substitutions1(t,s)
        in case all_except_option(s,h) of
                NONE => result
              | SOME z => z @ result
        end

fun get_substitutions2 (l: string list list, s: string) =
    let
        fun f (l,acc) =
            case l of
                [] => acc
              | h::t =>
                case all_except_option(s,h) of
                    NONE => f(t,acc)
                  | SOME z => f(t,z @ acc)
    in
        f(l,[])
    end

fun similar_names (ls: string list list,{first=f,middle=m,last=l}) =
    let
        val fs = get_substitutions2(ls,f)  (*get all similar first names*)
        fun sub (lss) =  (*creates a list of records from first names in lss*)
            case lss of
                [] => []
              | h::t => {first=h,middle=m,last=l}::sub(t)
    in
        {first=f,middle=m,last=l}::sub(fs)
    end

(* Problem 2 *)

datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

fun card_color (c:card) =
    case c of
        (Spades,_) => Black
      | (Clubs,_) => Black
      | _ => Red

fun card_value (c:card) =
    case c of
        (_,Num i) => i
      | (_,Ace) => 11
      | _ => 10

fun remove_card (cs:card list, c:card, e:exn) =
    case cs of
        [] => raise e
     | h::t => if h = c then t else remove_card(t,c,e)

fun all_same_color (cs:card list) =
    case cs of
        [] => true
      | _::[] => true
      | h::(n::t) => (
          card_color(h) = card_color(n)
         andalso all_same_color(n::t)
      )

fun sum_cards (cs:card list) =
    let fun aux(cs,acc) =
            case cs of
                [] => acc
              | h::t => aux(t,acc+card_value(h))
    in
        aux(cs,0)
    end

(*
The objective is to end the game with a low score (0 is best).
Scoring works as follows:
    Let sum be the sum of the values of the held-cards.
    If sum is greater than goal, the preliminary score is three times (sum−goal), else the preliminary score is (goal − sum).
    The score is the preliminary score
    If all the held-cards are the same color, the score is the preliminary score divided by 2
    (and rounded down as usual with integer division; use ML’s div operator).*)
fun score (cs:card list, g:int) =
    let
        val sum = sum_cards(cs)
        val prelim_score = if sum > g then 3*(sum-g) else (g-sum)
    in
        if all_same_color(cs) then prelim_score div 2 else prelim_score
    end

fun officiate (cs:card list, ms:move list, g:int) =
    let
        fun state (ccs:card list,
                   cms:move list,
                   chc:card list) =
            case cms of
                [] => score(chc,g)
              | (Discard c)::t_cms =>
                let val new_hc = remove_card(chc,c,IllegalMove)
                in state(cs,t_cms,new_hc) end
              | Draw::t_cms =>
                case ccs of
                    [] => score(chc,g)
                 |  h_ccs::t_ccs =>
                    if sum_cards(h_ccs::chc) > g
                    then score(h_ccs::chc,g)
                    else state(t_ccs,t_cms,h_ccs::chc)
    in
        state(cs,ms,[])
    end
