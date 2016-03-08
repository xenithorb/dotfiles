# .bashrc

SOURCE_FILES=(
	"/etc/bashrc"
	"~/.aliases"
	"~/.common"
) 

for i in "${SOURCE_FILES[@]}"; do 
	if [[ -f "$i" ]]; then
		. "$i"
	fi
done
 
FIREFOX_DEV_PATH="/opt/firefox-dev"
if [[ -d "$FIREFOX_DEV_PATH" ]]; then 
	export PATH="${PATH}:/opt/firefox-dev"
fi 

