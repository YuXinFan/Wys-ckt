
module MenhirBasics = struct
  
  exception Error
  
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
    | UINT8 of (
# 25 "parser.mly"
       (string)
# 22 "parser.ml"
  )
    | UINT64 of (
# 28 "parser.mly"
       (string)
# 27 "parser.ml"
  )
    | UINT32 of (
# 27 "parser.mly"
       (string)
# 32 "parser.ml"
  )
    | UINT16 of (
# 26 "parser.mly"
       (string)
# 37 "parser.ml"
  )
    | TYP_APP_LESS
    | TYP_APP_GREATER
    | TYPE
    | TVAR of (
# 16 "parser.mly"
       (string)
# 45 "parser.ml"
  )
    | TRUE of (
# 34 "parser.mly"
       (bool)
# 50 "parser.ml"
  )
    | TOTAL
    | TILDE of (
# 17 "parser.mly"
       (string)
# 56 "parser.ml"
  )
    | THEN
    | SYNTH
    | SUB_EFFECT
    | SUBTYPE
    | SUBKIND
    | SUB
    | STRING of (
# 13 "parser.mly"
       (string)
# 67 "parser.ml"
  )
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
    | REAL of (
# 30 "parser.mly"
       (string)
# 86 "parser.ml"
  )
    | RBRACK
    | RBRACE
    | RARROW
    | RANGE_OF
    | RANGE of (
# 23 "parser.mly"
       (string)
# 95 "parser.ml"
  )
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
    | NAME of (
# 15 "parser.mly"
       (string)
# 123 "parser.ml"
  )
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
    | INT8 of (
# 19 "parser.mly"
       (string * bool)
# 150 "parser.ml"
  )
    | INT64 of (
# 22 "parser.mly"
       (string * bool)
# 155 "parser.ml"
  )
    | INT32 of (
# 21 "parser.mly"
       (string * bool)
# 160 "parser.ml"
  )
    | INT16 of (
# 20 "parser.mly"
       (string * bool)
# 165 "parser.ml"
  )
    | INT of (
# 35 "parser.mly"
       (int)
# 170 "parser.ml"
  )
    | INSTANCE
    | INLINE_FOR_EXTRACTION
    | INLINE
    | INCLUDE
    | IN
    | IMPLIES
    | IFF
    | IF
    | IEEE64 of (
# 29 "parser.mly"
       (float)
# 183 "parser.ml"
  )
    | IDENT of (
# 14 "parser.mly"
       (string)
# 188 "parser.ml"
  )
    | HASH
    | GT
    | GE
    | FUNCTION
    | FUN
    | FRIENDTRY
    | FLOAT of (
# 32 "parser.mly"
       (float)
# 199 "parser.ml"
  )
    | FFI
    | FALSE of (
# 33 "parser.mly"
       (bool)
# 205 "parser.ml"
  )
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
    | CHAR of (
# 36 "parser.mly"
       (char)
# 236 "parser.ml"
  )
    | CALC
    | BYTEARRAY of (
# 12 "parser.mly"
       (bytes)
# 242 "parser.ml"
  )
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
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState224
  | MenhirState222
  | MenhirState220
  | MenhirState218
  | MenhirState216
  | MenhirState213
  | MenhirState208
  | MenhirState207
  | MenhirState204
  | MenhirState203
  | MenhirState201
  | MenhirState200
  | MenhirState197
  | MenhirState196
  | MenhirState195
  | MenhirState191
  | MenhirState190
  | MenhirState188
  | MenhirState186
  | MenhirState185
  | MenhirState179
  | MenhirState178
  | MenhirState175
  | MenhirState173
  | MenhirState172
  | MenhirState170
  | MenhirState169
  | MenhirState166
  | MenhirState164
  | MenhirState161
  | MenhirState160
  | MenhirState158
  | MenhirState156
  | MenhirState152
  | MenhirState148
  | MenhirState146
  | MenhirState145
  | MenhirState140
  | MenhirState136
  | MenhirState134
  | MenhirState132
  | MenhirState131
  | MenhirState130
  | MenhirState127
  | MenhirState125
  | MenhirState124
  | MenhirState121
  | MenhirState118
  | MenhirState106
  | MenhirState104
  | MenhirState101
  | MenhirState99
  | MenhirState97
  | MenhirState95
  | MenhirState92
  | MenhirState89
  | MenhirState87
  | MenhirState82
  | MenhirState78
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState67
  | MenhirState62
  | MenhirState58
  | MenhirState46
  | MenhirState41
  | MenhirState39
  | MenhirState38
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState27
  | MenhirState23
  | MenhirState22
  | MenhirState16
  | MenhirState13
  | MenhirState9
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 118 "parser.mly"
   open Syntax 
# 367 "parser.ml"

let rec _menhir_reduce24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.decl') -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s (decl : (Syntax.decl')) ->
    let _v : (
# 111 "parser.mly"
      (Syntax.decl)
# 374 "parser.ml"
    ) = 
# 129 "parser.mly"
    ( mk_decl decl )
# 378 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 111 "parser.mly"
      (Syntax.decl)
# 388 "parser.ml"
        ))) = _menhir_stack in
        Obj.magic _1
    | MenhirState213 | MenhirState185 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LET ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | OPEN ->
            _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | TYPE ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | VAL ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | EOF ->
            _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213)
    | _ ->
        _menhir_fail ()

