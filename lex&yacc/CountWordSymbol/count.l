%{
	#include <stdio.h>
	int wordNum=0;
	int symbNum=0;	
%}

symb	[\!\@\#\$\%\^\&\*\(\)\-\_\=\+\|\\/\<\>\;\:\"\'\{\}\[\]\.\,]
chars [a-zA-Z]*

%%
{chars}	{wordNum++;}
{symb}	{symbNum++;}
%%

int main(){
	yylex();
	printf("Num. of Words: %d\n",wordNum);
	printf("Num. of Symbols: %d",symbNum);
	return 0;
}

int yywrap(){
	return 1;
}