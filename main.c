#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(){
 //----lire ligne par ligne le fichier csv extraire les différrentes valeurs pour les stocker dans un tableau puis les trier grace au diiférentes méthodes------//
    
    FILE *fp = fopen("tmp.csv","r");

    char texte[200];
    if(fp == NULL){
        printf("Error: unable to open the file.\n");
        exit(1);
    }
    while(fgets(texte,200,fp) != NULL)
        printf("%s\n",texte);
    fclose(fp);
    /*while(fgets(line,100,fp)!= NULL){
        printf("Line: %s",line);
    }
    
    if(strcmp(argv[1], "--tab")==0){
        //entrer dans le tri_tab
    }
     if(strcmp(argv[1], "--avl")==0){
        //entrer dans le tri_avl
    }
     if(strcmp(argv[1], "--abr")==0){
        //entrer dans le tri_abr
    }
    */
    return 0;
}