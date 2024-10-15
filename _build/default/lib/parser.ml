
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | T_VOID
    | T_STRING
    | T_INT
    | T_BOOL
    | TIMES
    | STRING of (
# 21 "lib/parser.mly"
       (string)
# 21 "lib/parser.ml"
  )
    | SEMI
    | RPAREN
    | RETURN
    | RBRACKET
    | RBRACE
    | PLUS
    | OR
    | NUM of (
# 19 "lib/parser.mly"
       (int)
# 33 "lib/parser.ml"
  )
    | NOT
    | NE
    | MOD
    | MINUS
    | LT
    | LPAREN
    | LE
    | LBRACKET
    | LBRACE
    | IF
    | ID of (
# 17 "lib/parser.mly"
       (string)
# 48 "lib/parser.ml"
  )
    | GT
    | GE
    | EQ
    | EOF
    | ELSE
    | DIV
    | COMMA
    | BOOL of (
# 20 "lib/parser.mly"
       (bool)
# 60 "lib/parser.ml"
  )
    | ASSIGN
    | AND
  
end

include MenhirBasics

# 6 "lib/parser.mly"
  
    open Ast.Expr
    open Ast.Stm
    open Ast.Prog

    let rec left_assoc e es =
        match es with
        | [] -> e
        | (b, e') :: es -> left_assoc (Binop(b, e, e')) es

