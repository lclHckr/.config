# Set some variables
wall_dir="${HOME}/pictures/wallpapers/"
cacheDir="${HOME}/.cache/jp/${theme}jp"
rofi_command="rofi -dmenu -theme ~/.config/rofi/style.rasi -show filebrowser -filebrowser-command 'feh --bg-scale' -filebrowser-directory ~/pictures/wallpapers/ -show-icons"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
    mkdir -p "${cacheDir}"
fi

# Select a picture with rofi
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | sort | while IFS= read -r file; do
    filename=$(basename "$file")
    echo -en "$filename\x00icon\x1f$file
"
done | $rofi_command)

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
cp "${wall_dir}${wall_selection}" ~/pictures/wallpapers/.current_wallpaper
swww img "${wall_dir}/${wall_selection}" --transition-type=outer

exit 0