and _menhir_reduce76 : _menhir_env -> ((('ttv_tail * _menhir_state) * _menhir_state * (string))) * _menhir_state * (Syntax.types) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s), _, (x : (string))), _, (t : (Syntax.types))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Syntax.decl') = 
# 143 "parser.mly"
    (DVal (x, t))
# 421 "parser.ml"
     in
    _menhir_goto_rawDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Syntax.formulas) = 
# 211 "parser.mly"
    (Ignore)
# 430 "parser.ml"
     in
    _menhir_goto_formula _menhir_env _menhir_stack _menhir_s _v

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState31 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | RPAREN ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _, (_2 : (
# 14 "parser.mly"
       (string)
# 465 "parser.ml"
                    ))), (_4 : (
# 14 "parser.mly"
       (string)
# 469 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Syntax.formulas) = 
# 215 "parser.mly"
    (Ignore)
# 477 "parser.ml"
                     in
                    _menhir_goto_formula _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (string)
# 508 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_3 : (
# 14 "parser.mly"
       (string)
# 527 "parser.ml"
            )) = _v in
            let (_menhir_stack, _menhir_s, (_1 : (
# 14 "parser.mly"
       (string)
# 532 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Syntax.formulas) = 
# 213 "parser.mly"
    (Ignore)
# 538 "parser.ml"
             in
            _menhir_goto_formula _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | ADD | ANY | ARROW | ASPAR | ASSEC | BEQ | DIV | EOF | EOL | FUN | GT | IF | LBRACE | LET | MKWIRE | MOD | MUL | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | SUB | TYPE | UNBOX | UNION | VAL | WIRE ->
        _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack)
    | ALICE | BOB | IDENT _ | LPAREN | STRING _ ->
        _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce72 : _menhir_env -> 'ttv_tail * _menhir_state -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _ (uid : (string)) ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : (Syntax.decl') = 
# 135 "parser.mly"
    (DOpen uid)
# 565 "parser.ml"
     in
    _menhir_goto_rawDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rawDecl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.decl') -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState213 | MenhirState185 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_typeDecl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.tdefs) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | EOL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152)
    | MenhirState190 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | EOL ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | LET | OPEN | TYPE | VAL ->
            _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_decoratePartExpr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (app : (Syntax.const))), _), _, (args : (Syntax.exprs list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Syntax.exprs) = 
# 268 "parser.mly"
    (EApp (app, args))
# 635 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Syntax.exprs))), _, (xs : (Syntax.exprs list))) = _menhir_stack in
        let _v : (Syntax.exprs list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 651 "parser.ml"
         in
        _menhir_goto_nonempty_list_decoratePartExpr_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (app : (Syntax.const))), _, (args : (Syntax.exprs list))) = _menhir_stack in
        let _v : (Syntax.exprs) = 
# 266 "parser.mly"
    (EApp (app, args))
# 661 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | FUN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | IDENT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
    | IF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState131 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALICE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | ASPAR ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | ASSEC ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | BOB ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | FUN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | IDENT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | LET ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | LPAREN ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | MKWIRE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | PROJWIRE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | SINGLETON ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
        | UNBOX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | UNION ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | WIRE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132)
    | LET ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | LPAREN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | SINGLETON ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | UNION ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.types) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | FUN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121)
        | LBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | IDENT _v ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | LPAREN ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | RBRACE ->
                _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack) MenhirState27
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s, (x : (string))), _), _, (t : (Syntax.types))), _, (f : (Syntax.formulas))), _, (t2 : (Syntax.types))) = _menhir_stack in
        let _7 = () in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 899 "parser.ml"
        ) = 
# 185 "parser.mly"
    (TDependentRefine (x, t, f, t2))
# 903 "parser.ml"
         in
        _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s, (x : (string))), _), _, (t : (Syntax.types))), _, (t2 : (Syntax.types))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 915 "parser.ml"
        ) = 
# 183 "parser.mly"
    (TDependent (x, t, t2))
# 919 "parser.ml"
         in
        _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | LPAREN ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce76 _menhir_env (Obj.magic _menhir_stack)
    | MenhirState148 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, (t : (Syntax.types))) = _menhir_stack in
        let _1 = () in
        let _v : (Syntax.types) = 
# 167 "parser.mly"
    (t)
# 985 "parser.ml"
         in
        _menhir_goto_typeDef _menhir_env _menhir_stack _v
    | MenhirState188 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce76 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typNormal : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 115 "parser.mly"
      (Syntax.types)
# 997 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 14 "parser.mly"
       (string)
# 1014 "parser.ml"
            ))), _, (t : (
# 115 "parser.mly"
      (Syntax.types)
# 1018 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Syntax.binders) = 
# 227 "parser.mly"
    (BValuebinder (x,  t))
# 1026 "parser.ml"
             in
            _menhir_goto_singleBinder _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState188 | MenhirState148 | MenhirState5 | MenhirState9 | MenhirState121 | MenhirState118 | MenhirState34 | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (t : (
# 115 "parser.mly"
      (Syntax.types)
# 1041 "parser.ml"
        ))) = _menhir_stack in
        let _v : (Syntax.types) = 
# 171 "parser.mly"
    (t)
# 1046 "parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState124 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALICE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | ASPAR ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | ASSEC ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | BOB ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | FUN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | IDENT _v ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | LET ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | LPAREN ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | MKWIRE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | PROJWIRE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | SINGLETON ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | UNBOX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | UNION ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | WIRE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | ANY | ARROW | EOF | EOL | EQ | LBRACE | OPEN | RPAREN | TYPE | VAL ->
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125)
    | MenhirState190 | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ANY ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
        | LPAREN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
        | EOF | EOL | EQ | LET | OPEN | TYPE | VAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (
# 115 "parser.mly"
      (Syntax.types)
# 1110 "parser.ml"
            ))) = _menhir_stack in
            let _v : (Syntax.tdecls) = 
