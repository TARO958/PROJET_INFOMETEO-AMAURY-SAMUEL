#include <stdlib.h>
#include <stdio.h> 
#include "arbre.h"
#include <stdbool.h>



//fonction qui creer un arbre 
PNode creer_Arbre(int e){
    PNode a;
    a = (PNode) malloc(sizeof(PNode));
    a->data = e;
    a->left = NULL;
    a->right = NULL;
    a->height = 0;
    return a;
}
//fonction permetttant d'insérer un élément dans l'arbre, et qui renvoie l'arbre modifié
 PNode insert_element(PNode a,int e){
    if (a == NULL ){
        a =(PNode) malloc(sizeof(PNode));
        a->data = e;
        a->left = NULL;
        a->right = NULL;
        a->balance = 0;
        return a;
    }
    if (e < a->data) {
        a->left = insert_element(a->left, e);
    } else if (e > a->data) {
        a->right = insert_element(a->right, e);
    }
    return a;
 }

//fonction de recherche qui prend en entrée une valeur et renvoie un bool en indiquant si la valeur existe dans l'arbre binaire de recherche valide 
bool search(PNode a, int e) {
    if (a == NULL) {
        return false;
    }
    if (a->data == e) {
        return true;
    }
    if (e < a->data) {
        return search(a->left, e);
    } else {
        return search(a->right, e);
    }
}

//fonction permettant d'afficher l'arbre (pas totalement fonctionel plus pour tester simplement )
void tree_display(PNode a){
    if (a == NULL){
        printf("arbre manquant");
    }
    printf("%d ",a->data);
    affiche_arbre(a->left);
    affiche_arbre(a->right);
}

int main(){
    printf("je suis le boss ");
    PNode a = creerArbre(12); 
    affiche_arbre(a);
    a= insert_element(a,13);
    affiche_arbre(a);
    a = insert_element(a,15);
    printf("Pre ordre arbre :");
    affiche_arbre(a);

    return 0;
}