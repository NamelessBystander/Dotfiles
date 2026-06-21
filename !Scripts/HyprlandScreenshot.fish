#!/usr/bin/env fish
set FILE $(grimblast copysave area $HOME/Media/Pictures/Screenshots/screenshot_(date +'%Y-%m-%d_%H:%M:%S').png)

if test -n "$FILE"
       notify-send "Screenshot Copied" "Saved under ~/Media/Pictures/Screenshots/$(basename $FILE)" -i "$FILE" -a "Hyprland"
end
