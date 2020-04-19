
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
%token <string> RANGE

%token <string> UINT8
%token <string> UINT16
%token <string> UINT32
%token <string> UINT64
%token <float> IEEE64
%token <string> REAL

%token <float> FLOAT
%token <bool> FALSE 
%token <bool> TRUE
%token <int> INT
%token <char> CHAR

(* symbol *)
%token ADD SUB DIV MUL MOD 
%token GT LT GE LE EQ NE BEQ 
%token DOT COMMA
%token COLON COLON_COLON SEMICOLON SEMICOLON_SEMICOLON 
%token LARROW RARROW LPAREN_RPAREN LPAREN RPAREN ARROW
%token ANY // _
%token DBLEQUAL // == 
%token NOTEQUAL // !=
(* keyword *)
%token MODULE OPEN END 
%token IF ELSE THEN 
%token MATCH WITH 
%token LET IN REC 
%token TYPE VAL OF
%token FUNCTION FUN 
%token OR AND 

%token REQUIRES ENSURES

(* Application function name *)
%token SINGLETON UNION 
(* fstar raw *)
%token IRREDUCIBLE UNFOLDABLE INLINE OPAQUE ABSTRACT UNFOLD INLINE_FOR_EXTRACTION
%token NOEXTRACT
%token NOEQUALITY UNOPTEQUALITY PRAGMALIGHT PRAGMA_SET_OPTIONS PRAGMA_RESET_OPTIONS PRAGMA_PUSH_OPTIONS PRAGMA_POP_OPTIONS PRAGMA_RESTART_SOLVER
%token TYP_APP_LESS TYP_APP_GREATER SUBTYPE SUBKIND BY
%token  ASSERT SYNTH BEGIN 
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

%token EOL EOF


(*====Wys Token Start====*)
%token ASSEC ASPAR
%token MKWIRE PROJWIRE CONCATWIRE  WIRE
%token BOX UNBOX
%token SEAL "seal"
%token REVEAL "reveal"
%token FFI "ffi"
%token ALICE BOB
(*====Wys Token End====*)

%nonassoc THEN
%nonassoc ELSE
%nonassoc COLON_EQUALS

%right COLON_COLON
%right AMP
%left     BACKTICK
%left     BACKTICK_AT BACKTICK_HASH
%left     PIPE_RIGHT 




%start prog decl rawExpr 
%start wysPrin typFun typNormal
%type <Syntax.prog> prog 
%type <Syntax.decl> decl 
%type <Syntax.exprs> rawExpr
%type <Syntax.values> wysPrin
%type <Syntax.types> typFun
%type <Syntax.types> typNormal

(* Header  %{...}% *)
%{ open Syntax %}

  
%%
   /* Program */
prog:
  | MODULE name=STRING decls=list(decl) EOF 
    { Module (name, decls) }

decl:
  |  decl=rawDecl 
    { mk_decl decl }
  
  /****** Top Level Decl ******/

rawDecl:
  | OPEN uid=pathid
    {DOpen uid}
  | LET REC x=ident list(ident) EQ e1=expr ruleEnd
    {DLet (true,  x, e1)}
  | LET x=ident list(ident) EQ e1=expr ruleEnd
    {DLet (false,  x, e1)}
  | TYPE x=typeDecl ruleEnd
    {DType x} 
  | VAL x=idstr COLON t=typ 
    {DVal (x, t)}

/****** Type ******/
typeDecl: 
  | x=typedecl typars tdef=typeDef  /* (tdecls * types) */
    {  TTabbr (x, tdef) }
  | x=typedecl
    { TTdef x}  /* tdecls */

typedecl:
  | x=typNormal bs=nonempty_list(binder)
    {TTypebinder (x, bs)}  /* (types * binders list) */
    
  | x=typNormal 
    {TType x} /*types*/ 


typars:
  |   {}
  | binder                {  }

typeDef:
  | { TConst "unkonw"}  
  | EQ t=typ 
    {t}

typ: 
  | t=typNormal 
    {t}
  | t=typFun 
    {t}

typFun:
  | FUN bind=list(binder) ARROW ty=typNormal formula
    {TFun (bind, ty)} /* ( binders * types ) */

