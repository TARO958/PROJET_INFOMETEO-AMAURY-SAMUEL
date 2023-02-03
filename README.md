# Projet filtered french meteo data

The program we present allows the filtering, sorting and analysis of French meteorological data collected between 2010 and 2022.
It will result in different schemes adapted to the user's request

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Realisation](#Realisation)
- [Author](#author)

## Installation


- Step 1 )  access the folder containing the files with the 'cd' command

''' 

    cd path/to/your/project/directory

'''

- Step 2 )  execute the makefile with the 'make' command

''' 

    make

'''

- Step 3 )  run the program with the execution command 'main.sh


    ./Main.sh


## Usage

Example usage : nom_script.sh [-f nom_fichier.csv] [-t<mode>] [-w] [-p<mode>] [-m] [-h] [-G] [--abr] --

  ###  PARAMETER FILE [ REQUIRED | MAXIMUM : 1]
- f : weather data file, a csv file

  ###  DATA PARAMETER [ REQUIRED | NO LIMIT ]
- t(mode) : Display temperature data, 3 modes available, one mode is required
    - t1) sort by station ID
    - t2) sort by chronological order of data
    - t3) sorting in chronological order and then in data order
- p(mode) : Display data on pressure, 3 modes available, one mode is necessary
    - p1) sort by station ID
    - p2) sort by chronological order of data
    - p3) sorting in chronological order and then in data order
- w : Display wind data
- m : Displays humidity data
- h : Displays altitude data

  ###  GEOGRAPHICAL PARAMETER [ NOT REQUIRED | MAXIMUM : 1]
- F : Displays data from France and Corsica
- G : Displays data from Guyana
- A : Displays data from West Indies
- O : Displays data from French territories in the Indian Ocean
- S : Displays data from Saint Pierre and Miquelon
- A : Displays data from the French Astral Lands

  ###  SORTING PARAMETERS [ NOT REQUIRED | MAXIMUM : 1 | DEFAULT : AVL ]
- tab : Bubble sort
- abr : Binary tree sorting
- avl : Sort by binary search tree
 
##### Please conclude your order with : --

## Realisation

### the program is composed of :
- Main.sh
- Avl.c
- Abr.c
- Tab.c
- Makefile
- ReadME.md
- compte_rendu.pdf

## Author

### Samuel Zerrouk
- email : zerrouksam@cy-tech.fr

### Amaury Provent 
- email : proventama@cy-tech.fr

#### PréING 2 MI Groupe 4

![logo CyTech](https://upload.wikimedia.org/wikipedia/commons/4/4a/CY_Tech.png)


