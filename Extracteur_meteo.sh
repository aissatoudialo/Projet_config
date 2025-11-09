#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage : $0 <ville>"
	exit 1
fi
VILLE="$1"
FICHIER_BRUT="meteo_brut.txt"
curl -s "https://wttr.in/${VILLE}?format=j1" -o "$FICHIER_BRUT"
echo "Donnees meteo  sauvegarde dans $FICHIER_BRUT"
TEMP_ACTUELLE=$(jq -r '.current_condition[0].temp_C' "$FICHIER_BRUT")
TEMP_DEMAIN=$(jq -r '.weather[1].avgtempC' "$FICHIER_BRUT")
if [ -z "$TEMP_ACTUELLE" ] || [ -z "$TEMP_DEMAIN" ]; then
	echo " impossible d'extraire"
	exit 1
fi
echo "Temperature actuelle : ${TEMP_ACTUELLE}C"
echo "Temperature prevue demain : ${TEMP_DEMAIN}C"
