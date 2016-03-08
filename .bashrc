# .bashrc
for i in "/etc/bashrc" "~/.aliases"; do 
	if [[ -f $i ]]; then
		. $i
	fi
done
 
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#shopt -s dotglob extglob lithist
export EDITOR="$(type -P vim)"
export VISUAL="$EDITOR" 
export PATH="${PATH}:/opt/firefox-dev" 
