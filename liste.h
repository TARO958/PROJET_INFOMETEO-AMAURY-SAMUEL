#include <stdio.h>
 


typedef struct link{
    char id[6];
    time_t date;
    float data;
    struct link *next;
}link,*Plink;



Plink create_chain_list(Plink a ,int element);





