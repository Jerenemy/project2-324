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
  let rec lookup 
      (rho : t) 
      (x : Ast.Id.t) : Value.t option = 
    match rho with
    (* | _ -> Failures.unimplemented "lookup" *)

      | (x',v) :: rho' -> 
        if x = x' then Some (v)

        (* else, need to look in the rest of the interp, 
        and if the recursive call returns Some, then the entire thing should be Some, 
        but if the recursive call returns None, then the entire thing should be None. 
        but can't cons the other vars back on if it's option type, so need to deconstruct it *)
        else 
          let v_opt = lookup rho' x in 
          begin
            match v_opt with
            | Some v_some -> Some v_some
            | None -> None
          end

      | [] -> None 

  (* 
  Env.declaration (rho : Env.t) (x : Ast.Id.t) (v : Value.t) : (Env.t)
  FIX SPECIFICATION
  NOT IN USE
  Declare the value v to the identifier x, updating the environment rho.
 *)
  let declaration 
      (rho : t) 
      (x : Ast.Id.t) 
      (v: Value.t) : (t) = 
    (x, v) :: rho

    
    (* when returns Some, that means the head environment has been updated. when returns None, 
    that means that var was not in the head environment, and the update needs to be performed on a lower level environment  *)

    let rec update (rho : t) (x : Ast.Id.t) (v : Value.t) : t option =
      match rho with
      | (x',v') :: rho' -> 
        if x = x' then 
          Some ((x, v) :: rho')

        (* else, need to look in the rest of the interp, 
        and if the recursive call returns Some, then the entire thing should be Some, 
        but if the recursive call returns None, then the entire thing should be None. 
        but can't cons the other vars back on if it's option type, so need to deconstruct it *)
        else 
          let rho_opt = update rho' x v in 
          begin
            match rho_opt with
            | Some rho_some -> Some ((x',v') :: rho_some)
            | None -> None
          end

      | [] -> None 
  

    (* i DO need to return if it actually updated a variable, because if it does then i need to try to assign it in the next Env in EnvBlock
      so return Some Env.t when updated
    and return None when not updated *)
  (* let rec update (rho : t) (x : Ast.Id.t) (v : Value.t) : t =
    match rho with
    | (x',v') :: rho' -> 
      if x = x' then (x, v) :: rho'
      else (x',v') :: (update rho' x v)
    | [] -> [] *) 
    (*shouldnt [] be Env.empty to be the correct type? *)

  (* DEBUGGING *)
  let show (rho : t) : string =
    let bindings = List.map (fun (x, v) ->
      Printf.sprintf "%s: %s" (x) (Value.to_string v)
    ) rho in
    String.concat ", " bindings
  
  
end


module EnvBlock = struct
  type t = Envs of Env.t list

  (*
  maybe call this start/init/new 
  empty = the new environment block, which is NOT actually empty: a list that contains only the empty environment.
   *)
  let empty : t = Envs [Env.empty]


  let rec assign (rhos : t) (x : Ast.Id.t) (v : Value.t) : t = 
    match rhos with
    | Envs (rho :: rhos') -> 
      (* if x in rho then update x to v, else rho :: assign rhos' x v *)
      let rho_opt = Env.update rho x v in
      begin
        match rho_opt with
        | Some rho' -> Envs (rho' :: rhos')
        (* This expression has type t but an expression was expected of type Env.t listocamllsp *)
        | None -> 
          (* need it to be type Env.t list, not Envblock.Envs *)
          let Envs envs_assigned = (assign (Envs rhos') x v) in
          Envs (rho :: envs_assigned)
        (* why are returning just rhos here? this means that the var wasn't what? during assign *) 
      end

    | Envs [] -> raise @@ UnboundVariable x

  let rec lookup (rhos : t) (x : Ast.Id.t) : Value.t = 
    match rhos with
    | Envs (rho :: rhos') -> 
      (* if x in rho then get v, else look for v in rhos' *)
      let v_opt = Env.lookup rho x in
      begin
        match v_opt with
        | Some v_some -> v_some
        | None -> lookup (Envs rhos') x
      end

    | Envs [] -> raise @@ UnboundVariable x

  (* DEBUGGING *)
  let show (env_block : t) : string =
    match env_block with
    | Envs envs ->
        let env_strings = List.map Env.show envs in
        String.concat " | " env_strings
end

module Frame = struct
  
  type t = Envs of EnvBlock.t
         | Return of Value.t
  
  (* empty = the new frame, which contains the a new environment block: empty.
   *)
  let empty = Envs EnvBlock.empty
end

(* DEBUGGING *)
let print_frame (frame : Frame.t) : unit =
  match frame with
  | Frame.Envs env_block ->
      Printf.printf "Envs: %s\n" (EnvBlock.show env_block)
  | Frame.Return v ->
      Printf.printf "Return: %s\n" (Value.to_string v)


let unop (op : Ast.Expr.unop) (v : Value.t) : Value.t =
  match (op, v) with
  | (Neg, V_Int n) -> V_Int (-n)
  | (Not, V_Bool b) -> V_Bool (not b)
  | _ ->  raise @@ TypeError (
          Printf.sprintf "Bad operand types: %s %s"
            (Ast.Expr.show_unop op) (Value.to_string v)
          )
        
(* binop op v v' = the result of applying the metalanguage operation
* corresponding to `op` to v and v'.
*)
let binop (op : Ast.Expr.binop) (v : Value.t) (v' : Value.t) : Value.t =
  match (op, v, v') with
  | (Plus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n + n')
  | (Minus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n - n')
  | (Times, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n * n')
  | (Div, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n / n')
  | (Mod, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n mod n')
  | (And, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool (b && b')
  | (Or, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool (b || b')
  | (Eq, v, v') -> Value.V_Bool (v = v')
  | (Ne, v, v') -> Value.V_Bool (v <> v')
  | (Lt, Value.V_Int n, Value.V_Int n') -> Value.V_Bool (n < n')
  | (Le, Value.V_Int n, Value.V_Int n') -> Value.V_Bool (n <= n')
  | (Gt, Value.V_Int n, Value.V_Int n') -> Value.V_Bool (n > n')
  | (Ge, Value.V_Int n, Value.V_Int n') -> Value.V_Bool (n >= n')
  | _ ->  raise @@ 
          TypeError (
            Printf.sprintf "Bad operand types: %s %s %s"
              (Value.to_string v) (Ast.Expr.show_binop op) (Value.to_string v')
          )
        
let rec var_dec (eval) (rhos : EnvBlock.t) (rho : Env.t) (vds : (Ast.Id.t * Ast.Expr.t option) list) : Env.t = 
  match vds with
  | [] -> rho (* base case *)
  (* need rhos to pass into eval, but does it make sense passing in rhos and rho separately? do it for simpler style *)
  (* I'll deal with the problem here, and catch the Value.V_None and convert it to Value.V_Undefined here? *)
  | (x, e_opt) :: vds' ->  
    if Env.lookup rho x <> None then (* implement multidec using lookup *)
      raise @@ MultipleDeclaration x
    else
      begin 
        match e_opt with
        | Some _ -> 
          var_dec eval rhos ((x, eval rhos e_opt) :: rho)  vds'
        | None -> 
          var_dec eval rhos ((x, Value.V_Undefined) :: rho)  vds'
      end
    (* this should solve the problem - it did *)
    
  
(* put this as a mutually recursive in exec, paired with exec_stms *)
let exec_stm (eval) (rhos) (stm)  : Frame.t = 

  match stm with 
  | Ast.Stm.VarDec vds -> 
    let _ = vds in
    begin
      match rhos with
      | EnvBlock.Envs (rho :: rhos_tail) ->
        let rho' = var_dec eval rhos rho vds in
        let new_rhos = EnvBlock.Envs (rho' :: rhos_tail) in
        (* this should return a frame here, and then the rest of the stms should be executed in exec_stms *)
        let frame = Frame.Envs new_rhos in 
        let _ = print_frame frame in 
        frame 
      | _ -> Failures.impossible "empty rhos"
    end
    

  | Ast.Stm.ArrayDec (_ :: _) -> Failures.unimplemented "exec_stms ArrayDec"

  (* (Ast.Stm.Assign ("x", (Ast.Expr.Num 1))) *)
  | Ast.Stm.Assign (x, e) -> 
    let v = eval rhos (Some e) in (* Some e, because never assigning a variable an undefined value, right? *)
    Frame.Envs (EnvBlock.assign rhos x v)

    (* Failures.unimplemented "exec_stms Assign" *)


  | Ast.Stm.IndexAssign (_, _, _) -> Failures.unimplemented "exec_stms IndexAssign"

  | Ast.Stm.Expr e ->
    (* need to pass a val of type EnvBlock into eval, not Frame *)
    (* ERROR This expression has type Ast.Expr.t but an expression was expected of type
    Ast.Expr.t option *)
    let _ = eval rhos (Some e) in (* VERIFY: is e always Some, never None? *)
    Frame.Envs rhos  (* Continue with the same environment *)

  
  | Block _ -> 
    Failures.unimplemented "Block"
  | IfElse _ -> 
    Failures.unimplemented "IfElse"
  | While _ -> 
    Failures.unimplemented "While"

  (* what is the type of return? is it an expression or expr option? sometimes it is None, right? *)
  | Ast.Stm.Return e_opt ->
    Frame.Return (eval rhos e_opt) (* FIRST MAJOR PROBLEM:  this sho*)
    (* begin
      match e_opt with
      | Some e -> 
        let v = eval rhos e in
        Frame.Return v 
      | None -> Frame.Return Value.V_None
    end *)
    
    (* begin 
      match e_opt with
      | Some e -> 
    let _ = v in
    Failures.unimplemented "Return e" *)
  (* | Ast.Stm.Return None -> *)
  | _ -> Failures.impossible "uncaught case!"
  
  
    


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
          | Frame.Envs rhos' -> 
            exec_stms stms' rhos'
        end 

    

  
  (* instead of eta, paass rhos (envblock) because never evaluate exprs under Frame.Return  *)
  (* e : Ast.Expr.t option, when SOME, eval expr, when NONE, return V_Undefined (because eval-ing expr of a VarDec stm, when NONE, no val assigned) *)
  and eval (rhos : EnvBlock.t) (e_opt : Ast.Expr.t option) : Value.t =
    match e_opt with
    | Some e ->
    begin 
      match e with  
      (* `x` parses to Var "x".
       *)
      | Var x -> EnvBlock.lookup rhos x
      (* `xs[e]` parses to Index(xs, e)
      *)
      | Index (x, e) -> 
        let _ = x in
        let _ = e in
        Failures.unimplemented "Index xs[e]"
      | Num n -> V_Int n
      | Bool b -> V_Bool b
      (* `s` parses to String s for strings s. *)
      | Str s -> V_Str s
      | Unop (op, e) ->
        unop op (eval rhos (Some e)) (* is the Some necessary, or are we just doing it blindly for no reason? *)
      | Binop (op, e, e') ->
        binop op (eval rhos (Some e)) (eval rhos (Some e'))
      (* is es of type Ast.Expr.t option? es is a list of arguments.  *)
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
            (* verify with Fernando *)
            let vs = List.map (fun e -> eval rhos (Some e)) es in (* each e in es needs to be type Ast.Expr.t option *)
            try 
              (* do_call gets called in an infinite loop FIXED!!! *)
              (* let _ = print_string "Io.do_call" in *)
              Io.do_call f vs
            with Io.ApiError _ -> raise @@ UndefinedFunction f 
        end
      
    end
    | None -> Value.V_None 
    (* 
    problem, this can't handle the case for when it's undefined and returns None, but the way it's set up it needs to. 
    right now, during VarDec, it tries to evaluate the second item, but if it is None, it gives it the Value.V_Undefined and triggers this case.
    could i just trigger it directly there?

    TRIED TO FIX by checking if it's V_None when assigning to a var

    but wait, this breaks the edge case of var dec with int x = print(x). but is that allowed?

    that is not allowed, since can only declare vars of type int, str, and bool (I think?) 
    *)
  in

  let _ = eval EnvBlock.empty (Some (Call("main", []))) in (* needs to be arg of option type here too *)
  ()


