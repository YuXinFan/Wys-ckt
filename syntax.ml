
type ident = string

type path = string list

type lident = ident

type lid = lident

type op = 
| ADD 
| SUB
| BEQ
| GT

| MUL 
| DIV 
| MOD 
| EQ 

type const = 
| CApp of lid 
| CPrin of lid 
(* Binders 
b ::= 
  | (x:t)       // Value-binder 
  | x

  | ('a:k)      // type-binder
  | 'a          //Unascribed binder 
*)
type binders = 
| BValuebinder of lid * types    
| BValue of lid 


(* Types        t ::= 'a                   //Variable
                | Tc                    //Constant
                | x:t[{phi}] -> t'      //Dependent function, optionally refined domain  
                | x:t{phi}              //Refined type
                | fun b -> t            //Type function literal 

                | x:t[{phi}] * t        //Dependent pair, optionally refined lhs
                | t t'                  //Type/type application
                | t v                   //Type/value application
                | 'a:k -> t             //Dependent function, from types to values
*)
and types = 
| TVar of lid 
| TConst of lid 
| TDependent of lid * types * types 
| TDependentRefine of lid * types * formulas * types 
| TRefine of lid * types * formulas 
| TFun of binders list * types 

(*formulas is used to do property verification *)
and formulas = 
| Ignore 

(*Values       v ::= x                    //Variable
                | () | 0 | 1 | ... | c  //Constants
                | fun b -> e            //Lambda abstraction over values or types
 
                | D [(t1|v1)...(tn|vn)] //Fully-applied data constr. or logic func.
 *)
and values = 
| VVar of lid 
| VConst of lid 
| VFun of binders * exprs 

(*Expressions  e ::= v                    //Value
                | e1 e2                 //Application
                | let x = e1 in e2      //Let binding
                | match e with br1..brn //Pattern matching
                | assert phi            //Checked assertion
                | e.f                   //Projection
                | e1 := e2              //Assignment of reference
                | e1 binop e2           // binary operation 
                | fun x -> e            // lambda function

                | !e                    //Dereference
                | ref e                 //Allocation
                | raise e               //Raising exceptions
                | try e with br1..brn   //Handling exceptions
                | e t                   //Type application
                | let rec f = v         //[Mutually] recursive let binding
                  [and f1=v1 ... 
                   and fn=vn] in 
                  e    
                | assume phi            //Admitted formula
                | {[e with] f1=e1;...;fn=en} //Record literal
                | (e <: t)              //Ascription (with subtyping)
                *)
and exprs = 
| EVar of values 
| EApp of const * (exprs list)
| ELet of values * exprs * exprs 
| EBinop of exprs * op * exprs
| EFun of binders * exprs

| EMatch of exprs * branchs list 
| EAssert of formulas 
| EProj of exprs * lid 
| EAssign of exprs * exprs 
(*
branches    br ::= BAR pat -> e         //Pattern matching branch
*)
and branchs = 
| Bar of patterns * exprs 

(*
pattern    pat ::= _ 
                | b 
                
                | C p1 .. pn 
                | c   //Nested patterns
*)
and patterns = 
| PAny 
| PBinder of binders 

(*
Type decl   td ::= [logic data] type t b1..bn           //Type declaration (with parameters)
*)
and tdecls = 
| TType of types 
| TTypebinder of types * binders list

(*
Type def  tdef ::= td                                   //abstract type
                |  td = t                               //type abbreviation 
                
                |  td = BAR D1:t1 BAR ... BAR Dn:tn     //algebraic type
                |  {f1:t1; ...; fn:tn}                  //record 
*)
and tdefs =
| TTdef of tdecls 
| TTabbr of tdecls * types 

and decl = decl'
(*
Top level   tl ::= val x : t                            //value declaration
                |  open M                               //open namespace
                |  let [rec] x1 = e1                    //let binding with mutual rec.
                       [and ... and xn = en] 
                |  tdef                                 //type definition
               
                |  logic val L:t                        //logic value decl.                            
                |  (assume | define | query) Name:phi   //assumption, definition, query
*)
and decl' = 
| DOpen of lid 
| DVal of ident * types
| DLet of bool * values * exprs (* bool check if let with rec *) 
| DType of tdefs 

(* this is the whole program file*)
and prog = 
| Module of lid * decl list


type 'a located =
  { loc: Lexing.position * Lexing.position; value: 'a }
(* let string_of_token (ident : token) =  
  match ident with 
  |  ID s -> s
  | STRING s -> s 
  | INT i -> string_of_int i 
  | FLOAT f -> string_of_float f
  | _ -> "" *)

let mk_ident (text) = text


let mk_decl dec =  dec

let lid_of_ids ids = String.concat "." ids


let name_of_types (t:types) = match t with 
| TVar id -> id 
| TConst id -> id 
| TDependent (id, _, _) -> id
| TDependentRefine (id, _, _, _) -> id
| TRefine (id, _, _) -> id 
| TFun _ -> "Fun"


let name_of_const (c:const) = match c with 
| CApp id -> id 
| CPrin id -> id 

let rec find_wys_of_expr (e:exprs) = match e with 
| ELet (_, _, e2) -> find_wys_of_expr e2 
| EApp (const, _) -> name_of_const const = "as_sec"
| EFun (_, e) -> find_wys_of_expr e 
| _ -> false 

let find_wys_of_decl (d:decl) = match d with 
| DLet (_, _, e) -> if find_wys_of_expr e then Some e else None
| _ -> None

let find_wys_of_prog (p:prog) = match p with 
| Module (_, decls) -> let find_result = List.map find_wys_of_decl decls in 
    let wys = List.find (fun a -> match a with Some _ -> true | None -> false) find_result in 
      wys

(* type expr =
  raw_expr located

and raw_expr =
| Unit of unit
| False 
| True
| Int of int
| Id of string 
| Op of (op * expr * expr)
| Apply of ( token * expr list)
| Ifelse of (expr * expr *expr)
| If of (expr * expr)
| Letin of (token * expr * expr)
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
| Ne  *)

(* let string_of_op (op_: op) = match op_ with
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
  (string_of_expr body) *)


(* type unuse = 
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
| COMBSH *)
(* let string_of_program = string_of_expr *)
