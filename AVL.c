#include "AVL.h"








pNode rotationright(pNode a)
{

}
pNode rotationleft(pNode a)
{

}
pNode doubleRotationleft(pNode a)
{
    a->right = rotationDroite(a->right);
    return rotationGauche(a);
}
pNode doubleRotationright(pNode a)
{
    a->left = rotationGauche(a->left);
    return rotationDroite(a);
}

pNode equilibrageAVL(pNode a)
{
    if(a->equilibre >= 2)
    {
        if(a->fd->equilibre >= 0)
        {
            return rotationGauche(a);
        }

        return doubleRotationGauge(a);
    }

    else if(a->equilibre <= -2)
    {
        if(a->fg->equilibre <= 0)
        {
            return rotationDroite(a);
        }

        return doubleRotationDroite(a);
    }

    return a;
}