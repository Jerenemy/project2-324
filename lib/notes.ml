(* Failures.unimplemented "exec_stms VarDec" *)


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
