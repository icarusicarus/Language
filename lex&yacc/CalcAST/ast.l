%{
	#include <stdlib.h>
	#include "ast.h"
	#include "y.tab.h"
%}
digit	[0-9]
space	[ \t]
%%
"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}
"("	{return '(';}
")"	{return ')';}
"."	{return '.';}
{digit}+	{yylval.ival=atoi(yytext); return NUMBER;}
{space}+	{ }
\n		{return 0;}
%%
int yywrap()	{return 1;}
