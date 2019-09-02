(*
Programming Languages, Part A
Homework 1
Author: Palermo Penano
 *)

(*
  Reasonable date:
      - Value of type int*int*int (a 3-tuple)
      - Order: (positive year, month 1 to 12, day < 31)
      - Day of year 1 to 365
*)

fun is_older (date1: int*int*int, date2: int*int*int) =
    if
        (#1 date1) < (#1 date2)
        orelse
        ((#1 date1) = (#1 date2) andalso (#2 date1) < (#2 date2))
        orelse
        ((#2 date1) = (#2 date2) andalso (#3 date1) < (#3 date2))
    then true
    else false

fun number_in_month (dates: (int*int*int) list, month: int) =
    if null dates then 0
    else
        let val given_date = hd(dates)
        in
            if #2 given_date = month
            then 1 + number_in_month(tl dates, month)
            else number_in_month(tl dates, month)
        end

fun number_in_months (dates: (int*int*int) list, months: int list) =
    if not (null months)
    then
        let
            val current_month = hd(months)
            val current_count = number_in_month(dates, current_month)
        in
            current_count + number_in_months(dates, tl months)
        end
    else 0

fun dates_in_month (dates: (int*int*int) list, month: int) =
    if not (null dates)
    then
        let
            val given_date = hd(dates)
            val tl_call_dates = dates_in_month(tl dates, month)
        in
            if #2 given_date = month
            then given_date :: tl_call_dates
            else tl_call_dates
        end
    else dates

fun dates_in_months (dates: (int*int*int) list, months: int list) =
    if not (null months)
    then
        let
            val given_month = hd(months)
            val dates_in_given_month = dates_in_month(dates, given_month)
        in
            dates_in_given_month @ dates_in_months(dates, tl months)
        end
    else []

fun get_nth (strings: string list, n: int) =
    let
        val current_count = n
    in
        if current_count = 1
        then hd strings
        else get_nth (tl strings, current_count - 1)
    end

fun date_to_string (date: int*int*int) =
    let
        val months = [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ]
        val year_str = Int.toString(#1 date)
        val day_str = Int.toString(#3 date)
        val month_int = #2 date
        val month_str = get_nth(months, month_int)
    in
        month_str ^ " " ^ day_str ^ ", " ^ year_str
    end

fun number_before_reaching_sum (sum: int, xs: int list) =
    if hd xs >= sum then 0  (* if hd is greater than sum, then return 0 *)
    else
        let
            val sum_diff = sum - hd xs
        in
            if sum_diff > 0
            then 1 + number_before_reaching_sum(sum_diff, tl xs)
            else 0
        end

fun what_month (day_year: int) =
    let
        val months_day_sum = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(day_year, months_day_sum) + 1
    end

fun month_range (day1: int, day2: int) =
    if day1 > day2 then []
    else
        let
            val day1_month = what_month(day1)
        in
            if day1 < day2
            then day1_month :: month_range(day1 + 1, day2)
            else day1_month :: []
        end

fun oldest (dates: (int*int*int) list) =
    if null dates then NONE
    else
        let
            val hd_date = hd dates
            val tl_ans = oldest(tl dates)
        in
            if isSome tl_ans andalso is_older(valOf tl_ans, hd_date)
            then tl_ans
            else SOME (hd_date)
        end

