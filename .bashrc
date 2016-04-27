#!/bin/bash
# .bashrc

SOURCE_FILES=(
	"/etc/bashrc"
	".common" # Common needs to be before aliases
	".aliases"
) 

for i in "${SOURCE_FILES[@]}"; do 
	if [[ -e "$i" ]]; then
		source "$i"
	fi
done
 
FIREFOX_DEV_PATH="/opt/firefox-dev"
if [[ -d "$FIREFOX_DEV_PATH" ]]; then 
	export PATH="${PATH}:/opt/firefox-dev"
fi
