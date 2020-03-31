open Syntax

let string_of_option z = match z with 
| Some c -> c
| None -> ""

let rec showAST (e : expr ) =
  match e.value with 
  | ELiteral i -> Printf.printf " %d " i
  | EBinOp (e1, binop, e2) ->  
    let op_name = match binop with 
      | OpPlus -> "+"
      | OpMinus -> "-"
      | OpDiv -> "/"
      | OpTimes -> "*" in Printf.printf "(" ; showAST e1 ;   Printf.printf " %s " op_name ; showAST e2; Printf.printf ")"
  | EUnOp (OpNeg, e) -> Printf.printf " - "; showAST e  

let rec interpret (e : expr) =
  match e.value with
  | ELiteral i ->
      i
  | EBinOp (e1, OpPlus, e2) ->
      interpret e1 + interpret e2
  | EBinOp (e1, OpMinus, e2) ->
      interpret e1 - interpret e2
  | EBinOp (e1, OpTimes, e2) ->
      interpret e1 * interpret e2
  | EBinOp (e1, OpDiv, e2) ->
      interpret e1 / interpret e2
  | EUnOp (OpNeg, e) ->
      - (interpret e)

let process (line : string) =
  Printf.printf "Read File:\n %s" line;
  let linebuf = Lexing.from_string line in
  try
    (* Run the parser on this line of input. *)
    (* Printf.printf "%d\n%!" (interpret (Parser.main Lexer.token linebuf)) *)
    showAST (Parser.main Lexer.token linebuf)
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

let () =
  read_file "" (Lexing.from_channel stdin)