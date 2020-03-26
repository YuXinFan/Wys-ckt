module IO = Extlib.IO

module Unix = BatUnix
module Marshal = BatMarshal

type chan_in = IO.input
type chan_out = unit IO.output

type bytes = Platform.Bytes.bytes
    
let establish_server (callback:chan_in -> chan_out -> unit) (port:int) =
  let sock = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
  let sock_addr = Unix.ADDR_INET (Unix.inet_addr_of_string "127.0.0.1", port) in
  let _ = Unix.bind sock sock_addr in
  let _ = Unix.listen sock 10 in
  
  let rec accept_loop (_:unit) =
    let client_sock, _ = Unix.accept sock in
    let _ = callback (Unix.input_of_descr client_sock) (Unix.output_of_descr client_sock) in
    accept_loop ()
  in
  accept_loop ()  

let open_connection (port:int) :(chan_in * chan_out) =
  let sock_addr = Unix.ADDR_INET (Unix.inet_addr_of_string "127.0.0.1", port) in
  Unix.open_connection sock_addr

(* TODO: FIXME: these are in CoreCrypto.ml, use from there *)
let string_of_bytes b = Platform.Bytes.get_cbytes b
let bytes_of_string s = Platform.Bytes.abytes s

let int_of_string = int_of_string
  
let marshal (x:'a) :bytes =
  let s = Marshal.to_string x ([Marshal.Closures]) in
  bytes_of_string s

let unmarshal (b:bytes) =
  let s = string_of_bytes b in
  Marshal.from_string s 0

let send (c_out:chan_out) (b:bytes) :unit =
  let s = string_of_bytes b in
  let n = String.length s in
  IO.write_i32 c_out n;
  ignore (IO.really_output c_out s 0 n);
  IO.flush c_out

let recv (c_in:chan_in) :bytes =
  let n = IO.read_i32 c_in in
  let s = Bytes.to_string (Bytes.create n) in
  ignore (IO.really_input c_in s 0 n);
  bytes_of_string s

(* TODO: FIXME *)
let random i = bytes_of_string (Bytes.to_string (Bytes.create i))
 
(* let create_thread (f:unit -> unit) :unit = let _ = Thread.create f () in () *)

let is_server _ = Sys.argv.(1) = "0"
let me _ = Sys.argv.(2)

(**********)

exception GMWError of string

let gmwsock = ref Unix.stdin
let gmwsockset = ref false

let rungmw (conf_fname:string) (out_fname:string) (shout_fname:string) (port:Z.t) :(string list * bytes) =
  let port = Z.to_int port in
  begin
    if not (!gmwsockset) then
      let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
      let gmwaddr = Unix.ADDR_INET(Unix.inet_addr_of_string "127.0.0.1", port) in
      Unix.connect s gmwaddr;
      gmwsock := s; gmwsockset := true
    else ()
  end;

  let written = Unix.write !gmwsock conf_fname 0 (String.length conf_fname) in
  if not (written  = String.length conf_fname) then
    raise (GMWError "Cannot write to the main server socket")
  else
    let statusstr = String.make 5 '.' in
    let statusn = Unix.read !gmwsock statusstr 0 4 in
    assert(statusn = 4);
    let inc = open_in out_fname in
    let rec read_out l =
      try
	let c = input_char inc in
	if c = '0' then
	  read_out (l @ ["0"])
	else if c = '1' then
	  read_out (l @ ["1"])
	else
	  read_out l
	with
	  | End_of_file -> close_in inc; l
    in
    let out = read_out [] in

    let inc = open_in shout_fname in
    let rec read_shout i f =
      try
	let c = input_char inc in
	read_shout (i + 1) (fun x -> if x = i then c else f x)
      with
	| End_of_file -> close_in inc; String.init i f
    in

    let shout = bytes_of_string (read_shout 0 (fun _ -> '0')) in
    print_string ("rungmw bytes length: " ^ (string_of_int (Platform.Bytes.length shout)) ^ "\n");

    (out, shout)
      
let list_to_int l =
  let l' = List.rev_append l [] in
  let s = String.concat "" l' in
  let sin = Scanf.Scanning.from_string ("0b" ^ s) in
  Z.of_int (Scanf.bscanf sin "%i" (fun x -> x))
