#include <stdlib.h>
#include <stdio.h> 
#include "arbre.h"

int main(){
    printf("je suis le boss ");
    return 0;
}



//fonction permetttant d'insérer un élément dans l'arbre, et qui renvoie l'arbre
 pNode insert_élément(a)

//fonction de recherche qui prend en entrée une valeur et renvoie un bool en indiquant si la valeur existe dans l'arbre
int research_data(pNode a , data c){
    if(a == c ){
        return 1;
    }
    else if (a->data == c){
        return 0;

    }else if (c < a->data){
        return 0;
    }
}





