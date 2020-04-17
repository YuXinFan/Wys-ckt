open Syntax 


type typeValue = 
| Int 
| Prin 
| Bool
| Set 
| PrinSet 
| IntList 
| TypeDef
| ValDef
| Fun 
| Wire 
| Sec  
| Module_d 

| App 
| Proj 
| Lambda 
| Var (* unknown type *)

type env = {
    scope_name : string;
    value_in_env : dvalue list;
    env_in_env : env ref list;
    env_out_env : env ref option; 
}

and dvalue = {
    name : string;
    typ : typeValue;
    scope : env ref ;
}




type dprog = 
| Module_d of (string * ddecl list) 

and ddecl = 
| DOpen_d of dvalue 
| DVal_d of dvalue 
| DLet_d of bool * dvalue * dexpr  
| DType_d of dvalue 

and dexpr = 
| EVar_d of dvalue
| EApp_d of dvalue * (dexpr list) 
| ELet_d of dvalue * dexpr * dexpr 
| EProj_d of dvalue * dvalue 
| EBinop_d of dexpr * op * dexpr 
| EFun_d of dvalue * dexpr 

(***  Global Value ***)
let env_cnt = ref (-1) 
let env_init () = env_cnt := !env_cnt + 1 ;
    "internal"^"_"^string_of_int !env_cnt 

(******* Env Help Function *******)

let make_empty_env id = {
    scope_name = id ;
    value_in_env = [];
    env_in_env = [] ;
    env_out_env = None;
    }

let put_env_in_env (env1: env ref) (env2: env ref) =
    env2 := {!env2 with  env_in_env = ((!env2).env_in_env @ [env1])};
    env1 := {!env1 with env_out_env = Some env2}

let put_value_in_env (v: dvalue)(env:env ref) = env := {!env with value_in_env = !env.value_in_env @ [v]}

(******* dvalue Help Function *******)
let make_dvalue name (typ:typeValue) sc = { 
    name = name ; 
    typ = typ ;
    scope = sc } 


let dvalue_of_type (t:types) = let tmp = ref (make_empty_env "tmp") in
    let id = (
    match t with 
    | TVar id -> id 
    | TConst id -> id 
    | TDependent (id, _, _) -> id 
    | TDependentRefine (id, _, _,_) -> id 
    | TRefine (id, _, _) -> id 
    | TFun (_, _) ->  "Fun in Type" 
    ) in 
        make_dvalue id TypeDef tmp  


let rec find_value_in_value_list (name:string) (dl:dvalue list) = match dl with 
| [] -> None 
| [x] -> if x.name = name then Some x else None 
| hd::tl -> if hd.name = name then Some hd else (find_value_in_value_list name tl)


let find_value_in_env (name:string) (env: env ref) = 
    let value_list = !env.value_in_env in 
     find_value_in_value_list name value_list


(******* raw Syntax Help Function *******)
let dcons_of_values v = match v with 
| VVar id -> ("Var", id)
| VConst id -> ("Const", id)
| VFun (_, _) -> ("Fun", "Fun")

let dcons_of_const c = match c with 
| CApp id -> id 
| CPrin id -> id 

let dcons_of_binder b = match b with 
| BValuebinder (id, _) -> id 
| BValue id -> id 


(******* typeValue Help Function *******)

(* todo *)
let match_value_type (_:string) (name:string) = match name with 
| "Alice" -> Prin 
| "Bob" -> Prin 
| _ -> Var

let match_apply_name_type (name:string) = match name with 
| "singleton" -> Set
| "union" -> Set 
| "projwire" -> Wire 
| "mkwire" -> Wire 
| "bool" -> Bool 
| "as_sec" -> Sec 
| _ -> Var 

let match_op_type (op:op) = match op with 
| ADD -> Int 
| SUB -> Int 
| MUL -> Int 
| DIV -> Int 
| MOD -> Int 

| GT -> Bool 
| BEQ -> Bool 
| EQ -> Bool

