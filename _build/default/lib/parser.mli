
(* The type of tokens. *)

type token = 
  | WHILE
  | T_VOID
  | T_STRING
  | T_INT
  | T_BOOL
  | TIMES
  | STRING of (string)
  | SEMI
  | RPAREN
  | RETURN
  | RBRACKET
  | RBRACE
  | PLUS
  | OR
  | NUM of (int)
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
  | ID of (string)
  | GT
  | GE
  | EQ
  | EOF
  | ELSE
  | DIV
  | COMMA
  | BOOL of (bool)
  | ASSIGN
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val terminated_stm: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Stm.t)

val terminated_pgm: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Prog.t)

val terminated_exp: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Expr.t)