# 157 "parser.mly"
    (TType x)
# 1115 "parser.ml"
             in
            _menhir_goto_typedecl _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156)
    | MenhirState222 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 115 "parser.mly"
      (Syntax.types)
# 1128 "parser.ml"
        ))) = _menhir_stack in
        Obj.magic _1
    | _ ->
        _menhir_fail ()

and _menhir_reduce74 : _menhir_env -> ((('ttv_tail * _menhir_state) * _menhir_state * (Syntax.values list))) * _menhir_state * (Syntax.exprs) -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _ (_5 : (unit)) ->
    let (((_menhir_stack, _menhir_s), _, (x : (Syntax.values list))), _, (e1 : (Syntax.exprs))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Syntax.decl') = 
# 139 "parser.mly"
    (DLet (false,  x, e1))
# 1142 "parser.ml"
     in
    _menhir_goto_rawDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce73 : _menhir_env -> (((('ttv_tail * _menhir_state) * _menhir_state) * _menhir_state * (Syntax.values list))) * _menhir_state * (Syntax.exprs) -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _ (_6 : (unit)) ->
    let ((((_menhir_stack, _menhir_s), _), _, (x : (Syntax.values list))), _, (e1 : (Syntax.exprs))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _v : (Syntax.decl') = 
# 137 "parser.mly"
    (DLet (true,  x, e1))
# 1155 "parser.ml"
     in
    _menhir_goto_rawDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce68 : _menhir_env -> ('ttv_tail * _menhir_state * (
# 13 "parser.mly"
       (string)
# 1162 "parser.ml"
)) * _menhir_state * (string list) -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _ (_3 : (unit)) ->
    let ((_menhir_stack, _menhir_s, (x : (
# 13 "parser.mly"
       (string)
# 1168 "parser.ml"
    ))), _, (y : (string list))) = _menhir_stack in
    let _v : (string) = 
# 361 "parser.mly"
    ( let i=String.concat "." y in 
        let id = x^"."^i in id  )
# 1174 "parser.ml"
     in
    match _menhir_s with
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState195 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce75 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (Syntax.tdefs) -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _ (_3 : (unit)) ->
    let ((_menhir_stack, _menhir_s), _, (x : (Syntax.tdefs))) = _menhir_stack in
    let _1 = () in
    let _v : (Syntax.decl') = 
# 141 "parser.mly"
    (DType x)
# 1193 "parser.ml"
     in
    _menhir_goto_rawDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typedecl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.tdecls) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ANY ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState146
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
    | LPAREN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState146
    | STRING _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
    | EOF | EOL | LET | OPEN | TYPE | VAL ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Syntax.tdecls))) = _menhir_stack in
        let _v : (Syntax.tdefs) = 
# 150 "parser.mly"
    ( TTdef x)
# 1218 "parser.ml"
         in
        _menhir_goto_typeDecl _menhir_env _menhir_stack _menhir_s _v
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState146 in
        let _v : (unit) = 
# 161 "parser.mly"
      ()
# 1227 "parser.ml"
         in
        _menhir_goto_typars _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146

and _menhir_goto_typeDef : _menhir_env -> 'ttv_tail -> (Syntax.types) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (tdef : (Syntax.types)) = _v in
    let ((_menhir_stack, _menhir_s, (x : (Syntax.tdecls))), _, (_2 : (unit))) = _menhir_stack in
    let _v : (Syntax.tdefs) = 
# 148 "parser.mly"
    (  TTabbr (x, tdef) )
# 1244 "parser.ml"
     in
    _menhir_goto_typeDecl _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_nonempty_list_idstr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState222 | MenhirState190 | MenhirState188 | MenhirState145 | MenhirState148 | MenhirState5 | MenhirState9 | MenhirState124 | MenhirState23 | MenhirState121 | MenhirState118 | MenhirState34 | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (string list)) = _v in
        let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 1258 "parser.ml"
        ) = 
# 187 "parser.mly"
    ( let len = List.length x in 
      if len = 1 then 
        TVar (List.hd x)
      else 
        TApp (List.hd x, List.tl x)
      )
# 1267 "parser.ml"
         in
        _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Syntax.const))) = _menhir_stack in
        let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 1278 "parser.ml"
        ) = 
# 194 "parser.mly"
    ( let name = match x with 
      | CApp id -> id 
      | _ -> "no_app" in TVar name )
# 1284 "parser.ml"
         in
        _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
    | MenhirState22 | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (string))) = _menhir_stack in
        let _v : (string list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 1295 "parser.ml"
         in
        _menhir_goto_nonempty_list_idstr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_decoratePartExpr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | LPAREN ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | ANY | ARROW | ASPAR | ASSEC | ELSE | EOF | EOL | EQ | FUN | IF | IN | LBRACE | LET | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Syntax.exprs))) = _menhir_stack in
        let _v : (Syntax.exprs list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 1324 "parser.ml"
         in
        _menhir_goto_nonempty_list_decoratePartExpr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_goto_pre_postcond : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.formulas) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALICE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | ASPAR ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | ASSEC ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | BOB ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | FUN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | IDENT _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | LET ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | LPAREN ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | MKWIRE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | PROJWIRE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | SINGLETON ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | UNBOX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | UNION ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | WIRE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140)
    | MenhirState140 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s, (x : (
# 13 "parser.mly"
       (string)
# 1383 "parser.ml"
        ))), _, (_3 : (Syntax.types))), _, (_5 : (Syntax.formulas))), _, (_6 : (Syntax.formulas))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 1390 "parser.ml"
        ) = 
