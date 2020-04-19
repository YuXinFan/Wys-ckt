open Syntax
open Dsyntax
open Dprint

let string_of_option z = match z with 
| Some c -> c
| None -> ""

let string_of_const c = match c with 
| CApp id -> Printf.sprintf "%s" id 
| CPrin id -> Printf.sprintf "%s" id 

let string_of_op o = match o with 
| ADD -> Printf.sprintf "+" 
| SUB -> Printf.sprintf "-" 
| DIV -> Printf.sprintf "/" 
| MOD -> Printf.sprintf "mod" 
| MUL -> Printf.sprintf "*" 
| BEQ -> Printf.sprintf "==" 
| GT -> Printf.sprintf ">" 
| EQ -> Printf.sprintf "=" 

let rec string_of_binder (b : binders) = match b with 
| BValuebinder (id, t) -> let str_type = string_of_type t in 
    Printf.sprintf "(&Binder %s: %s)" id str_type 
| BValue id -> Printf.sprintf "%s" id 

and string_of_binders bs = let map = List.map string_of_binder bs in 
  let result = String.concat ";;" map in 
    result  

and string_of_type (t : types ) = match t with 
| TVar id -> Printf.sprintf "(&TVar %s)" id  
| TConst id -> Printf.sprintf "(&TConst %s)" id 
| TDependent (id, t1, t2) -> let str_t1 = string_of_type t1 in 
    let str_t2 = string_of_type t2 in 
      Printf.sprintf "(%s : %s -> %s)"  id str_t1 str_t2 
| TDependentRefine (id, t1, fo, t2) -> let str_t1 = string_of_type t1 in 
    let str_fo = string_of_formula fo in 
      let str_t2 = string_of_type t2 in 
        Printf.sprintf "(%s : %s {%s} -> %s)" id str_t1 str_fo str_t2 
| TRefine (id, t, fo) ->  let str_t = string_of_type t in 
    let str_fo = string_of_formula fo in 
        Printf.sprintf "(%s : %s {%s})" id str_t str_fo  
| TFun (b, t) -> let str_b = string_of_binders b in 
    let str_t = string_of_type t in 
      Printf.sprintf "(Fun %s -> %s)" str_b str_t 

and string_of_formula  = fun _ -> ""

and string_of_value (v : values) = match v with 
| VFun (b, e) -> let str_b = string_of_binder b in 
    let str_e = string_of_expr e in 
      Printf.sprintf "Fun %s = %s" str_b str_e
| VVar lid -> Printf.sprintf "(&Value %s)" lid 
| VConst lid ->  Printf.sprintf "%s" lid 

and string_of_branch (bran : branchs) = match bran with 
| Bar (p, e) -> let str_p = string_of_pattern p in 
    let str_e = string_of_expr e in 
      Printf.sprintf "(|%s -> %s)" str_p str_e 

and string_of_branchs (brans : branchs list) = 
  let map = List.map string_of_branch brans in 
    let result = String.concat "\n" map in 
      "{\n"^result^"}"  

and string_of_pattern (p : patterns) = match p with 
| PAny -> Printf.sprintf "_" 
| PBinder b -> let str_b = string_of_binder b in 
    Printf.sprintf "%s" str_b 

and string_of_tdef (t:tdefs) = match t with 
| TTdef td -> let str_td = string_of_tdecl td in 
    Printf.sprintf "(&Tdef %s)" str_td 
| TTabbr (td, t) -> let str_td = string_of_tdecl td in 
    let str_t = string_of_type t in 
      Printf.sprintf "(&Tdef %s = %s)" str_td str_t 

and string_of_tdecl (td:tdecls) = match td with 
| TType t -> let str_t = string_of_type t in 
    Printf.sprintf "(&Tdecl %s)" str_t    
| TTypebinder  (t, tbs) -> let str_t = string_of_type t in 
    let str_tbs = string_of_binders tbs in 
      Printf.sprintf "(&Tdecl type %s %s)" str_t str_tbs 

and string_of_exprs (es:exprs list) = let map = List.map string_of_expr es in 
  let result = String.concat "*" map in 
    result  
 
and string_of_expr (e : exprs) = match e with 
| EVar v -> let str_v = string_of_value v in 
    Printf.sprintf " %s " str_v 
