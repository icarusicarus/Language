all: lex.yy.c
	gcc lex.yy.c -o count
lex.yy.c: count.l
	flex count.l
