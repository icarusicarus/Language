all: lex.yy.c y.tab.c y.tab.h
	gcc lex.yy.c y.tab.c -o attr
lex.yy.c: attr.l
	flex attr.l
y.tab.c: attr.y
	bison -dy attr.y
