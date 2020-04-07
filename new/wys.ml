open Syntax

let string_of_option z = match z with 
| Some c -> c
| None -> ""

let rec string_of_decls  (ds: decl list) = match ds with 
| [] -> Printf.sprintf "()"
| [d] -> (
  match d with 
  | Open m -> Printf.sprintf "Open %s" m 
  | Val (m, _) -> Printf.sprintf "Val %s" m
)
| hd::tl ->  string_of_decls [hd] ^ string_of_decls tl

let string_of_program t = match t with 
| Module (m, ds) -> Printf.printf "module %s %s" m (string_of_decls ds) 

let interpret (e : prog) =
  string_of_program e 

let process (line : string) =
  Printf.printf "Read File:\n %s \nAST:\n" line;
  let linebuf = Lexing.from_string line in
  try
    (* Run the parser on this line of input. *)
    (* Printf.printf "%d\n%!" (interpret (Parser.main Lexer.token linebuf)) *)
    interpret (Parser.prog Lexer.token linebuf)
  with
  | Lexer.Error msg ->
      Printf.fprintf stderr "%s%!" msg
  | Parser.Error ->
      Printf.fprintf stderr "At offset %d: syntax error.\n%!" (Lexing.lexeme_start linebuf)

let process (optional_line : string option) =
  match optional_line with
  | None ->
      ()
  | Some line ->
      process line

let rec read_file (buf : string) (channel)=
  (* Attempt to read one line. *)
  let optional_line, continue = Lexer.read channel in
  match continue with 
  | true -> let this_line = string_of_option optional_line in 
              let buf = buf ^ " " ^ this_line in 
                read_file buf channel
  | false -> process (Some buf)

(* 
  process optional_line;
  if continue then
    read_file channel *)

let main () = 
read_file "" (Lexing.from_channel stdin) ;;

main ()
  