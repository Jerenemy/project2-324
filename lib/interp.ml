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
 * space in the store  than is available.
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
    | V_Loc of int (*--- location of pointers TO STORE*)
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
    | V_Loc p -> Int.to_string p
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



(* 
module Store: type t = Value.t array * int ref

Represents the memory store as a tuple containing an array of Value.t 
and a reference to the next free memory location.
*)
module Store = struct
  type t = (Value.t Array.t * int ref)

  (* Initialize store with every value of type V_Undefined
  then when indexed, immediately get correct val
  *)
  let store_arr : Value.t Array.t = Array.make 100 Value.V_Undefined

  (* type int ref to globally keep track of next available mem. 
   * works like a pointer: needs to be dereferenced and updated with reference assignment.
   *)
  let next_free : int ref = ref 0

  (* 
  create_store -> Store.t 
  Creates and initializes a new memory store with default values.

  A new store where:
    The array is of size 100, initialized with Value.V_Undefined.
    The next_free reference is set to 0.
  *)
  let create_store : t = (store_arr, next_free)

  (* 
  allocate : Store.t -> int -> Value.t

  Allocates a block of memory in the store for an array of a given size and returns the starting location.

  Arguments:
    store: The current memory store.
    size: The number of memory units to allocate.
  Output:
    If sufficient space is available:
      Updates next_free by adding size.
      Returns Value.V_Loc(current_loc), where current_loc is the previous value of next_free.
    If insufficient space:
      Raises OutOfMemoryError.
  *)
  let allocate (store : t) (size : int) : Value.t =
    let store_arr, next_free = store in 
    (* dereference next_free with ! *)
    let current_loc = !(next_free) in
    if current_loc + size > Array.length store_arr then
      raise @@ OutOfMemoryError
    else
      (* update next_free by reference assignment := *)
      let _ = next_free := current_loc + size in
    Value.V_Loc current_loc

  (* 
  get : Store.t -> int -> Value.t

  Retrieves the value stored at a specific memory location.

  Arguments:
    store: The current memory store.
    loc: The memory location to access.
  Output:
    Returns the value at loc in the store.
    If loc is out of bounds (negative or beyond next_free), raises SegmentationError(loc).

  Note: The store does allow you to get a value past the length of the array indexing,
    as long as that value has been previously assigned in the store, as there is no size information
    contained within each array. However, this aligns reasonably with our intuition of the C language.
  *)
  let get (store : t) (loc : int) : Value.t = 
    let store_arr, next_free = store in 
    if loc < 0 || loc >= !(next_free) then
      raise @@ SegmentationError loc
    else 
      (* get store_arr[loc] *)
      Array.get store_arr loc

  (* 
  set : Store.t -> int -> Value.t -> unit

  Sets the value at a specific memory location in the store.

  Arguments:
    store: The current memory store.
    loc: The memory location to update.
    v: The value to store at loc.
  Output:
    Updates the value at loc to v.
    If loc is out of bounds, raises SegmentationError(loc).
  *)
  let set (store : t) (loc : int) (v : Value.t) : unit = 
    let store_arr, next_free = store in 
    if loc < 0 || loc >= !(next_free) then
      raise @@ SegmentationError loc
    else 
      (* set store_arr[loc] = v *)
      Array.set store_arr loc v
end 

