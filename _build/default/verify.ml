open Dsyntax 
open Dprint

let get_args2 (l:'a list) = let a1 = List.hd l in 
  let a2 = List.hd (List.tl l) in 
    (a1, a2)

let is_prin_set e =  match e with 
    | PrinSet -> true 
    | _ -> false  

let is_EVar de = match de with 
| EVar_d _ -> true 
| _ -> false 

let is_Int dv = dv.typ = Int 

let is_IntList dv = dv.typ = IntList 

let get_EVar_dvalue de = match de with 
| EVar_d x -> x 
| _ -> raise (Invalid_argument "de is not a EVar_d type")

(* list size is uncover *)
let list_mem_verify (de1:dexpr) (de2:dexpr) =  
  let evar1 = is_EVar de1 in 
  let evar2 = is_EVar de2 in 
  if evar1 && evar2 then 
    let dv1 = get_EVar_dvalue de1 in 
      let dv2 = get_EVar_dvalue de2 in 
        let r1 = is_Int dv1 in 
          let r2 = is_IntList dv2 in 
            r1 && r2 
  else
    false

(* list size is uncover *)
let list_intersect_verify (de1: dexpr) (de2: dexpr) = 
  let evar1 = is_EVar de1 in 
  let evar2 = is_EVar de2 in 
  if evar1 && evar2 then 
    let dv1 = get_EVar_dvalue de1 in 
    let dv2 = get_EVar_dvalue de2 in 
      let r1 = is_IntList dv1 in 
      let r2 = is_IntList dv2 in 
        r1 && r2 
  else 
    false

let rec match_ffi (v:dvalue) (des:dexpr list) = match v.name with 
| "FFI.mk_nil" -> true
| "FFI.mk_cons" -> let arg1 = List.hd des in 
    let arg2 = List.hd (List.tl des) in 
      let r1 = match_ast_to_wys_ckt arg1 in 
        let r2 = match_ast_to_wys_ckt arg2 in 
        r1 && r2 
| "FFI.nth" -> let a1 = List.hd des in 
    let a2 = List.hd (List.tl des) in 
      let r2 = match_ast_to_wys_ckt a2 in 
        let r1 = (match a1 with 
        | EVar_d v' -> v'.typ = Int 
        | _ -> raise (Invalid_argument "FFI.nth must have a constant int index argument")
        ) in 
        r1 && r2
| "FFI.list_mem" -> let a1, a2 = get_args2 des in 
    let a2' = list_mem_verify a1 a2 in 
      let r1 = ( match a1 with 
      | EVar_d v' -> v'.typ = Int 
      | _ -> raise (Invalid_argument "FFI.list_mem must have a Int variable argument")
      ) in 
        let r2 = a2' in 
          r1 && r2 
| "FFI.list_intersect" -> let a1, a2 = get_args2 des in 
    let r1' = ( match a1 with 
    | EVar_d v' -> v'.typ = IntList 
    | _ -> raise (Invalid_argument "FFI.list_intersect must have a IntList argument at position 0")
    ) in 
    let r2' = ( match a2 with 
    | EVar_d v' -> v'.typ = IntList
    | _ -> raise (Invalid_argument "FFI.list_intersect must have a IntList argument at position 0")
    ) in 
      if r1'&&r2' then 
        let a' = list_intersect_verify a1 a2 in 
          let r =  a' in 
            r 
      else false  

(*  mksh, combsh  are todo HERE *)
| "as_sec" -> true 
| _ -> let warn_str = Printf.sprintf "not support FFI application: %s" v.name in 
    raise (Invalid_argument warn_str)


and match_ast_to_wys_ckt (f: dexpr) = match f with 
| ELet_d (_, e1, e2) -> 
    let is_e1 = match_ast_to_wys_ckt e1 in 
        let is_e2 = match_ast_to_wys_ckt e2 in 
        is_e1 && is_e2 
| EVar_d v -> (match v.typ with
    | Int -> true 
    | Bool -> true 
    | PrinSet -> true 
    | IntList -> true 
    | Wire -> true 
    | IntWire -> true 
    | Prin -> true 
    | BoolWire -> true 
    | BoxBool -> true 
    | BoxInt -> true 
    | _ -> raise (Invalid_argument "EVar variable has a not a support type")
    )
| EApp_d (v, des) -> (match v.name with 
  | "mkwire" -> match_ast_to_wys_ckt (List.nth des 1)
  | "unbox" -> match_ast_to_wys_ckt (List.nth des 0)
  | "projwire" -> true 

  | _ -> match_ffi v des 
  )
| EBinop_d (e1, op, e2) -> let e1_typ = type_of_dexpr e1 in 
  let e2_typ = type_of_dexpr e2 in 
    if e1_typ = e2_typ then 
      let is_matched = (match e1_typ with 
      | IntWire -> (match op with 
        | ADD -> true 
        | SUB -> true 
        | GT -> true 
        | BEQ -> true 
        | _ -> false
        )
      | BoolWire -> (match op with 
        | BEQ -> true 
        | _ -> false
        )
      | Int -> (match op with 
        | ADD -> true 
        | SUB -> true 
        | GT -> true 
        | BEQ -> true 
        | _ -> false)
      | _ -> false 
      )
      in 
      is_matched 
    else 
      raise (Invalid_argument "different type operator of ffi binary operation");
| EFun_d (_, e) -> match_ast_to_wys_ckt e 
| ECond_d (c, e1, e2) -> let r0 = match_ast_to_wys_ckt c in 
  let r1 = match_ast_to_wys_ckt e1 in 
  let r2 = match_ast_to_wys_ckt e2 in 
    r1&&r2&&r0
| _ ->  raise(Invalid_argument "not supported dexpr type" )

let verify_as_sec (prins:dvalue) (func:dvalue) = 
    let is_PrinSet = is_prin_set prins.typ in 
        let ast = get func.aste in 
          match ast with 
          | ELet_d (_, e1, _) -> 
            let is_matched_code = match_ast_to_wys_ckt e1 in 
                is_PrinSet && is_matched_code
          | _ -> raise (Invalid_argument "as_sec prins func with func is not a let in expr")

let verify_wys (dp:dprog) = 
  let decl_with_as_sec = get (find_decl_with_as_sec dp) in 
    let p_g = get_prins_and_fun_dvalue decl_with_as_sec in 
      let func = snd p_g in 
      print1 "Typed AST OF as_sec:\n";
      print_dexpr (get func.aste);
      print1 "\n\n";
      print1 "Verification Result:\n";
      let result = verify_as_sec (fst p_g) (snd p_g) in 
        result