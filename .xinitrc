#!/usr/bin/env bash

user_resources=$HOME/.Xresources
pywal_resources=$HOME/.cache/wal/colors.Xresources
user_modmap=$HOME/.Xmodmap
sys_resources=/etc/X11/xinit/.Xresources
sys_modmap=/etc/X11/xinit/.Xmodmap

if [ -f $sys_resources ]; then
  xrdb -merge $sys_resources
fi

if [ -f $sys_modmap ]; then
  xmodmap $sys_modmap
fi

if [ -f "$user_resources" ]; then
  xrdb -merge "$user_resources"
fi

if [ -f "$pywal_resources" ]; then
  xrdb -merge "$pywal_resources"
fi

if [ -f "$user_modmap" ]; then
  xmodmap "$user_modmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# include all fonts in /usr/share/fonts
for dir in /usr/share/fonts ; do
  if [ -d "$dir"  ]; then
    pushd $dir
    mkfontdir
    mkfontscale
    xset +fp "$PWD"
    popd
  fi
done

xset +fp $HOME/.local/share/fonts/

xset fp rehash

xrandr
sleep 1

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . $HOME/.xprofile

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

export SUDO_ASKPASS=/usr/lib/ssh/x11-ssh-askpass

# run local xhost
xhost local:root

exec bspwm >> ~/.bspwm/logfile 2>&1
