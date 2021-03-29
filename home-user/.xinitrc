xrdb -merge ~/.Xresources
xrandr --dpi 192
nitrogen --restore &
dunst &

while true; do
BAT=$(acpi | awk '{ print $4 }' | sed s/","//g)
DATE=$(date +"%F" )
CLK=$(date +"%R" )
WEEK=$(date +"%A" )
xsetroot -name "   $BAT    $WEEK $DATE    $CLK   "
#xsetroot -name "$CLK"
sleep 1
done &


xbindkeys &

#[ -f ~/.xprofile ] && . ~/.xprofile

#setxkbmap us -variant alt-intl
xmodmap -e "keycode 48 = dead_acute quotedbl acute acute apostrophe"

xinput --set-prop bcm5974 'libinput Natural Scrolling Enabled' 1
xinput --set-prop bcm5974 'libinput Accel Speed' 0.3
xinput --set-prop bcm5974 'libinput Accel Speed' 0
xinput --set-prop "USB Optical Mouse" 'libinput Natural Scrolling Enabled' 1

source scripts/exports.sh
source scripts/start.sh

exec dwm
