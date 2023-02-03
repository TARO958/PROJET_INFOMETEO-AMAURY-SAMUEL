#!/bin/bash


# # #     VARIABLE     # # #

Arg_Obligatoire=false
Arg_Tri=false
file=""
Lieux=false
fileHere=false

# Variable lieux :
France=false
Guyane=false
StMic=false
Antilles=false
OceanIndien=false
Antartique=false

# Variable données :
modeT=false
modeP=false

# Variable tris :
tab=false
abr=false
avl=false

######################################################
# PROGRAM CONFORT                                    #
VerifTmp="tmp.csv"                                   #
                                                     #
if [ $VerifTmp ]                                     #
then                                                 #
     rm "tmp.csv"                                    #
     #rm "tmptmp.csv"                                #
     #rm "result.csv"                                #
     #rm -r ~/.local/share/Trash/*                   #
     #echo "!!! tmp has been remove !!!"             #
fi                                                   #
# TROFNOC MARGORP                                    #
######################################################


### Usage ###

usage() {
  echo -e "\n"
  echo " Ce programme permet un filtrage,tris et affichage sous forme de graphique des données météo"
  echo -e "\n"
  echo "  Exemple utilisation : nom_script.sh [-f nom_fichier.csv] [-t<mode>] [-w] [-p<mode>] [-m] [-h] [-G] [--abr] --"
  echo -e "\n"
  echo "        PARAMETRE FICHIER [ OBLIGATOIRE | MAXIMUM : 1]"
  echo "  -f : fichier de donnée meteo, un fichier format csv"
  echo -e "\n"
  echo "        PARAMETRE DONNES [ OBLIGATOIRE | PAS DE LIMITE ]"
  echo "  -t<mode> : Affiche les données sur la temperature, 3 modes disponible, un mode est necessaire"
  echo "       -t1) tri en focntion des ID des stations"
  echo "       -t2) tri en focntion de l'ordre chronologique des données"
  echo "       -t3) tri en focntion de l'ordre chronologique puis des données"
  echo "  -p<mode> : Affiche les données sur la pression, 3 modes disponible, un mode est necessaire"
  echo "       -p1) tri en focntion des ID des stations"
  echo "       -p2) tri en focntion de l'ordre chronologique des données"
  echo "       -p3) tri en focntion de l'ordre chronologique puis des données"
  echo "  -w : Affiche les données sur le vent"
  echo "  -m : Affiche les données sur l'humidité"
  echo "  -h : Affiche les données sur l'altitude"
  echo -e "\n"
  echo "       PARAMETRE GEOGRAPHIQUE [ PAS OBLIGATOIRE | MAXIMUM : 1]"
  echo "   -F : Affiche les données de la France metropolitaine ainsi que la Corse"
  echo "   -G : Affiche les données de la Guyane"
  echo "   -A : Affiche les données des Antilles"
  echo "   -O : Affiche les données des territoires français present dans l'Océan Indien"
  echo "   -S : Affiche les données de Saint Pierre et Miquelon"
  echo "   -A : Affiche les données des terres Astrales française"
  echo -e "\n"
  echo "       PARAMETRE TRIS [ PAS OBLIGATOIRE | MAXIMUM : 1 | DEFAULT : AVL ]"
  echo "   --tab : Tri à bulles"
  echo "   --abr : Tri par arbre binaire"
  echo "   --avl : Tri par arbre binaire de recherche"
  echo -e "\n"   
  echo "   Veuillez conclure votre commande avec : --"
  echo -e "\n"   
}

if [ -z "$1" ]; then
     echo "  taper --help pour voir le manuel"
     exit 1
fi

if [ "$1" == "--help" ]; then
  usage
  exit 0
fi

### ----- ###



### MSG ERREUR ###

VerifFile() {
     if [ "$fileHere" == false ]; then
          echo "  Il n'y a pas de fichier .csv rentrer" >&2
          exit 1
     fi
}

triVerifINF() {
     if [ "$Arg_Tri" == true ]; then
          echo "  Il y'a plusieurs argument de tri." >&2
          exit 1
     fi
}

