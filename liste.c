
#include "liste.h"
#include <string.h>
#include <time.h>

Plink create_node(float e){
    Plink a;
    a = (Plink) malloc(sizeof(Plink));
    if(a == NULL){
        exit(1);
    }
    a->data = e;
    a->next = NULL;
    return a;
}



Plink insert_node(Plink a,float e ){
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


Plink *insertion_sort(Plink a){
    Plink new_a = NULL;
    Plink actual = a;
    Plink prev = NULL;

    while(actual!= NULL){
        prev = NULL;
        Plink temp = new_a;
        while(temp != NULL && temp->data < actual->data){
            prev = temp;
            temp = temp->next;
        }
        Plink temp2 = actual->next;
        if(prev == NULL){
            actual->next = new_a;
            new_a = actual;
        }
        else{
            actual->next = prev->next;
            prev->next = actual;
        }
        actual = temp2;
    }
    return *new_a;
}






int main(int argc, char **argv)

{   



    FILE *fp = NULL;
    Plink *head = NULL;

    fp = fopen("tmp.csv", "r");
    if(fp == NULL)
    {
        
        perror("error opening file\n");

    }  
    else{
          char line[1024];
          
          
          float col = atof(argv[1]); // argument donné pour la colonne
             while (fgets(line, 1024, fp)) {
                char *value= strtok(line, ",");
                Plink *a = (Plink*)malloc(sizeof(Plink));
                for (int i = 1; i < col; i++) {
                    value = strtok(NULL, ",");


                }
                (*a)->data = atof(value);
                (*a)->next = head;
                head = a;
            }
            head = insertion_sort(head);
            Plink  *actual = head;
            while (actual!= NULL) {
                printf("%f\n", (*actual)->data);
                actual = (*actual)->next;  
                /* code */
            }
            
    }
    fclose(fp);
   



if(argc <4){
    return 1;
  }




    return 0;


}


