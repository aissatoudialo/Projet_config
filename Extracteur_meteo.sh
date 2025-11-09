#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage : $0 <ville>"
	exit 1
fi
VILLE="$1"
FICHIER_BRUT="meteo_brut.txt"
curl -s "https://wttr.in/${VILLE}?format=j1" -o "$FICHIER_BRUT"
echo "Donnees meteo  sauvegarde dans $FICHIER_BRUT"
