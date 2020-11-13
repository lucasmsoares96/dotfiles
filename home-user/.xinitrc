xrdb -merge ~/.Xresources
xrandr --dpi 192
nitrogen --restore &

while true; do
BAT=$(acpi | awk '{ print $4 }' | sed s/","//g)
DATE=$(date +"%F" )
CLK=$(date +"%R" )
xsetroot -name "   $BAT    $DATE    $CLK "
#xsetroot -name "$CLK"
sleep 1
done &


xbindkeys &

#[ -f ~/.xprofile ] && . ~/.xprofile

#setxkbmap us -variant alt-intl
xmodmap -e "keycode 48 = dead_acute quotedbl acute acute apostrophe"

xinput --set-prop bcm5974 'libinput Natural Scrolling Enabled' 1
xinput --set-prop bcm5974 'libinput Accel Speed' 0.3
xinput --set-prop "USB Optical Mouse" 'libinput Natural Scrolling Enabled' 1


export _JAVA_AWT_WM_NONREPARENTING=1
export LANG="pt_BR.UTF-8"
export LC_ALL="pt_BR.UTF-8"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_DPI_SCALE=1
export GTK_IM_MODULE=xim          # Make compose key work
export QT_IM_MODULE=xim

export PATH="$HOME/scripts:$PATH" #dmenu
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/flutter/bin:$PATH"

# Autostart section
#pcmanfm &

firefox https://web.whatsapp.com/ &
alacritty -e vifm &
st -e weechat &
teams &
thunderbird &
qbittorrent &
discord &
zathura /home/lucas/Engenharia_de_Computacao/3_periodo/Horario-Computação-2020-1-ERE.pdf &

exec dwm
