#!/bin/bash
# .bashrc

source ~/.source_files

# if a file starts with / don't prepend $HOME
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
# .common configurable functions