(* 
type t = (Ast.Id.t * Value.t) list

Represents an environment as a list of identifier-value pairs.
*)
module Env = struct
  type t = (Ast.Id.t * Value.t) list

  (* empty = the empty environment.
   *)
  let empty : t = []
  
  (* 
  lookup : Env.t -> Ast.Id.t -> Value.t option

  Retrieves the value associated with an identifier from the environment.

  Arguments:
    rho: The environment to search.
    x: The identifier to look up.
  Output:
    If x is found, returns Some(v).
    If x is not found, returns None.. 
  *)
  let rec lookup 
      (rho : t) 
      (x : Ast.Id.t) : Value.t option = 
    match rho with
      | (x',v) :: rho' -> 
        if x = x' then Some (v)
        else 
          let v_opt = lookup rho' x in 
          begin
            match v_opt with
            | Some v_some -> Some v_some
            | None -> None
          end

      | [] -> None 

    
    (* 
    update : Env.t -> Ast.Id.t -> Value.t -> Env.t option

    Updates the value associated with an identifier in the environment.

    Arguments:
      rho: The environment to update.
      x: The identifier to update.
      v: The new value for x.
    Output:
      If x is found, returns Some(rho') with x updated to v.
      If x is not found, returns None.
    *)
    let rec update 
        (rho : t) 
        (x : Ast.Id.t) 
        (v : Value.t) : t option =
      match rho with
      | (x',v') :: rho' -> 
        if x = x' then 
          Some ((x, v) :: rho')
        else 
          let rho_opt = update rho' x v in 
          begin
            match rho_opt with
            | Some rho_some -> Some ((x',v') :: rho_some)
            | None -> None
          end
      | [] -> None 
  

  (* DEBUGGING *)
  let show (rho : t) : string =
    let bindings = List.map (fun (x, v) ->
      Printf.sprintf "%s: %s" (x) (Value.to_string v)
    ) rho in
    String.concat ", " bindings
end

(* 
type t = Envs of Env.t list

Represents a block of environments.
*)
module EnvBlock = struct
  type t = Envs of Env.t list

  (*
  empty : EnvBlock.t

  Initializes a new environment block containing a single empty environment.
  *)
  let empty : t = Envs [Env.empty]

  (* 
  assign : EnvBlock.t -> Ast.Id.t -> Value.t -> EnvBlock.t

  Assigns a value to an identifier in the nearest enclosing environment where it is declared.

  Arguments:
    rhos: The environment block to update.
    x: The identifier to assign.
    v: The value to assign to x.
  Output:
    Returns a new EnvBlock with x updated to v in the appropriate environment.
    If x is not found, raises UnboundVariable(x).
  *)
  let rec assign 
      (rhos : t) 
      (x : Ast.Id.t) 
      (v : Value.t) : t = 
    match rhos with
    | Envs (rho :: rhos') -> 
      (* if x in rho then update x to v, else rho :: assign rhos' x v *)
      let rho_opt = Env.update rho x v in
      begin
        match rho_opt with
        | Some rho' -> Envs (rho' :: rhos')
        | None -> 
          (* need it to be type Env.t list, not Envblock.Envs *)
          let Envs envs_assigned = (assign (Envs rhos') x v) in
          Envs (rho :: envs_assigned)
      end
    | Envs [] -> raise @@ UnboundVariable x

  (* 
  lookup : EnvBlock.t -> Ast.Id.t -> Value.t

  Looks up the value of an identifier, searching from the innermost to the outermost scope.

  Arguments:
    rhos: The environment block to search.
    x: The identifier to look up.
  Output:
    Returns the value associated with x.
    If x is not found, raises UnboundVariable(x).
  *)
  let rec lookup 
      (rhos : t) 
      (x : Ast.Id.t) : Value.t = 
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

(* 
type t = Envs of EnvBlock.t | Return of Value.t

Represents a frame, which can be either an environment block or a return value.
*)
module Frame = struct
  
  type t = Envs of EnvBlock.t
         | Return of Value.t
  
  (* 
  empty = the new frame, which contains the a new environment block: empty.
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

(* 
unop : Ast.Expr.unop -> Value.t -> Value.t

Evaluates a unary operation on a given value.

Arguments:
  op: The unary operator to apply.
  v: The value on which the operator is applied.
Output:
  If op is Neg and v is an integer, returns -v.
  If op is Not and v is a boolean, returns !v.
  For any other combinations, raises a TypeError.
*)
let unop 
    (op : Ast.Expr.unop) 
    (v : Value.t) : Value.t =
  match (op, v) with
  | (Neg, V_Int n) -> V_Int (-n)
  | (Not, V_Bool b) -> V_Bool (not b)
  | _ ->  raise @@ TypeError (
          Printf.sprintf "Bad operand types: %s %s"
            (Ast.Expr.show_unop op) (Value.to_string v)
          )
        
(* 
binop : Ast.Expr.binop -> Value.t -> Value.t -> Value.t

Evaluates a binary operation on two given values.

Arguments:
  op: The binary operator to apply.
  v1: The first value.
  v2: The second value.
Output:
  Typical mathematical binary functions...
  For any other combinations, raises a TypeError.
*)
let binop 
    (op : Ast.Expr.binop) 
    (v : Value.t) 
    (v' : Value.t) : Value.t =
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

(* 
var_dec : (Store.t -> EnvBlock.t -> Ast.Expr.t option -> Value.t) ->
          Store.t -> EnvBlock.t -> Env.t ->
          (Ast.Id.t * Ast.Expr.t option) list -> Env.t

Processes a list of variable declarations, updating the current environment.

Arguments:
  eval: The evaluation function.
  store: The current memory store.
  rhos: The environment block.
  rho: The current environment.
  vds: A list of variable declarations, each with an identifier and an optional initializing expression.
Output:
  Returns an updated environment with new variable bindings.
  For each declaration:
    If x is already declared in rho, raises MultipleDeclaration(x).
    If an initializing expression is provided, binds x to its evaluated value.
    If no expression is provided, binds x to Value.V_Undefined.
*)
let rec var_dec 
    (eval : Store.t -> EnvBlock.t -> Ast.Expr.t option -> Value.t) 
    (store : Store.t) 
    (rhos : EnvBlock.t) 
    (rho : Env.t) 
    (vds : (Ast.Id.t * Ast.Expr.t option) list) : Env.t = 
  match vds with
  | [] -> rho (* base case *)
  | (x, e_opt) :: vds' ->  
    if Env.lookup rho x <> None then (* implement multidec using lookup *)
      raise @@ MultipleDeclaration x
    else
      begin 
        match e_opt with
        | Some _ -> 
          var_dec eval store rhos ((x, eval store rhos e_opt) :: rho)  vds'
        | None -> 
          var_dec eval store rhos ((x, Value.V_Undefined) :: rho)  vds'
      end
   
(* 
arr_dec : (Store.t -> EnvBlock.t -> Ast.Expr.t option -> Value.t) ->
          Store.t -> EnvBlock.t -> Env.t ->
          (Ast.Id.t * Ast.Expr.t) list -> Env.t

Processes a list of array declarations, allocating memory and updating the environment.

Arguments:
  eval: The evaluation function.
  store: The current memory store.
  rhos: The environment block.
  rho: The current environment.
  ads: A list of array declarations, each with an identifier and an expression for size.
Output:
  Returns an updated environment with new array bindings.
  For each declaration:
  If x is already declared in rho, raises MultipleDeclaration(x).
    Evaluates the size expression to get the array size.
    Allocates memory in the store and binds x to Value.V_Loc(start).
  If the size is not an integer, raises TypeError.
*)
let rec arr_dec 
    (eval : Store.t -> EnvBlock.t -> Ast.Expr.t option -> Value.t) 
    (store : Store.t) 
    (rhos : EnvBlock.t) 
    (rho : Env.t) 
    (ads : (Ast.Id.t * Ast.Expr.t) list) : Env.t =
  match ads with
  | [] -> rho (* base case *)
  | (x, e) :: ads' -> 
    if Env.lookup rho x <> None then
      raise @@ MultipleDeclaration x
    else
      (* get starting loc for this arr, pair that with x, add that to rho *)
      let v_size = eval store rhos (Some e) in
      begin 
        match v_size with
        | Value.V_Int size -> 
          (* allocate reserves space in store, and returns starting value as Value.V_Loc *)
          let start = Store.allocate store size in
          arr_dec eval store rhos ((x, start) :: rho) ads'
        | _ -> raise @@ TypeError "array size must be of int"
      end


(* exec p:  Execute the program `p`.
 *)
let exec (Ast.Prog.Pgm fundefs : Ast.Prog.t) : unit =

  let get_body_and_params (f : Ast.Id.t) : (Ast.Stm.t list * Ast.Id.t list) = 
    let rec find_body (fundefs : Ast.Prog.fundef list) : (Ast.Stm.t list * Ast.Id.t list) = 
      match fundefs with
      | [] -> raise @@ UndefinedFunction f
      | FunDef(g, params, body) :: fundefs' -> 
        if g = f then (body, params)
        else find_body fundefs' 
    in
      find_body fundefs
  in

  (* 
  exec_stms : Store.t -> Ast.Stm.t list -> EnvBlock.t -> Frame.t


  Executes a list of statements within the given environment block.

  Arguments:
    store: The current memory store.
    stms: The list of statements to execute.
    rhos: The environment block.
  Output:
    Returns a frame:
      If no Return is encountered, returns Frame.Envs(rhos') with the updated environment block.
      If a Return is encountered, returns Frame.Return(v) with the returned value.
  *)
  let rec exec_stms 
      (store : Store.t) 
      (stms : Ast.Stm.t list) 
      (rhos : EnvBlock.t) : Frame.t =
    match stms with 
    | [] -> Frame.Envs rhos
    | stm :: stms' ->
      let eta = exec_stm store rhos stm 
      in
        begin 
          match eta with
          | Return rf -> 
            Return rf
          | Envs rhos' -> 
            exec_stms store stms' rhos'
        end 

  (* 
  exec_stm : Store.t -> EnvBlock.t -> Ast.Stm.t -> Frame.t

  Executes a single statement within the given environment block.

  Arguments:
    store: The current memory store.
    rhos: The environment block.
    stm: The statement to execute.
  Output:
    Returns a frame, either Frame.Envs(rhos') or Frame.Return(v), depending on the statement execution.
  *)
  and exec_stm 
      (store : Store.t)
      (rhos : EnvBlock.t) 
      (stm : Ast.Stm.t)  : Frame.t = 
  
    match stm with 
  
    | VarDec vds -> 
      begin
        match rhos with
        | Envs (rho :: rhos_tail) ->
          let rho' = var_dec eval store rhos rho vds in
          let new_rhos = EnvBlock.Envs (rho' :: rhos_tail) in
          (* this returns a frame here, and then the rest of the stms are executed in exec_stms *)
          Frame.Envs new_rhos
        | _ -> Failures.impossible "empty rhos"
      end
      
    | ArrayDec ads ->
      begin
        match rhos with
        | Envs (rho :: rhos_tail) -> 
          let rho' = arr_dec eval store rhos rho ads in
          let new_rhos = EnvBlock.Envs (rho' :: rhos_tail) in
          let frame = Frame.Envs new_rhos in
          let _ = print_frame frame in
          frame
        | _ -> Failures.impossible "empty rhos"
      end
  
    | Assign (x, e) -> 
      let v = eval store rhos (Some e) in (* Some e, because never assigning a variable an undefined value *)
      Frame.Envs (EnvBlock.assign rhos x v)
    
    | IndexAssign (xs, e, e') -> 
      (* 
      eval both exprs
      lookup xs in rhos
      set the val at v to be v'
      return the (unchanged) rhos frame
      need to pass location + index to set
      *)
      let v = eval store rhos (Some e) in
      let v' = eval store rhos (Some e') in
      begin
        match v with
        | Value.V_Int index -> 
          let xs_loc = EnvBlock.lookup rhos xs in
          begin
            match xs_loc with
            | Value.V_Loc xs_loc_int ->
              let _ = Store.set store (xs_loc_int + index) v' in 
              Frame.Envs rhos
            | _ -> Failures.impossible "xs must be type V_Loc when stored in rhos "
          end
        | _ -> raise @@ TypeError "array index must be int"
      end
  
    | Expr e ->
      (* stm expr execution doesn't change the frame, maybe has a side effect (like print) *)
      let _ = eval store rhos (Some e) in 
      Frame.Envs rhos  (* Continue with the same environment *)
  
    | Block stms -> 
      (* to evaluate stm list given by block just push new empty env on top of rhos and pop it back off at the end *)
      let EnvBlock.Envs rhos_list = rhos in
      let block_frame = exec_stms store stms (EnvBlock.Envs (Env.empty :: rhos_list)) in
      begin 
        match block_frame with
        (* delete top env if returns another list of envs *)
        | Frame.Envs EnvBlock.Envs (_ :: block_rhos) -> 
          Frame.Envs (EnvBlock.Envs block_rhos)
        | Frame.Return v -> Frame.Return v
        | Envs EnvBlock.Envs [] -> 
          Failures.impossible "empty env block"
      end

    | IfElse (e, s, s') -> 
      let v = eval store rhos (Some e) in
      begin
        match v with
        | Value.V_Bool b -> 
          if b then exec_stm store rhos s 
          else exec_stm store rhos s'
        | _ -> raise @@ TypeError "non bool test case given to IfElse"
      end

    | While (e, s) -> 
      let v = eval store rhos (Some e) in
      begin
        match v with
        | Value.V_Bool b -> 
          (* 
          need to do recursive call with another while but updated rhos.
          We just eval the block statment every time, 
            which pushes a new env onto rhos and then pops it off once its done, 
            but this has no effect on the rest of the envblock or the test expr 
            if vars are declared within the new env created by the block.
          *)
          (* first check test expr (eval'd under current rhos) *)
          if b then
            (* 
            If true, execute Block s to update rhos to rhos'
            When the Block s is executed, a new env is pushed onto rhos and then popped off, 
              and vars in rhos may / may not have been updated.
              This reflects the While operational semantics.
             *)
            let rhos' = (exec_stm store rhos s) in
            begin 
              (* 
              check if there was a return in the While block. 
              If no return, re-evaluate While expr with rhos'
              If return, return returnframe
              *)
              match rhos' with
              | Envs rhos_envblock -> exec_stm store rhos_envblock (Ast.Stm.While (e, s))
              | Return v -> Frame.Return v
            end
          else Frame.Envs rhos
        | _ -> raise @@ TypeError "non bool test case given to While"
      end
  
    | Return e_opt ->
      Frame.Return (eval store rhos e_opt) 
    
  
  (* 
  eval : Store.t -> EnvBlock.t -> Ast.Expr.t option -> Value.t
      Evaluates an expression and returns its value.

  Arguments:
    store: The current memory store.
    rhos: The environment block.
    e_opt: The optional expression to evaluate.
  Output:
    If an expression is provided, returns its evaluated value.
    If no expression is provided, returns Value.V_None.
  *)
  and eval (store : Store.t) (rhos : EnvBlock.t) (e_opt : Ast.Expr.t option) : Value.t =
    (* 
    instead of eta, paass rhos (envblock) because never evaluate exprs (or stms) under Frame.Return.
    e : Ast.Expr.t option, when SOME, eval expr, when NONE, return V_Undefined, 
      because eval-ing expr of a VarDec stm, when NONE, no val assigned 
    *)
    match e_opt with
    | Some e ->
    begin 
      match e with  
      (* `x` parses to Var "x".
       *)
      | Var x -> EnvBlock.lookup rhos x

      (* `xs[e]` parses to Index(xs, e) *)
      | Index (xs, e) ->
        let v_index = eval store rhos (Some e) in
        begin 
          match v_index with
          | Value.V_Int index -> 
            if index >= 0 then
              let v_start = EnvBlock.lookup rhos xs in
              begin 
                match v_start with
                | Value.V_Loc start -> 
                  Store.get store (start+index)
                | _ -> Failures.impossible "xs always stored in rhos with type V_Loc"
              end
            else raise @@ SegmentationError index
          | _ -> raise @@ TypeError "index must be int"
        end
        
      | Num n -> V_Int n
      | Bool b -> V_Bool b
      (* `s` parses to String s for strings s. *)
      | Str s -> V_Str s
      | Unop (op, e) ->
        unop op (eval store rhos (Some e)) (* is the Some necessary, or are we just doing it blindly for no reason? *)
      | Binop (op, e, e') ->
        binop op (eval store rhos (Some e)) (eval store rhos (Some e'))
      (* is es of type Ast.Expr.t option? es is a list of arguments.  *)
      | Call(f, es) -> 
        begin
          try
            let body_stms, params = get_body_and_params f in
            (* Check if the number of arguments matches the number of parameters *)
            if List.length params <> List.length es then
              raise @@ TypeError "Incorrect number of arguments"
            else
              (* create new env 
              start by evaluating the arg list. (need to convert the arg e to option type) *)
              let args = List.map (fun e -> eval store rhos (Some e)) es in
              (* then pair params with eval'd args *)
              let param_bindings = List.combine params args in
              (* create a new environment binding parameters to arguments *)
              let new_rho = List.fold_left 
                              (fun acc (param, arg) -> (param, arg) :: acc) 
                              [] param_bindings in
              let EnvBlock.Envs rhos_list = rhos in
              begin 
                match exec_stms store body_stms (EnvBlock.Envs (new_rho :: rhos_list)) with
                | Envs _ -> Failures.impossible "Function didn't execute return!"
                | Return v -> v
              end
          with
          | UndefinedFunction f -> 
            let vs = List.map (fun e -> eval store rhos (Some e)) es in (* each e in es needs to be type Ast.Expr.t option *)
            try 
              Io.do_call f vs
            with Io.ApiError _ -> raise @@ UndefinedFunction f 
        end
      
    end
    | None -> Value.V_None 

  in
  (* create store here *)
  let store = Store.create_store in
  let _ = eval store EnvBlock.empty (Some (Call("main", []))) in (* needs to be arg of option type here too *)
  ()


