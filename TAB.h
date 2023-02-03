#include <stdio.h>
#include <stdlib.h>

typedef struct link{
    char id[6];
    time_t date;
    float data;
    struct link next;
}link,Plink;

Plink* creationPlink(int a) {
    Plink* newnode = (Plink*) malloc(sizeof(Plink));
    if(newnode == NULL)
    {
        printf("erreur 1");
        exit(1);
    }
    newnode->element = a;
    newnode->suivant = NULL;
    newnode->
    return newnode;
}

void afficheListe(Plink* pliste) {
    if(pliste == NULL) {
        printf("La liste est vide \n");
    }
    else {
        printf("%d", pliste -> element);
        while(pliste->suivant != NULL){
            pliste=pliste->suivant;
            printf("-> %d", pliste->element);
        }
    }
    printf("\n\n\n");
}

Plink* insert_node_end(Plink* a,float e ){
    Plink* newnode = creationPlink(e);
    if(a == NULL){
        a = newnode;
    }
    else {
        Plink* tmp = a;
        while(tmp->next != NULL){
            tmp = tmp->next;
        }
        tmp->next = newnode;
    }
    return a;
}

