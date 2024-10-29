#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-4"
theme='style'

# CMDs
# uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown=''
reboot=''
lock=''
suspend='󰤄'
# suspend=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "" \
		-theme ${dir}/${theme}.rasi
		# -mesg "Uptime: $uptime" \
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$suspend\n$logout\n$lock" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		playerctl pause && hyprlock || hyprlock
        ;;
    $suspend)
		systemctl suspend
        ;;
    $logout)
		hyprctl dispatch exit
        ;;
esac