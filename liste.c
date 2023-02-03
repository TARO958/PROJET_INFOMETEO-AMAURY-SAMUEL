
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



Plink insert_node_end(Plink a,float e ){
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

Plink insert_node_begin(Plink a,float e){
    Plink newnode = create_node(e);
    newnode->next = a;
    a = newnode;
    return a;
}


Plink sort_grauwing(Plink a){
    Plink temp = a;
    Plink temp1 = a->next;
    
    if(a == NULL){  
        printf("List is empty\n");
        
    }
     while(temp->next!= NULL){
        if (temp >temp1){
            a->next = temp1->next;
            temp3 = temp2;
            temp3->next = temp;
          
        }
        else {
            temp = temp->next;
        }
        
    }
     return a;
}


void display(Plink a){
    if(a == NULL){
        printf("List is empty\n");
    }
    else {
        while(a->next!= NULL){
            printf("%f -> ",a->data);
            a = a->next;
        }
        printf("%f\n\n",a->data);
        
    }
}




int main()

{   
    Plink a= NULL;
    a = create_node(1.2);
    printf("a->data = %f\n",a->data);

    a = insert_node_end(a,8.2);
    a = insert_node_end(a,5.4);
    a = insert_node_end(a,9.6);
    a = sort_grauwing(a);
    display(a);



   



    return 0;


}


