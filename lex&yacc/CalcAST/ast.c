#include "ast.h"

Node *mkIntNode(int tok){
	Node *newIntNode = (Node *)malloc(sizeof(Node));
	newIntNode->ival = tok;
	newIntNode->flag = 0;
	newIntNode->left = NULL;
	newIntNode->right = NULL;
	return newIntNode;
}

Node *mkOpNode(Node *left, Node *right, char *tok){
	Node *newOpNode = (Node *)malloc(sizeof(Node));
	char *newOp = (char *)malloc(strlen(tok)+1);
	strcpy(newOp, tok);
	newOpNode->left = left;
	newOpNode->right = right;
	newOpNode->sval = newOp;
	newOpNode->flag = 1;
	return newOpNode;	
}

void printTree(Node *tree, int level){
	int lev=level;
	for(int i=0;i<lev;i++){
		printf("\t");
	}
	if(tree->flag){
		printf("Op(%s)\n",tree->sval);
		printTree(tree->left,lev+1);
		printTree(tree->right,lev+1);
	}else{
		printf("Int(%d)\n",tree->ival);
	}
}
