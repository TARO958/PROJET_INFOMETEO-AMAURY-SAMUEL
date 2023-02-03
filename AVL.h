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
// redifinition du pointeur
//typedef Node *PNode;



pNode insert_elementAVL(pNode a,int data);
bool search(PNode root, int data);
void tree_display(PNode a);

pNode rotationright(pNode a);
pNode rotationleft(pNode a);
pNode doubleRotationleft(pNode a);
pNode doubleRotationright(pNode a);
pNode equilibrageAVL(pNode a);




#endif 
