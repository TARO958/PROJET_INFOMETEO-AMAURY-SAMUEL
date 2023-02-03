#include "ABR.h"
PNode* createNode(PNode a, int e)
{
    PNode* new = malloc(sizeof(PNode));
    if(!new)
    {
        exit(4);
    }

    new->champ1 = 0;
    new->champ2 = 0;
    new->champ3 = 0;

    new->left = NULL;
    new->right = NULL;

    
}
PNode* insert_element(PNode a,int e){
    if (a == NULL ){

        return a;
    }
    if (e < a->data) {
        a->fleft = insert_element(a->fleft, e);
    } else if (e > a->data) {
        a->fright = insert_element(a->fright, e);
    }
    return a;
 }

void writeonexit(PNode a, FILE* exit)
{
    if(!a) return;
    
    fprintf(exit, "%f", a->champ1);
    fputc(' ', exit);
    fprintf(exit, "%f", a->champ2);
    fputc(' ', exit);
    fprintf(exit, "%f", a->champ3);
    fputc(' ', exit);

    fprintf(exit, "%s", "\n");
}

void infixcourse(PNode a, FILE* f)
{
    if(!a)
    {
        infixcourse(a->fleft, f);
        writeonexit(a, f);
        infixcourse(a->fright, f);
    }
}