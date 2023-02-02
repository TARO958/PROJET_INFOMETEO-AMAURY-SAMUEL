#include <stdlib.h>
#include "File.h"
#include <stdio.h>


// Fonction de comparaison pour le tri AVL
int compare_records(const void *a, const void *b) {
  record_t *ra = (record_t *)a;
  record_t *rb = (record_t *)b;
  return ra->key - rb->key;
}

// Fonction pour ouvrir un fichier CSV et le trier à l'aide d'un AVL
void sort_csv_file(const char *filename){
  // Ouvrir le fichier CSV en mode lecture
  FILE *fp = fopen(filename, "r");
  if (fp == NULL) {
    printf("Impossible d'ouvrir le fichier %s\n", filename);
    return;
  }

}


