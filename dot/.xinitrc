export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

LANG=ja_JP.UTF-8

#一定時間で画面がOFFにならないようにする
xset s off        #BlankTimeをoff
xset dpms 0 0 0   #DPMSの機能をそれぞれoff


# gnome-terminal &
# xrdb $HOME/.Xresources
# xterm &
dbus-launch gnome-terminal
ruby /home/kokoax/.mybin/dwm-statusbar &
fcitx &

wallpaper_dir="$HOME/wallpaper" && feh --bg-scale $wallpaper_dir/`ls ${wallpaper_dir}  | shuf -n 1`
xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &

exec dwm