triverifSUP() {
     if [ "$Arg_Tri" == false ]; then
          avl=true
     fi
}

ObligatoirVerif() {
     if [ $Arg_Obligatoire == false ]; then 
          echo "  Il n'a pas de type de données demander." >&2
          exit 1
     fi
}

LieuxVerif() {
     if [ "$Lieux" == true ]; then
          echo "  Il y a deja une variable géographique" >&2
          exit 1
     fi
}

VerifModesP() {
     if [ "$modeP" == true ]; then
     echo "erreur il y a plusieurs fois la variable -P<mode>" >&2
     exit 1
     fi
}


VerifModesT() {
     if [ "$modeT" == true ]; then
     echo "erreur il y a plusieurs fois la variable -t<mode>" >&2
     exit 1
     fi
}


### --- ------ ###



### Options ###

OPTIONS=$(getopt -o f:t:t1:t2:t3:p:p1:p2:p3:w:m:h:F:G:S:A:O:Q:d: --long tab:,abr:,avl: -- "$@")

eval set -- "$OPTIONS"

while true; do
     case $1 in
     -f)
          file="$2"
          if [[ $file != *.csv ]]; then
               echo "Le fichier doit être un fichier .csv" >&2
               exit 1
          fi
          fileHere=true
          shift 2
          ;;
     -t)
          echo "Erreur : il manque le mode associer à l'argument -t" >&2
          exit 1
          ;;
     -t1)
          VerifModesT
          modeT=true
          temperature1=true
          Arg_Obligatoire=true
          shift 
          ;;
     -t2)
          VerifModesT
          modeT=true
          temperature2=true
          Arg_Obligatoire=true
          shift 
          ;;
     -t3)
          VerifModesT
          modeT=true
          temperature3=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p)
          echo "Erreur : il manque le mode associer à l'argument -p" >&2
          exit 1
          ;;
     -p1)
          VerifModesP
          modeP=true
          pression1=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p2)
          VerifModesP
          modeP=true
          pression2=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p3)
          VerifModesP
          modeP=true
          pression3=true
          Arg_Obligatoire=true
          shift 
          ;;
     -w)
          vent=true
          Arg_Obligatoire=true
          shift 
          ;;
     -m)
          humidite=true  
          Arg_Obligatoire=true
          shift 
          ;;
     -h)
          altitude=true
          Arg_Obligatoire=true
          shift 
          ;;
     -F)
          LieuxVerif
          France=true
          Lieux=true
          shift 
          ;;
     -G)
          LieuxVerif
          Guyane=true
          Lieux=true
          shift 
          ;;
     -S)
          LieuxVerif
          StMic=true
          Lieux=true
          shift 
          ;;
     -A)
          LieuxVerif
          Antilles=true
          Lieux=true
          shift 
          ;;
     -O)
          LieuxVerif
          OceanIndien=true
          Lieux=true
          shift 
          ;;
     -Q)
          LieuxVerif
          Antartique=true
          Lieux=true
          shift 
          ;;
     -d)
          DateMin=$2
          DateMax=$3
          date=true
          shift 3
          ;;
     --tab)
          triVerifINF
          tab=true
          Arg_Tri=true
          shift 
          ;;
     --abr)
          triVerifINF
          abr=true
          Arg_Tri=true
          shift 
          ;;
     --avl)
          triVerifINF
          avl=true
          Arg_Tri=true
          shift 
          ;;
     --)
          shift
          break
          ;;
     *)
          echo "Erreur : option non prise en charge : $1" >&2
          exit 1
          ;;
     esac
done

ObligatoirVerif
triverifSUP
VerifFile

echo -e "\n\tFiltred file underconstruction"

### ------- ###



# # #  Filtrage  # # #


# Géographique #

