xrdb -merge ~/.Xresources
xrandr --dpi 192
nitrogen --restore &
polkit-dumb-agent &
udiskie &
dunst &
emacs --daemon &

export LANG="pt_BR.UTF-8"
export LC_ALL="pt_BR.UTF-8"

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

xmodmap -e "keycode 48 = dead_acute quotedbl acute acute apostrophe"

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

source scripts/exports.sh
source scripts/start.sh

xset r rate 210 60

exec dwm