# 198 "parser.mly"
    (TVar x)
# 1394 "parser.ml"
         in
        _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_formula : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.formulas) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ARROW ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ASPAR ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | ASSEC ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | FUN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | IDENT _v ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
                | MKWIRE ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | PROJWIRE ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | STRING _v ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
                | UNBOX ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | WIRE ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState118
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)
            | ALICE | ANY | ASPAR | ASSEC | BOB | EOF | EOL | EQ | FUN | IDENT _ | IF | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RPAREN | SINGLETON | STRING _ | TYPE | UNBOX | UNION | VAL | WIRE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s, (x : (string))), _), _, (t : (Syntax.types))), _, (f : (Syntax.formulas))) = _menhir_stack in
                let _6 = () in
                let _4 = () in
                let _2 = () in
                let _v : (
# 115 "parser.mly"
      (Syntax.types)
# 1450 "parser.ml"
                ) = 
# 181 "parser.mly"
    (TRefine (x, t, f))
# 1454 "parser.ml"
                 in
                _menhir_goto_typNormal _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _, (bind : (Syntax.binders list))), _, (ty : (
# 115 "parser.mly"
      (Syntax.types)
# 1475 "parser.ml"
        ))), _, (_5 : (Syntax.formulas))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 114 "parser.mly"
      (Syntax.types)
# 1482 "parser.ml"
        ) = 
# 177 "parser.mly"
    (TFun (bind, ty))
# 1486 "parser.ml"
         in
        (match _menhir_s with
        | MenhirState188 | MenhirState148 | MenhirState5 | MenhirState9 | MenhirState121 | MenhirState118 | MenhirState34 | MenhirState23 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (t : (
# 114 "parser.mly"
      (Syntax.types)
# 1495 "parser.ml"
            )) = _v in
            let _v : (Syntax.types) = 
# 173 "parser.mly"
    (t)
# 1500 "parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v
        | MenhirState220 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 114 "parser.mly"
      (Syntax.types)
# 1509 "parser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            _menhir_fail ())
    | _ ->
        _menhir_fail ()

and _menhir_run108 : _menhir_env -> (((((('ttv_tail * _menhir_state) * _menhir_state) * _menhir_state * (Syntax.exprs))) * _menhir_state * (Syntax.exprs))) * _menhir_state * (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (((((_menhir_stack, _menhir_s), _), _, (x : (Syntax.exprs))), _, (y : (Syntax.exprs))), _, (z : (Syntax.exprs))) = _menhir_stack in
    let _8 = () in
    let _6 = () in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _v : (Syntax.exprs) = 
# 276 "parser.mly"
    (ECond (x,y,z))
# 1530 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_binop : _menhir_env -> 'ttv_tail -> (Syntax.op) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_goto_ruleEnd : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState152 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState164 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState173 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState179 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce74 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState191 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState197 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState204 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState208 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        _menhir_reduce74 _menhir_env (Obj.magic _menhir_stack) _menhir_s _v
    | MenhirState218 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (unit)) = _v in
        let (_menhir_stack, _menhir_s, (e : (Syntax.exprs))) = _menhir_stack in
        let _v : (
# 112 "parser.mly"
      (Syntax.exprs)
# 1589 "parser.ml"
        ) = 
# 253 "parser.mly"
    (e)
# 1593 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (
# 112 "parser.mly"
      (Syntax.exprs)
# 1600 "parser.ml"
        )) = _v in
        Obj.magic _1
    | _ ->
        _menhir_fail ()

and _menhir_reduce80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _1 = () in
    let _v : (unit) = 
# 371 "parser.mly"
        ()
# 1612 "parser.ml"
     in
    _menhir_goto_ruleEnd _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _1 = () in
    let _v : (unit) = 
# 370 "parser.mly"
        ()
# 1622 "parser.ml"
     in
    _menhir_goto_ruleEnd _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_nonempty_list_arg_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (args : (Syntax.exprs list)) = _v in
        let (_menhir_stack, _menhir_s, (name : (Syntax.const))) = _menhir_stack in
        let _v : (Syntax.exprs) = 
# 264 "parser.mly"
    (EApp (name, args))
# 1637 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Syntax.exprs list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Syntax.exprs))) = _menhir_stack in
        let _v : (Syntax.exprs list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 1648 "parser.ml"
         in
        _menhir_goto_nonempty_list_arg_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_binder_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.binders list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (bs : (Syntax.binders list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 115 "parser.mly"
      (Syntax.types)
# 1664 "parser.ml"
        ))) = _menhir_stack in
        let _v : (Syntax.tdecls) = 
# 154 "parser.mly"
    (TTypebinder (x, bs))
# 1669 "parser.ml"
         in
        _menhir_goto_typedecl _menhir_env _menhir_stack _menhir_s _v
    | MenhirState158 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Syntax.binders list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Syntax.binders))) = _menhir_stack in
        let _v : (Syntax.binders list) = 
# 223 "<standard.mly>"
    ( x :: xs )
# 1680 "parser.ml"
         in
        _menhir_goto_nonempty_list_binder_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_typars : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASPAR ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | ASSEC ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | FUN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
        | MKWIRE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | PROJWIRE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | STRING _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
        | UNBOX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | WIRE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState148
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148)
    | EOF | EOL | LET | OPEN | TYPE | VAL ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _v : (Syntax.types) = 
