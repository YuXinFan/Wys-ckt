module CircuitCheck

open Prins
//************AST START************
open FStar.Ghost

open FStar.OrdMap
open FStar.OrdSet

type other_info = nat

type typ =
  | T_prin
  | T_eprins
  | T_unit
  | T_bool
  | T_cons: cname:string -> args:list typ -> typ
  | T_box: c:typ -> typ
  | T_wire: c:typ -> typ
  | T_fun: typ -> typ -> typ  //not emitting it for now
  | T_unknown
  | T_sh  // for now shares only for nats

type varname =
  | Var: name:string -> ty:typ -> varname

type const =
  | C_prin  : c:prin   -> const
  | C_eprins: c:eprins -> const

  | C_unit  : c:unit -> const
  | C_bool  : c:bool -> const

  | C_opaque: c:'a -> typ -> const

type exp =
  | E_aspar     : ps:exp -> e:exp -> exp
  | E_assec     : ps:exp -> e:exp -> exp
  | E_box       : ps:exp -> e:exp -> exp
  | E_unbox     : e:exp  -> exp
  | E_mkwire    : e1:exp -> e2:exp -> exp
  | E_projwire  : e1:exp -> e2:exp -> exp
  | E_concatwire: e1:exp -> e2:exp -> exp
  | E_mksh      : e:exp -> exp
  | E_combsh    : e:exp -> exp

  | E_const     : c:const -> exp
  | E_var       : x:varname -> exp
  | E_let       : x:varname -> e1:exp -> e2:exp -> exp
  | E_abs       : x:varname -> e:exp -> exp
  | E_fix       : f:varname -> x:varname -> e:exp -> exp
  | E_empabs    : x:varname -> e:exp -> exp
  | E_app       : e1:exp -> e2:exp -> exp
  | E_ffi       : n:nat -> fname:string -> fn:'a -> args:list exp -> inj:'b -> exp
  | E_cond      : e:exp -> e1:exp -> e2:exp -> exp

type canbox = | Can_b | Cannot_b

type canwire = | Can_w | Cannot_w

type v_meta =
  | Meta: bps:eprins -> cb:canbox -> wps:eprins -> cw:canwire -> v_meta
//************AST END************
//************FFI START************
val union: s1:eprins -> s2:eprins
           -> Pure eprins (True) (fun s -> ((s1 =!= OrdSet.empty () \/ s2 =!= OrdSet.empty ()) ==> s =!= OrdSet.empty ()) /\
                                    (forall p. OrdSet.mem p s = (OrdSet.mem p s1 || OrdSet.mem p s2)))
let union s1 s2 =
  let s = OrdSet.union s1 s2 in
  let _ = cut (OrdSet.equal s OrdSet.empty ==> (OrdSet.equal s1 OrdSet.empty /\ OrdSet.equal s2 OrdSet.empty)) in
  s
//************FFI END************

//************Wysteria START************
open FStar.List
type as_mode =
  | Par
  | Sec

type mode =
  | Mode: m:as_mode -> ps:prins -> mode

type telt =
  | TMsg  : #a:Type -> x:a -> telt
  | TScope: ps:prins -> t:list telt -> telt

type trace = list telt

type wire (a:Type) (eps:eprins) = m:OrdMap.ordmap prin a p_cmp{forall p. mem p eps = OrdMap.contains p m}

open FStar.Heap
assume val moderef : ref mode
assume val traceref : ref trace

//kind Requires         = mode -> Type
//kind Ensures (a:Type) = mode -> a -> trace -> Type
effect Wys (a:Type) (req:mode->Type) (ens: mode->Type ->trace->Type) = ()

assume type can_wire: Type -> Type
assume Canwire_nat   : can_wire nat
assume Canwire_int   : can_wire int
assume Canwire_bool  : can_wire bool
assume Canwire_prin  : can_wire prin
assume Canwire_prins : can_wire prins
assume Canwire_eprins: can_wire eprins

type delSec (m:mode) (ps:prins) = ps = m.ps