if [ "$Lieux" == true ]; then
     if [ "$Guyane" == true ]; then
          Pattern="81408|81415|81401|81405"
     fi
     if [ "$StMic" == true ]; then
          Pattern="71805"
     fi
     if [ "$Antilles" == true ]; then
          Pattern="78890|78897|78922|78925|78894"
     fi
     if [ "$OceanIndien" == true ]; then
          Pattern="61980|67005"
     fi
     if [ "$Antartique" == true ]; then
          Pattern="61972|61976|61998"
     fi
     if [ "$France" == true ]; then
          Pattern="81408|81415|81401|81405|71805|78890|78897|78897|78922|78925|78894|61980|67005|61972|61976|61998"
     fi
fi


# Données

resetTmp() {
     if [ -f "tmptmp.csv" ] && [ -f "result.csv" ]; then
          rm tmptmp.csv
          rm tmp.csv
          mv result.csv tmp.csv
     fi
}

     # Base
if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $10 ";" $15}' >> tmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $10 ";" $15}' >> tmp.csv
fi

     # t1 & t2 & t3 (temperature)
if [ "$temperature1" == true ] || [ "$temperature2" == true ] || [ "$temperature3" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
fi

     # p1 & p2 & p3 (pression)
if [ "$pression1" == true ] || [ "$pression2" == true ] || [ "$pression3" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
fi

     # heigh
if [ "$altitude" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $14}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $14}' >> tmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
fi      

     # mud
if [ "$humidite" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $6}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $6}' >> tmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
fi      

     # wind
if [ "$vent" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $4 ";" $5}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $4 ";" $5}' >> tmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
fi      


# Date

if [ "$date" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" >> tmptmp.csv
     fi
fi      

# # # Appel du tri # # #


# tab
if [ "$tab" == true ]; then
     if [ "$temperature1" == true ]; then
          # tri tab(1) tmp.csv
     fi
     if [ "$temperature2" == true ]; then
          # tri tab(2)
     fi
     if [ "$temperature3" == true ]; then
          # tri tab(2)
          # tri tab(1)
     fi
     if [ "$pression1" == true ]; then
          # tri tab(1)
     fi
     if [ "$pression2" == true ]; then
          # tri tab(2)
     fi
     if [ "$pression3" == true ]; then
          # tri tab(2)
          # tri tab(1)
     fi
     if [ "$vent" == true ]; then
          # tri tab(1)
     fi
     if [ "$altitude" == true ]; then
          # tri abr(14) décroissant !
     fi
     if [ "$humidite" == true ]; then
          # tri abr(6) décroissant !
     fi
fi

# abr
if [ "$tab" == true ]; then
     if [ "$temperature1" == true ]; then
          # tri abr(1)
     fi
     if [ "$temperature2" == true ]; then
          # tri abr(2)
     fi
     if [ "$temperature3" == true ]; then
          # tri abr(2)
          # tri abr(1)
     fi
     if [ "$pression1" == true ]; then
          # tri abr(1)
     fi
     if [ "$pression2" == true ]; then
          # tri abr(2)
     fi
     if [ "$pression3" == true ]; then
          # tri abr(2)
          # tri abr(1)
     fi
     if [ "$vent" == true ]; then
          # tri abr(1)
     fi
     if [ "$altitude" == true ]; then
          # tri abr(14) décroissant !
     fi
     if [ "$humidite" == true ]; then
          # tri abr(6) décroissant !
     fi
fi

#avl
if [ "$avl" == true ] || ([ "$abr" == false ] && [ "$avl" == false ]); then
     if [ "$temperature1" == true ]; then
          # tri avl(1)
     fi
     if [ "$temperature2" == true ]; then
          # tri avl(2)
     fi
     if [ "$temperature3" == true ]; then
          # tri avl(2)
          # tri avl(1)
     fi
     if [ "$pression1" == true ]; then
          # tri avl(1)
     fi
     if [ "$pression2" == true ]; then
          # tri avl(2)
     fi
     if [ "$pression3" == true ]; then
          # tri avl(2)
          # tri avl(1)
     fi
     if [ "$vent" == true ]; then
          # tri avl(1)
     fi
     if [ "$altitude" == true ]; then
          # tri abr(14) décroissant !
     fi
     if [ "$humidite" == true ]; then
          # tri abr(6) décroissant !
     fi
fi



echo -e "\n\t\tDONE\n"

return 0
