#ifndef _ABR_H
#define _ABR_H
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


typedef struct node
{
    float champ1;
    float champ2;
    float champ3;
    struct node* left;
    struct node* right;
    int height // Used for the AVL
} Node;

typedef Node* pNode;

pNode insert_element(pNode a,int e);
pNode createNode(pNode a, int e);
void writeonexit(pNode a, FILE* exit);
void writeonexit(pNode a, FILE* exit);
void infixcourse(PNode a, FILE* f);


#endif

