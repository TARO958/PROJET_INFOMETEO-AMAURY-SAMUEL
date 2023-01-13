#!/bin/bash

arg1=$1
Arg_Obligatoire=false

if [ -z "$arg1" ] 
then 
    echo "erreur pas d'argument obligatoire"
    exit 1
fi

echo "Argument inscrit : $*"


for arg in "$@"
do

    case "$arg" in
        "-t") echo "Il manque le mode à l'argument -t"
              exit 1
        ;; 
        "-t1") Arg_Obligatoire=true 
             echo "VALIDE"
             break
        ;;
        "-t2") Arg_Obligatoire=true 
             echo "VALIDE"
             break
        ;;
        "-t3") Arg_Obligatoire=true 
             echo "VALIDE"
             break
        ;;
        "-p") echo "Il manque le mode à l'argument -p"
              exit 1
        ;;
        "-p1") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        "-p2") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        "-p3") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        "-w") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        "-m") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        "-h") Arg_Obligatoire=true
             echo "VALIDE"
             break
        ;;
        *) echo "Erreur l'argument $arg n'existe pas"
           break
        ;;  
    esac

done

# Verification argument 
if [ $Arg_Obligatoire == true ]
then 
    echo "Bool true"
else 
    exit 1
fi

echo "toujours là"

################ BROUILLON ####################


# [ $# -ge i ]; vérifie si l'argument "i" existe par comparaison des nombre d'arguments


# "t") cut -d';' -f11 meteo_filtered_data_v1.csv # mode 1, 2, 3

# "p") cut -d';' -f3 meteo_filtered_data_v1.csv # mode 1, 2, 3
            
# "w") cut -d';' -f4 meteo_filtered_data_v1.csv
            
# "m") cut -d';' -f6 meteo_filtered_data_v1.csv # décroissant
            
# "h") cut -d';' -f14 meteo_filtered_data_v1.csv # décroissant