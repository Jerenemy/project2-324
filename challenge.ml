module Value = struct
  type t =
  | V_Undefined
  | V_None
  | V_Int of int
  | V_Bool of bool
  | V_Str of string
  (* V_Array of t list --- ARRAY TYPE TO STORE LISTS OF VALUES  *)
  (* V_loc of int --- TYPE TO STORE *)
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
    (* V_Array arr -> "[" ^ String.concat ", " (List.map to_string arr) ^ "]"  *)
    (*| V_Location loc -> "Location(" ^ Int.to_string loc ^ ")"*)
end


module Store = struct
  type t = {
    store : Value.t Array.t;  (* Array of values *)
    next_free : int ref;       (* Reference to the next free location *)
  }

  let create_store size = {
    store = Array.make 100 Value.V_Undefined;  (* Initialize the store with `V_Undefined` values *)
    next_free = ref 0;                           (* Start with location 0 *)
  }

  (* Allocate a block of memory for an array *)
  let allocate store size =
    let current_location = !(store.next_free) in
    if current_location + size > Array.length store.store then
      raise "OutOfMemoryError"
    else
      (* Update the next free location after allocation *)
      store.next_free := current_location + size; (*Reference assignment (update the reference given as first argument with the value of the second argument).*)
    current_location

  (* Get a value from a specific memory location *)
  let get store location =
    if location < 0 || location >= !(store.next_free) then
      raise "SegmentationError"
    else
      Array.get store.store location

  (* Set a value at a specific memory location *)
  let set store location value =
    if location < 0 || location >= !(store.next_free) then
      raise "SegmentationError"
    else
      Array.set store.store location value
end




| Call(f, es) -> 
  begin
    try
      (* Retrieve parameters and body *)
      let params, stms = get_body_and_params f in

      (* Evaluate all argument expressions *)
      let args = List.map (fun e -> eval store rhos (Some e)) es in

      (* Check if the number of arguments matches the number of parameters *)
      if List.length params <> List.length args then
        raise @@ TypeError "Incorrect number of arguments"
      else
        (* Create a new environment binding parameters to arguments *)
        let param_bindings = List.combine params args in
        let new_rho = List.fold_left (fun acc (param, arg) ->
          (param, arg) :: acc
        ) [] param_bindings in

        (* Push the new environment onto the environment block *)
        let new_rhos = EnvBlock.Envs (new_rho :: (match rhos with Envs envs -> envs)) in

        (* Execute the function body with the new environment *)
        match exec_stms store stms new_rhos with
        | Return v -> v
        | Envs _ -> raise @@ NoReturn f
    with
    | UndefinedFunction f -> 
      (* Handle API functions *)
      let vs = List.map (fun e -> eval store rhos (Some e)) es in
      try 
        Io.do_call f vs
      with Io.ApiError _ -> raise @@ UndefinedFunction f 
  end
