#!/bin/sh

#output=$(cat /sys/class/net/enp5s0/operstate)

#if [$(cat /sys/class/net/enp5s0/operstate) = "up"]
#if [ "${output}" = "up" ]
#then
	#printf "Connected"
#elif [ "${output}" = "down" ]
#then
	#printf "Disconnected"
#fi

cpu () {
	cpu_str=" "$[100 - $(vmstat 1 2 | tail -1 | awk '{print $15}')]"%"
}

mem () {
	used=$(free | tail -2 | head -1 | awk '{print $3}')
	free=$(free | tail -2 | head -1 | awk '{print $2}')

	used_perc=$(bc -l <<< $used/$free*100)
	thing=$(printf %.0f $used_perc)"%"
	mem_str=" "$thing
}

arrow() {
    another="\ue0b2"
    epicstr="\x4$another\x3 $cpu_str \x6$another\x5 $mem_str \x8$another\x7 $date"
}


while true; do
	cpu
	mem
    arrow

	date=$(date +"%A, %d.%m.%Y %H:%M")
    time="  $(date +"%H:%M")"
    date2="  $(date +"%A, %d.%m.%Y")"

    xsetroot -name "$(echo -e "$date2 | $time")"

	sleep 2
done