| EApp (const, e2) -> let str_e1 = string_of_const const in 
    let str_e2 = string_of_exprs e2 in 
      Printf.sprintf " (&App %s %s) " str_e1 str_e2 
| ELet (v, e1, e2) -> let str_v = string_of_value v in 
    let str_e1 = string_of_expr e1 in 
      let str_e2 = string_of_expr e2 in 
        Printf.sprintf "(let %s = %s in %s)" str_v str_e1 str_e2 
| EMatch (e, bran) -> let str_e = string_of_expr e in 
    let str_bran = string_of_branchs bran in 
      Printf.sprintf "(match %s with %s)" str_e str_bran 
| EAssert f -> let str_f = string_of_formula f in 
    Printf.sprintf "(Assert %s)" str_f 
| EProj (e, id) -> let str_e = string_of_expr e in 
    Printf.sprintf "(%s.%s)" str_e id 
| EAssign (e1, e2) -> let str_e1 = string_of_expr e1 in 
    let str_e2 = string_of_expr e2 in 
      Printf.sprintf " (%s := %s) " str_e1 str_e2 
| EBinop (e1, o, e2) -> let str_e1 = string_of_expr e1 in 
    let str_e2 = string_of_expr e2 in 
      let str_op = string_of_op o in 
        Printf.sprintf " (%s %s %s) " str_e1 str_op str_e2 
| EFun (bin, e) -> let str_b = string_of_binder bin in 
    let str_e = string_of_expr e in 
      Printf.sprintf " (&Fun %s -> %s ) " str_b str_e  

and string_of_decl d = match d with 
| DOpen m -> Printf.sprintf "(Open %s)" m 
| DVal (m, t) -> let t_str = string_of_type t in 
    Printf.sprintf "(Val %s : %s)" m t_str 
| DLet (b, v, e) -> let str_v = (string_of_value v) in 
    let str_e = (string_of_expr e) in 
      let str_rec = if b = true then "rec " else "" in 
        Printf.sprintf "(Let %s%s = %s)" str_rec str_v str_e 
| DType t -> let str_t = string_of_tdef t in 
    Printf.sprintf "(&DType %s)" str_t 

let rec string_of_decls  (ds: decl list) = match ds with 
| [] -> Printf.sprintf "()"
| [d] -> string_of_decl d 
| hd::tl ->  string_of_decls [hd] ^"\n"^ string_of_decls tl

let string_of_program t = match t with 
| Module (m, ds) -> Printf.printf "{\n(module %s)\n{\n%s\n}\n}" m (string_of_decls ds) 

let interpret (e : prog) =
  string_of_program e 

let process (line : string) =
  Printf.printf "Read File:\n %s \nAST:\n" line;
  let linebuf = Lexing.from_string line in
  try
    (* Run the parser on this line of input. *)
    (* Printf.printf "%d\n%!" (interpret (Parser.main Lexer.token linebuf)) *)
    let ast = Parser.prog Lexer.token linebuf in
       let ast_d = cons_of_dprog ast in  
        let wys =  match find_wys_of_prog ast with 
        | Some e -> e 
        | None -> EVar (VVar "None") 
        in
        let str = string_of_expr wys in 
          string_of_program ast;
          Printf.printf "------------------------------------\n";
          newline ();
          Printf.printf "%s" str;
          Printf.printf "------------------------------------\n";
          newline ();
          print_env !(snd ast_d) "";
          print_dprog (fst ast_d)

  with
  | Lexer.Error msg ->
      Printf.fprintf stderr "%s%!" msg
  | Parser.Error ->
      Printf.fprintf stderr "At offset %d: syntax error.\n%!" (Lexing.lexeme_start linebuf)

let process (optional_line : string option) =
  match optional_line with
  | None ->
      ()
  | Some line ->
      process line 

let rec read_file (buf : string) (channel)=
  (* Attempt to read one line. *)
  let optional_line, continue = Lexer.read channel in
  match continue with 
  | true -> let this_line = string_of_option optional_line in 
              let buf = buf ^ " " ^ this_line in 
                read_file buf channel
  | false -> process (Some buf)

(* 
  process optional_line;
  if continue then
    read_file channel *)

let main () = 
read_file "" (Lexing.from_channel stdin) ;;

main ()
  