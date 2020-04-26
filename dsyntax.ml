open Syntax 

(* General Helper *)
let rec remove_at n = function
    | [] -> []
    | h :: t -> if n = 0 then t else h :: remove_at (n-1) t

let is_none = function |None -> true |Some _ -> false

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
| IntWire
| BoolWire 
| Wire
| Sec  
| Module_d 
| Wys 

| App 
| Proj 
| Lambda 
| Var (* unknown type *)

| Env 
type env = {
    scope_name : string;
    value_in_env : dvalue list;
    env_in_env : env ref list;
    env_out_env : (env ref) option; 
}

and dvalue = {
    (* the id name of a value with name = id in code*)
    name : string;
    (* type of this value, or result type of this function   *)
    typ : typeValue;
    (* the env this value in *)
    scope : env ref ;
    (* when this value is a function, args is the types of its parameters in order *)
    args : (typeValue list) option;

    (* when this value is made by a decl, astd is its ddecl AST *)
    mutable astd : ddecl option;
    (* when this value is made by a expr, aste is its dexpr AST *)
    mutable aste : dexpr option; 
}




and dprog = 
| Module_d of (string * ddecl list) 

and ddecl = 
| DOpen_d of dvalue 
| DVal_d of dvalue * typeValue list * typeValue
| DLet_d of bool * dvalue list * dexpr  
| DType_d of dvalue 

and dexpr = 
| EVar_d of dvalue
| EApp_d of dvalue * (dexpr list) 
| ELet_d of dvalue * dexpr * dexpr 
| EProj_d of dvalue * dvalue 
| EBinop_d of dexpr * op * dexpr 
| EFun_d of dvalue * dexpr 
| ECond_d of dexpr * dexpr * (dexpr option) 

(***  Global Value ***)
let env_cnt = ref (-1) 
let env_init () = env_cnt := !env_cnt + 1 ;
    "internal"^"_"^string_of_int !env_cnt 

let get a = match a with 
| Some e -> e
| None -> raise (Invalid_argument "Option.get no value")
(******* Env Help Function *******)

let make_empty_env id = {
    scope_name = id ;
    value_in_env = [];
    env_in_env = [] ;
    env_out_env = None;
    }

(* Remark: put_env_in_env and put_env_out_env must be done before construct sub expr *)
let put_env_in_env (env1: env ref) (env2: env ref) =
    env2 := {!env2 with env_in_env = ((!env2).env_in_env @ [env1])}

let put_env_out_env (env1:env ref) (env2: env ref) =     
    env2 := {!env2 with env_out_env = Some env1}

let put_value_in_env (v: dvalue)(env:env ref) = 
  env := {!env with value_in_env = !env.value_in_env @ [v]}

(******* dvalue Help Function *******)
let make_dvalue ?args ?astd ?aste name (typ:typeValue) sc = { 
    name = name ; 
    typ = typ ;
    scope = sc;
    args = args;
    
    astd = astd;
    aste = aste } 


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


let rec find_value_in_env (name:string) (env: env ref) = 
    let value_list = !env.value_in_env in 
      let in_curr_level = find_value_in_value_list name value_list in 
        match in_curr_level with 
        | Some e -> Some e
        | None -> let out = !env.env_out_env in 
            (match out with 
            | None -> None 
            | Some e -> find_value_in_env name e)

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

(* Match prims type value  *)
let match_value_type (_:string) (name:string) = match name with 
| "Alice" -> Prin 
| "Bob" -> Prin 
| "int" -> Int 
| "bool" -> Bool 
| "wire" -> Wire 
| "prins" -> PrinSet
| "Wys" -> Wys 
| _ -> Var 

let match_apply_name_type (name:string) = match name with 
| "singleton" -> Set
| "union" -> Set 
| "projwire" -> Wire 
| "mkwire" -> Wire 
| "bool" -> Bool 
| "as_sec" -> Sec 
| _ -> Var 

let rec match_types_type (t: types) = match t with 
| TVar id -> [match_value_type "" id]
| TConst id ->  [match_value_type "" id]
| TDependent (_, t1, t2) -> match_types_type t1 @ match_types_type t2 
| TDependentRefine (_, t1, _, t2) -> match_types_type t1 @ match_types_type t2 
| TRefine (id, _, _) -> [match_value_type "" id]
| TFun _ -> [Var]

