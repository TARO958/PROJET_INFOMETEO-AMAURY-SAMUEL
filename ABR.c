#include <stdlib.h>
#include <stdio.h> 
#include "arbre.h"
#include <stdbool.h>



//fonction qui creer un arbre 
PNode creer_Arbre(int e){
    PNode a;
    a = (PNode) malloc(sizeof(PNode));
    a->data = e;
    a->fleft = NULL;
    a->fright = NULL;
    a->balance = 0;
    return a;
}

//fonction permetttant d'insérer un élément dans l'arbre, et qui renvoie l'arbre modifié
 PNode insert_element(PNode a,int e){
    if (a == NULL ){
        a =(PNode) malloc(sizeof(PNode));
        a->data = e;
        a->fleft = NULL;
        a->fright = NULL;
        a->balance = 0;
        return a;
    }
    if (e < a->data) {
        a->left = insert_element(a->fleft, e);
    } else if (e > a->data) {
        a->right = insert_element(a->fright, e);
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
        return search(a->fleft, e);
    } else {
        return search(a->fright, e);
    }
}

//fonction permettant d'afficher l'arbre (pas totalement fonctionel plus pour tester simplement )
void tree_display(PNode a){
    if (a == NULL){
        printf("arbre manquant");
    }
    printf("%d ",a->data);
    tree_display(a->fleft);
    tree_display(a->fright);
}



int main(){
    printf("je suis le boss ");
    PNode a = creer_Arbre(12); 
    tree_display(a);
    a= insert_element(a,13);
    tree_display(a);
    a = insert_element(a,15);
    printf("Pre ordre arbre :");
    tree_display(a);




 //----lire ligne par ligne le fichier csv extraire les différrentes valeurs pour les trier grace au diiférentes méthodes------//
    FILE *fp;
    char line[100];

    fp = fopen("tmp.csv","r");
    if(fp == NULL){
        printf("Error: unable to open the file.\n");
        return 1;
    }
    while(fgets(line,100,fp)!= NULL){
        printf("Line: %s",line);
    }

    return 0;
}