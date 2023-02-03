#include "arbre.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <time.h>

    
    /*------------------- Fonctions ----------------------*/
int height(PNode node) {
  if (node == NULL) return 0;
  return node->height; 
}




PNode leftRotate(PNode x) {
  PNode y = x->fright;
  PNode T2 = y->fleft;
  y->fleft = x;
  x->fright = T2;
  x->height = max(height(x->fleft), height(x->fright)) + 1;
  y->height = max(height(y->fleft), height(y->fright)) + 1;
  return y;
}
PNode rightRotate(PNode y) {
  PNode x = y->fleft;
  PNode T2 = x->fright;
  x->fright = y;
  y->fleft = T2;
  y->height = max(height(y->fleft), height(y->fright)) + 1;
  x->height = max(height(x->fleft), height(x->fright)) + 1;
  return x;
}
int max(int a, int b) {
  return (a > b) ? a : b;
}

int height(PNode node) {
  if (node == NULL) return 0;
  return node->height; 
}

int getBalance(PNode node) {
  if (node == NULL) return 0;
  return height(node->fleft) - height(node->fright);
}


// insere un noeud

   
PNode creer_AVL(int e,int var,float data){
    PNode newnode = malloc(sizeof(PNode));
    if (newnode == NULL){
        exit(1);
    }
    newnode->data = data;
    newnode->height = -1;
    newnode->fright = NULL;
    newnode->fleft = NULL;
    newnode->id = e;
    newnode->date = var;
    return newnode;
    
}


PNode sort_AVL(PNode a,int e,int var,float data){
    if(a == NULL){
        return creer_AVL(e,var,data);
    }
    if(a->id <= e){
        a->fright = sort_AVL(a->fright,e,var,data);
    }
    if(a->id > e ){
        a->fleft = sort_AVL(a->fleft,e,var,data);
    }
    a->height = 1 + max(height(a->fleft), height(a->fright));
    int balance = getBalance(a);

     if (balance > 1 && data < a->fleft->data)
        return rightRotate(a);
    if (balance < -1 && data > a->fright->data)
        return leftRotate(a);
    if (balance > 1 && data > a->fleft->data) {
        a->fleft = leftRotate(a->fleft);
        return rightRotate(a);
    }
    if (balance < -1 && data < a->fright->data) {
        a->fright = rightRotate(a->fright);
        return leftRotate(a);
    }
     return a;

}
void inorder(PNode a) 
{   
    if (a != NULL) 
    { 
        inorder(a->fleft); 
              fprintf(fp,"%d %d %f\n", a->id, a->date, a->data);
        inorder(a->fright); 
    } 
}

// MAJ équilibre de l'arbre


    

/*--------------------------------- MAIN ------------------------------------*/

int main() {
     FILE *fp;
    PNode Avl = NULL;
    int id;
    char date[100];
    float data;


    fp = fopen("tmp.csv","r");
    if(fp == NULL){
        printf("Error: unable to open the file.\n");
        return 1;
    }
    while((fscanf(fp,"%d %s %f\n", &id, date, &data)) != EOF){
        date[19] = '\0';
            struct tm tm;
            time_t date;
            if(strptime(date, "%d/%m/%Y %H:%M:%S", &tm) != NULL){
                date = mktime(&tm);
            }
        Avl = sort_AVL(Avl, id, date, data);
         
        
    }
    fclose(fp);
    fp = fopen("fichier_trié.csv", "w");
    if(fp == NULL){
        printf("Error: unable to open the file.\n");
        return 1;
    }
    inorder(Avl);
     
    return 0;
}
      

