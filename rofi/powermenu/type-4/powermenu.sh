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

was_ags_opened="false"

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

toggle_ags_on_open() {
  if [ "$(ags -r "isWindowVisible('bar-0')")" = "true" ]; then
    ags -t bar-0 # hide ags panel
    was_ags_opened="true"
  else
    was_ags_opened="false"
  fi
}

toggle_ags_on_close() {
  if [ "$was_ags_opened" = "true" ]; then
    ags -t bar-0 # hide ags panel
  fi
}

# Actions
toggle_ags_on_open

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

toggle_ags_on_close
