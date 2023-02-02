#ifndef ARBRE_H
#define ARBRE_H

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdbool.h>

/*------------------- Structure -----------------------*/

// struct pour la data (on peux le changer en ce qu'on veut mais il va falloir definir le bordel)
   // typedef int Data;

// structure AVL
typedef struct nodetype {
    int data;
    struct nodetype* left;
    struct nodetype* right;
    int balance;
}Node,*PNode;

// redifinition du pointeur
//typedef Node *PNode;



PNode insert_element(PNode a,int data);
bool search(PNode root, int data);
void tree_display(PNode a);
PNode creer_Arbre(int e);

#endif 

