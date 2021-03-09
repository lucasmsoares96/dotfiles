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


export _JAVA_AWT_WM_NONREPARENTING=1
export LANG="pt_BR.UTF-8"
export LC_ALL="pt_BR.UTF-8"

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_IM_MODULE=xim

export GDK_DPI_SCALE=1
export GTK_IM_MODULE=xim          # Make compose key work

export PATH="$HOME/scripts:$PATH" #dmenu
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="/opt/flutter/bin:$PATH"
export PATH="/opt/android-studio/bin:$PATH"


# Autostart section
#pcmanfm &

zathura /home/lucas/Engenharia_de_Computacao/4_periodo/ENGENHARIA_COMPUTAÇÃO_15-12-20_2020-2.pdf &
alacritty -e vifm &
st -e weechat &
teams &
#thunderbird &
qbittorrent &
discord &
chromium --app="https://web.whatsapp.com/" &
chromium --app="https://mail.google.com/mail/u/0/#inbox" &
chromium --app="https://outlook.live.com/mail/inbox" &
chromium --app="https://calendar.google.com/calendar/u/0/r" &
chromium --app="https://pomofocus.io/" &

exec dwm
