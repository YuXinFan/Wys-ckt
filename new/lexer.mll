{   
    open Lexing
    open Parser
    exception Error of string

    let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <- {
    pos with pos_bol = lexbuf.lex_curr_pos;
             pos_lnum = pos.pos_lnum + 1
  }
}

let whitespace = [' ' '\t']
let newline = '\n' | '\r' | "\r\n"
let integer = '-'?['0'-'9']['0'-'9']*
let identifier = ['a'-'z']['a'-'z' 'A'-'Z' '0'-'9' '_']*
let bident = ['A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*



rule read = parse 
    | ([^'\n']* '\n') as line
        { let n = String.length line in 
            let l = String.sub line 0 (n-1) in 
                Some l, true }
    | eof
        { None, false }
    | ([^'\n']+ as line) eof
        { Some (line ), false }

and token = parse   
    | whitespace    {token lexbuf}
    | eof       {EOF}
    | integer as i      {INT (int_of_string i)}
  (*  | "(*"         { line_comment "" lexbuf } *)

    | '{'        { LBRACE }
    | '}'        { RBRACE }
    | '('        { LPAREN }
    | ')'        { RPAREN }

    | ','        { COMMA }
    
    | '+'        { ADD }
    | '-'        { SUB }
    | '*'        { MUL }
    | '/'        { DIV }
    | '%'        { MOD }

    | ":"       { COLON }
    | "->"       { ARROW }
    
    | "||"       { OR }
    | "&&"       { AND }
    | "=="       { DBLEQUAL }
    | "!="       { NOTEQUAL }
    | '='        { EQ}
    | '<'        { LT }
    | '>'        { GT }
    | "<="       { LE }
    | ">="       { GE }

    | "match"   { MATCH }
    | "with"    { WITH }
    | "|"       { BAR }

    | "let"      { LET }
    | "in"        {IN}

    | "if"       { IF }
    | "then"      { THEN }
    | "else"     { ELSE }

    | "val"      { VAL }
    | "fun"      { FUN }

    | "true"     { TRUE true}
    | "false"    { FALSE false}

    | "module"  {MODULE}
    | "open"    {OPEN}
    | bident    {STRING (lexeme lexbuf)}

(* Wys identifier *)
    | "as_sec"  {ASSEC}
    | "as_par"  {ASPAR}
    | "box"     {BOX}
    | "mkwire_s" | "mkwire_p" {MKWIRE}
    | "projwire_s" | "projwire_p"   {PROJWIRE}
    | "unbox_s" | "unbox_p"     {UNBOX}
    | "concat_wire" {CONCATWIRE}

    | identifier { IDENT (lexeme lexbuf) }
    | eof        { EOF }
    | _          { raise (Error (Printf.sprintf "At offset %d: unexpected character.\n" (Lexing.lexeme_start lexbuf)))}

(*
and line_comment buf = parse
  | newline    { next_line lexbuf ; line_comment buf lexbuf}
  | "*)"       { read lexbuf }
  | _          { line_comment (buf ^ lexeme lexbuf) lexbuf }
  *)