# 165 "parser.mly"
    ( TConst "unkonw")
# 1725 "parser.ml"
         in
        _menhir_goto_typeDef _menhir_env _menhir_stack _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce63 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (x : (string))) = _menhir_stack in
    let _v : (string list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 1741 "parser.ml"
     in
    _menhir_goto_nonempty_list_idstr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce25 : _menhir_env -> 'ttv_tail * _menhir_state * (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (e : (Syntax.exprs))) = _menhir_stack in
    let _v : (Syntax.exprs) = 
# 243 "parser.mly"
    (e)
# 1751 "parser.ml"
     in
    _menhir_goto_decoratePartExpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run74 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let ((_menhir_stack, _menhir_s), _, (e : (Syntax.exprs))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (Syntax.exprs) = 
# 245 "parser.mly"
    (e)
# 1765 "parser.ml"
     in
    _menhir_goto_decoratePartExpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _, (x : (Syntax.binders))), _, (e : (Syntax.exprs))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (Syntax.exprs) = 
# 272 "parser.mly"
    (EFun (x, e))
# 1782 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (app : (Syntax.const))), _, (x : (Syntax.exprs))), _, (y : (Syntax.exprs))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (Syntax.exprs) = 
# 270 "parser.mly"
    (EApp (app, [x;y]))
# 1800 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _, (x : (Syntax.exprs))), _, (y : (Syntax.exprs))), _, (z : (Syntax.exprs))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Syntax.exprs) = 
# 274 "parser.mly"
    (ECond (x,y,z))
# 1923 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState92
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _, (t : (Syntax.types))), _, (e1 : (Syntax.exprs))), _, (e2 : (Syntax.exprs))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Syntax.exprs) = 
# 259 "parser.mly"
    ( let tname = name_of_types t in 
        let vt = VVar tname in 
          ELet (vt, e1, e2))
# 1990 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _, (x : (Syntax.values))), _, (e1 : (Syntax.exprs))), _, (e2 : (Syntax.exprs))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Syntax.exprs) = 
# 257 "parser.mly"
    (ELet (x, e1, e2))
# 2055 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState104
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState125 | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Syntax.exprs))) = _menhir_stack in
        let _v : (Syntax.formulas) = 
# 217 "parser.mly"
    (Ignore)
# 2182 "parser.ml"
         in
        _menhir_goto_formula _menhir_env _menhir_stack _menhir_s _v
    | MenhirState132 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState134
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState134 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState136 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (x : (Syntax.exprs))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Syntax.exprs) = let x = 
# 200 "<standard.mly>"
    ( x )
# 2317 "parser.ml"
             in
            
# 249 "parser.mly"
    (x)
# 2322 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Syntax.exprs)) = _v in
            let _v : (Syntax.formulas) = 
# 203 "parser.mly"
    (Ignore)
# 2330 "parser.ml"
             in
            _menhir_goto_pre_postcond _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState130 | MenhirState140 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Syntax.exprs))) = _menhir_stack in
        let _v : (Syntax.formulas) = 
# 205 "parser.mly"
    (Ignore)
# 2346 "parser.ml"
         in
        _menhir_goto_pre_postcond _menhir_env _menhir_stack _menhir_s _v
    | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | EOL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173)
    | MenhirState178 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EOL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179)
    | MenhirState203 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | EOL ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | LET | OPEN | TYPE | VAL ->
            _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204)
    | MenhirState207 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | EOL ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | LET | OPEN | TYPE | VAL ->
            _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208)
    | MenhirState216 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | EOL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218)
    | _ ->
        _menhir_fail ()

and _menhir_run51 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 333 "parser.mly"
    ( SUB )
# 2429 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run52 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 339 "parser.mly"
    ( MUL )
# 2441 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run53 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 335 "parser.mly"
    ( MOD )
# 2453 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run54 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 342 "parser.mly"
    (GT)
# 2465 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run55 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 337 "parser.mly"
    ( DIV )
# 2477 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run56 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 344 "parser.mly"
    (BEQ)
# 2489 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_run57 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.op) = 
# 331 "parser.mly"
    ( ADD )
# 2501 "parser.ml"
     in
    _menhir_goto_binop _menhir_env _menhir_stack _v

and _menhir_reduce78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit) = 
# 369 "parser.mly"
    ()
# 2510 "parser.ml"
     in
    _menhir_goto_ruleEnd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run192 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run193 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | BOB ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | ANY | ARROW | ASPAR | ASSEC | ELSE | EOF | EOL | EQ | FUN | IF | IN | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Syntax.exprs))) = _menhir_stack in
        let _v : (Syntax.exprs list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 2553 "parser.ml"
         in
        _menhir_goto_nonempty_list_arg_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.exprs) = 
# 322 "parser.mly"
    (EVar (VVar "Bob"))
# 2569 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.exprs) = 
# 320 "parser.mly"
    (EVar (VVar "Alice"))
# 2581 "parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_list_binder_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.binders list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState127 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Syntax.binders))), _, (xs : (Syntax.binders list))) = _menhir_stack in
        let _v : (Syntax.binders list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 2632 "parser.ml"
         in
        _menhir_goto_list_binder_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_singleBinder : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.binders) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (Syntax.binders)) = _v in
    let _v : (Syntax.binders) = 