let match_op_type (op:op) = match op with 
| ADD -> Int 
| SUB -> Int 
| MUL -> Int 
| DIV -> Int 
| MOD -> Int 

| GT -> Bool 
| BEQ -> Bool 
| EQ -> Bool

let rec match_wire_type (des:dexpr list) = match des with 
| [] -> Wire 
| [a] -> ( match type_of_dexpr a with
  | Int -> IntWire 
  | Bool -> BoolWire
  | _ -> Wire 
  )
| hd::tl -> (match match_wire_type [hd] with 
  | Wire -> match_wire_type tl 
  | IntWire -> IntWire 
  | BoolWire -> BoolWire 
  | _ -> Wire 
  )
and type_of_dexpr (de:dexpr) = match de with 
| EVar_d dv -> dv.typ
| EApp_d (dv , des) -> let dv_typ = match_apply_name_type dv.name in 
    (match dv_typ with 
    | Set -> PrinSet
    | Wire -> match_wire_type des 
    | Bool -> Bool 
    | Sec -> Sec
    | _ -> Var
    )
| ELet_d (_, de1, _) -> type_of_dexpr de1
| EProj_d (_, dv2) -> dv2.typ  
| EBinop_d (_, op, _) -> match_op_type op 
| EFun_d (_, _) -> Fun 
| ECond_d (_, e, _) -> type_of_dexpr e

(*******  Dsyntax Constructor *******)
let rec cons_of_dprog (ast : prog) = match ast with 
| Module (id, dcls) -> let env = ref ( make_empty_env id ) in 
    let dcls_v = cons_of_ddecls env dcls in 
        (Module_d (id, dcls_v), env)

and cons_of_ddecls (env:env ref) (dcls : decl list) = match dcls with 
|[] -> []
| [d] -> [cons_of_ddecl env d] 
| hd::tl -> let hd_d = (cons_of_ddecl env hd) in 
    let tl_d =  (cons_of_ddecls env tl) in 
    [hd_d] @ tl_d 

and cons_of_ddecl (env:env ref) (dcl: decl) = match dcl with 
| DOpen id -> let id_v = make_dvalue id Module_d env in 
    put_value_in_env id_v env;
    DOpen_d id_v 
| DVal (id, t) -> 
    let typeValue_list = match_types_type t in  
      let len = List.length typeValue_list in
        let result_type = List.nth typeValue_list (len-1) in 
          let left_type = remove_at (len-1) typeValue_list in 
            let id_v = make_dvalue ~args:left_type id ValDef env in
              put_value_in_env id_v env ;
              DVal_d (id_v, left_type, result_type) 
| DLet (b, v, e) -> let hd, tl = List.hd v, List.tl v in 
  let hd_name = snd (dcons_of_values hd) in
    (* if v is been valdef, find and put args into env  *)
    let is_exist = find_value_in_env hd_name env in 
      (match is_exist with 
      | Some vd -> if vd.typ = ValDef then 
        let args = get(vd.args) in 
        for i = 0 to (List.length tl)-1 do 
          let tmp_name = snd (dcons_of_values (List.nth tl i)) in 
          let tmp_typeValue = (List.nth args i) in 
          let tmp = make_dvalue tmp_name tmp_typeValue  env in 
            put_value_in_env tmp env 
        done;
      | None -> ()
      );
    let e_d = cons_of_dexpr env e in 
      let v_type = type_of_dexpr e_d in 
        let v_v = make_dvalue hd_name v_type env in  
          let result_ast = DLet_d (b, [v_v], e_d) in 
          v_v.astd <- Some result_ast;  
          put_value_in_env v_v env ;
          result_ast
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
| hd::tl -> let hd_d = (cons_of_dexpr env hd) in 
    let  tl_d =  (cons_of_dexprs env tl) in 
        [hd_d] @ tl_d 

