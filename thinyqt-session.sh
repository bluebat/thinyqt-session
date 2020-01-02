#!/bin/sh
export DESKTOP_SESSION=thinyqt
/usr/libexec/notification-daemon &
[ -f $HOME/.xsettingsd ] || /usr/share/thinyqt-session/settings.sh
xsettingsd &
mkdir -p $HOME/.config/qtpanel $HOME/.config/nitrogen $HOME/.config/sxhkd
[ -f $HOME/.config/qtpanel/qtpanelrc ] || cp /usr/share/thinyqt-session/qtpanelrc $HOME/.config/qtpanel/
[ -f $HOME/.config/nitrogen/bg-saved.cfg ] || cp /usr/share/thinyqt-session/bg-saved.cfg $HOME/.config/nitrogen/
[ -f $HOME/.config/sxhkd/sxhkdrc ] || cp /usr/share/thinyqt-session/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
[ -f $HOME/.qshutdown ] || cp /usr/share/thinyqt-session/qshutdown $HOME/.qshutdown

start-pulseaudio-x11
imsettings-switch -n -q -x

[ -x $HOME/.xprofile ] && $HOME/.xprofile
#examples in .xprofile
# xrandr -o left
# xset -dpms
# xset s off
# xbacklight -set 100
# gsettings set org.gnome.desktop.interface gtk-theme Bluecurve
# gsettings set org.gnome.desktop.wm.preferences theme Bluecurve
# synclient touchpadoff=`lsusb|grep -i mouse|wc -l`
# x11vnc -forever -repeat -passwd ******** &
# parcellite &
# $HOME/.dropbox-dist/dropboxd &
# $HOME/.TelegramDesktop/Telegram -noupdate &

nitrogen --restore
qtpanel &
yakuake &
nm-tray &
#blueman-applet &
volumeicon &
memtray &
qshutdown &
sxhkd &
exec eggwm
