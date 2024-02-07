type SampleRec = { Str : string, Num : int }

let readStrField = getValueReader `SampleRec.Str`
let readNumField = getValueReader `SampleRec.Num`

let rc = { Str = "Hello world!"; Num = 42 }

let s, n = readStrField rc, readNumField rc

let readNumField = getValueReader (fun (rc:SampleRec) -> rc.Num)
let n = readNumField rc

let getValueReader f =
  // Returns a function that takes the record as an argument..
  (fun rc -> 
     // .. reads the value of the field using 'f' ..
     let value = f rc
     // .. prints the value on a console and returns it
     printfn "%A" value
     value)

getValueReader : DynamicMember<'recordT, 'fieldT> -> ('recordT -> 'fieldT)

> let dynMem = <@@ (_ : SampleRec).Str @@>
val dynMem : Expr<SampleRec> -> Expr<string>

> type DynamicMember<'a, 'b> = Expr<'a> -> Expr<'b>

