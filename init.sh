#!/bin/sh

xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add control = 0x1234'
xmodmap -e 'keycode any = Return'
xcape -t 250 -e '0x1234=Return'
xcape -t 250 # caps to ESC
# exec gnome-session --session xmonad "$@"
