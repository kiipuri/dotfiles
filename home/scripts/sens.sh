#!/bin/sh

#mouse="$(xinput list | grep "slave  pointer" | sed 's/^⎜   ↳ //g' | sed 's/id=.*//g' | sed 's/	/  /g' | sed 's/\s\{2,\}.*//g' | dmenu -c -l 10 -p "Select your mouse")"

SAVEIFS=$IFS
IFS=$'\n'
devices=$(xinput list | sed 's/^.\+=//g' | awk '{print $1}')
mice=()

for d in $devices
do
    if [ ! -z "$(xinput list-props $d | grep "libinput Accel Speed")" ]; then
        dname="$(xinput list-props $d | head -n1 | grep -o "'.*'" | sed "s:'::g")"
        #echo $dname
        mice+=("$dname")
    fi
done

mouse=$(printf "%s\n" "${mice[@]}" | dmenu -c -l 10 -p "Select your mouse")
echo $mouse

while true; do
    cursens="$(xinput list-props "$mouse" | grep "libinput Accel Speed (" | awk '{print $5}')"
    result="$(echo -e "+0.05\n-0.05\nExit" | dmenu -c -l 3 -p "Current sens is $cursens. Add/substract from sens")"

    if [ $result = "Exit" ]; then
        break
    elif [ $result = "+0.05" ]; then
        newsens=$(python -c "print($cursens + 0.05)")
    elif [ $result = "-0.05" ]; then
        newsens=$(python -c "print($cursens - 0.05)")
    fi
    
    xinput set-prop "$mouse" "libinput Accel Speed" $newsens
done
