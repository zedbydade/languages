let evenSquares =
    [ for n in [0 .. 10]
    when n%2 = 0
    -> n * n
    ]

Func<int,int,int>             addF = (a,b) => a + b
Expression<Func<int,int,int>> addE = (a,b) => a + b

let addF =   fun a b -> a + b
let addE = « fun a b -> a + b »

let addAndPrint =
  « fun a b ->
      let sum = a + b
      printf "Sum = %d" sum »
