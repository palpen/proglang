
fun f (x,y,z) =
    if true
    then (x,y,z)
    else (y,x,z)

fun compose (f,g) = fn x => f (g x)
