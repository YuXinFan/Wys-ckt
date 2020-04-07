
(* We use a two-level AST, where the types [expr] and [raw_expr] are mutually
   recursive; this means that every subexpression is annotated with its
   location in the input text. In this file, we use the parameterized symbol
   [located] to annotate semantic values with locations without polluting the
   grammar. *)

(* We make heavy use of ~ patterns and <...> semantic actions to avoid naming
   or numbering the semantic values that we manipulate. *)

(* Grammer specification*)
%token <bytes> BYTEARRAY
%token <string> STRING
%token <string> IDENT
%token <string> NAME
%token <string> TVAR
%token <string> TILDE

%token <string * bool> INT8
%token <string * bool> INT16
%token <string * bool> INT32
%token <string * bool> INT64
%token <int> INT
%token <string> RANGE

%token <string> UINT8
%token <string> UINT16
%token <string> UINT32
%token <string> UINT64
%token <float> IEEE64
%token <string> REAL
%token <char> CHAR

(* symbol *)
%token ADD SUB DIV MUL MOD 
%token GT LT GE LE EQ NE 
%token DOT COMMA
%token COLON COLON_COLON SEMICOLON SEMICOLON_SEMICOLON 
%token LARROW RARROW LPAREN_RPAREN LPAREN RPAREN
(* keyword *)
%token MODULE OPEN BIG_START_NAME  END 
%token IF ELSE THEN 
%token MATCH WITH 
%token LET IN REC 
%token <bool> TRUE FALSE
%token TYPE VAL OF
%token FUNCTION FUN 

%token REQUIRES ENSURES
(* fstar raw *)
%token IRREDUCIBLE UNFOLDABLE INLINE OPAQUE ABSTRACT UNFOLD INLINE_FOR_EXTRACTION
%token NOEXTRACT
%token NOEQUALITY UNOPTEQUALITY PRAGMALIGHT PRAGMA_SET_OPTIONS PRAGMA_RESET_OPTIONS PRAGMA_PUSH_OPTIONS PRAGMA_POP_OPTIONS PRAGMA_RESTART_SOLVER
%token TYP_APP_LESS TYP_APP_GREATER SUBTYPE SUBKIND BY
%token AND ASSERT SYNTH BEGIN 
%token EXCEPTION  DEFAULT
%token FRIENDTRY  CALC CLASS INSTANCE EFFECT 
%token INCLUDE
%token WHEN HASH AMP  LONG_LEFT_ARROW 
%token IFF IMPLIES CONJUNCTION DISJUNCTION
%token QMARK_DOT
%token QMARK
%token  EQUALS PERCENT_LBRACK LBRACK_AT DOT_LBRACK DOT_LENS_PAREN_LEFT DOT_LPAREN DOT_LBRACK_BAR LBRACK LBRACK_BAR LBRACE BANG_LBRACE
%token BAR_RBRACK UNDERSCORE LENS_PAREN_LEFT LENS_PAREN_RIGHT
%token BAR RBRACK RBRACE DOLLAR
%token PRIVATE REIFIABLE REFLECTABLE REIFY RANGE_OF SET_RANGE_OF LBRACE_COLON_PATTERN PIPE_RIGHT
%token NEW_EFFECT SUB_EFFECT LAYERED_EFFECT POLYMONADIC_BIND SPLICE SQUIGGLY_RARROW TOTAL
%token MINUS COLON_EQUALS QUOTE BACKTICK_AT BACKTICK_HASH
%token BACKTICK UNIV_HASH
%token BACKTICK_PERC

%token EOF

%nonassoc THEN
%nonassoc ELSE
%nonassoc COLON_EQUALS

%right COLON_COLON
%right AMP
%left     BACKTICK
%left     BACKTICK_AT BACKTICK_HASH
%left     PIPE_RIGHT



