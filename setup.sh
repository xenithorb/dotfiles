#!/bin/bash
#
# Setup script for 'dotfiles' repo.
# will create symlinks for files in the repo in ~/
#
#
# Needs symlinks to tidy up absolute positions
hash symlinks 2>/dev/null 2>&1 || { echo 'Go install symlinks!'; exit 1; }

# Comment this out or set 0 you don't want it to overwrite
# or remove the necessary files/directories
OVERWRITE=1

if [[ "$OVERWRITE" == 1 ]]; then
	rm_Owrite="-f"
	ln_Owrite="-f"
else
	rm_Owrite="-i"
	ln_Owrite="-i"
fi

RDIR="$(dirname "$0")"
ADIR="$(readlink -m "$RDIR")"

print_half_width_line() {
	print_line_with_name() {
		printf "\n%s\n%s\n%s\n" "${line}" "${1}" "${line}"
	}
	if [[ $line ]]; then
		print_line_with_name "$1"
	else
		line="$(eval printf '%.s-' {1..$(( $(tput cols)/2 ))})"
		print_line_with_name "$1"
	fi
}

print_half_width_line "BEGIN"

print_half_width_line "Directories:"
find "$RDIR" -mindepth 1 -maxdepth 1 -type d ! \( -name ".git" -o -path "*\.config" \) -exec sh -c 'rm '"$rm_Owrite"' -rv '"$HOME/"'$(basename {})' \;
find "$RDIR/.config" -mindepth 1 -maxdepth 1 -type d ! -name ".git" -exec sh -c 'rm '"$rm_Owrite"' -rv '"$HOME/.config/"'$(basename {})' \;

print_half_width_line "Files:"
find "$RDIR" -mindepth 1 -maxdepth 1 ! \( -name ".git" -a -name ".*" -o -path "*\.config" -o -name "setup.sh" \) -exec ln -sv "$ln_Owrite" "$ADIR/{}" "$HOME/" \;
find "$RDIR/.config" -mindepth 1 -maxdepth 1 -exec ln -sv "$ln_Owrite" "$ADIR/{}" "$HOME/.config/" \;

# Convert absolute links to relative links the right way
symlinks -dc ~/ &>/dev/null

print_half_width_line "Update git submodules:"
git submodule
git submodule init
git submodule update --remote

print_half_width_line "END"
