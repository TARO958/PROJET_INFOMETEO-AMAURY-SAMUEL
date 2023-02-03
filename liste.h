#include <stdio.h>
#include <stdlib.h>
 


typedef struct link{
    char id[6];
    time_t date;
    float data;
    struct link *next;
}link,*Plink;









