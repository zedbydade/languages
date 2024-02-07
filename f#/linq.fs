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

let sample1() =
    SQL « { for c in (§db.Customers) -> c } »
    |> dump

let sample2() =
      SQL « { for c in (§db.Customers)
          when c.Country = "UK"
          -> c } »
    |> dump

let sample3() =
  SQL « { for p in (§db.Products)
          for c in (§db.Categories)
          when c.CategoryID = p.CategoryID
          -> (c.CategoryName, p.ProductName) } »
  |> dump

let dump (q:#seq<Customer>) =
  for c in q do
    Console.WriteLine
      ("{0,-25}{2,10}, {1,-8}{3,-30}",
       c.CompanyName, c.Country, c.City, c.ContactName)
  Console.ReadLine();

let db = new Northwind("Server=.; Database=Northwind; Integrated Security=SSPI")
let custTable = « §db.Customers »

let queryTemplate selector (value:Expr<string>) =
  custTable |>
    « { for c in _ do
          let s = (_ c) in
          when (s:string).IndexOf(_:string) <> -1
          -> c } » value selector

let falseCond = « fun (c:Customer) -> false »
let trueCond  = « fun (c:Customer) -> true  »

let (||*) f g = « fun (c:Customer) -> (_ c) || (_ c) » f g
let (&&*) f g = « fun (c:Customer) -> (_ c) && (_ c) » f g

let simplecombine_demo() =
  let isUk = « fun (c:Customer) -> c.Country = "UK" »
  let isSeattle = « fun (c:Customer) -> c.City = "Seattle" »

  let expr = isUk ||* isSeattle
  let q = custTable |> « { for c in _ when _ c -> c } » expr
  SQL q |> dump
