{   
    open lexing
    open Parser
}

let whitespace = [' ' '\t']+
let newline = '\n' | '\r' | "\r\n"
let integer = '-'?['0'-'9']['0'-'9']*
let identifier = ['a-z']['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule read = parse 
    | whitespace    {read lexbuf}
    | newline       {new_line lexbuf; read lexbuf}
    | integer       {INT (int_of_string (lexem lexbuf))}
    | "(*"         { line_comment "" lexbuf }

    | ','        { COMMA }
    | '!'        { EXCLAM }
    | '~'        { TILDE }
    | '{'        { LBRACE }
    | '}'        { RBRACE }
    | '('        { LPAREN }
    | ')'        { RPAREN }
    | '+'        { ADD }
    | '-'        { SUB }
    | '*'        { MUL }
    | '/'        { DIV }
    | '%'        { MOD }
    | "->"       { ARROW }
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
    | "fun"      { FUNC }
    | "let"      { LET }
    | "val"      { FUNC_DECLAR }
    | "while"    { WHILE }
    | "do"       { DO }
    | "if"       { IF }
    | "then"      { THEN }
    | "else"     { ELSE }
    | "true"     { BOOL true }
    | "false"    { BOOL false }

    | identifier { IDENT (lexeme lexbuf) }
    | eof        { EOF }
    | _          { raise lexer_error }

and line_comment buf = parse
  | newline    { new_line lexbuf}
  | "*)"       { read lexbuf}
  | _          { line_comment (buf ^ lexeme lexbuf) lexbuf }