abstract val w_contains: #a:Type -> #eps:eprins -> prin -> $w:wire a eps -> GTot bool
let w_contains (#a:Type) #eps p x = OrdMap.contains p x
abstract val w_select  : #a:Type -> #eps:eprins -> p:prin -> w:wire a eps{w_contains #a #eps p w} -> GTot a
let w_select (#a:Type) #eps p x = Some?.v (OrdMap.select p x)

abstract val w_const_on: #a:Type -> eps:eprins -> x:a
                -> GTot (w:wire a eps{forall p. (mem p eps <==> w_contains #a #eps p w) /\
                                                (w_contains #a #eps p w ==> w_select #a #eps p w = x)})
let w_const_on (#a:Type) eps x = OrdMap.const_on eps x


type canProjWireS (#a:Type) (#eps:eprins) (m:mode) (x:wire a eps) (p:prin) =
   m.m = Sec /\ mem p ( m.ps ) /\ w_contains #a #eps p x
type canMkWireS (a:Type) (m:mode) (eps:eprins) =
  m.m = Sec /\ can_wire a /\ subset eps ( m.ps )

val projwire_s: #a:Type -> #eps:eprins -> p:prin -> x:wire a eps{w_contains #a #eps p x}
                -> Wys a (fun m0     -> canProjWireS #a #eps m0 x p)
                         (fun m0 r t -> r = w_select #a #eps p x /\ t = [])
let projwire_s (#a:Type) #eps p x =
  let m0 = ST.read moderef in
  assert (canProjWireS #a #eps m0 x p);
  Some?.v (OrdMap.select p x)

val mkwire_s: #a:Type -> eps:eprins -> x:a
              -> Wys (wire a eps) (fun m0     -> canMkWireS a m0 eps)
                                  (fun m0 r t -> r = w_const_on #a eps x /\ t = [])
let mkwire_s (#a:Type) eps x =
  let m0 = ST.read moderef in
  assert (canMkWireS a m0 eps);
  OrdMap.const_on eps x
//#### trace ####
val last_elt: t:trace{Cons? t} -> Tot telt
let rec last_elt (Cons hd tl) = match tl with
  | [] -> hd
  | _  -> last_elt tl

val all_but_last: t:trace{Cons? t} -> Tot trace
let rec all_but_last (Cons hd tl) = match tl with
  | []       -> []
  | hd'::tl' -> hd::(all_but_last tl)

val rest_trace: t1:trace -> t2:trace -> Tot (option trace)
let rec rest_trace t1 t2 = match t2 with
  | []     -> Some t1
  | hd::tl ->
    match t1 with
      | []       -> None
      | hd'::tl' ->
        if hd = hd' then rest_trace tl' tl else None
//#### as_sec ####
val as_sec: #a:Type -> #req_f:(mode -> Type) -> #ens_f:(mode -> a -> trace -> Type)
            -> ps:prins
            -> $f:(unit -> Wys a req_f ens_f)
            -> Wys a (fun m0     -> req_f (Mode Sec ps) /\ delSec m0 ps)
                     (fun m0 r t -> Cons? t /\ last_elt t = TMsg #a r /\
                                    ens_f (Mode Sec ps) r (all_but_last t))
let as_sec ps f =
  let m0 = ST.read moderef in
  let t0 = ST.read traceref in
  let _ = assert (delSec m0 ps) in
  ST.write moderef (Mode Sec ps);
  let x = f () in
  let t1 = ST.read traceref in
  let t_diff = rest_trace t1 t0 in
  let t' = append (Some?.v t_diff) [TMsg x] in
  ST.write moderef m0;
  ST.write traceref (append t0 t');
  x
//************Wysteria END************
//**********example 百万富翁 **********
let alice_s = singleton Alice
let bob_s = singleton Bob
let ab = union alice_s bob_s

type pre  (m:mode)  = fun m0 -> b2t (m0 = m)
type post (#a:Type) = fun (m:mode) (x:a) (t:trace) -> True

val mill: ps:prins{ps = ab} -> w:wire int ps -> Wys (wire bool ps) (pre (Mode Par ab)) post
let mill ps w =
  let g:unit -> Wys (wire bool ps) (pre (Mode Sec ps)) post =
    fun _ ->
    let x = projwire_s #int #ab Alice w in
    let y = projwire_s #int #ab Bob w in
    mkwire_s ab (x > y)
  in
  as_sec ab g
//************ example end ************
type secAst

val verifySecFunction:  secAst -> unit 
let verifySecFunction ast = match ast.root.name with
|let_binding -> ()
|letin_binding -> ()


val buildAst: (fun _ -> _) -> secAst
let buildAst f = x : secAst

val toplevelVerify: (fun _ -> _) -> unit
let toplevelVerify secf = 
    let ast = buildAst secf in
        verifySecFunction ast 

