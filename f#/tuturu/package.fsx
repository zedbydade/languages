#r "nuget:FSharp.Data"

open FSharp.Data 

let html = Http.RequestString("www.google.com.br")

printf $"{html}"
