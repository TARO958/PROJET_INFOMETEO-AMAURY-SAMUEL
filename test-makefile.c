#include <stdlib.h>
#include <stdio.h> 
#include "test-makefile.h"


int main(){
    printf("hello world");
    return 0;
    test_de_fou(7,2);
}

int test_de_fou(int a, int b ){
    if(a > b){
        return a;
    }
    return b;
}