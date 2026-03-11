#!/usr/bin/env fish
# Take the screenshot and store the output path in a variable
# grimblast outputs the path to the file when using 'copysave'
set FILE (grimblast copysave area $HOME/Media/Pictures/Screenshots/screenshot_(date +'%Y-%m-%d|%H:%M:%S').png)

# Check if the file path is not empty (e.g., if you didn't escape/cancel)
if test -n "$FILE"
       notify-send "Screenshot Copied" "Saved under ~/Media/Pictures/Screenshots/$(basename $FILE)" -i "$FILE" -a "Hyprland"
end
