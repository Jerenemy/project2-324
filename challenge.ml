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

