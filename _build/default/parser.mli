
(* The type of tokens. *)

type token = 
  | WITH
  | WIRE
  | WHEN
  | VAL
  | UNOPTEQUALITY
  | UNIV_HASH
  | UNION
  | UNFOLDABLE
  | UNFOLD
  | UNDERSCORE
  | UNBOX
  | UINT8 of (string)
  | UINT64 of (string)
  | UINT32 of (string)
  | UINT16 of (string)
  | TYP_APP_LESS
  | TYP_APP_GREATER
  | TYPE
  | TVAR of (string)
  | TRUE of (bool)
  | TOTAL
  | TILDE of (string)
  | THEN
  | SYNTH
  | SUB_EFFECT
  | SUBTYPE
  | SUBKIND
  | SUB
  | STRING of (string)
  | SQUIGGLY_RARROW
  | SPLICE
  | SINGLETON
  | SET_RANGE_OF
  | SEMICOLON_SEMICOLON
  | SEMICOLON
  | SEAL
  | RPAREN
  | REVEAL
  | REQUIRES
  | REIFY
  | REIFIABLE
  | REFLECTABLE
  | REC
  | REAL of (string)
  | RBRACK
  | RBRACE
  | RARROW
  | RANGE_OF
  | RANGE of (string)
  | QUOTE
  | QMARK_DOT
  | QMARK
  | PROJWIRE
  | PRIVATE
  | PRAGMA_SET_OPTIONS
  | PRAGMA_RESTART_SOLVER
  | PRAGMA_RESET_OPTIONS
  | PRAGMA_PUSH_OPTIONS
  | PRAGMA_POP_OPTIONS
  | PRAGMALIGHT
  | POLYMONADIC_BIND
  | PIPE_RIGHT
  | PERCENT_LBRACK
  | OR
  | OPEN
  | OPAQUE
  | OF
  | NOTEQUAL
  | NOEXTRACT
  | NOEQUALITY
  | NEW_EFFECT
  | NE
  | NAME of (string)
  | MUL
  | MODULE
  | MOD
  | MKWIRE
  | MINUS
  | MATCH
  | LT
  | LPAREN_RPAREN
  | LPAREN
  | LONG_LEFT_ARROW
  | LET
  | LENS_PAREN_RIGHT
  | LENS_PAREN_LEFT
  | LE
  | LBRACK_BAR
  | LBRACK_AT
  | LBRACK
  | LBRACE_COLON_PATTERN
  | LBRACE
  | LAYERED_EFFECT
  | LARROW
  | IRREDUCIBLE
  | INT8 of (string * bool)
  | INT64 of (string * bool)
  | INT32 of (string * bool)
  | INT16 of (string * bool)
  | INT of (int)
  | INSTANCE
  | INLINE_FOR_EXTRACTION
  | INLINE
  | INCLUDE
  | IN
  | IMPLIES
  | IFF
  | IF
  | IEEE64 of (float)
  | IDENT of (string)
  | HASH
  | GT
  | GE
  | FUNCTION
  | FUN
  | FRIENDTRY
  | FLOAT of (float)
  | FFI
  | FALSE of (bool)
  | EXCEPTION
  | EQUALS
  | EQ
  | EOL
  | EOF
  | ENSURES
  | END
  | ELSE
  | EFFECT
  | DOT_LPAREN
  | DOT_LENS_PAREN_LEFT
  | DOT_LBRACK_BAR
  | DOT_LBRACK
  | DOT
  | DOLLAR
  | DIV
  | DISJUNCTION
  | DEFAULT
  | DBLEQUAL
  | CONJUNCTION
  | CONCATWIRE
  | COMMA
  | COLON_EQUALS
  | COLON_COLON
  | COLON
  | CLASS
  | CHAR of (char)
  | CALC
  | BYTEARRAY of (bytes)
  | BY
  | BOX
  | BOB
  | BEQ
  | BEGIN
  | BAR_RBRACK
  | BAR
  | BANG_LBRACE
  | BACKTICK_PERC
  | BACKTICK_HASH
  | BACKTICK_AT
  | BACKTICK
  | ASSERT
  | ASSEC
  | ASPAR
  | ARROW
  | ANY
  | AND
  | AMP
  | ALICE
  | ADD
  | ABSTRACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val wysPrin: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.values)

val typNormal: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.types)

val typFun: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.types)

val rawExpr: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.exprs)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.prog)

val decl: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.decl)
