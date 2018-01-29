#!/bin/bash
# .bashrc
FIREFOX_DEV_PATH="/opt/firefox-dev"
source ~/.source_files

# if a file starts with / don't prepend $HOME
for i in "${!SOURCE_FILES[@]}"; do
	f="${SOURCE_FILES[i]}"
	if [[ "${f:0:1}" != '/' ]]; then
		f="${HOME}/${f}"
	fi
	if [[ -e "$f" ]]; then
		# shellcheck source=/dev/null
		source "$f"
	fi
done

# .common configurable functions
set_editor vim
