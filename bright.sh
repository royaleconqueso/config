#!/bin/bash
export LC_ALL=C

readarray -t SCREENS < <(xrandr --listmonitors | grep "^ [0-9]\+: " | cut -d ' ' -f 6)
[[ ${#SCREENS[@]} > 0 ]] || exit 1

CURBRIGHT="$(xrandr --current --verbose | awk 'on { if ($0 ~ /^\tBrightness: /) { print $2 } else if ($0 ~ /^\t/) { next } exit } /^[[:graph:]]+ connected primary/ { on=1 }')"
[ -n "$CURBRIGHT" ] && CURBRIGHT="$(bc 2> /dev/null <<< "scale=0; ($CURBRIGHT * 100)/1")" || CURBRIGHT=100

function setbright {
    local BRIGHT="$(bc <<< "scale=1; $1 / 100")"
    for SCREEN in "${SCREENS[@]}"; do
        xrandr --output "$SCREEN" --brightness "$BRIGHT"
    done
}

ICON_PATH=""
[ ! -x "$(which gtk-icon-path)" ] || ICON_PATH="$(gtk-icon-path display-brightness-symbolic 256 2> /dev/null)"
[ -n "$ICON_PATH" ] || ICON_PATH="question"

printf "Current brightness: %4d%%\n" "$CURBRIGHT"
printf "\rBrightness: %4d%%" "$CURBRIGHT"
setbright "$CURBRIGHT"

zenity --scale --print-partial \
    --title="X RandR Brightness" \
    --text="Set brightness to..." \
    --window-icon="$ICON_PATH" \
    --min-value=10 --max-value=1000 --step=10 \
    --value="$CURBRIGHT" 2> /dev/null \
    | while read BRIGHT; do
        printf "\rBrightness: %4d%%" "$BRIGHT"
        setbright "$BRIGHT"
    done

if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    printf "\nReset brightness: %4d%%" "$CURBRIGHT"
    setbright "$CURBRIGHT"
fi
echo
