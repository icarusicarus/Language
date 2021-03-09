#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

typedef struct node{
	struct node *left;
	struct node *right;
	char flag;
	union {
		char *sval;
		int ival;
	};
}Node;

void printTree(Node *tree, int level);
Node *mkOpNode(Node *left, Node *right, char *tok);
Node *mkIntNode(int tok);
