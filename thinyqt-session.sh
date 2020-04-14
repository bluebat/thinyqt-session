#!/bin/sh
export XDG_CURRENT_DESKTOP=ThinyQt
export DESKTOP_SESSION=thinyqt
/usr/libexec/notification-daemon &
touch $HOME/.xsettingsd
xsettingsd &
mkdir -p $HOME/.qshutdown
[ -f $HOME/.fehbg ] || cp /usr/share/thinyqt-session/fehbg $HOME/.fehbg
[ -f $HOME/.qshutdown/qshutdown.conf ] || cp /usr/share/thinyqt-session/qshutdown.conf $HOME/.qshutdown/

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

[ -x $HOME/.fehbg ] && $HOME/.fehbg
eggwm &
#quickterminal &
nm-tray &
#blueman-applet &
kmix &
memtray &
qshutdown &
qscreenshot &
exec hdepanel
