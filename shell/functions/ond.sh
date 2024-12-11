#!/bin/bash

# Define variables
OBSIDIAN_VAULT_PATH="/Users/dennis.lemm/Repositories/private/zettelkasten/"
TEMPLATE_PATH="${OBSIDIAN_VAULT_PATH}/05 - Templates/Daily.md"
YEAR=`date +%Y`
MONTH=`date +%m`
TODAY=`date +%Y-%m-%d`
DAILY_NOTES_PATH="${OBSIDIAN_VAULT_PATH}/04 - Daily/${YEAR}/${MONTH}"
DAILY_NOTE="${DAILY_NOTES_PATH}/${TODAY}.md"

# Check if the daily note already exists
if [ ! -f "$DAILY_NOTE" ]; then
    # Create year and month based path if it does not exists.
    mkdir -p "$DAILY_NOTES_PATH"
    # Kopieren der Vorlage zur täglichen Notizdatei
    cp "$TEMPLATE_PATH" "$DAILY_NOTE"
    echo "Daily note for $TODAY created in ${DAILY_NOTES_PATH}."
else
    echo "Daily note for $TODAY already exists in ${DAILY_NOTES_PATH}."
fi
