all: lex.yy.c y.tab.c y.tab.h ast.o
	gcc lex.yy.c y.tab.c ast.o -o ast
lex.yy.c: ast.l
	flex ast.l
y.tab.c: ast.y ast.o
	bison -dy ast.y
ast.o: ast.c
	gcc -c ast.c
clean:
	rm -rf lex.yy.c y.tab.*