# 222 "parser.mly"
    (x)
# 2646 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState127 | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ANY ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
        | LPAREN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
        | ARROW ->
            _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127)
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Syntax.binders))) = _menhir_stack in
        let _v : (unit) = 
# 162 "parser.mly"
                          (  )
# 2728 "parser.ml"
         in
        _menhir_goto_typars _menhir_env _menhir_stack _menhir_s _v
    | MenhirState158 | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ANY ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | LPAREN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | EOF | EOL | EQ | LET | OPEN | TYPE | VAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Syntax.binders))) = _menhir_stack in
            let _v : (Syntax.binders list) = 
# 221 "<standard.mly>"
    ( [ x ] )
# 2750 "parser.ml"
             in
            _menhir_goto_nonempty_list_binder_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158)
    | _ ->
        _menhir_fail ()

and _menhir_goto_idstr : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | FUN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState222 | MenhirState190 | MenhirState188 | MenhirState145 | MenhirState148 | MenhirState5 | MenhirState9 | MenhirState124 | MenhirState23 | MenhirState121 | MenhirState118 | MenhirState34 | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState22 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | FUN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | EOF | EOL | EQ | FUN | IF | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RPAREN | SINGLETON | TYPE | UNBOX | UNION | VAL | WIRE ->
            _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
    | MenhirState158 | MenhirState156 | MenhirState146 | MenhirState127 | MenhirState13 | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (string))) = _menhir_stack in
        let _v : (Syntax.binders) = 
# 229 "parser.mly"
    (BValue x)
# 2853 "parser.ml"
         in
        _menhir_goto_singleBinder _menhir_env _menhir_stack _menhir_s _v
    | MenhirState22 | MenhirState101 | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | EOF | EOL | EQ | FUN | IF | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RPAREN | SINGLETON | TYPE | UNBOX | UNION | VAL | WIRE ->
            _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | FUN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run72 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_partExpr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.exprs) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState216 | MenhirState207 | MenhirState203 | MenhirState178 | MenhirState172 | MenhirState130 | MenhirState140 | MenhirState131 | MenhirState136 | MenhirState134 | MenhirState132 | MenhirState125 | MenhirState27 | MenhirState106 | MenhirState104 | MenhirState32 | MenhirState97 | MenhirState95 | MenhirState92 | MenhirState38 | MenhirState89 | MenhirState87 | MenhirState39 | MenhirState82 | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | ELSE | EOF | EOL | EQ | FUN | IDENT _ | IF | IN | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | STRING _ | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Syntax.exprs))) = _menhir_stack in
            let _v : (Syntax.exprs) = 
# 278 "parser.mly"
    (e)
# 2965 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | ELSE | EOF | EOL | EQ | FUN | IDENT _ | IF | IN | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | STRING _ | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (x : (Syntax.exprs))), (b : (Syntax.op))), _, (y : (Syntax.exprs))) = _menhir_stack in
            let _v : (Syntax.exprs) = 
# 282 "parser.mly"
    (EBinop (x, b, y))
# 2999 "parser.ml"
             in
            _menhir_goto_partExpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | ALICE | BOB | IDENT _ | LPAREN | STRING _ ->
            _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | ELSE | EOF | EOL | EQ | FUN | IDENT _ | IF | IN | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | STRING _ | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
            _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | BEQ ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
        | MOD ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack)
        | SUB ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | ELSE | EOF | EOL | EQ | FUN | IDENT _ | IF | IN | LBRACE | LET | MKWIRE | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | STRING _ | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
            _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_dotid_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState161 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | EOL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164)
    | MenhirState166 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (string))), _, (xs : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 3186 "parser.ml"
         in
        _menhir_goto_list_dotid_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | EOL ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | LET | OPEN | TYPE | VAL ->
            _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_ident_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.values list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Syntax.values))), _, (xs : (Syntax.values list))) = _menhir_stack in
        let _v : (Syntax.values list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 3270 "parser.ml"
         in
        _menhir_goto_list_ident_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState201 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState200 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.decl' list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, (name : (
# 13 "parser.mly"
       (string)
# 3447 "parser.ml"
            ))), _, (decls : (Syntax.decl' list))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (
# 110 "parser.mly"
      (Syntax.prog)
# 3454 "parser.ml"
            ) = 
# 125 "parser.mly"
    ( Module (name, decls) )
# 3458 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 110 "parser.mly"
      (Syntax.prog)
# 3465 "parser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState213 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (
# 111 "parser.mly"
      (Syntax.decl)
# 3480 "parser.ml"
        ))), _, (xs : (Syntax.decl' list))) = _menhir_stack in
        let _v : (Syntax.decl' list) = 
# 213 "<standard.mly>"
    ( x :: xs )
# 3485 "parser.ml"
         in
        _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_ident : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.values) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState216 | MenhirState207 | MenhirState203 | MenhirState178 | MenhirState172 | MenhirState130 | MenhirState140 | MenhirState131 | MenhirState136 | MenhirState134 | MenhirState132 | MenhirState125 | MenhirState27 | MenhirState106 | MenhirState104 | MenhirState32 | MenhirState97 | MenhirState95 | MenhirState92 | MenhirState38 | MenhirState89 | MenhirState87 | MenhirState39 | MenhirState70 | MenhirState82 | MenhirState78 | MenhirState71 | MenhirState72 | MenhirState46 | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Syntax.values))) = _menhir_stack in
        let _v : (Syntax.exprs) = 
