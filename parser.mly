
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
%token <string * bool> INT
%token <string> RANGE

%token <string> UINT8
%token <string> UINT16
%token <string> UINT32
%token <string> UINT64
%token <float> IEEE64
%token <string> REAL
%token <char> CHAR
%token <bool> LET
(* symbol *)
%token ADD SUB DIV MUL MOD 
%token GT LT GE LE EQ NE 
%token DOT COMMA
%token COLON COLON_COLON SEMICOLON SEMICOLON_SEMICOLON 
%token LPAREN_RPAREN LPAREN RPAREN
(* keyword *)
%token IF ELSE THEN 
%token MATCH WITH 
%token IN REC 
%token TRUE FALSE
%token TYPE VAL OF
%token FUNCTION FUN 
%token OPEN MODULE END
%token LARROW RARROW LPAREN RPAREN LPAREN_RPAREN 
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
   
     let main :=
     ~ = expr; EOL; <>
   
   let binop == 
   | ADD;    {Syntax.Add}
   | SUB;    {Syntax.Sub}
   | DIV;    {Syntax.Div}
   | MUL;    {Syntax.Mul}
   | MOD;    {Syntax.Mod}
   | LE;     {Syntax.Le}
   | GE;     {Syntax.Ge}
   | LT;     {Syntax.Lt}
   | GT;     {Syntax.Gt}
   | EQ;     {Syntax.Eq}
   | NE;     {Syntax.Ne}

  let func_args = 
  | (* none *) {[]}  
  | arg = IDENT; args = func_args {arg::args}

   let letbinding :=
  let expr := 
  | UNIT;       { Syntax.Unit}
  | TRUE:       {Syntax.True}
  | False;      {Syntax.False}
  | i = INT;      {Syntax.Int(i)}
  | id = IDENT;   {Syntax.Id(id)}
  (* expr binop expr *)
  | left = expr; op = binop; right = expr
    { Syntax.Op (op, left, right) }
  (* ( <expression> ) *)
  | LPARENS; e = expr ;RPARENS
    { e }
  | IF; predicat = expr; THEN ; then_expr = expr;
    ELSE;  else_expr = expr; 
    { Syntax.If (predicat, if_expr, else_expr) }
  | LET; id = ID; EQUALS; dec = expr; IN; body = expr;
    { Syntax.Let (id, dec, body) }
  | left = expr; SEMICOLON; right = expr
    { Syntax.Seq (left, right) }


   
   (* An Wys block is a as_sec*)

   let expr_wys :=
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
   

   let expr_let := 
    | LET ; expr_assign ; <>
    | located (

    )
   let expr_assign := 
   | IDENT ; EQUAL ; expr
    let expr_letin := 
    | LET ; expr_assign ; in ; expr

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
   
   let located(x) ==
     ~ = x; { { loc = $loc; value = x } }
   