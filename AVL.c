#include "arbre.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

    
    /*-------------------- Fonctions ----------------------*/
//crée un noeud
// return la hauteur
// equilibre un noeud
// met a jour le noeud
tation gauche
PNode LeftRotate(PNode a){
    PNode pivot;
    pivot = a->fright;
    a->fright = pivot->fright;
    pivot->fright = a;
    a = pivot;
    return  a;
}
// rotation droite
PNode RightRotate(PNode a){
    PNode pivot;
    pivot = a->fleft;
    a->fleft = pivot->fright;
    pivot->fright = a;
    a = pivot;
    return a;
}    
// double rotation droite
PNode DoubleRightRotate(PNode a){
    a->fleft = LeftRotate(a->fleft);
    return RightRotate(a);
}
// double rotation gauche
PNode DoubleleftRotate(PNode a){
    a->fright = RightRotate(a->fright);
    return LeftRotate(a);
}
// insere un noeud
   PNode insertion_AVL(PNode a,int e,int *h){
    if(a == NULL){
        *h = 1;
        return creer_Arbre(e);
    }
    else if(a->data<e){
        a->fleft = insertion_AVL(a->fright,&e,h);
        *h = -*h;

    }
    else if(a->data >e){
        a->fright = insertion_AVL(a->fleft,&e,h);
    }
    else{
        *h = 0;
        return a;
    }
    if(*h!=0){
        a->balance = a->balance + *h;
        if(a->balance == 0){
            *h = 0;
        }
        else {
            *h =1;
        }
    }
    return a;
   }
// MAJ équilibre de l'arbre
PNode balance_AVL(PNode a){
    if(a->balance >= 2){
        if(a->fright->balance >= 0 ){
            return LeftRotate(a);
        }
        else{
            return DoubleleftRotate;
        }
    }
    if(a->balance <= 2){
        if(a->fleft->balance <= 0){
            return RightRotate(a);
        }
        else{
            return DoubleRightRotate(a);
        }
    }
    return a;
}
    

// parcours préfixe (affichage temporaire)
    

/*--------------------------------- MAIN ------------------------------------*/

int main() {
      
}
