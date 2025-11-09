#!/bin/bash

if [ -z "$1" ]; then
	echo "Erreur : chaîne vide."
	exit 1
fi

if ! [[ "$1" =~ ^[A-Za-z]+$ ]]; then
	echo "Erreur : n'est pas une chaîne de caractères."
	exit 1
fi

if [ $# -ne 1 ]; then
	echo "Erreur : le nombre d'argument n'est pas correct."
	exit 1
fi



curl https://wttr.in/$1 >> "/c/Users/kylia/OneDrive/Bureau/L2 MIASHS/ProjetConfig/local.txt"
