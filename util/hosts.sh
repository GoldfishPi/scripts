selection=`grep -o '[a-z\.]*.lol' /etc/hosts | dmenu -i -l 20`

[ -z $selection ] && exit

exec firefox $selection