and cons_of_dexpr (env:env ref) (e: exprs) = match e with 
| EVar v -> let v_type, v_name =  dcons_of_values v  in 
    (* Deal with "#int" "#ab", xxx_real = int or ab *)
    let v_name_real = if v_name.[0] = '#' 
        then String.sub v_name 1 (String.length v_name -1) 
        else v_name 
        in 
    (* find value from env by name *)
    let v_value = find_value_in_env v_name_real env in 
        (match v_value with 
        | None -> let v_typ = match_value_type v_type v_name_real in 
            let v_d = make_dvalue v_name_real v_typ env in 
                put_value_in_env v_d env ;
                (* Printf.printf "D %s %s %d\n" !env.scope_name v_name (List.length !env.value_in_env);  *)
                EVar_d v_d
        | Some dv -> 
            EVar_d dv 
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
                let env2_dv = make_dvalue (!env2).scope_name Env env2 in
                put_value_in_env env2_dv env;
                put_env_in_env env2 env;
                put_env_out_env env env2;
                  let e2_d = cons_of_dexpr env2 e2 in 
                      let result_ast = ELet_d (v_d, e1_d, e2_d) in 
                        v_d.aste <- Some result_ast ;
                        result_ast 

| EBinop (e1, op, e2) -> let e1_d = cons_of_dexpr env e1 in 
    let e2_d = cons_of_dexpr env e2 in 
        EBinop_d (e1_d, op, e2_d)
| EFun (b, e) -> let b_name = dcons_of_binder b in 
    let b_v = make_dvalue b_name Lambda env in 
    put_value_in_env b_v env ;
      let env2 = ref (make_empty_env (env_init())) in 
      put_env_out_env env env2;
      put_env_in_env env2 env;
        let e_d = cons_of_dexpr env2 e in 
          let env2_dv = make_dvalue (!env2).scope_name Env env2 in 
            put_value_in_env env2_dv env ;   
            let result_ast = EFun_d (b_v, e_d) in 
              b_v.aste <- Some result_ast;
              result_ast
| _ -> EVar_d (make_dvalue "none" Var env)


(* find wys apply, "as_sec prin_set lambda_function" *)
let rec find_as_sec_in_expr (e:dexpr) = match e with 
  | ELet_d (_, _,e2) -> find_as_sec_in_expr e2 
  | EApp_d (v, vs) -> if v.name = "as_sec" then Some vs else None
  | EFun_d (_, e) -> find_as_sec_in_expr e
  | _ -> None 

let find_as_sec_in_decl (d: ddecl) = match d with 
  | DLet_d (_, _, e) -> find_as_sec_in_expr e
  | _ -> None 

let find_decl_with_as_sec (dp: dprog) = match dp with 
| Module_d (_, dcls) -> let find_result = List.map find_as_sec_in_decl dcls in 
  let sec = List.find (fun a -> match a with Some _ -> true | None -> false) find_result in 
    sec 

let get_prins_and_fun_dvalue (des: dexpr list) = 

let map_f (de:dexpr)= match de with 
| EVar_d v -> v
| _ -> let nothing =  (ref (make_empty_env "none_env")) in 
  let nothing2 = make_dvalue "none" Var nothing in 
    nothing2
in 

 let dvalue_list = List.map map_f des in
  let prins = List.hd dvalue_list in 
    let func = List.hd (List.tl dvalue_list)in 
    (prins, func) 

let rec find_as_sec_fun (dv:dvalue) (env: env) = 
   let r = List.find_opt (fun a -> if a.name = dv.name then true else false) env.value_in_env in 
    match r with 
    | Some dv' -> (true, Some dv') 
    | None -> ( match env.env_in_env with 
      | [] -> raise (Invalid_argument "not find as_sec fun in env")
      | [x] -> find_as_sec_fun dv !x 
      | x -> find_as_sec_fun_in_envs dv x   
    )

and find_as_sec_fun_relax (dv:dvalue) (env: env) = 
   let r = List.find_opt (fun a -> if a.name = dv.name then true else false) env.value_in_env in 
    match r with 
    | Some dv' -> (true, Some dv') 
    | None -> ( match env.env_in_env with 
      | [] -> (false, None)
      | [x] -> find_as_sec_fun_relax dv !x 
      | x -> find_as_sec_fun_in_envs dv x   
    ) 

and find_as_sec_fun_in_envs (dv:dvalue) (envs:env ref list) = 
let is_find = ref false in 
let envs_len = List.length envs in 
let cnt = ref 0 in 
let tmp = dv in 
let result = ref tmp in 
while (not !is_find)&&(envs_len > !cnt) do 

  let nth = List.nth envs !cnt in 
  cnt := !cnt+1;
  let b, o = find_as_sec_fun_relax dv !nth in 
  if b = true then 
    result := get o;
    is_find := true 
done;
(!is_find, Some !result) 
