#!/bin/bash

letter=$1

if [ -z "$letter" ] 
then 
    echo "erreur pas de lettre"
    exit 1
fi

case "$letter" in 
    "t") echo "lettre T"
    ;;
    "p") echo "lettre P"
    ;;
    "w") echo "lettre W"
    ;;
    "m") echo "lettre M"
    ;;
    "h") echo "lettre H"
    ;;
    *) echo "lettre autre"
    ;;
esac