# 286 "parser.mly"
    (EVar x)
# 3502 "parser.ml"
         in
        _menhir_goto_partExpr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState67 | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (id : (Syntax.values))) = _menhir_stack in
        let _v : (Syntax.exprs) = 
# 324 "parser.mly"
    (EVar id)
# 3512 "parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | FUN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | IDENT _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | LET ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | LPAREN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | SINGLETON ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | UNION ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState200 | MenhirState201 | MenhirState169 | MenhirState175 | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | EQ ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState175
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175)
    | _ ->
        _menhir_fail ()

and _menhir_goto_listAppName : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.const) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | BOB ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FUN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | IDENT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LET ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LPAREN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SINGLETON ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | UNION ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_reduce42 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 14 "parser.mly"
       (string)
# 3651 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (x : (
# 14 "parser.mly"
       (string)
# 3657 "parser.ml"
    ))) = _menhir_stack in
    let _v : (Syntax.values) = 
# 374 "parser.mly"
            ( (VVar x) )
# 3662 "parser.ml"
     in
    _menhir_goto_ident _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Syntax.binders list) = 
# 211 "<standard.mly>"
    ( [] )
# 3671 "parser.ml"
     in
    _menhir_goto_list_binder_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ASPAR ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | ASSEC ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | IDENT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
            | MKWIRE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | PROJWIRE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | STRING _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
            | UNBOX ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | WIRE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.binders) = 
# 231 "parser.mly"
    (BValue "_")
# 3733 "parser.ml"
     in
    _menhir_goto_singleBinder _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce45 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 13 "parser.mly"
       (string)
# 3740 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (x : (
# 13 "parser.mly"
       (string)
# 3746 "parser.ml"
    ))) = _menhir_stack in
    let _v : (string) = 
# 355 "parser.mly"
    (x)
# 3751 "parser.ml"
     in
    _menhir_goto_idstr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 13 "parser.mly"
       (string)
# 3758 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | FUN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | STRING _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_reduce12 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 14 "parser.mly"
       (string)
# 3790 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 14 "parser.mly"
       (string)
# 3796 "parser.ml"
    ))) = _menhir_stack in
    let _v : (Syntax.const) = 
# 316 "parser.mly"
    (CApp "unknow-app")
# 3801 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce44 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 14 "parser.mly"
       (string)
# 3808 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (x : (
# 14 "parser.mly"
       (string)
# 3814 "parser.ml"
    ))) = _menhir_stack in
    let _v : (string) = 
# 353 "parser.mly"
    (x)
# 3819 "parser.ml"
     in
    _menhir_goto_idstr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_appName : _menhir_env -> 'ttv_tail -> _menhir_state -> (Syntax.const) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState216 | MenhirState207 | MenhirState203 | MenhirState178 | MenhirState172 | MenhirState130 | MenhirState140 | MenhirState131 | MenhirState132 | MenhirState134 | MenhirState136 | MenhirState125 | MenhirState27 | MenhirState32 | MenhirState104 | MenhirState106 | MenhirState95 | MenhirState97 | MenhirState38 | MenhirState92 | MenhirState39 | MenhirState87 | MenhirState89 | MenhirState82 | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ALICE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | BOB ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | LPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState70 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ALICE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | BOB ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | IDENT _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | LPAREN ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState222 | MenhirState190 | MenhirState188 | MenhirState145 | MenhirState148 | MenhirState5 | MenhirState9 | MenhirState124 | MenhirState16 | MenhirState23 | MenhirState121 | MenhirState118 | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99)
    | _ ->
        _menhir_fail ()

and _menhir_goto_wysPrin : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 113 "parser.mly"
      (Syntax.values)
# 3884 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState216 | MenhirState207 | MenhirState203 | MenhirState178 | MenhirState172 | MenhirState140 | MenhirState130 | MenhirState131 | MenhirState136 | MenhirState134 | MenhirState132 | MenhirState125 | MenhirState27 | MenhirState106 | MenhirState104 | MenhirState32 | MenhirState97 | MenhirState95 | MenhirState92 | MenhirState38 | MenhirState89 | MenhirState87 | MenhirState39 | MenhirState82 | MenhirState70 | MenhirState78 | MenhirState71 | MenhirState72 | MenhirState58 | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (
# 113 "parser.mly"
      (Syntax.values)
# 3894 "parser.ml"
        )) = _v in
        let _v : (Syntax.exprs) = 
# 284 "parser.mly"
    (EVar x)
# 3899 "parser.ml"
         in
        _menhir_goto_partExpr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState224 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (
# 113 "parser.mly"
      (Syntax.values)
# 3908 "parser.ml"
        )) = _v in
        Obj.magic _1
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (string)
# 3917 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (string)
# 3927 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (string list) = 
# 211 "<standard.mly>"
    ( [] )
# 3939 "parser.ml"
     in
    _menhir_goto_list_dotid_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run162 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (y : (
# 13 "parser.mly"
       (string)
# 3956 "parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (string) = 
# 366 "parser.mly"
    (y)
# 3963 "parser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | EOF | EOL | LET | OPEN | TYPE | VAL ->
            _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Syntax.values list) = 
# 211 "<standard.mly>"
    ( [] )
# 3990 "parser.ml"
     in
    _menhir_goto_list_ident_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (string)
# 3997 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Syntax.decl' list) = 
# 211 "<standard.mly>"
    ( [] )
# 4009 "parser.ml"
     in
    _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | STRING _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186

and _menhir_run190 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | STRING _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190

and _menhir_run195 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState195 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EOF | EOL | LET | OPEN | TYPE | VAL ->
            _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195

and _menhir_run200 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
    | REC ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState200 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
        | EQ ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201)
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
    | EQ ->
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState200
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 298 "parser.mly"
    (CApp "union")
