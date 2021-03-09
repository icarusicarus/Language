%{
	#include <stdlib.h>
	#include "y.tab.h"
%}
%%
[0-9]+	{yylval=atoi(yytext); return NUMBER;}
[ \t]	;
\n	{return 0;}
\+	{return '+';}
\-	{return '-';}
\*	{return '*';}
\/	{return '/';}
\(	{return '(';}
\)	{return ')';}
.	{printf("error near %s\n"); exit(-1);}
%%
int yywrap(){
	return 1;
}