# 80 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_terminated_exp) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: terminated_exp. *)

  | MenhirState003 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 003.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState004 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 004.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState005 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 005.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState007 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 007.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState009 : (('s, 'r) _menhir_cell1_unop, 'r) _menhir_state
    (** State 009.
        Stack shape : unop.
        Start symbol: <undetermined>. *)

  | MenhirState010 : (('s, 'r) _menhir_cell1_TIMES, 'r) _menhir_state
    (** State 010.
        Stack shape : TIMES.
        Start symbol: <undetermined>. *)

  | MenhirState013 : (('s, 'r) _menhir_cell1_MOD, 'r) _menhir_state
    (** State 013.
        Stack shape : MOD.
        Start symbol: <undetermined>. *)

  | MenhirState015 : (('s, 'r) _menhir_cell1_DIV, 'r) _menhir_state
    (** State 015.
        Stack shape : DIV.
        Start symbol: <undetermined>. *)

  | MenhirState017 : (('s, 'r) _menhir_cell1_op_sep_list_rest_mdops_unop_, 'r) _menhir_state
    (** State 017.
        Stack shape : op_sep_list_rest(mdops,unop).
        Start symbol: <undetermined>. *)

  | MenhirState022 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 022.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState026 : (('s, 'r) _menhir_cell1_mdexp, 'r) _menhir_state
    (** State 026.
        Stack shape : mdexp.
        Start symbol: <undetermined>. *)

  | MenhirState027 : (('s, 'r) _menhir_cell1_PLUS, 'r) _menhir_state
    (** State 027.
        Stack shape : PLUS.
        Start symbol: <undetermined>. *)

  | MenhirState029 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 029.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState031 : (('s, 'r) _menhir_cell1_op_sep_list_rest_pmops_mdexp_, 'r) _menhir_state
    (** State 031.
        Stack shape : op_sep_list_rest(pmops,mdexp).
        Start symbol: <undetermined>. *)

  | MenhirState034 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 034.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState036 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 036.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState038 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 038.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState040 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 040.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState042 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 042.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState050 : (('s, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 050.
        Stack shape : exp.
        Start symbol: <undetermined>. *)

  | MenhirState052 : (('s, 'r) _menhir_cell1_compexp, 'r) _menhir_state
    (** State 052.
        Stack shape : compexp.
        Start symbol: <undetermined>. *)

  | MenhirState053 : (('s, 'r) _menhir_cell1_AND, 'r) _menhir_state
    (** State 053.
        Stack shape : AND.
        Start symbol: <undetermined>. *)

  | MenhirState055 : (('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_, 'r) _menhir_state
    (** State 055.
        Stack shape : op_sep_list_rest(__anonymous_1,compexp).
        Start symbol: <undetermined>. *)

  | MenhirState058 : (('s, 'r) _menhir_cell1_andexp, 'r) _menhir_state
    (** State 058.
        Stack shape : andexp.
        Start symbol: <undetermined>. *)

  | MenhirState059 : (('s, 'r) _menhir_cell1_OR, 'r) _menhir_state
    (** State 059.
        Stack shape : OR.
        Start symbol: <undetermined>. *)

  | MenhirState061 : (('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_, 'r) _menhir_state
    (** State 061.
        Stack shape : op_sep_list_rest(__anonymous_0,andexp).
        Start symbol: <undetermined>. *)

  | MenhirState064 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 064.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState074 : ('s, _menhir_box_terminated_pgm) _menhir_state
    (** State 074.
        Stack shape : .
        Start symbol: terminated_pgm. *)

  | MenhirState082 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_typename _menhir_cell0_ID, _menhir_box_terminated_pgm) _menhir_state
    (** State 082.
        Stack shape : typename ID.
        Start symbol: terminated_pgm. *)

  | MenhirState088 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_typename_novoid _menhir_cell0_ID _menhir_cell0_option___anonymous_2_, _menhir_box_terminated_pgm) _menhir_state
    (** State 088.
        Stack shape : typename_novoid ID option(__anonymous_2).
        Start symbol: terminated_pgm. *)

  | MenhirState093 : ((('s, _menhir_box_terminated_pgm) _menhir_cell1_typename _menhir_cell0_ID, _menhir_box_terminated_pgm) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_3__, _menhir_box_terminated_pgm) _menhir_state
    (** State 093.
        Stack shape : typename ID loption(separated_nonempty_list(COMMA,__anonymous_3)).
        Start symbol: terminated_pgm. *)

  | MenhirState095 : (('s, 'r) _menhir_cell1_WHILE, 'r) _menhir_state
    (** State 095.
        Stack shape : WHILE.
        Start symbol: <undetermined>. *)

  | MenhirState097 : ((('s, 'r) _menhir_cell1_WHILE, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 097.
        Stack shape : WHILE exp.
        Start symbol: <undetermined>. *)

  | MenhirState098 : (('s, 'r) _menhir_cell1_RETURN, 'r) _menhir_state
    (** State 098.
        Stack shape : RETURN.
        Start symbol: <undetermined>. *)

  | MenhirState101 : (('s, 'r) _menhir_cell1_LBRACE, 'r) _menhir_state
    (** State 101.
        Stack shape : LBRACE.
        Start symbol: <undetermined>. *)

  | MenhirState103 : (('s, 'r) _menhir_cell1_IF, 'r) _menhir_state
    (** State 103.
        Stack shape : IF.
        Start symbol: <undetermined>. *)

  | MenhirState105 : ((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 105.
        Stack shape : IF exp.
        Start symbol: <undetermined>. *)

  | MenhirState107 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 107.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState110 : ((('s, 'r) _menhir_cell1_ID, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 110.
        Stack shape : ID exp.
        Start symbol: <undetermined>. *)

  | MenhirState112 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 112.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState114 : (('s, 'r) _menhir_cell1_typename_novoid, 'r) _menhir_state
    (** State 114.
        Stack shape : typename_novoid.
        Start symbol: <undetermined>. *)

  | MenhirState116 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 116.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState119 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 119.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState126 : (('s, 'r) _menhir_cell1_assign, 'r) _menhir_state
    (** State 126.
        Stack shape : assign.
        Start symbol: <undetermined>. *)

  | MenhirState130 : (('s, 'r) _menhir_cell1_arraydec, 'r) _menhir_state
    (** State 130.
        Stack shape : arraydec.
        Start symbol: <undetermined>. *)

  | MenhirState140 : (((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_body_stm, 'r) _menhir_state
    (** State 140.
        Stack shape : IF exp body_stm.
        Start symbol: <undetermined>. *)

  | MenhirState145 : (('s, 'r) _menhir_cell1_stm, 'r) _menhir_state
    (** State 145.
        Stack shape : stm.
        Start symbol: <undetermined>. *)

  | MenhirState152 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_stm, _menhir_box_terminated_pgm) _menhir_state
    (** State 152.
        Stack shape : stm.
        Start symbol: terminated_pgm. *)

  | MenhirState160 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_fundef, _menhir_box_terminated_pgm) _menhir_state
    (** State 160.
        Stack shape : fundef.
        Start symbol: terminated_pgm. *)

  | MenhirState162 : ('s, _menhir_box_terminated_stm) _menhir_state
    (** State 162.
        Stack shape : .
        Start symbol: terminated_stm. *)


and ('s, 'r) _menhir_cell1_andexp = 
  | MenhirCell1_andexp of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_arraydec = 
  | MenhirCell1_arraydec of 's * ('s, 'r) _menhir_state * (string * Ast.Expr.t)

and ('s, 'r) _menhir_cell1_assign = 
  | MenhirCell1_assign of 's * ('s, 'r) _menhir_state * (string * Ast.Expr.t option)

and ('s, 'r) _menhir_cell1_body_stm = 
  | MenhirCell1_body_stm of 's * ('s, 'r) _menhir_state * (Ast.Stm.t)

and ('s, 'r) _menhir_cell1_compexp = 
  | MenhirCell1_compexp of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_exp = 
  | MenhirCell1_exp of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_fundef = 
  | MenhirCell1_fundef of 's * ('s, 'r) _menhir_state * (Ast.Prog.fundef)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_3__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_3__ of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_mdexp = 
  | MenhirCell1_mdexp of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_ = 
  | MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ of 's * ('s, 'r) _menhir_state * (Ast.Expr.binop * Ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_ = 
  | MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ of 's * ('s, 'r) _menhir_state * (Ast.Expr.binop * Ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest_mdops_unop_ = 
  | MenhirCell1_op_sep_list_rest_mdops_unop_ of 's * ('s, 'r) _menhir_state * (Ast.Expr.binop * Ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest_pmops_mdexp_ = 
  | MenhirCell1_op_sep_list_rest_pmops_mdexp_ of 's * ('s, 'r) _menhir_state * (Ast.Expr.binop * Ast.Expr.t)

and 's _menhir_cell0_option___anonymous_2_ = 
  | MenhirCell0_option___anonymous_2_ of 's * (unit option)

and ('s, 'r) _menhir_cell1_pmexp = 
  | MenhirCell1_pmexp of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_stm = 
  | MenhirCell1_stm of 's * ('s, 'r) _menhir_state * (Ast.Stm.t)

and ('s, 'r) _menhir_cell1_typename = 
  | MenhirCell1_typename of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typename_novoid = 
  | MenhirCell1_typename_novoid of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_unop = 
  | MenhirCell1_unop of 's * ('s, 'r) _menhir_state * (Ast.Expr.t)

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DIV = 
  | MenhirCell1_DIV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 17 "lib/parser.mly"
       (string)
# 406 "lib/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 17 "lib/parser.mly"
       (string)
# 413 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MOD = 
  | MenhirCell1_MOD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_terminated_stm = 
  | MenhirBox_terminated_stm of (Ast.Stm.t) [@@unboxed]

and _menhir_box_terminated_pgm = 
  | MenhirBox_terminated_pgm of (Ast.Prog.t) [@@unboxed]

and _menhir_box_terminated_exp = 
  | MenhirBox_terminated_exp of (Ast.Expr.t) [@@unboxed]

let _menhir_action_03 =
  fun x ->
    (
# 131 "lib/parser.mly"
        ( Var x )
# 463 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_04 =
  fun i ->
    (
# 133 "lib/parser.mly"
        ( Num i )
# 471 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_05 =
  fun b ->
    (
# 135 "lib/parser.mly"
        ( Bool b )
# 479 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_06 =
  fun s ->
    (
# 137 "lib/parser.mly"
        ( Str s)
# 487 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_07 =
  fun e x ->
    (
# 139 "lib/parser.mly"
        ( Index(x, e) )
# 495 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_08 =
  fun f xs ->
    let args = 
# 241 "<standard.mly>"
    ( xs )
# 503 "lib/parser.ml"
     in
    (
# 141 "lib/parser.mly"
        ( Call(f, args) )
# 508 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_09 =
  fun e ->
    (
# 143 "lib/parser.mly"
        ( e )
# 516 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_10 =
  fun p ->
    (
# 88 "lib/parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 524 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_11 =
  fun e x ->
    (
# 171 "lib/parser.mly"
        ( (x, e) )
# 532 "lib/parser.ml"
     : (string * Ast.Expr.t))

let _menhir_action_12 =
  fun e x ->
    (
# 167 "lib/parser.mly"
        ( (x, e) )
# 540 "lib/parser.ml"
     : (string * Ast.Expr.t option))

let _menhir_action_13 =
  fun ss ->
    (
# 183 "lib/parser.mly"
        ( Block ss )
# 548 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_14 =
  fun s ->
    (
# 195 "lib/parser.mly"
        (s)
# 556 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_15 =
  fun s ->
    (
# 197 "lib/parser.mly"
        (s)
# 564 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_16 =
  fun e0 e1 ->
    let op = 
# 91 "lib/parser.mly"
            ( Eq )
# 572 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 577 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_17 =
  fun e0 e1 ->
    let op = 
# 92 "lib/parser.mly"
            ( Ne )
# 585 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 590 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_18 =
  fun e0 e1 ->
    let op = 
# 93 "lib/parser.mly"
            ( Lt )
# 598 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 603 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_19 =
  fun e0 e1 ->
    let op = 
# 94 "lib/parser.mly"
            ( Le )
# 611 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 616 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_20 =
  fun e0 e1 ->
    let op = 
# 95 "lib/parser.mly"
            ( Gt )
# 624 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 629 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_21 =
  fun e0 e1 ->
    let op = 
# 96 "lib/parser.mly"
            ( Ge )
# 637 "lib/parser.ml"
     in
    (
# 100 "lib/parser.mly"
        ( Binop(op, e0, e1) )
# 642 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_22 =
  fun e ->
    (
# 102 "lib/parser.mly"
        ( e )
# 650 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_23 =
  fun e s0 s1 ->
    (
# 187 "lib/parser.mly"
        ( IfElse(e, s0, s1) )
# 658 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_24 =
  fun e s0 ->
    (
# 189 "lib/parser.mly"
        ( IfElse(e, s0, Block []) )
# 666 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_25 =
  fun e s ->
    (
# 191 "lib/parser.mly"
        ( While(e, s) )
# 674 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_26 =
  fun e ->
    (
# 80 "lib/parser.mly"
        ( e )
# 682 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_27 =
  fun f ss xs ->
    let ps = 
# 241 "<standard.mly>"
    ( xs )
# 690 "lib/parser.ml"
     in
    (
# 211 "lib/parser.mly"
        ( FunDef (f, ps, ss) )
# 695 "lib/parser.ml"
     : (Ast.Prog.fundef))

let _menhir_action_28 =
  fun e ->
    (
# 175 "lib/parser.mly"
        ( e )
# 703 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_29 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 711 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_30 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 719 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_31 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 727 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_32 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 735 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_33 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 743 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_34 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 751 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_35 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 759 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_36 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 767 "lib/parser.ml"
     : ((Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_37 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 775 "lib/parser.ml"
     : (Ast.Stm.t list))

let _menhir_action_38 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 783 "lib/parser.ml"
     : (Ast.Stm.t list))

let _menhir_action_39 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 791 "lib/parser.ml"
     : (string list))

let _menhir_action_40 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 799 "lib/parser.ml"
     : (string list))

let _menhir_action_41 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 807 "lib/parser.ml"
     : (Ast.Expr.t list))

let _menhir_action_42 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 815 "lib/parser.ml"
     : (Ast.Expr.t list))

let _menhir_action_43 =
  fun p ->
    (
# 119 "lib/parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 823 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_44 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 831 "lib/parser.ml"
     : (Ast.Prog.fundef list))

let _menhir_action_45 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 839 "lib/parser.ml"
     : (Ast.Prog.fundef list))

let _menhir_action_46 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 847 "lib/parser.ml"
     : (Ast.Stm.t list))

let _menhir_action_47 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 855 "lib/parser.ml"
     : (Ast.Stm.t list))

let _menhir_action_48 =
  fun e ->
    let o = 
# 83 "lib/parser.mly"
                                     ( Or )
# 863 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 868 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_49 =
  fun e ->
    let o = 
# 87 "lib/parser.mly"
                                      ( And )
# 876 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 881 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_50 =
  fun e ->
    let o = 
# 113 "lib/parser.mly"
            ( Times )
# 889 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 894 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_51 =
  fun e ->
    let o = 
# 114 "lib/parser.mly"
            ( Div )
# 902 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 907 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_52 =
  fun e ->
    let o = 
# 115 "lib/parser.mly"
            ( Mod )
# 915 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 920 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_53 =
  fun e ->
    let o = 
# 105 "lib/parser.mly"
            ( Plus )
# 928 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 933 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_54 =
  fun e ->
    let o = 
# 106 "lib/parser.mly"
            ( Minus )
# 941 "lib/parser.ml"
     in
    (
# 76 "lib/parser.mly"
        ( (o, e) )
# 946 "lib/parser.ml"
     : (Ast.Expr.binop * Ast.Expr.t))

let _menhir_action_55 =
  fun e opsexps ->
    (
# 72 "lib/parser.mly"
        ( (e, opsexps) )
# 954 "lib/parser.ml"
     : (Ast.Expr.t * (Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_56 =
  fun e opsexps ->
    (
# 72 "lib/parser.mly"
        ( (e, opsexps) )
# 962 "lib/parser.ml"
     : (Ast.Expr.t * (Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_57 =
  fun e opsexps ->
    (
# 72 "lib/parser.mly"
        ( (e, opsexps) )
# 970 "lib/parser.ml"
     : (Ast.Expr.t * (Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_58 =
  fun e opsexps ->
    (
# 72 "lib/parser.mly"
        ( (e, opsexps) )
# 978 "lib/parser.ml"
     : (Ast.Expr.t * (Ast.Expr.binop * Ast.Expr.t) list))

let _menhir_action_59 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 986 "lib/parser.ml"
     : (unit option))

let _menhir_action_60 =
  fun () ->
    let x = 
# 209 "lib/parser.mly"
                                                                                       (())
# 994 "lib/parser.ml"
     in
    (
# 114 "<standard.mly>"
    ( Some x )
# 999 "lib/parser.ml"
     : (unit option))

let _menhir_action_61 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1007 "lib/parser.ml"
     : (Ast.Expr.t option))

let _menhir_action_62 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 1015 "lib/parser.ml"
     : (Ast.Expr.t option))

let _menhir_action_63 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1023 "lib/parser.ml"
     : (Ast.Expr.t option))

let _menhir_action_64 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 1031 "lib/parser.ml"
     : (Ast.Expr.t option))

let _menhir_action_65 =
  fun p ->
    (
# 84 "lib/parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 1039 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_66 =
  fun fundefs ->
    (
# 214 "lib/parser.mly"
                                             ( Pgm fundefs )
# 1047 "lib/parser.ml"
     : (Ast.Prog.t))

let _menhir_action_67 =
  fun p ->
    (
# 110 "lib/parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 1055 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_68 =
  fun assts ->
    (
# 153 "lib/parser.mly"
        ( VarDec assts )
# 1063 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_69 =
  fun ids ->
    (
# 155 "lib/parser.mly"
        ( ArrayDec ids )
# 1071 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_70 =
  fun e x ->
    (
# 157 "lib/parser.mly"
        ( Assign(x, e) )
# 1079 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_71 =
  fun e0 e1 x ->
    (
# 159 "lib/parser.mly"
        ( IndexAssign(x, e0, e1) )
# 1087 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_72 =
  fun e ->
    (
# 161 "lib/parser.mly"
        ( Expr e )
# 1095 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_73 =
  fun e ->
    (
# 163 "lib/parser.mly"
        ( Return e )
# 1103 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_74 =
  fun x ->
    let s = 
# 196 "<standard.mly>"
    ( x )
# 1111 "lib/parser.ml"
     in
    (
# 179 "lib/parser.mly"
        ( s )
# 1116 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_75 =
  fun x ->
    let x = 
# 209 "lib/parser.mly"
                                                                                              (x)
# 1124 "lib/parser.ml"
     in
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1129 "lib/parser.ml"
     : (string list))

let _menhir_action_76 =
  fun x xs ->
    let x = 
# 209 "lib/parser.mly"
                                                                                              (x)
# 1137 "lib/parser.ml"
     in
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1142 "lib/parser.ml"
     : (string list))

let _menhir_action_77 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1150 "lib/parser.ml"
     : ((string * Ast.Expr.t) list))

let _menhir_action_78 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1158 "lib/parser.ml"
     : ((string * Ast.Expr.t) list))

let _menhir_action_79 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1166 "lib/parser.ml"
     : ((string * Ast.Expr.t option) list))

let _menhir_action_80 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1174 "lib/parser.ml"
     : ((string * Ast.Expr.t option) list))

let _menhir_action_81 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1182 "lib/parser.ml"
     : (Ast.Expr.t list))

let _menhir_action_82 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1190 "lib/parser.ml"
     : (Ast.Expr.t list))

let _menhir_action_83 =
  fun s ->
    (
# 201 "lib/parser.mly"
        ( s )
# 1198 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_84 =
  fun s ->
    (
# 203 "lib/parser.mly"
        ( s )
# 1206 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_85 =
  fun s ->
    (
# 205 "lib/parser.mly"
        ( s )
# 1214 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_86 =
  fun e ->
    (
# 217 "lib/parser.mly"
                                    ( e )
# 1222 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_87 =
  fun p ->
    (
# 223 "lib/parser.mly"
                                    ( p )
# 1230 "lib/parser.ml"
     : (Ast.Prog.t))

let _menhir_action_88 =
  fun s ->
    (
# 220 "lib/parser.mly"
                                    ( s )
# 1238 "lib/parser.ml"
     : (Ast.Stm.t))

let _menhir_action_89 =
  fun () ->
    (
# 149 "lib/parser.mly"
                               ()
# 1246 "lib/parser.ml"
     : (unit))

let _menhir_action_90 =
  fun () ->
    (
# 149 "lib/parser.mly"
                               ()
# 1254 "lib/parser.ml"
     : (unit))

let _menhir_action_91 =
  fun () ->
    (
# 146 "lib/parser.mly"
                                ()
# 1262 "lib/parser.ml"
     : (unit))

let _menhir_action_92 =
  fun () ->
    (
# 146 "lib/parser.mly"
                                ()
# 1270 "lib/parser.ml"
     : (unit))

let _menhir_action_93 =
  fun () ->
    (
# 146 "lib/parser.mly"
                                ()
# 1278 "lib/parser.ml"
     : (unit))

let _menhir_action_94 =
  fun e ->
    (
# 123 "lib/parser.mly"
        ( Unop(Neg, e) )
# 1286 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_95 =
  fun e ->
    (
# 125 "lib/parser.mly"
        ( Unop(Not, e) )
# 1294 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_action_96 =
  fun e ->
    (
# 127 "lib/parser.mly"
        ( e )
# 1302 "lib/parser.ml"
     : (Ast.Expr.t))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ASSIGN ->
        "ASSIGN"
    | BOOL _ ->
        "BOOL"
    | COMMA ->
        "COMMA"
    | DIV ->
        "DIV"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | GE ->
        "GE"
    | GT ->
        "GT"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | LBRACE ->
        "LBRACE"
    | LBRACKET ->
        "LBRACKET"
    | LE ->
        "LE"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | NE ->
        "NE"
    | NOT ->
        "NOT"
    | NUM _ ->
        "NUM"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | RBRACE ->
        "RBRACE"
    | RBRACKET ->
        "RBRACKET"
    | RETURN ->
        "RETURN"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | STRING _ ->
        "STRING"
    | TIMES ->
        "TIMES"
    | T_BOOL ->
        "T_BOOL"
    | T_INT ->
        "T_INT"
    | T_STRING ->
        "T_STRING"
    | T_VOID ->
        "T_VOID"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_164 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_stm =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let s = _v in
          let _v = _menhir_action_88 s in
          MenhirBox_terminated_stm _v
      | _ ->
          _eRR ()
  
  let _menhir_run_159 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _v ->
      let fundefs = _v in
      let _v = _menhir_action_66 fundefs in
      let p = _v in
      let _v = _menhir_action_87 p in
      MenhirBox_terminated_pgm _v
  
  let rec _menhir_goto_nonempty_list_fundef_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState160 ->
          _menhir_run_161 _menhir_stack _v
      | MenhirState074 ->
          _menhir_run_159 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_161 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_fundef -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _v ->
      let MenhirCell1_fundef (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_45 x xs in
      _menhir_goto_nonempty_list_fundef_ _menhir_stack _v _menhir_s
  
  let _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_exp =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let e = _v in
          let _v = _menhir_action_86 e in
          MenhirBox_terminated_exp _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_001 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_06 s in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_aexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState003 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState005 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_070 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_95 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_unop : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState015 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState010 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_016 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DIV -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DIV (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_51 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_op_sep_list_rest_mdops_unop_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_op_sep_list_rest_mdops_unop_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | MOD ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | DIV ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | AND | COMMA | EOF | EQ | GE | GT | LE | LT | MINUS | NE | OR | PLUS | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_33 () in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState010 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_04 i in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState003 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState004 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState005 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState064 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | COMMA | DIV | EOF | EQ | GE | GT | LE | LT | MINUS | MOD | NE | OR | PLUS | RBRACKET | RPAREN | SEMI | TIMES ->
          let x = _v in
          let _v = _menhir_action_03 x in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState007 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RPAREN ->
          let _v = _menhir_action_41 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let b = _v in
      let _v = _menhir_action_05 b in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_08 f xs in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MOD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState013 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState015 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest_mdops_unop_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest_mdops_unop_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_34 x xs in
      _menhir_goto_list_op_sep_list_rest_mdops_unop__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest_mdops_unop__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState009 ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState017 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_019 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_unop -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_unop (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_57 e opsexps in
      let p = _v in
      let _v = _menhir_action_43 p in
      _menhir_goto_mdexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_mdexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState029 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState027 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_030 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_54 e in
      _menhir_goto_op_sep_list_rest_pmops_mdexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_op_sep_list_rest_pmops_mdexp_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_op_sep_list_rest_pmops_mdexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | MINUS ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | AND | COMMA | EOF | EQ | GE | GT | LE | LT | NE | OR | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_35 () in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState027 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState029 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest_pmops_mdexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest_pmops_mdexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_36 x xs in
      _menhir_goto_list_op_sep_list_rest_pmops_mdexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest_pmops_mdexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState026 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState031 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_033 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_mdexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_mdexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_58 e opsexps in
      let p = _v in
      let _v = _menhir_action_67 p in
      _menhir_goto_pmexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_pmexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState042 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState038 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState034 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState022 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_043 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_16 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_compexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_AND -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_AND (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_49 e in
      let _menhir_stack = MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | COMMA | EOF | OR | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_31 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState053 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_32 x xs in
      _menhir_goto_list_op_sep_list_rest___anonymous_1_compexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest___anonymous_1_compexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState052 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_compexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_compexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_56 e opsexps in
      let p = _v in
      let _v = _menhir_action_10 p in
      _menhir_goto_andexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_andexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState059 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_060 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OR -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_OR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_48 e in
      let _menhir_stack = MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | COMMA | EOF | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_29 () in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_059 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState059 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_30 x xs in
      _menhir_goto_list_op_sep_list_rest___anonymous_0_andexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest___anonymous_0_andexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState058 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_063 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_andexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_andexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_55 e opsexps in
      let p = _v in
      let _v = _menhir_action_65 p in
      let e = _v in
      let _v = _menhir_action_26 e in
      _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_exp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState162 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState112 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_072 _menhir_stack _v _tok
      | MenhirState004 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_137 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_72 e in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_prim_stm : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_74 x in
          _menhir_goto_prim_stm_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_prim_stm_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState097 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_149 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_WHILE, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_14 s in
      _menhir_goto_body_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_body_stm : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState097 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_150 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_WHILE, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_exp (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_25 e s in
      _menhir_goto_compound_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_compound_stm : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_84 s in
      _menhir_goto_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stm : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState162 ->
          _menhir_run_164 _menhir_stack _v _tok
      | MenhirState152 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_152 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | T_STRING ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | T_INT ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | T_BOOL ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | STRING _v_0 ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState152
      | RETURN ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | NUM _v_1 ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState152
      | NOT ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | MINUS ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | LPAREN ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | LBRACE ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | IF ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState152
      | BOOL _v_3 ->
          let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState152
      | RBRACE ->
          let x = _v in
          let _v = _menhir_action_46 x in
          _menhir_goto_nonempty_list_stm_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState095 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_93 () in
      _menhir_goto_typename_novoid _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typename_novoid : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState162 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState088 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, MenhirState114, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACKET ->
              _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer
          | ASSIGN ->
              _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
          | COMMA | SEMI ->
              _menhir_reduce_63 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState116 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState119 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_reduce_63 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_63 () in
      _menhir_goto_option_init_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_option_init_ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_12 e x in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_assign (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState126 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ASSIGN ->
                  _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
              | COMMA | SEMI ->
                  _menhir_reduce_63 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | SEMI ->
          let x = _v in
          let _v = _menhir_action_79 x in
          _menhir_goto_separated_nonempty_list_COMMA_assign_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_assign_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState114 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_128 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_assign -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_assign (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_80 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_assign_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_123 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_typename_novoid -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let assts = _v in
      let _v = _menhir_action_68 assts in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACKET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RBRACKET ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_60 () in
                  _menhir_goto_option___anonymous_2_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | COMMA | RPAREN ->
              let _v = _menhir_action_59 () in
              _menhir_goto_option___anonymous_2_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_option___anonymous_2_ : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_typename_novoid _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell0_option___anonymous_2_ (_menhir_stack, _v) in
          let _menhir_s = MenhirState088 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | T_STRING ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_INT ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_BOOL ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _v = _menhir_action_75 x in
          _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_91 () in
      _menhir_goto_typename_novoid _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_078 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_92 () in
      _menhir_goto_typename_novoid _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState082 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_typename _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_40 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA___anonymous_3__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA___anonymous_3__ : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_typename _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_3__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _menhir_s = MenhirState093 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_STRING ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_INT ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_BOOL ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState098 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | SEMI ->
          let _v = _menhir_action_61 () in
          _menhir_goto_option_exp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_option_exp_ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_73 e in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_101 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | T_STRING ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | T_INT ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | T_BOOL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101
      | RETURN ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | LBRACE ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | IF ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | ID _v ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101
      | RBRACE ->
          let _v = _menhir_action_37 () in
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState103 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState107 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState112 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | DIV | EQ | GE | GT | LE | LT | MINUS | MOD | NE | OR | PLUS | SEMI | TIMES ->
          let x = _v in
          let _v = _menhir_action_03 x in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_147 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LBRACE -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
      let ss = _v in
      let _v = _menhir_action_13 ss in
      _menhir_goto_block_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block_stm : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState097 ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_151 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_WHILE, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_15 s in
      _menhir_goto_body_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_144 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let s = _v in
          let _v = _menhir_action_15 s in
          _menhir_goto_body_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | BOOL _ | EOF | ID _ | IF | LBRACE | LPAREN | MINUS | NOT | NUM _ | RBRACE | RETURN | STRING _ | T_BOOL | T_INT | T_STRING | WHILE ->
          let s = _v in
          let _v = _menhir_action_85 s in
          _menhir_goto_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_143 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_85 s in
      _menhir_goto_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_typename_novoid _menhir_cell0_ID _menhir_cell0_option___anonymous_2_ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_option___anonymous_2_ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
      let MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_76 x xs in
      _menhir_goto_separated_nonempty_list_COMMA___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_89 () in
      _menhir_goto_typename _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typename : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typename (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState082 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | T_STRING ->
                  _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | T_INT ->
                  _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | T_BOOL ->
                  _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | RPAREN ->
                  let _v = _menhir_action_39 () in
                  _menhir_goto_loption_separated_nonempty_list_COMMA___anonymous_3__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_stm_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState093 ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState152 ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_154 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_typename _menhir_cell0_ID, _menhir_box_terminated_pgm) _menhir_cell1_loption_separated_nonempty_list_COMMA___anonymous_3__ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_loption_separated_nonempty_list_COMMA___anonymous_3__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, f) = _menhir_stack in
      let MenhirCell1_typename (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let ss = _v in
      let _v = _menhir_action_27 f ss xs in
      match (_tok : MenhirBasics.token) with
      | T_VOID ->
          let _menhir_stack = MenhirCell1_fundef (_menhir_stack, _menhir_s, _v) in
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | T_STRING ->
          let _menhir_stack = MenhirCell1_fundef (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | T_INT ->
          let _menhir_stack = MenhirCell1_fundef (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | T_BOOL ->
          let _menhir_stack = MenhirCell1_fundef (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
      | EOF ->
          let x = _v in
          let _v = _menhir_action_44 x in
          _menhir_goto_nonempty_list_fundef_ _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_90 () in
      _menhir_goto_typename _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_153 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_stm -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_stm (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_47 x xs in
      _menhir_goto_nonempty_list_stm_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_145 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stm (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | T_STRING ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | T_INT ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | T_BOOL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | STRING _v_0 ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState145
      | RETURN ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | NUM _v_1 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState145
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | LBRACE ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | IF ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
      | ID _v_2 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState145
      | BOOL _v_3 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState145
      | RBRACE ->
          let _v_4 = _menhir_action_37 () in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4
      | _ ->
          _eRR ()
  
  and _menhir_run_146 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_stm -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_stm (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_list_stm_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_stm_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState101 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState145 ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_141 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_body_stm -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_body_stm (_menhir_stack, _, s0) = _menhir_stack in
      let MenhirCell1_exp (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let s1 = _v in
      let _v = _menhir_action_23 e s0 s1 in
      _menhir_goto_compound_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_133 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_exp (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let s0 = _v in
      let _v = _menhir_action_24 e s0 in
      _menhir_goto_compound_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_139 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_body_stm (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState140 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_STRING ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_INT ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_BOOL ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_142 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_83 s in
      _menhir_goto_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_134 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let s = _v in
          let _v = _menhir_action_14 s in
          _menhir_goto_body_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | BOOL _ | EOF | ID _ | IF | LBRACE | LPAREN | MINUS | NOT | NUM _ | RBRACE | RETURN | STRING _ | T_BOOL | T_INT | T_STRING | WHILE ->
          let s = _v in
          let _v = _menhir_action_83 s in
          _menhir_goto_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let e = _v in
      let _v = _menhir_action_28 e in
      let x = _v in
      let _v = _menhir_action_64 x in
      _menhir_goto_option_init_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_117 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_11 e x in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_arraydec (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState130 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBRACKET ->
                      _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | SEMI ->
              let x = _v in
              let _v = _menhir_action_77 x in
              _menhir_goto_separated_nonempty_list_COMMA_arraydec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_arraydec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState130 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState114 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_132 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_arraydec -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_arraydec (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_78 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_arraydec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_124 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_typename_novoid -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_typename_novoid (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let ids = _v in
      let _v = _menhir_action_69 ids in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_113 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_70 e x in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_111 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ID, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_exp (_menhir_stack, _, e0) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_71 e0 e1 x in
      _menhir_goto_prim_stm _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_108 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState110 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | STRING _v ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NUM _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BOOL _v ->
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | AND | DIV | EQ | GE | GT | LE | LT | MINUS | MOD | NE | OR | PLUS | SEMI | TIMES ->
              let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
              let e = _v in
              let _v = _menhir_action_07 e x in
              _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _menhir_s = MenhirState105 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_STRING ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_INT ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_BOOL ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_62 x in
      _menhir_goto_option_exp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _menhir_s = MenhirState097 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | T_STRING ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_INT ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | T_BOOL ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_09 e in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_07 e x in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState050 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_81 x in
          _menhir_goto_separated_nonempty_list_COMMA_exp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_exp_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState007 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_051 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_exp (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_82 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_exp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_020 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_42 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_058 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_andexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | COMMA | EOF | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_29 () in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_compexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | COMMA | EOF | OR | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_31 () in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_21 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_20 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_19 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_18 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_023 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_17 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | NE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState022 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LT ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState034 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState036 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GT ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState038 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState040 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | EQ ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState042 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | COMMA | EOF | OR | RBRACKET | RPAREN | SEMI ->
          let e = _v in
          let _v = _menhir_action_22 e in
          _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_028 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_PLUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_53 e in
      _menhir_goto_op_sep_list_rest_pmops_mdexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_mdexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | MINUS ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | AND | COMMA | EOF | EQ | GE | GT | LE | LT | NE | OR | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_35 () in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_014 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MOD -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MOD (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_52 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TIMES (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_50 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_unop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | MOD ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | DIV ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | AND | COMMA | EOF | EQ | GE | GT | LE | LT | MINUS | NE | OR | PLUS | RBRACKET | RPAREN | SEMI ->
          let _v_0 = _menhir_action_33 () in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_94 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_96 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_exp =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState074 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | T_VOID ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_STRING ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_INT ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_BOOL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_162 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_stm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState162 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_STRING ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_INT ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | T_BOOL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let terminated_stm =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_terminated_stm v = _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let terminated_pgm =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_terminated_pgm v = _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let terminated_exp =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_terminated_exp v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
