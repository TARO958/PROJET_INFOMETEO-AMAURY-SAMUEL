    #include "arbre.h"

    #define MALLOC(x) ((x*) malloc(sizeof(x)))

    /*-------------------- Fonctions ----------------------*/

    // crée un noeud
    pNode createNode(int a) {
        pNode new = MALLOC(Node);
        new->data = a;
        new->height = 1;
        new->left = NULL;
        new->right = NULL;
        return new;
    }

    // return la hauteur
    int height(pNode a) {
        if (a != NULL) return a->height;
    }

    // equilibre un noeud
    int balence(pNode a) {
        if (a == NULL) return 0;
        return (height(a->left) - height(a->right));
    }

    // met a jour le noeud
    void actualisation(pNode a) {
        int heightLeft = height(a->left);
        int heightRight = height(a->right);
        a->height = (heightLeft > heightRight ? heightLeft : heightRight) + 1;
    }

    // rotation gauche
    pNode rotationLeft (pNode l) {
        pNode r = l->right;
        pNode t = r->left;
        r->left = l;
        l->right = t;
        actualisation(l);
        actualisation(r);
        return l;
    }

    // rotation droit
    pNode rotationRight (pNode r) {
        pNode l = r->left;
        pNode t = l->right;
        l->right = r;
        r->left = t;
        actualisation(r);
        actualisation(l);
        return r;
    }

    // insere un noeud
    pNode insert(pNode a,int x) {
        if (a == NULL) return createNode(x);
        if (x < a->data) a->left = insert(a->left,x);
        else if (x > a->data) a->right = insert(a->right,x);
        else return a;
    }

    // MAJ hauteur
    actualisationHeight(Node a) {
        int balence = balence(a);
        if (balence > 1 && data < a->left->data) return rotationRight(a);
        if (balence < -1 && data > a->right->data) return rotationLeft(a);
        if (balence > 1 && data > a->left->data) {
            a->left = rotationLeft(a->left); 
            return rotationRight(a);
        }
        if (balence < -1 && data < a->right->data) {
            a->right = rotationRight(a->right);
            return rotationLeft(a);
        }
        return a;
    }

    // parcours préfixe (affichage temporaire)
    void prefixe(pNode a) {
        if (a == NULL) return;
        printf("%d ", a->data);
        prefixe(a->left);
        prefixe(a->right);
    }

    /*--------------------------------- MAIN ------------------------------------*/

    int main() {
        pNode root = NULL;
        root = insert(root,10);
        root = insert(root,20);
        root = insert(root,30);
        root = insert(root,40);
        root = insert(root,50);
        root = insert(root,25);

        printf("\nParcours prefixe");
        prefixe(root);
        printf("\n\n");

        return 0; 
    }


