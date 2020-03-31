{   
    open lexing
    open Parser
    exception Error of string
}

let whitespace = [' ' '\t']
let newline = '\n' | '\r' | "\r\n"
let integer = '-'?['0'-'9']['0'-'9']*
let identifier = ['a'-'z']['a'-'z' 'A'-'Z' '0'-'9' '_']*


rule read = parse 
    | ([^'\n']* '\n') as line
    { Some line, true }
| eof
    { None, false }
| ([^'\n']+ as line) eof
    { Some (line ^ "\n"), false }

and token = parse   
    | whitespace    {token lexbuf}
    | integer as i      {INT (int_of_string i)}
    | "(*"         { line_comment "" lexbuf }

    | '{'        { LBRACE }
    | '}'        { RBRACE }
    | '('        { LPAREN }
    | ')'        { RPAREN }

    | ','        { COMMA }
    | '!'        { EXCLAM }
    | '~'        { TILDE }
    
    | '+'        { ADD }
    | '-'        { SUB }
    | '*'        { MUL }
    | '/'        { DIV }
    | '%'        { MOD }

    | ":"       { COLON }
    | "->"       { ARROW }
    | "#"       {SHARP}
    
    | "||"       { OR }
    | "&&"       { AND }
    | "=="       { DBLEQUAL }
    | "!="       { NOTEQUAL }
    | '='        { EQUAL }
    | '<'        { LTHAN }
    | '>'        { GTHAN }
    | "<="       { LEQUAL }
    | ">="       { GEQUAL }

    | "match"   { MATCH }
    | "with"    { WITH }
    | "|"       { BAR }

    | "let"      { LET }
    | "in"        {IN}

    | "if"       { IF }
    | "then"      { THEN }
    | "else"     { ELSE }

    | "val"      { FUNC_DECLAR }
    | "fun"      { FUNC }

    | "true"     { BOOL true }
    | "false"    { BOOL false }

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

and line_comment buf = parse
  | newline    { new_line lexbuf}
  | "*)"       { read lexbuf}
  | _          { line_comment (buf ^ lexeme lexbuf) lexbuf }

