%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "ast.h"
	Node *Root;
	int yyerror(const char *msg), yylex();
%}
%union{
	int ival;
	Node *pval;
}
%left '+' '-'
%left '*' '/'
%left '(' ')'
%nonassoc UMINUS
%token <ival> NUMBER
%type <pval> Exp
%type <pval> Term
%type <pval> Fact
%%
Pgr	: Exp	{Root=$1;}
Exp	: Exp '+' Term	{$$=mkOpNode($1,$3,"+");}
     	| Exp '-' Term	{$$=mkOpNode($1,$3,"-");}
	| Term
	;
Term	: Term '*' Fact	{$$=mkOpNode($1,$3,"*");}
	| Term '/' Fact	{$$=mkOpNode($1,$3,"/");}
	| Fact
	;
Fact	: '(' Exp ')'	{$$=$2;}
      	| '-' NUMBER	%prec UMINUS	{$$=mkIntNode(-$2);}
     	| NUMBER	{$$=mkIntNode($1);}
	;
%%
int main()	{yyparse(); printTree(Root,0); return 0;}
int yyerror(const char *msg)	{fputs(msg,stderr);}
