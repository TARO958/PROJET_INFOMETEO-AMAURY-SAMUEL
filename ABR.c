#include <stdlib.h>
#include <stdio.h> 
#include "arbre.h"


int main(){
    printf("je suis le boss ");
    
    return 0;
}



//fonction permetttant d'insérer un élément dans l'arbre, et qui renvoie l'arbre modifié
 pNode insert_element(pNode root,int data){
    if (root == NULL ){
        root =(pNode) malloc(sizeof(pNode));
        root->data = data;
        root->left = NULL;
        root->right = NULL;
        return root;
    }
    if (data < root->data) {
        root->left = insert_element(root->left, data);
    } else if (data > root->data) {
        root->right = insert_element(root->right, data);
    }
    return root;
 }

//fonction de recherche qui prend en entrée une valeur et renvoie un bool en indiquant si la valeur existe dans l'arbre binaire de recherche valide 
bool search(pNode root, int data) {
    if (root == NULL) {
        return false;
    }
    if (root->data == data) {
        return true;
    }
    if (data < root->data) {
        return search(root->left, data);
    } else {
        return search(root->right, data);
    }
}







