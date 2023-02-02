#include <stdio.h>
#include <stdlib.h>
#include "liste.h"
#include <string.h>
#include <time.h>

/*Plink create_node(int e){
    Plink a;
    a = (Plink) malloc(sizeof(Plink));
    if(a == NULL){
        exit(1);
    }
    a->data = e;
    a->next = NULL;
    return a;
}



Plink insert_node(Plink a,int e ){
    Plink newnode = create_node(e);
    if(a == NULL){
        a = newnode;
    }
    else {
        Plink tmp = a;
        while(tmp->next != NULL){
            tmp = tmp->next;
        }
        tmp->next = newnode;
    }
    return a;
}
*/


Plink sortLinkList(Plink a){
    Plink p, q, top, temp;
    int changed;
    top = (Plink) malloc(sizeof(Plink));
    top->next = a;
    do{
        changed = 0;
        q= top;
        p = top->next;
        while(p->next != NULL){
            if(p->date > p->next->date){
                temp = p->next;
                p->next = temp->next;
                temp->next = p;
                q->next = temp;
                changed = 1;
            }
                q = p;
                p = p->next; 
        }

    }while (changed);
    p = top->next;
    free(top);
    return p; 
}


int main(int argc, char **argv)
{   
    FILE *fp;
    char line[100];
    Plink a = NULL;
    Plink sortedList = NULL;
    Plink actual = NULL;

    if(argc < 4){
        return 1;
    }
    
    fp = fopen(argv[1], "r");
    if(fp == NULL){
        printf("File %s not found\n", argv[1]);
        return 1;
    }
    
    while(fgets(line, 100, fp)!= NULL){
        actual =(Plink)malloc(sizeof(Plink));
        sscanf(line, "%s;%li;%f", actual->id,&actual->date, &actual->data);
        actual->next = a;
        a = actual;
    }
    fclose(fp);
    sortedList = sortLinkList(actual);
    actual = sortedList;
    while(actual != NULL){
        printf("%s;%li;%.1f\n",actual->id,actual->date,actual->data);
        actual = actual->next;
    }
    return 0;


}
