

type id = string 

let string_of_id (ident : id) : string = ident 

type 'a located =
  { loc: Lexing.position * Lexing.position; value: 'a }

type expr =
  raw_expr located

and raw_expr =
| Unit of unit
| False 
| True
| Int of int
| Id of string 
| Op of (op * expr * expr)
| Apply of (id * expr list)
| Ifelse of (expr * expr *expr)
| If of (expr * expr)
| Letin of (id * expr * expr)
| Let of (id * expr)
| Seq of (expr * expr)
| Fun of (id * id list * expr)
| Lambda of ( id list * expr)

and op =
| Mul 
| Sub 
| Add 
| Div 
| Mod 

| Le 
| Ge 
| Eq 
| Lt 
| Gt 
| Ne 

let string_of_op (op_: op) = match op_ with
  | Mul -> "*"
  | Sub  -> "-"
  | Add  -> "+"
  | Div  -> "/"
  | Mod  -> "mod"

  | Lt   -> "<"
  | Gt   -> ">"
  | Ge   -> ">="
  | Le   -> "<="
  | Ne  -> "!="
  | Eq   -> "="


let rec string_of_expr e = match e.value with
| Unit () -> "()"
| False -> "false"
| True -> "true"
| Int i -> string_of_int i 
| Id id -> string_of_id id 
| Op (op, e1, e2) -> Printf.sprintf "(%s %s %s)"
  (string_of_expr e1)
  (string_of_op op)
  (string_of_expr e2)
| Apply (id, args) -> Printf.sprintf "(%s %s)"
  (string_of_id id) 
  (List.map string_of_expr args |> String.concat " ")
| If (cond, then_) -> Printf.sprintf "if (%s) then (%s)"
  (string_of_expr cond)
  (string_of_expr then_)
| Ifelse (cond, then_, else_) -> Printf.sprintf "if (%s) then {%s} else {%s}"
  (string_of_expr cond)
  (string_of_expr then_)
  (string_of_expr else_)
| Letin (id, e, body) -> Printf.sprintf "Let %s = %s in %s"
  (string_of_id id )
  (string_of_expr e)
  (string_of_expr body) 
| Let (id , e) -> Printf.sprintf "Let %s = %s "
  (string_of_id id)
  (string_of_expr e)
| Seq (e1, e2) -> Printf.sprintf "%s ; %s"
  (string_of_expr e1) 
  (string_of_expr e2)
| Fun (id, args, body) -> Printf.sprintf "let %s ( %s ) = \n{ %s }"
  (string_of_id id) 
  (List.map string_of_id args |> String.concat " ")
  (string_of_expr body) 
| Lambda (args, body) -> Printf.sprintf "fun (%s) = \n { %s }"
  (List.map string_of_id args |> String.concat " ")
  (string_of_expr body)


type unuse = 
| EASSEC of expr * expr
| EAPAR of expr * expr
| ECONST of id
| EFUNC of id
| EBOX
| UNBOX 
| MKWIRE
| PROJWIRE
| CONCATWIRE
| MKSH
| COMBSH
let string_of_program = string_of_expr
