%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "j_lex.h"
	#include "j_parse.h"
%}

%token CLASS PUB STATIC
%left  AND OR
%left  LT LE EQ
%left  ADD MINUS
%left  TIMES
%token LBP RBP LSP RSP LP RP
%token INT NUM BOOLEAN
%token TRUE FALSE NOT
%token IF ELSE
%token WHILE PRINT
%token ASSIGN
%token VOID MAIN STR
%token RETURN
%token SEMI COMMA
%token THIS NEW DOT
%token ID LIT
%token COMMENT

%expect 28

%%
prog	:	mainc cdcls
		{ printf("Program -> MainClass ClassDecl*\n");
		  printf("Parsed OK!\n"); }
	|
		{ printf("****** Parsing failed!\n"); }
	;

stmts	:	stmt stmts
		{ printf("(for Statement*) stmts : stmt stmts\n"); }
	|
		{ printf("(for Statement*) stmts : \n"); }
	;

mainc	:	CLASS ID LBP PUB STATIC VOID MAIN LP STR LSP RSP ID RP LBP stmts RBP RBP
		{ printf("MainClass -> class id lbp public static void main lp string lsp rsp id rp lbp stmts rbp rbp\n"); }
	;

cdcls	:	cdcl cdcls
		{ printf("(for ClassDecl*) cdcls : cdcl cdcls\n"); }
	|
		{ printf("(for ClassDecl*) cdcls : \n"); }
	;

cdcl	:	CLASS ID LBP vdcls mdcls RBP
		{ printf("ClassDecl -> class id lbp VarDecl* MethodDecl* rbp\n"); }
	;

vdcls	:	vdcl vdcls
		{ printf("(for VarDecl*) vdcls : vdcl vdcls\n"); }
	|
		{ printf("(for VarDecl*) vdcls : \n"); }
	;

vdcl	:	type ID SEMI
		{ printf("VarDecl -> Type id semi\n"); }
	;

mdcls	:	mdcl mdcls
		{ printf("(for MethodDecl*) mdcls : mdcl mdcls\n"); }
	|
		{ printf("(for MethodDecl*) mdcls : \n"); }
	;

mdcl	:	PUB type ID LP formals RP LBP vdcls stmts RETURN exp SEMI RBP
		{ printf("MethodDecl -> public Type id lp FormalList rp lbp Statements* return Exp semi rbp\n"); }
	;

formals	:	type ID frest
		{ printf("FormalList -> Type id FormalRest*\n"); }
	|
		{ printf("FormalList -> \n"); }
	;

frest	:	COMMA type ID frest
		{ printf("FormalRest -> comma Type id FormalRest\n"); }
	|
		{ printf("FormalRest -> \n"); }
	;

type : INT LSP RSP
		{ printf("type -> int lsp rsp\n"); }
	|	BOOLEAN
		{ printf("type -> BOOLEAN\n"); }
	| INT
		{ printf("type -> INT\n"); }
	| ID
		{ printf("type -> ID\n"); }
	;

stmt : LBP stmts RBP
		{ printf("stmt -> LBP stmts RBP\n"); }
	| IF LP exp RP stmts ELSE stmts
		{ printf("stmt -> IF LP exp RP stmts ELSE stmts\n"); }
	| WHILE LP exp RP stmts
		{ printf("stmt -> WHILE LP exp RP stmts\n"); }
	| PRINT LP exp RP SEMI
		{ printf("stmt -> PRINT LP exp RP SEMI\n"); }
	| ID LSP exp RSP EQ exp SEMI
		{ printf("stmt -> ID LSP exp RSP EQ exp SEMI\n"); }
	| vdcls
		{ printf("stmt -> vdcls\n"); }
	;

relop : ADD
	| MINUS
	| TIMES
	| OR
	| AND
	| LT
	| LE
	| EQ
	| DOT
	;

exp : exp relop exp
	| ID LSP exp RSP
	| ID LP explist RP
	| LP exp RP
	| NUM
	| TRUE
	| FALSE
	| ID
	| THIS
	| NEW INT LSP exp RSP
	| NEW ID LP RP
	| NOT exp
	;

exprests : exprest exprests
		{ printf("(for ExpRest*) exprests : exprest exprests\n"); }
	|
		{ printf("(for ExpRest*) exprests : \n"); }
	;

explist : exp exprests
		{ printf("ExpList -> Exp RxpRest* \n"); }
	;

exprest : COMMA exp
		{ printf("ExpRest -> comma Exp \n"); }
	;


// Write the grammar rules for type, statement, exp, explist, exprest

%%

int yyerror(char *s)
{
	printf("%s\n",s);
	return 1;
}
