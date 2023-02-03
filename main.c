// INCLUE TOUTES LES BIBLIOTHEQUES
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "AVL.h"
#include "TAB.h"
#include "ABR.h"

int main(int argc, char** argv) {
    FILE*input = NULL;
    FILE*exit = NULL;
    int direction;
    int sorttype;
    int sort_collumn;
    PNode a_temp=NULL;
    Chainon* list_temp=NULL;

    for(i = 1; i < argc; i++) {
        if(strcmp("-f", argv[i]) == 0) {
            input=argv[i+1];
        }
        //
        else if(strcmp("-r", argv[i]) == 0) {
            direction=1;
        }
        //
        else if(strcmp("--tab", argv[i]) == 0) {
            sorttype=0;
        }
        else if(strcmp("--ABR", argv[i]) == 0) {
            sorttype=1;
        }
        else if(strcmp("--AVL", argv[i]) == 0) {
            sorttype=2;
        }

        else if(strcmp("-c", argv[i]) == 0)
        {
            sort_collumn = argv[i];
        }

        else if(strcmp("-o", argv[i]) == 0) {
            output=argv[i+1];
        }
    }

    FILE* entry=fopen(input,"w+");

    if(!entry) return 1;

    int position = 0;
    float data_tab[3]={0};

    do {
        for (int i=0;i<3;i++)
        {
            fscanf(entry,"%f",&data_tab[i]);
        }
        position = fgetc(entry);

        switch (sorttype)
        {
            case: 0
            // Insert liste chainées
            break;

            case: 1
            // Insert AVR
            break;

            case: 2
            // Insert AVL
            break;
        }
    } while (position!=EOF);

    fclose(entry);


    // Rewrite all the sorted linked list or binary tree values in the exit file
    FILE* exit = fopen(exit, "w+");
    *chainon current = pliste // TETE DE LISTE
    if(!exit)
    {
        return 1;
    }

    if(type_trie == 0)
    {
        // Fonction trie liste chainé
        current_liste
        list_temp = pliste;
        while(!PTR_NUL(list_temp))
        {

            fprintf(exit, "%f", current->champ1);
            fputc(' ', exit);
            fprintf(exit, "%f", current->champ2);
            fputc(' ', exit); 
            fprintf(exit, "%f", current->champ3);
            fputc(' ', exit);                                   
        
            fprintf(ma_sortie, "%s", "\n");
            list_temp = list_temp->suivant;
        }
    }

    return 0;
 }

