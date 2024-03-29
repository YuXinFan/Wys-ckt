open Dsyntax 
open Syntax


let print2 (opt: string )(str:string) = Printf.printf "(%s %s)" opt str 

let print1  (str:string) = Printf.printf "%s" str

let newline () = Printf.printf "\n"

let space () = Printf.printf " "

let string_of_typeValue (i: typeValue) = match i with 
| Module_d -> "-Module"

| Int -> "-Int"
| Prin -> "-Prin"
| Bool -> "-Bool"


| Set -> "-Set"
| PrinSet -> "-PrinSet"
| IntList -> "-IntList"

| TypeDef -> "-Type"
| ValDef -> "-Val"
| Fun -> "-Fun"

| App -> "-App"
| Proj -> "-Project"
| Lambda -> "-Lambda"

| Wire -> "-Wire"
| IntWire -> "-IntWire"
| BoolWire -> "-BoolWire"

| BoxBool -> "-BoxBool"
| BoxInt -> "-BoxInt"
| BoxUnknow -> "-BoxUnknow"

| Wys -> "-Wys"
| WysInt -> "-WysInt"
| WysBool -> "-WysBool"
| WysUnknow -> "-WysUnknow"


| Unbox -> "-Unbox"

| Var (* unknown type *) -> "-Can'tknow"

| Sec  -> "-Secure"

| Env -> "Env"

let string_of_op (a: op) = match a with 
| ADD -> "(+)"
| SUB -> "(-)"
| MOD -> "Mod"
| DIV -> "/"
| MUL -> "*"

| GT -> "(>)"
| BEQ -> "(=)"
| EQ -> "="

let rec print_dvalue ?(intend = "") (dv: dvalue) = match dv.typ with 
| Env -> print_env !(dv.scope) intend 
| _ -> print1 intend; print2 (string_of_typeValue dv.typ) dv.name

and print_ast_of_dvalue (dv: dvalue) = 
match dv.astd with 
| Some dd -> print_ddecl dd 
| None -> ()
(* ;
match dv.aste with 
| Some de -> print_dexpr de 
| None -> () *)

and print_dprog (dg : dprog) = match dg with 
| Module_d (str, dds) -> print2 "Module" str; print_ddecls dds 

and print_ddecls (dds: ddecl list) = match dds with 
| [] -> ()
| [x] -> print_ddecl x 
| hd::tl -> print_ddecl hd; print_ddecls tl 

and print_ddecl (dd: ddecl) = match dd with 
| DOpen_d dv -> 
    print1 "Open ";
    print_dvalue dv;
    newline()
| DVal_d (dv, tvs, tv) -> 
    print1 "Val ";
    print_dvalue dv;
    print1 ":";
    for i = 0 to List.length tvs do 
        let nth_opt = List.nth_opt tvs i in
            match nth_opt with 
            | None -> ()
            | Some e -> print1 (string_of_typeValue e); print1 "->" 
    done; 
    print1 (string_of_typeValue tv);
    newline()
| DLet_d (_, dv, de) -> 
    print1 "Let "; print_dvalue (List.hd dv); print1 "="; print_dexpr de ; newline()
| DType_d dv -> 
    print1 "Type "; print_dvalue dv; newline()

and print_dexprs (des:dexpr list) = match des with 
| [] -> ()
| [x] -> print_dexpr x 
| hd::tl -> print_dexpr hd; print_dexprs tl

and print_dexpr ?(intend= "  ") (de:dexpr) = match de with 
| EVar_d dv -> print_dvalue dv 
| EApp_d (dv, eds) -> 
    print_dvalue dv; space(); print_dexprs eds 
| ELet_d (dv, de1, de2) -> 
    print1 "Let ";
    print_dvalue dv;
    print1 " = {\n";
    print1 (intend^"  "); 
    print_dexpr de1 ~intend:(intend^"  ");
    newline();
    print1 intend;
    print1 "} in {\n";
    print1 (intend^"  ");
    print_dexpr de2 ~intend:(intend^"  ");
    newline();
    print1 intend;
    print1 "}"
| EProj_d (dv1, dv2) -> 
    print_dvalue dv1;
    print1 ".";
    print_dvalue dv2
| EBinop_d (de1, op, de2) -> 
    print_dexpr de1;
    print1 (string_of_op op) ;
    print_dexpr de2 
| EFun_d (dv, de)->
    print1 "Lambda ";
    print_dvalue dv;
    print1 "= {\n";
    print1 (intend^"  ");
    print_dexpr de ~intend:(intend^"  ") 
| ECond_d (cond, de1, de2) -> 
    print1 "if ";
    print_dexpr cond;
    newline();
    print1 (intend);
    print1 "then {";
    print_dexpr de1;
    print1 "}\n";
    print1 (intend);
    print1 "else {";
    print_dexpr de2 ;
    print1 "}"


and print_env (env: env) (intend: string) = 
print1 intend;  print2 "name: " env.scope_name; newline();
for i = 0 to List.length env.value_in_env do 
    let vd_opt = (List.nth_opt (env.value_in_env) i) in
        let intend = intend^"  " in 
        match vd_opt with 
        | None -> ()
        | Some v -> print1 intend; print_dvalue ~intend v; print_ast_of_dvalue v; newline();
done;

match env.env_out_env with 
| None -> print1 env.scope_name;  print1 "in None";
| Some e -> print1 env.scope_name; print1 ("in " ^ !e.scope_name);
