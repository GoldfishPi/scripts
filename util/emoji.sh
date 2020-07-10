# emoji_name=`echo | dmenu -p "Emoji Name:" 🤣`
chosen=$(cut -d ';' -f1 $HOME/scripts/util/emoji-list | dmenu -i -l 30 | sed "s/ .*//")

[ -z "$chosen" ] && exit

if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
