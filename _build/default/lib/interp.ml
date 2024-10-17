(* C- interpreter.
 *
 * N. Danner
 *)

(* Raised when a function body terminates without executing `return`.
 *)
exception NoReturn of Ast.Id.t

(* MultipleDeclaration x is raised when x is declared more than once in a
 * block.
 *)
exception MultipleDeclaration of Ast.Id.t

(* UnboundVariable x is raised when x is used but not declared.
 *)
exception UnboundVariable of Ast.Id.t

(* UndefinedFunction f is raised when f is called but has not been defined.
 *)
exception UndefinedFunction of Ast.Id.t

(* TypeError s is raised when an operator or function is applied to operands
 * of the incorrect type.  s is any (hopefuly useful) message.
 *)
exception TypeError of string

(* OutOfMemoryError is raised when the an attempt is made to allocate more
 * space in the store than is available.
 *)
exception OutOfMemoryError

(* Raised when an attempt is made to access a store location that is
 * negative or larger than the store capacity.
 *)
exception SegmentationError of int


(* Values.
 *)
module Value = struct
  type t = 
    | V_Undefined
    | V_None
    | V_Int of int
    | V_Bool of bool
    | V_Str of string
    [@@deriving show]

  (* to_string v = a string representation of v (more human-readable than
   * `show`.
   *)
  let to_string (v : t) : string =
    match v with
    | V_Undefined -> "?"
    | V_None -> "None"
    | V_Int n -> Int.to_string n
    | V_Bool b -> Bool.to_string b
    | V_Str s -> s
end


(* Module for input/output built-in functions.
 *)
module Io = struct

  (* Module for maps with Id.t domain.
   *)
  module IdMap = Map.Make(Ast.Id)

  (* Raised when a function is invoked that is not in the API.
   *)
  exception ApiError of string

  (* The input source and output destination is abstracted, because there
   * are two use cases that are rather different.  The interactive
   * interpreter uses standard input and standard output for input and
   * output.  But the automated tests need the input source and output
   * destination to be programmatic values (the former is read from a test
   * specification, and the latter has to be compared to the test
   * specification).  The "right" way to do this is to make the interpreter
   * itself a functor that takes an IO module as an argument, but that is a
   * little much for this project, so instead we define this Io module with
   * the input source (`in_channel`) and output destination (`output`)
   * references that can be changed by the client that is using the
   * interpreter.
   *)

  (* The input channel.  get_* and prompt_* read from this channel.  Default
   * is standard input.
   *)
  let in_channel : Scanf.Scanning.in_channel ref =
    ref Scanf.Scanning.stdin

  (* The output function.  print_* and prompt_* (if !show_prompts = true)
   * call this function for output.  Default is to print the string to
   * standard output and flush.
   *)
  let output : (string -> unit) ref = 
    ref (
      fun s ->
        Out_channel.output_string Out_channel.stdout s ;
        Out_channel.flush Out_channel.stdout
    )

  (* If !show_prompts = true, then the argument to `prompt_*` is output via
   * `output`; otherwise it is ignored.  We have this flexibility so that
   * the testing framework can set it to `false`, and therefore the prompts
   * do not have to be specified as part of the expected output of the
   * programs.
   *)
  let show_prompts : bool ref =
    ref true

  (* outputnl s: output s ^ "\n" via !output.
   *)
  let outputnl (s : string) : unit =
    (!output) (s ^ "\n")

  (* The API definition.  The API is specified by a
   * (string*(Value.t->Value.t)) list.  Each element names an API function
   * and provides the code to be executed when the function is called.
   *
   * This is really ugly; there must be a better way.
   *)
  let api : (Value.t list -> Value.t) IdMap.t =
    [
      ("print_bool", fun vs ->
        match vs with
        | [Value.V_Bool n] -> 
          outputnl (Bool.to_string n) ; Value.V_None
        | _ -> raise @@ TypeError "Bad argument type for print_bool"
      )
    ; ("get_bool", fun vs ->
        match vs with
        | [] -> Value.V_Bool (Scanf.bscanf !in_channel " %B" (fun b -> b))
        | _ -> raise @@ TypeError "Bad argument type for get_bool"
      )
    ; ("prompt_bool", fun vs ->
        match vs with
        | [Value.V_Str s] ->
          if !show_prompts then (!output) s else () ;
            Value.V_Bool (Scanf.bscanf !in_channel " %B" (fun b -> b))
        | _ -> raise @@ TypeError "Bad argument type for prompt_bool"
      )
    ; ("print_int", fun vs ->
        match vs with
        | [Value.V_Int n] -> 
          outputnl (Int.to_string n) ; Value.V_None
        | _ -> raise @@ TypeError "Bad argument type for print_int"
      )
    ; ("get_int", fun vs ->
        match vs with
        | [] -> Value.V_Int (Scanf.bscanf !in_channel " %d" (fun n -> n))
        | _ -> raise @@ TypeError "Bad argument type for get_int"
      )
    ; ("prompt_int", fun vs ->
        match vs with
        | [Value.V_Str s] ->
          if !show_prompts then (!output) s else () ;
            Value.V_Int (Scanf.bscanf !in_channel " %d" (fun n -> n))
        | _ -> raise @@ TypeError "Bad argument type for prompt_int"
      )
    ; ("print_string", fun vs ->
         match vs with
         | [Value.V_Str s] -> 
           outputnl s ; Value.V_None
         | _ -> raise @@ TypeError "Bad argument type for print_s"
      )
    ; ("get_string", fun vs ->
        match vs with
        | [] -> Value.V_Str (Scanf.bscanf !in_channel " %s" (fun s -> s))
        | _ -> raise @@ TypeError "Bad argument type for get_str"
      )
    ; ("prompt_string", fun vs ->
        match vs with
        | [Value.V_Str s] ->
          if !show_prompts then (!output) s else () ;
            Value.V_Str (Scanf.bscanf !in_channel " %s" (fun s -> s))
        | _ -> raise @@ TypeError "Bad argument type for prompt_str"
      )
    ] |> List.to_seq |> IdMap.of_seq

  (* do_call f vs invokes the API function corresponding to `f` with argument
   * list `vs`.
   *
   * Raises ApiError f: if f is not an API function.
   *)
  let do_call (f : string) (vs : Value.t list) : Value.t =
    try
      IdMap.find f api vs
    with
    | Not_found -> raise @@ ApiError f

end

module Env = struct
  type t = (Ast.Id.t * Value.t) list

  (* empty = the empty environment.
   *)
  let empty : t = []
  (* add exceptions for function redef and one other thing *)
  (* 
  Env.lookup (rho : Env.t) (x : Ast.Id.t) : Value.t
    
  Retrieve the value associated with identifier x from the environment rho or the program pgm.
  
  Searches rho for a binding (x', v') where x = x'. If found, returns v'.
  Raises UnboundVariable x if x is not found. 
  *)
  let lookup 
      (rho : t) 
      (_ : Ast.Id.t) : Value.t = 
    match rho with
    | _ -> Failures.unimplemented "lookup"

  (* 
  Env.assign (rho : Env.t) (x : Ast.Id.t) (v : Value.t) : (Env.t)

  Assign the value v to the identifier x, updating the environment rho.
 *)
  let assign 
      (rho : t) 
      (x : Ast.Id.t) 
      (v: Value.t) : (t) = 
    (x, v) :: rho

  
  
end


module EnvBlock = struct
  type t = Envs of Env.t list

  (*
  maybe call this start/init/new 
  empty = the new environment block, which is NOT actually empty: a list that contains only the empty environment.
   *)
  let empty : t = Envs [Env.empty]
end

module Frame = struct
  
  type t = Envs of EnvBlock.t
         | Return of Value.t
  
  (* newframe = the new frame, which contains the a new environment block: empty.
   *)
  let empty = Envs EnvBlock.empty
end

(* let  var_dec (eval) (rho) (vds) : Env.t = 
  Failures.unimplemented "var_dec" *)
  
let rec exec_stm (eval) (rhos) (stm)  : Frame.t = 
  (* let _ = eval in
  let _ = rhos in
  let _ = stm in *)

  match stm with 
  | Ast.Stm.VarDec vds -> 
    let _ = vds in
    Failures.unimplemented "exec_stms VarDec"


    (* deconstruct rhos and pass head to function *)
    (* never have empty env *)
     (* begin
      match rhos with
      | EnvBlock.Envs (rho :: rhos_tail)
        let rho' = var_dec eval rho vds in
        let new_rhos = EnvBlock.Envs (rho' :: rhos_tail) in
        exec_stms stms' new_rhos
      | _ -> Failures.unimplemented "empty rhos"
    end *)
    (* let _ = vds in *)

        
  (* | VarDec _ :: _ ->    *)
    (* Failures.unimplemented "exec_stms VarDec" *)
    (* add s to rhos, then pass new rhos into exec_stms 
    'int x, y;'
    = (Ast.Stm.VarDec [("x", None); ("y", None)])*)


  | Ast.Stm.ArrayDec (_ :: _) -> Failures.unimplemented "exec_stms ArrayDec"
  
  | Ast.Stm.Assign (_, _) -> Failures.unimplemented "exec_stms Assign"

  | Ast.Stm.IndexAssign (_, _, _) -> Failures.unimplemented "exec_stms IndexAssign"

  | Ast.Stm.Expr e ->
    (* need to pass a val of type EnvBlock into eval, not Frame *)
    let _ = eval rhos e in
    exec_stm (eval) (rhos) (stm) 

  | Ast.Stm.Return None ->
    Frame.Return Value.V_None 

  | _ -> Failures.unimplemented "exec_stms"


(* exec p:  Execute the program `p`.
 *)
let exec (Ast.Prog.Pgm fundefs : Ast.Prog.t) : unit =

  let get_body (f : Ast.Id.t) : Ast.Stm.t list = 
    let rec find_body (fundefs : Ast.Prog.fundef list) : Ast.Stm.t list = 
      match fundefs with
      | [] -> raise @@ UndefinedFunction f
      | FunDef(g, _, body) :: fundefs' -> 
        if g = f then body 
        else find_body fundefs' 
    in
      find_body fundefs
    (* Failures.unimplemented "get_body" *)
  in

  (* 
  if exec_stms returns a Frame, when does it return a frame? When it's an empty list?
    are the block statemenet returns handeled here? 
  (when a block statement concludes, it returns a ReturnFrame? or when a function concludes?) 
  *)
  let rec exec_stms (stms : Ast.Stm.t list) (rhos : EnvBlock.t) : Frame.t =
    match stms with 
    | [] -> Frame.Envs rhos
    | stm :: stms' ->
      let eta = exec_stm eval rhos stm 
      in
        begin 
          match eta with
          | Frame.Return rf -> 
            Frame.Return rf
            (* let _ = rf in *)
            (* Failures.unimplemented "rf" *)
          | Frame.Envs rhos' -> 
            exec_stms stms' rhos'
        end 
       (* exec_stms  *)

    

  
  (* instead of eta, paass rhos (envblock) because never evaluate exprs under Frame.Return  *)
  and eval (rhos : EnvBlock.t) (e : Ast.Expr.t) : Value.t =
    match e with
    | Num n -> V_Int n
    | Call(f, es) -> 
      begin
        try
          let stms = get_body f in
          begin 
            match exec_stms stms rhos with
            | Envs _ -> Failures.impossible "Function didn't execute return!"
            | Return v -> v
          end
        with
        | UndefinedFunction f -> 
          let vs = List.map (eval rhos) es in 
          try 
            Io.do_call f vs
          with Io.ApiError _ -> raise @@ UndefinedFunction f 
      end

    | _ -> Failures.unimplemented (
      Printf.sprintf "eval: %s" (Ast.Expr.show e)
    ) 
  in

  let _ = eval EnvBlock.empty (Call("main", [])) in
  ()


