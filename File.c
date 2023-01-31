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

  // Lire chaque ligne dans le fichier CSV
   char line[1024];
 while (fgets(line, 1024, fp) != NULL) {
    // Séparer les champs de la ligne en utilisant la virgule comme séparateur
    char *field = strtok(line, ",");
    int key = atoi(field);
    field = strtok(NULL, ",");
    char *value = field;

    // Ajouter l'enregistrement à l'arbre AVL
    record_t *record = (record_t *)malloc(sizeof(record_t));
    record->key = key;
    strcpy(record->value, value);
    avl_insert(tree, record);
  }