# 4123 "parser.ml"
     in
    _menhir_goto_listAppName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (string)
# 4130 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 13 "parser.mly"
       (string)
# 4138 "parser.ml"
    )) = _v in
    let _v : (Syntax.values) = 
# 375 "parser.mly"
              ( (VVar x) )
# 4143 "parser.ml"
     in
    _menhir_goto_ident _menhir_env _menhir_stack _menhir_s _v

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 296 "parser.mly"
    (CApp "singleton")
# 4155 "parser.ml"
     in
    _menhir_goto_listAppName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | FUN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState34 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON | EQ ->
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack)
        | IDENT _ | STRING _ ->
            _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | STRING _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState34 in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAREN ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | COLON | EQ | IDENT _ | STRING _ ->
            _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | FUN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | IDENT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LET ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LPAREN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SINGLETON ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | UNION ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (string)
# 4277 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD | ANY | ARROW | ASPAR | ASSEC | BEQ | DIV | ELSE | EOF | EOL | EQ | FUN | GT | IF | IN | LBRACE | LET | MKWIRE | MOD | MUL | OPEN | PROJWIRE | RBRACE | RPAREN | SINGLETON | SUB | THEN | TYPE | UNBOX | UNION | VAL | WIRE ->
        _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack)
    | ALICE | BOB | IDENT _ | LPAREN | STRING _ ->
        _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ANY ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | LPAREN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | STRING _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ANY ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | LPAREN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | STRING _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ARROW ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 311 "parser.mly"
    (CApp "wire")
# 4343 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 313 "parser.mly"
    (CApp "unbox")
# 4355 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (string)
# 4362 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
    | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | COLON | EOF | EOL | EQ | FUN | IDENT _ | IF | LBRACE | LET | MKWIRE | OPEN | PROJWIRE | RPAREN | SINGLETON | STRING _ | TYPE | UNBOX | UNION | VAL | WIRE ->
        _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 304 "parser.mly"
    (CApp "projwire")
# 4388 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 306 "parser.mly"
    (CApp "mkwire")
# 4400 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (string)
# 4407 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE | ANY | ARROW | ASPAR | ASSEC | BOB | COLON | EOF | EOL | EQ | FUN | IF | LBRACE | LET | LPAREN | MKWIRE | OPEN | PROJWIRE | RPAREN | SINGLETON | TYPE | UNBOX | UNION | VAL | WIRE ->
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack)
    | IDENT _ | STRING _ ->
        _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 302 "parser.mly"
    (CApp "as_sec")
# 4433 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Syntax.const) = 
# 308 "parser.mly"
    (CApp "as_par")
# 4445 "parser.ml"
     in
    _menhir_goto_appName _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState224 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState222 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState220 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState218 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState216 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState213 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState208 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState207 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState204 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState203 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState201 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState200 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState197 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState196 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState195 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState191 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState190 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState188 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState185 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState179 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState178 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState175 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState173 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState166 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState164 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState161 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState158 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState152 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState148 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState140 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState136 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState134 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState132 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState127 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState124 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState121 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState95 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 113 "parser.mly"
      (Syntax.values)
# 4782 "parser.ml"
    ) = 
# 292 "parser.mly"
    (VVar "Bob")
# 4786 "parser.ml"
     in
    _menhir_goto_wysPrin _menhir_env _menhir_stack _menhir_s _v

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 113 "parser.mly"
      (Syntax.values)
# 4798 "parser.ml"
    ) = 
# 290 "parser.mly"
    (VVar "Alice")
# 4802 "parser.ml"
     in
    _menhir_goto_wysPrin _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and decl : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 111 "parser.mly"
      (Syntax.decl)
# 4831 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
        | REC ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState169 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
            | STRING _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
            | EQ ->
                _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170)
        | STRING _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
        | EQ ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169)
    | OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | STRING _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState160 in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOT ->
                _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | EOF | EOL ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)
    | TYPE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ASPAR ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | ASSEC ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | IDENT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | MKWIRE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | PROJWIRE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | STRING _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | UNBOX ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | WIRE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145)
    | VAL ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | STRING _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 110 "parser.mly"
      (Syntax.prog)
# 4949 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MODULE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | STRING _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LET ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | OPEN ->
                _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | TYPE ->
                _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | VAL ->
                _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | EOF ->
                _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState185
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            raise _eRR)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

and rawExpr : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 112 "parser.mly"
      (Syntax.exprs)
# 4996 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | FUN ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | IDENT _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | LET ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | LPAREN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | SINGLETON ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | STRING _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | UNION ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216)

and typFun : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 114 "parser.mly"
      (Syntax.types)
# 5044 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FUN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState220
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220)

and typNormal : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 115 "parser.mly"
      (Syntax.types)
# 5062 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ASPAR ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | ASSEC ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | IDENT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
    | MKWIRE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | PROJWIRE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | STRING _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
    | UNBOX ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | WIRE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222)

and wysPrin : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 113 "parser.mly"
      (Syntax.values)
# 5094 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ALICE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState224
    | BOB ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState224
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224)

# 269 "<standard.mly>"
  

# 5114 "parser.ml"
