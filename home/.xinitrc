ifstat -t 1 -d 1
setxkbmap -option caps:escape
dunst &
xrdb .Xresources
nitrogen --restore &
dwmblocks &
exec dwm
