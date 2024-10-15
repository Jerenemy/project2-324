(* Parser for C-.
 *
 * N. Danner
 *)

%{
    open Ast.Expr
    open Ast.Stm
    open Ast.Prog

    let rec left_assoc e es =
        match es with
        | [] -> e
        | (b, e') :: es -> left_assoc (Binop(b, e, e')) es
%}

%token <string> ID

%token <int> NUM
%token <bool> BOOL
%token <string> STRING

%token PLUS
%token MINUS
%token TIMES
%token DIV
%token MOD
%token NOT
%token AND
%token OR
%token EQ
%token NE
%token LT
%token LE
%token GT
%token GE

%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token LBRACKET
%token RBRACKET
%token SEMI
%token COMMA

%token T_INT
%token T_BOOL
%token T_STRING
%token T_VOID

%token ASSIGN
%token IF
%token ELSE
%token WHILE
%token RETURN

%token EOF

%start terminated_exp
%start terminated_stm
%start terminated_pgm

%type <Ast.Expr.t> terminated_exp
%type <Ast.Stm.t> terminated_stm
%type <Ast.Prog.t> terminated_pgm

%%

operator_separated_list(O, next):
    | e = next ; opsexps = list(op_sep_list_rest(O, next))
        { (e, opsexps) }

op_sep_list_rest(O, next):
    | o = O ; e = next
        { (o, e) }

exp:
    | e = orexp
        { e }

orexp:
    | p = operator_separated_list(OR { Or } , andexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

andexp:
    | p = operator_separated_list(AND { And } , compexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

%inline compop:
    | EQ    { Eq }
    | NE    { Ne }
    | LT    { Lt }
    | LE    { Le }
    | GT    { Gt }
    | GE    { Ge }

compexp:
    | e0 = pmexp ; op = compop ; e1 = pmexp
        { Binop(op, e0, e1) }
    | e = pmexp
        { e }

%inline pmops:
    | PLUS  { Plus }
    | MINUS { Minus }

pmexp:
    | p = operator_separated_list(pmops, mdexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

%inline mdops:
    | TIMES { Times }
    | DIV   { Div }
    | MOD   { Mod }

mdexp:
    | p = operator_separated_list(mdops, unop)
        { let (e, opsexps) = p in left_assoc e opsexps }

unop:
    | MINUS ; e = aexp
        { Unop(Neg, e) }
    | NOT ; e = aexp
        { Unop(Not, e) }
    | e = aexp
        { e }

aexp:
    | x = ID
        { Var x }
    | i = NUM           
        { Num i }
    | b = BOOL                      
        { Bool b }
    | s = STRING
        { Str s}
    | x = ID ; LBRACKET ; e = exp ; RBRACKET
        { Index(x, e) }
    | f = ID ; LPAREN ; args = separated_list(COMMA, exp) ; RPAREN    
        { Call(f, args) }
    | LPAREN; e = exp ; RPAREN      
        { e }

typename_novoid:
    | T_INT | T_BOOL | T_STRING {}

typename:
    | typename_novoid | T_VOID {}

prim_stm:
    | typename_novoid ; assts = separated_nonempty_list(COMMA, assign)
        { VarDec assts }
    | typename_novoid ; ids = separated_nonempty_list(COMMA, arraydec)
        { ArrayDec ids }
    | x = ID ; ASSIGN ; e = exp
        { Assign(x, e) }
    | x = ID ; LBRACKET ; e0 = exp ; RBRACKET ; ASSIGN ; e1 = exp
        { IndexAssign(x, e0, e1) }
    | e = exp                       
        { Expr e }
    | RETURN ; e = option(exp)              
        { Return e }

assign:
    | x = ID ; e = option(init)
        { (x, e) }

arraydec:
    | x = ID ; LBRACKET ; e = exp ; RBRACKET
        { (x, e) }

init:
    | ASSIGN ; e = exp
        { e }

prim_stm_term:
    | s = terminated(prim_stm, SEMI)
        { s }

block_stm:
    | LBRACE ; ss = list(stm) ; RBRACE     
        { Block ss }

compound_stm:
    | IF ; LPAREN ; e = exp ; RPAREN ; s0 = body_stm ; ELSE ; s1 = stm
        { IfElse(e, s0, s1) }
    | IF ; LPAREN ; e = exp ; RPAREN ; s0 = stm
        { IfElse(e, s0, Block []) }
    | WHILE ; LPAREN ; e = exp ; RPAREN ; s = body_stm
        { While(e, s) }

body_stm:
    | s = prim_stm_term
        {s}
    | s = block_stm
        {s}

stm: 
    | s = prim_stm_term
        { s }
    | s = compound_stm
        { s }
    | s = block_stm
        { s }

fundef:
    | typename ; f = ID ; LPAREN ; 
      ps = separated_list(COMMA, typename_novoid ; x = ID ; option(LBRACKET ; RBRACKET {()} ) {x} ) ; 
      RPAREN ; LBRACE; ss = nonempty_list(stm); RBRACE        
        { FunDef (f, ps, ss) }

pgm:
    | fundefs = nonempty_list(fundef)        { Pgm fundefs }

terminated_exp:
    | e = exp; EOF                  { e }

terminated_stm:
    | s = stm; EOF                  { s }

terminated_pgm:
    | p = pgm ; EOF                 { p }

