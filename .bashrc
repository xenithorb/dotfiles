#!/bin/bash
# .bashrc

# Normally this would belong in .common, but this seriously benefits from being
# the first thing run, because visually, if it's run from .common there is an
# annoying delay in the konsole blurring
#if [[ $(ps --no-header -p $PPID -o comm) =~ (yakuake|konsole) ]]; then
#	for wid in $(xdotool search --pid $PPID); do
#		xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c \
#			-set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id "$wid"
#	done
#fi

# shellcheck disable=SC1090
source "$HOME/.source_files"

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
