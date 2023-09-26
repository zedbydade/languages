ype classInfo = {
  name:string;
  baseName:string option;
  members:classMember list;
};;

type classMember;;

type 'a classMemberFamily with

  member Query : classMember -> 'a option
  member Make : 'a -> classMember
end;;

val cmfCtor : (expr) classMemberFamily;;
	
val cmfMethod : (string*expr*Type option) classMemberFamily;;
	
val cmfField : (string*Type*expr option) classMemberFamily;;
	
val cmfProp : (string*expr*expr*Type) classMemberFamily;;

#light

// Module with implementation of methods

module Person_Meta = begin
  // Simulates field of the class
  let name = ref ""
  
  // Represents constructor
  let ctor (n) =
    name := n
    
  // Represents method
  let Say (pre:string) =
    let s = pre^", my name is "^(!name)^"." in
    print_string s
  
  // Represents property  
  let get_Name () =
    (!name)
  let set_Name (value) =
    name:=value
end
 

 
// The real class
// Members are just a placeholders and the quotations
// are extracted from the previous module

type Person = class 

  val mutable name : string;
  new((n:string)) = { name = ""; }
  member this.Say(pre:string) = ()
  member this.Name with get() = "" and set((v:string)) = ()
end

#light
do


  let clsInfo = getClassFromType ((typeof() : Person typ).result)
  
  Console.WriteLine("Class '{0}':", clsInfo.name)
  if (clsInfo.baseName <> None) then
    Console.WriteLine(" base: {0}", clsInfo.baseName)
  
  clsInfo.members |> List.iter ( fun m ->
      match cmfMethod.Query m with
        | Some (name, expr, ret) ->
            Method "printf ( %s : %a ) = " name output_any ret
        | _ ->
      match cmfField.Query m with
        | Some (name, typ, init) ->
            printf "Field ( %s : %a) " name output_any typ
        | _ ->
      match cmfProp.Query m with
        | Some (name, getter, setter, typ) ->
            printf "Property ( %s : %a )\n" name output_any typ
            printf "get = %a\n" output_any getter
            printf "set = %a\n\n" output_any setter
        | _ ->
      match cmfCtor.Query m with
        | Some (expr) ->
            printf "Ctor = %a\n\n" output_any expr
        | _ ->
            failwith "Error!"
    )
