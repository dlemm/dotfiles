#!/bin/bash

# Prüfen, ob beide Argumente (Eingabe- und Ausgabeverzeichnis) übergeben wurden
if [ "$#" -ne 2 ]; then
    echo "Benutzung: ./compress.sh <input_folder> <output_folder>"
    exit 1
fi

# Argumente erfassen
INPUT_FOLDER=$1

# Prüfen, ob das Eingabeverzeichnis existiert
if [ ! -d "$INPUT_FOLDER" ]; then
    echo "Fehler: Eingabeverzeichnis '$INPUT_FOLDER' existiert nicht."
    exit 1
fi

# TinyPNG CLI aufrufen
tinypng --key $TINYPNG_API_KEY "$INPUT_FOLDER" "~/Pictures/tinypng_output/"

echo "Bilder wurden komprimiert und nach '$OUTPUT_FOLDER' verschoben."