(*====Wys Token Start====*)
%token ASSEC ASPAR
%token MKWIRE PROJWIRE CONCATWIRE 
%token BOX UNBOX
%token SEAL "seal"
%token REVEAL "reveal"
%token FFI "ffi"
(*====Wys Token End====*)

   %start <Syntax.expr> main
  (* Header  %{...}% *)
   %{ open Syntax %}
   
   %%
   
   main :
   | program EOF { program }

   program :
   | MODULE BIG_START_NAME list(OPEN BIG_START_NAME) program_decl [END]
    {program_decl}

   program_decl:
   | decl_letbinding
   | decl_typedefine
   | decl_expr

   decl_expr:
   |

   (* let main :=
   | MODULE 
     ~ = expr; EOF; <>
   
   let arith_op == 
   | ADD;    {Syntax.Add}
   | SUB;    {Syntax.Sub}
   | DIV;    {Syntax.Div}
   | MUL;    {Syntax.Mul}
   | MOD;    {Syntax.Mod}

   let comp_op ==
   | LE;     {Syntax.Le}
   | GE;     {Syntax.Ge}
   | LT;     {Syntax.Lt}
   | GT;     {Syntax.Gt}
   | EQ;     {Syntax.Eq}
   | NE;     {Syntax.Ne}

   let bool_op == 
   | AND ; {}

  func_args:
   | (* none *) {[]}  
   | arg = IDENT; args = func_args; {arg::args}

  let expr := 
  (* ( <expression> ) *)
  | delimited(LPAREN, expr, RPAREN)
  | expr_unit
  | expr_bool
  | expr_int
  | expr_bin
  | expr_if
  | expr_letin 
  | expr_let
  | expr_seq

  let expr_unit :=
  | located (
    unit = LPAREN_RPAREN;  {Syntax.Unit(unit)}
  ) 

  let expr_bool :=
  | bool_true
  | bool_false

  let bool_true :=
  | located (
    TRUE ;
    {Syntax.True}
  )

  let bool_false :=
  | located (
    FALSE;
    {Syntax.False}
  )
  let expr_int :=
  | located (
    var = INT;
    {Syntax.Int(var)}
  )
  
  let expr_var :=
  | located (
    id = IDENT; 
    {Syntax.Id(id)}
  )
  (* expr binop expr *)
  let expr_bin :=
  | bin_arith
  | bin_comp

  let bin_arith :=
  | located (
      left = expr; op_ = arith_op; right = expr;
        { Syntax.Op (op_, left, right) }
  )

  let bin_comp :=
  | located (
      left = expr; op_ = comp_op; right = expr;
        { Syntax.Op (op_, left, right) }
  )
  let expr_if :=
  | if_then_no_else 
  | if_then_else

  let if_then_no_else :=
  | located (
    IF ; cond = expr ; THEN ; e1 = expr ; 
    { Syntax.If (cond, e1)}
  )
  
  let if_then_else :=
  | located (
      IF ; cond = expr ; THEN ; e1 = expr ; ELSE ; e2 = expr ;
    { Syntax.Ifelse (cond , e1, e2)}
  )

  

  let expr_seq := 
  | located (
    left = expr; SEMICOLON; right = expr; {Syntax.Seq(left, right)}
  )

  let expr_letin :=
  | located(
      LET; ident = IDENT; EQ ; expr1 = expr ; IN ; expr2 = expr ; 
        { Syntax.Letin (ident, expr1, expr2)}
  )
  let expr_let :=
  | located (
    LET; ident = IDENT; EQ ; expr1 = expr ; 
    { Syntax.Let (ident, expr1)}
  )  *)
   (* An Wys block is a as_sec or as_par*)
(* 
   let expr_wys :=
    | expr_aspar    
    | expr_assec    
    | expr_box      
    | expr_unbox    
    | expr_mkwire   
    | expr_projwire  
    | expr_concatwire 
    | E_concatwire *)
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


(** 
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
  | BOX ; IDENT ; <> // box prin value
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
   

   
   (* A multiplicative expression is either an atomic expression or the
      application of a multiplicative operator to two subexpressions. *)
   
   let multiplicative_expr :=
     | atomic_expr
     | located(
         ~ = multiplicative_expr; ~ = multiplicative_op; ~ = atomic_expr; <EBinOp>
       )

   
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
   (* -------------------------------------------------------------------------- *)
   
   (* [located(x)] recognizes the same input fragment as [x] and wraps its
      semantic value of type ['a] as a value of type ['a located]. *)
   
 
   **)
     let located(x) ==
     ~ = x; { { loc = $loc; value = x } }