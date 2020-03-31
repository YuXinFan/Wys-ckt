
(* We use a two-level AST, where the types [expr] and [raw_expr] are mutually
   recursive; this means that every subexpression is annotated with its
   location in the input text. In this file, we use the parameterized symbol
   [located] to annotate semantic values with locations without polluting the
   grammar. *)

(* We make heavy use of ~ patterns and <...> semantic actions to avoid naming
   or numbering the semantic values that we manipulate. *)

(* Grammer specification*)
   %token <int> INT
   %token PLUS MINUS TIMES DIV
   %token LPAREN RPAREN
   %token EOL
   

  (*====Wys Token Start====*)
  %token ASSEC ASPAR
  %token MKWIRE PROJWIRE CONCATWIRE 
  %token BOX UNBOX
  %token SEAL "seal"
  %token REVEAL "reveal"
  %token FFI "ffi"
  %token IDENT
  (*====Wys Token End====*)

   %start <Syntax.expr> main
  (* Header  %{...}% *)
   %{ open Syntax %}
   
   %%
   
   (* -------------------------------------------------------------------------- *)
   
   (* We wish to parse an expression followed with an end-of-line. *)
   
   let main :=
     ~ = expr; EOL; <>
   
   (* An Wys block is a as_sec*)

   let expr :=
    | expr_aspar    
    | expr_assec    
    | expr_box      
    | expr_unbox    
    | expr_mkwire   
    | expr_projwire  
    | expr_concatwire 
    | E_concatwire
    (* TODO 
  | E_mksh      : e:exp -> exp
  | E_combsh    : e:exp -> exp
  
  | expr_const
  | E_var       : x:varname -> exp
  | E_let       : x:varname -> e1:exp -> e2:exp -> exp
  | E_abs       : x:varname -> e:exp -> exp
  | E_fix       : f:varname -> x:varname -> e:exp -> exp
  | E_empabs    : x:varname -> e:exp -> exp
  | E_app       : e1:exp -> e2:exp -> exp
  | E_ffi       : n:nat -> fname:string -> fn:'a -> args:list exp -> inj:'b -> exp
  | E_cond      : e:exp -> e1:exp -> e2:exp -> exp
  *)

let expr_aspar := 
  | ASPAR; IDENT ; IDENT; <>  (*as_par prins func*)
  | located (
      ~ = expr_const; ~ = expr_var; <EASPAR>
    )
let expr_assec := 
  | ASSEC; IDENT ; IDENT; <> // as_sec prins func
  | located (
    ~ = expr_const; ~= expr_var; <EASSEC>
  )
let expr_box :=  
  | BOX ; IDENT ; <>// box prin value
  | located (
    ~ = expr_var; <EBOX>
  ) 
let expr_unbox := UNBOX IDENT // unbox_s value or unbox_p value
let expr_mkwire := MKWIRE IDENT // mkwire_s prin value or mkwire_p prin value
let expr_projwire := PROJWIRE IDENT // projwire_s prin wire or projwire_p prin wire
let expr_concatwire := CONCATWIRE IDENT // concat_wire wire wire
let expr_const :=   Prin | EPRINS | UNIT | BOOL | OPAQUE
let expr_var := IDENT 
   (* An expression is an additive expression. *)
   
   let expr ==
     additive_expr
   
   (* An additive expression is
   
      either a multiplicative expression,
      or the application of an additive operator to two subexpressions.
   
      In the second case, the left-hand subexpression is additive, while the
      right-hand subexpression is multiplicative; this reflects the fact that
      the operator is left-associative. The three semantic values of interest
      (the left subexpression, the operator, the right subexpression) are
      matched against ~ patterns, which means that, in the end, the data
      constructor [EBinOp] is applied to a tuple of these three components.
      Furthermore, this whole construction is wrapped in [located], so the
      result of [EBinOp], a raw expression, is turned into an expression. *)
   
   let additive_expr :=
     | multiplicative_expr
     | located(
         ~ = additive_expr; ~ = additive_op; ~ = multiplicative_expr; <EBinOp>
       )
   
   (* These are the additive operators and their meaning. *)
   
   let additive_op ==
     | PLUS;  { OpPlus }
     | MINUS; { OpMinus }
   
   (* A multiplicative expression is either an atomic expression or the
      application of a multiplicative operator to two subexpressions. *)
   
   let multiplicative_expr :=
     | atomic_expr
     | located(
         ~ = multiplicative_expr; ~ = multiplicative_op; ~ = atomic_expr; <EBinOp>
       )
   
   (* These are the multiplicative operators and their meaning. *)
   
   let multiplicative_op ==
     | TIMES; { OpTimes }
     | DIV;   { OpDiv }
   
   (* An atomic expression is one of:
      an expression between parentheses,
      an integer literal,
      an application of a unary operator to an atomic expression. *)
   
   (* Only the last two cases are wrapped in [located]; in the first case, this is
      not necessary, as the expression already carries a location. Note that, this
      way, we get tight locations (i.e., the parentheses are not included). *)
   
   let atomic_expr :=
     | LPAREN; ~ = expr; RPAREN; <>
     | located(
       | ~ = INT; <ELiteral>
       | ~ = unary_op; ~ = atomic_expr; <EUnOp>
       )
   
   (* These are the unary operators and their meaning. *)
   
   let unary_op ==
     | MINUS; { OpNeg }
   
   (* -------------------------------------------------------------------------- *)
   
   (* [located(x)] recognizes the same input fragment as [x] and wraps its
      semantic value of type ['a] as a value of type ['a located]. *)
   
   let located(x) ==
     ~ = x; { { loc = $loc; value = x } }
   