%{  #include <stdio.h>
    #include <ctype.h>
    int yyerror(const char *msg), yylex();
%}
%token NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%%
Line    : Exp { printf("= %d \n", $1); }
        ;
Exp     : Exp '+' Term { $$ = $1 + $3; }
	| Exp '-' Term { $$ = $1 - $3; }
        | Term
        ;
Term	: Term '*' Fact { $$ = $1 * $3; }
     	| Term '/' Fact { $$ = $1 / $3; }
	| Fact
	;
Fact	: '(' Exp ')' { $$ = $2;}
     	| '-' Exp { $$ = -$2;}
     	| NUMBER { $$ = $1;}
	;
%%
int main() { yyparse(); return 0; }
int yyerror(const char *msg) { fputs(msg, stderr); }
