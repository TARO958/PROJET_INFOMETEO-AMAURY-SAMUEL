#ifdef ARBRE_H
#define ARBRE_H

#include<stdlib.h>
#include<stdio.h>
#include<math.h>
#include<time.h>
#include<stdbool.h>

/*------------------- Structure -----------------------*/

// struct pour la data (on peux le changer en ce qu'on veut mais il va falloir definir le bordel)
   // typedef int Data;

// structure AVL
    typedef struct nodetype {
        int data;
        int height;
        struct nodetype* left;
        struct nodetype* right;
    }Node;

// redifinition du pointeur
    typedef Node* pNode;



 pNode insert_element(pNode root,int data);
 bool search(pNode root, int data);
#endif 

