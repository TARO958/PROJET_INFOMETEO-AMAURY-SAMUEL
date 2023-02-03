#ifndef ARBRE_H
#define ARBRE_H

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define __USE_XOPEN
#define _GNU_SOURCE
#include <time.h>
#include <stdbool.h>

#define max(a,b) ({ typeof (a) _a = (a); typeof (b) _b = (b); _a > _b ? _a : _b; })


/*------------------- Structure -----------------------*/

// struct pour la data (on peux le changer en ce qu'on veut mais il va falloir definir le bordel)
   // typedef int Data;

// structure AVL
typedef struct nodetype {
    float data;
    struct nodetype* fleft;
    struct nodetype* fright;
    int height;
    int id;
    int date;
    
}Node,*PNode;

// redifinition du pointeur
//typedef Node *PNode;



PNode insert_element(PNode a,int data);
bool search(PNode root, int data);
void tree_display(PNode a);
PNode creer_Arbre(int e);


#endif 
