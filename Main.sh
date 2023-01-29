#!/bin/bash


# # #     VARIABLE     # # #

Arg_Obligatoire=false
Arg_Tri=false
file=""
Lieux=false
#file="meteo_filtered_data_v1.csv"

######################################################
# PROGRAM CONFORT                                    #
VerifTmp="tmp.csv"                                   #
                                                     #
if [ $VerifTmp ]                                     #
then                                                 #
     rm "tmp.csv"                                    #
     #rm -r ~/.local/share/Trash/*                   #
     #echo "!!! tmp has been remove !!!"              #
fi                                                   #
# TROFNOC MARGORP                                    #
######################################################


### Usage ###

usage() {
  echo "Utilisation : nom_script.sh [-f|--fichier nom_fichier.csv] [-t|--temperature MODE] [-w|--vent] [-p|--pression MODE] [-m|--humidité] [-h|--altitude]"
  echo "  -f : fichier de donnée meteo"
  echo "  -t : Affiche les données sur la temperature"
  echo "  -p : Affiche les données sur la pression"
  echo "  -w : Affiche les données sur le vent"
  echo "  -m : Affiche les données sur l'humidité"
  echo "  -h : Affiche les données sur l'altitude"
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

triVerifINF() {
     if [ "$Arg_Tri" == true ]; then
          echo "  Il y'a plusieurs argument de tri." >&2
          exit 1
     fi
}

triverifSUP() {
     if [ "$Arg_Tri" == false ]; then
          echo "  Il manque un argument de tri." >&2
          exit 1
     fi
}

ObligatoirVerif() {
     if [ $Arg_Obligatoire == false ]; then 
          echo "  Il n'a pas de type de données demander." >&2
          exit 1
     fi
}

LieuxVerif() {
     if [ "$Lieux" == false ]; then
          echo "  Il manque un lieu en argument." >&2
          exit 1
     fi
}

### --- ------ ###



### Options ###

OPTIONS=$(getopt -o f:t1:t2:t3:p1:p2:p3:w:m:h:F:G:S:A:O:Q:d: --long tab:,abr:,avl: -- "$@")

eval set -- "$OPTIONS"

while true; do
     case $1 in
     -f)
          file="$2"
               if [[ $file != *.csv ]]; then
               echo "Le fichier doit être un fichier .csv" >&2
               exit 1
          fi
          shift 2
          ;;
     -t1)
          temperature1=true
          Arg_Obligatoire=true
          shift 
          ;;
     -t2)
          #temperature2=true
          Arg_Obligatoire=true
          shift 
          ;;
     -t3)
          #temperature3=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p1)
          #pression1=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p2)
          #pression2=true
          Arg_Obligatoire=true
          shift 
          ;;
     -p3)
          #pression3=true
          Arg_Obligatoire=true
          shift 
          ;;
     -w)
          #vent=true
          Arg_Obligatoire=true
          shift 
          ;;
     -m)
          #humidité=true  
          Arg_Obligatoire=true
          shift 
          ;;
     -h)
          #altitude=true
          Arg_Obligatoire=true
          shift 
          ;;
     -F)
          #France=true
          Lieux=true
          shift 
          ;;
     -G)
          #Guyane=true
          Lieux=true
          shift 
          ;;
     -S)
          #StMic=true
          Lieux=true
          shift 
          ;;
     -A)
          #Antilles=true
          Lieux=true
          shift 
          ;;
     -O)
          #OceanIndien=true
          Lieux=true
          shift 
          ;;
     -Q)
          #Antartique=true
          Lieux=true
          shift 
          ;;
     -d)
          #DateMin=$2
          #DateMax=$3
          #date=true
          shift 3
          ;;
     --tab)
          triVerifINF
          #tab=true
          Arg_Tri=true
          shift 
          ;;
     --abr)
          triVerifINF
          #altitude=true
          Arg_Tri=true
          shift 
          ;;
     --avl)
          triVerifINF
          #altitude=true
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
LieuxVerif
triverifSUP

### ------- ###



# echo "Argument inscrit : $*"



###  Verification argument  ###

echo "  Arguments understood"

#tri pour la temperature
if [ "$temperature1" == true ]
then
     # cut -d';' -f1 $file > tmp.csv
     awk -F ";" '{print $0,$10,$11,$12}' "$file" >> tmp.csv
     echo "    DONE"
fi





################ BROUILLON ####################


# [ $# -ge i ]; vérifie si l'argument "i" existe par comparaison des nombre d'arguments


# "t") cut -d';' -f11 meteo_filtered_data_v1.csv # mode 1, 2, 3

# "p") cut -d';' -f3 meteo_filtered_data_v1.csv # mode 1, 2, 3
            
# "w") cut -d';' -f4 meteo_filtered_data_v1.csv
            
# "m") cut -d';' -f6 meteo_filtered_data_v1.csv # décroissant
            
# "h") cut -d';' -f14 meteo_filtered_data_v1.csv # décroissant