typNormal:
  | x=idstr COLON t=typ LBRACE f=formula RBRACE
    {TRefine (x, t, f)}
  | x=idstr COLON t=typ ARROW t2=typ 
    {TDependent (x, t, t2)}
  | x=idstr COLON t=typ LBRACE f=formula RBRACE ARROW t2=typ 
    {TDependentRefine (x, t, f, t2)}
  | x=nonempty_list(idstr)
    {TVar (List.hd x)}
  | x=appName nonempty_list(idstr)
    { let name = match x with 
      | CApp id -> id 
      | _ -> "no_app" in TVar name }
  | x=STRING LPAREN typ RPAREN pre_postcond pre_postcond 
    {TVar x}


pre_postcond:
  | nondelimited_expr 
    {Ignore}
  | expr 
    {Ignore}



/****** formula ******/
formula:
  | {Ignore}
  | IDENT EQ IDENT 
    {Ignore}
  | LPAREN IDENT EQ IDENT RPAREN 
    {Ignore}
  | expr 
    {Ignore}

/****** Binder ******/
binder:
  | x=singleBinder 
    {x}


singleBinder:
  | LPAREN x=IDENT COLON t=typNormal RPAREN 
    {BValuebinder (x,  t)}
  | x=idstr 
    {BValue x}
  | ANY 
    {BValue "_"}


/****** Expr ******/
decorateExpr:
  | e=expr
    {e}
  | LPAREN e=expr RPAREN
    {e}

decoratePartExpr:
  | e=partExpr
    {e}
  | LPAREN e=partExpr RPAREN
    {e}

nondelimited_expr:
  | x=delimited(LPAREN,expr,RPAREN)
    {x}

rawExpr:
  | e=expr ruleEnd 
    {e}

expr:
  | LET x=ident EQ e1=expr IN e2=expr 
    {ELet (x, e1, e2)}
  | LET t=typ EQ e1=expr IN e2=expr 
    { let tname = name_of_types t in 
        let vt = VVar tname in 
          ELet (vt, e1, e2)}

  | name=listAppName args=nonempty_list(arg)
    {EApp (name, args)}
  | app=appName args=nonempty_list(decoratePartExpr)
    {EApp (app, args)}
  | app=appName LPAREN args=nonempty_list(decoratePartExpr) RPAREN
    {EApp (app, args)}
  | FUN x=binder ARROW e=expr 
    {EFun (x, e)}
  | e=partExpr
    {e}

partExpr:
  | x=partExpr b=binop y=partExpr 
    {EBinop (x, b, y)}
  | x=wysPrin
    {EVar x}
  | x=ident 
    {EVar x} 

wysPrin:
  | ALICE 
    {VVar "Alice"}
  | BOB 
    {VVar "Bob"}
/****** Apply expr ******/
listAppName:
  | SINGLETON 
    {CApp "singleton"}
  | UNION 
    {CApp "union"}
    
appName:
  | ASSEC 
    {CApp "as_sec"}
  | PROJWIRE
    {CApp "projwire"}
  | MKWIRE 
    {CApp "mkwire"}
  | ASSEC 
    {CApp "as_sec"}

  | WIRE 
    {CApp "wire"}
  | IDENT   
    {CApp "app"}

arg:
  | ALICE 
    {EVar (VVar "Alice")} 
  | BOB 
    {EVar (VVar "Bob")}
  | id=ident 
    {EVar id}

/****** Binary opertaion expr ******/


binop:
  | ADD 
    { ADD }
  | SUB 
    { SUB }
  | MOD  
    { MOD }
  | DIV 
    { DIV }
  | MUL 
    { MUL }

  | GT 
    {GT}
  | BEQ  
    {BEQ}


/******************************************************************************/
/*                      Identifiers, module paths                             */
/******************************************************************************/

idstr:
  | x=IDENT 
    {x}
  | x=STRING 
    {x}

// path use for module path

pathid:
  | x=STRING y=list(dotid) ruleEnd 
    { let i=String.concat "." y in 
        let id = x^"."^i in id  }

dotid:
  | DOT y=STRING
    {y} 

ruleEnd:
  | {}
  | EOF {}
  | EOL {}

ident:
  | x=IDENT { (VVar x) }
  | x=STRING  { (VVar x) }

   (* -------------------------------------------------------------------------- *)
   
   (* [located(x)] recognizes the same input fragment as [x] and wraps its
      semantic value of type ['a] as a value of type ['a located]. *)
   

let located(x) ==
   ~ = x; { { loc = $loc; value = x } }