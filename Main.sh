#!/bin/bash


# # #     VARIABLE     # # #

Arg_Required=false
Arg_sort=false
file=""
Places=false
fileHere=false

# Variable Places :
France=false
Guyana=false
StMic=false
Antilles=false
OceanIndien=false
Antarctica=false

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
  echo " This program allows a filtering, sorting and displaying of weather data as a graph"
  echo -e "\n"
  echo "  Example usage: script_name.sh [-f filename.csv] [-t<mode>] [-w] [-p<mode>] [-m] [-h] [-G] [--abr] --"
  echo -e "\n"
  echo "        FILE PARAMETER [ REQUIRED | MAXIMUM : 1]"
  echo "  -f : weather data file, a csv file"
  echo -e "\n"
  echo "        DATA PARAMETER [ REQUIRED | NO LIMIT ]"
  echo "  -t<mode> : Display temperature data, 3 modes available, one mode is required"
  echo "       -t1) sort by station ID"
  echo "       -t2) sort by chronological order of the data"
  echo "       -t3) sort by chronological order and then by data"
  echo "   -p<mode> : Display pressure data, 3 modes available, one mode is required"
  echo "       -p1) sorting by station ID"
  echo "       -p2) sort by chronological order of the data"
  echo "       -p3) sort by chronological order and then by data"
  echo "  -w : Displays the wind data"
  echo "  -m : Displays height data"
  echo "  -h : Displays height data"
  echo -e "\n"
  echo "       GEOGRAPHICAL PARAMETER [ NOT REQUIRED | MAXIMUM: 1]"
  echo "   -F : Displays data for France and Corsica"
  echo "   -G : Displays the data for Guyana"
  echo "   -A : Displays data from the Antilles"
  echo "   -O : Displays data from French territories in the Indian Ocean"
  echo "   -S : Displays data from Saint Pierre et Miquelon"
  echo "   -A : Displays data from French Astral Lands"
  echo -e "\n"
  echo "       PARAMETRE TRIS [ PAS OBLIGATOIRE | MAXIMUM : 1 | DEFAULT : AVL ]"
  echo "   --tab : Sort with chained list"
  echo "   --abr : Sort by binary tree"
  echo "   --avl : Sort by binary search tree"
  echo -e "\n"   
  echo "   Please conclude your command with : --"
  echo -e "\n"   
}

if [ -z "$1" ]; then
     echo "  type --help to see the manual"
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
          echo "  There is no .csv file to enter" >&2
          exit 1
     fi
}

sortVerifINF() {
     if [ "$Arg_sort" == true ]; then
          echo "  There are several sorting arguments." >&2
          exit 1
     fi
}

sortVerifSUP() {
     if [ "$Arg_sort" == false ]; then
          avl=true
     fi
}

ObligatoirVerif() {
     if [ $Arg_Required == false ]; then 
          echo "  It has no data type request." >&2
          exit 1
     fi
}

PlacesVerif() {
     if [ "$Places" == true ]; then
          echo "  There is already a geographical variable" >&2
          exit 1
     fi
}

VerifModesP() {
     if [ "$modeP" == true ]; then
     echo "    error there are several times the variable -p<mode>" >&2
     exit 1
     fi
}


VerifModesT() {
     if [ "$modeT" == true ]; then
     echo "    error there are several times the variable -t<mode>" >&2
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
               echo "    The file must be a .csv file" >&2
               exit 1
          fi
          fileHere=true
          shift 2
          ;;
     -t)
          echo "    Error: the -t argument is missing the associate mode" >&2
          exit 1
          ;;
     -t1)
          VerifModesT
          modeT=true
          temperature1=true
          Arg_Required=true
          shift 
          ;;
     -t2)
          VerifModesT
          modeT=true
          temperature2=true
          Arg_Required=true
          shift 
          ;;
     -t3)
          VerifModesT
          modeT=true
          temperature3=true
          Arg_Required=true
          shift 
          ;;
     -p)
          echo "    Error: the -p argument is missing the associate mode" >&2
          exit 1
          ;;
     -p1)
          VerifModesP
          modeP=true
          pression1=true
          Arg_Required=true
          shift 
          ;;
     -p2)
          VerifModesP
          modeP=true
          pression2=true
          Arg_Required=true
          shift 
          ;;
     -p3)
          VerifModesP
          modeP=true
          pression3=true
          Arg_Required=true
          shift 
          ;;
     -w)
          wind=true
          Arg_Required=true
          shift 
          ;;
     -m)
          moisture=true  
          Arg_Required=true
          shift 
          ;;
     -h)
          height=true
          Arg_Required=true
          shift 
          ;;
     -F)
          PlacesVerif
          France=true
          Places=true
          shift 
          ;;
     -G)
          PlacesVerif
          Guyana=true
          Places=true
          shift 
          ;;
     -S)
          PlacesVerif
          StMic=true
          Places=true
          shift 
          ;;
     -A)
          PlacesVerif
          Antilles=true
          Places=true
          shift 
          ;;
     -O)
          PlacesVerif
          OceanIndien=true
          Places=true
          shift 
          ;;
     -Q)
          PlacesVerif
          Antarctica=true
          Places=true
          shift 
          ;;
     -d)
          DateMin=$2
          DateMax=$3
          date=true
          shift 3
          ;;
     --tab)
          sortVerifINF
          tab=true
          Arg_sort=true
          shift 
          ;;
     --abr)
          sortVerifINF
          abr=true
          Arg_sort=true
          shift 
          ;;
     --avl)
          sortVerifINF
          avl=true
          Arg_sort=true
          shift 
          ;;
     --)
          shift
          break
          ;;
     *)
          echo "Error: option not supported : $1" >&2
          exit 1
          ;;
     esac
