open Microsoft.FSharp.Quotations;;
open Microsoft.FSharp.Quotations.Raw;;
open Microsoft.FSharp.Quotations.Typed;;

type simple_expr =
  | Int of int
  | Add of simple_expr * simple_expr
  | Sub of simple_expr * simple_expr
  | Mul of simple_expr * simple_expr
  | Div of simple_expr * simple_expr;;


let what_is x = 
  match Raw.efInt32.Query x with 
  | Some (_) -> "number"
  | _ -> 
  match Raw.efApps.Query x with 
  | Some (_) -> "application"
  | _ -> 
    "something else"


// Prints "number"	    
print_string (what_is <@@@@ 1 @@@@>);

// Prints "application"	    
print_string (what_is <@@@@ 1 + 2 @@@@>);

let rec parse x =
  match Raw.efInt32.Query x with  
    // x contains the number so we can simply return Int(x)
    | Some (x) -> Int(x); 
    | _ -> 
  match Raw.efApps.Query x with  
    | Some (op,args) -> 
    
      // op contains quoted reference to function (operator)
      // so we need to extract name of applied function from it
      let opname = (
        match Raw.efAnyTopDefn.Query op with  
          // operators are top-level definitons so we extract name
          // from 'a' that contains info about the definiton
          | Some (a,_) -> let t1,t2 = a.topDefPath in t2
          | _ -> failwith ("Function is not a top level definition.");
        ) in
      
      // Recursively translate arguments to simple_expr 
      // and convert returned list to array
      let av = List.to_array(List.map (fun arg -> parse arg) args) in
      
      // Finally, match the operation name with basic 
      // operator names and return according simple_expr value
      (match opname with
        | "op_Addition"    -> Add(av.(0),av.(1))
        | "op_Subtraction" -> Sub(av.(0),av.(1))
        | "op_Multiply"    -> Mul(av.(0),av.(1))
        | "op_Division"    -> Div(av.(0),av.(1))
        | _ ->
          // some other operation - error
          failwith "Not supported operation");
    | _ ->
      // something else than efApps and efInt32 - error
      failwith "Not supported construction in expression.";;