let rec type_of_dexpr (de:dexpr) = match de with 
| EVar_d dv -> dv.typ
| EApp_d (dv , _) -> let dv_typ = match_apply_name_type dv.name in 
    (match dv_typ with 
    | Set -> PrinSet
    | Wire -> Wire 
    | Bool -> Bool 
    | Sec -> Sec
    | _ -> Var
    )
| ELet_d (_, de1, _) -> type_of_dexpr de1
| EProj_d (_, dv2) -> dv2.typ  
| EBinop_d (_, op, _) -> match_op_type op 
| EFun_d (_, _) -> Lambda 

(*******  Dsyntax Constructor *******)
let rec cons_of_dprog (ast : prog) = match ast with 
| Module (id, dcls) -> let env = ref ( make_empty_env id ) in 
    let dcls_v = cons_of_ddecls env dcls in 
        (Module_d (id, dcls_v), env)

and cons_of_ddecls (env:env ref) (dcls : decl list) = match dcls with 
|[] -> []
| [d] -> [cons_of_ddecl env d] 
| hd::tl -> (cons_of_ddecl env hd) :: (cons_of_ddecls env tl)

and cons_of_ddecl (env:env ref) (dcl: decl) = match dcl with 
| DOpen id -> let id_v = make_dvalue id Module_d env in 
    put_value_in_env id_v env;
    DOpen_d id_v 
| DVal (id, _) -> let id_v = make_dvalue id ValDef env in
    put_value_in_env id_v env ;
    DVal_d id_v 
| DLet (b, v, e) -> let v_name = snd (dcons_of_values v)  in
    let e_d = cons_of_dexpr env e in 
        let v_kind = type_of_dexpr e_d in 
            let v_v = make_dvalue v_name v_kind env in  
                put_value_in_env v_v env ;
                DLet_d (b, v_v, e_d)
| DType t -> let t_decl = ( match t with 
    | TTdef t -> t
    | TTabbr (t, _) -> t 
    ) in 
        let t_typ = (match t_decl with 
        | TType t -> t
        | TTypebinder (t, _) -> t
        ) in 
            let t_v = dvalue_of_type t_typ in 
                put_value_in_env t_v env ;
                DType_d {t_v with scope = env}  

and cons_of_dexprs (env:env ref) (es:exprs list) = match es with 
| [] -> []
| [e] -> [cons_of_dexpr env e]
| hd::tl -> (cons_of_dexpr env hd) :: (cons_of_dexprs env tl)

and cons_of_dexpr (env:env ref) (e: exprs) = match e with 
| EVar v -> let v_type, v_name =  dcons_of_values v  in 
    let v_value = find_value_in_env v_name env in 
        (match v_value with 
        | None -> let v_typ = match_value_type v_type v_name in 
            let v_d = make_dvalue v_name v_typ env in 
                put_value_in_env v_d env ;
                EVar_d v_d
        | Some dv -> EVar_d dv 
        ) 
                

| EApp (c, es) -> let c_name = dcons_of_const c in 
    let c_v = make_dvalue c_name App env in 
        let es_d = cons_of_dexprs env es in 
            EApp_d (c_v, es_d) 
| ELet (v, e1, e2) -> let _, v_name = dcons_of_values v in 
    let e1_d = cons_of_dexpr env e1 in
        let e1_type = type_of_dexpr e1_d in 
            let v_d = make_dvalue v_name e1_type env in 
                put_value_in_env v_d env;
                let env2 = ref (make_empty_env (env_init())) in 
                    put_env_in_env env2 env;
                    let e2_d = cons_of_dexpr env2 e2 in 
                        ELet_d (v_d, e1_d, e2_d) 

| EBinop (e1, op, e2) -> let e1_d = cons_of_dexpr env e1 in 
    let e2_d = cons_of_dexpr env e2 in 
        EBinop_d (e1_d, op, e2_d)
| EFun (b, e) -> let b_name = dcons_of_binder b in 
    let b_v = make_dvalue b_name Lambda env in 
        let env2 = ref (make_empty_env (env_init())) in 
            put_env_in_env env2 env;
            let e_d = cons_of_dexpr env2 e in 
                EFun_d (b_v, e_d)
| _ -> EVar_d {name="none";typ=Var; scope=env}
