#!/bin/bash
# .bashrc

SOURCE_FILES=(
	"/etc/bashrc" # if a file starts with / don't prepend $HOME
	".common" # Common needs to be before aliases
	".aliases"
)

for i in "${!SOURCE_FILES[@]}"; do
	f="${SOURCE_FILES[i]}"
	if [[ "${f:0:1}" != '/' ]]; then
		f="${HOME}/${f}"
	fi
	if [[ -e "$f" ]]; then
		source "$f"
	fi
done

FIREFOX_DEV_PATH="/opt/firefox-dev"
if [[ -d "$FIREFOX_DEV_PATH" ]]; then
	export PATH="${PATH}:/opt/firefox-dev"
fi
