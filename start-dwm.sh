#! /bin/bash
while true; do
    BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
    DATE=$(date)

	xsetroot -name "[$BATT%] [$STATUS] [$DATE]"
	sleep 2
done &

while type dwm >/dev/null ; do dwm && continue || break ; done &

exec $HOME/scripts/screen/wallpaper.sh &

exec picom