done

ObligatoirVerif
sortVerifSUP
VerifFile

echo -e "\n\tFiltred file underconstruction"

### ------- ###



# # #  Filtering  # # #


# allows to define the geographical pattern if used 

if [ "$Places" == true ]; then
     if [ "$Guyana" == true ]; then
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
     if [ "$Antarctica" == true ]; then
          Pattern="61972|61976|61998"
     fi
     if [ "$France" == true ]; then
          Pattern="81408|81415|81401|81405|71805|78890|78897|78897|78922|78925|78894|61980|67005|61972|61976|61998"
     fi
fi


# Data

#function to reset temporary files to leave only a tmp.csv file
resetTmp() {
     if [ -f "tmptmp.csv" ] && [ -f "result.csv" ]; then
          rm tmptmptmp.csv
          rm tmptmp.csv
          rm tmp.csv
          mv result.csv tmp.csv
     fi
}

#function to choose which sort to perform and on which column 
sortAndJoin1() {
     awk -F ";" '{print $1 ";" $2 ";" $3}' "tmptmp.csv" >> tmptmptmp.csv
     if [ "$tab" == true ]; then
          # tri tab (1) tmptmptmp.csv
     elif [ "$abr" == true ]; then
          # tri abr (1) tmptmptmp.csv
     else 
          # tri avl (1) tmptmptmp.csv
     fi
     join -t ";" -1 1 -2 1 tmptmptmp.csv tmptmp.csv > tmptmp.csv
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp 
}

sortAndJoin2() {
     awk -F ";" '{print $1 ";" $2 ";" $3}' "tmptmp.csv" >> tmptmptmp.csv
     if [ "$tab" == true ]; then
          # tri tab (2) tmptmptmp.csv
     elif [ "$abr" == true ]; then
          # tri abr (2) tmptmptmp.csv
     else 
          # tri avl (2) tmptmptmp.csv
     fi
     join -t ";" -1 2 -2 2 tmptmptmp.csv tmptmp.csv > tmptmp.csv
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
}

sortAndJoin3() {
     awk -F ";" '{print $1 ";" $2 ";" $3}' "tmptmp.csv" >> tmptmptmp.csv
     if [ "$tab" == true ]; then
          # tri tab (3) tmptmptmp.csv
     elif [ "$abr" == true ]; then
          # tri abr (3) tmptmptmp.csv
     else 
          # tri avl (3) tmptmptmp.csv
     fi
     join -t ";" -1 3 -2 3 tmptmptmp.csv tmptmp.csv > tmptmp.csv
     join -t ";" -1 1 -2 1 tmp.csv tmptmp.csv >> result.csv
     resetTmp
}


     # Base
if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $10 ";" $15}' >> tmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $10 ";" $15}' >> tmp.csv
fi

     # t1 & t2 & t3 (temperature)
if [ "$temperature1" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     fi
     sortAndJoin1
fi

if [ "$temperature2" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     fi
     sortAndJoin2
fi

if [ "$temperature3" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $11 ";" $12 ";" $13}' >> tmptmp.csv
     fi
     sortAndJoin2
     sortAndJoin1
fi

     # p1 & p2 & p3 (pression)
if [ "$pression1" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     fi
     sortAndJoin1
fi

if [ "$pression2" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     fi
     sortAndJoin2
fi

if [ "$pression3" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $3 ";" $7 ";" $8}' >> tmptmp.csv
     fi
     sortAndJoin2
     sortAndJoin1
fi

     # heigh
if [ "$height" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $14}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $14}' >> tmptmp.csv
     fi
     sortAndJoin3
fi      

     # moisture
if [ "$moisture" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $6}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $6}' >> tmptmp.csv
     fi
     sortAndJoin3
fi      

     # wind
if [ "$wind" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $4 ";" $5}' >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" | awk -F ";" '{print $1 ";" $2 ";" $4 ";" $5}' >> tmptmp.csv
     fi
     sortAndJoin1
fi      


# Date

if [ "$date" == true ]
     then
     if [ "$France" == true ]; then
          grep -E -v "^$Pattern" "$file" >> tmptmp.csv
     else grep -E "ID|$Pattern" "$file" >> tmptmp.csv
     fi
fi      


echo -e "\n\t\tDONE\n"

return 0
