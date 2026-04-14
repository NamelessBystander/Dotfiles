#!/usr/bin/env fish
set -l timestamp (date +'%Y-%m-%d|%H:%M:%S')
set -l dir "$HOME/Media/Pictures/Screenshots"
mkdir -p -- "$dir"

set -l file_path "$dir/screenshot_$timestamp.png"

# ask slurp for a region and bail if cancelled
set -l region (slurp)

if test -z "$region"
    notify-send "Screenshot cancelled" "No region selected" -a "dwl"
    exit 1
end

# take the screenshot to a file, then copy the file to the clipboard
if grim -g "$region" "$file_path"
    if test -s "$file_path"
        # copy file contents to clipboard
        cat -- "$file_path" | wl-copy --type image/png
        if test $status -eq 0
            notify-send "Screenshot copied" "Saved to $file_path" -i "$file_path" -a "dwl"
        else
            notify-send "Clipboard error" "Saved $file_path but failed to copy to clipboard" -a "dwl"
        end
    else
        rm -- "$file_path"
        notify-send "Screenshot failed" "No file was created" -a "dwl"
    end
else
    notify-send "grim error" "Failed to make screenshot" -a "dwl"
end
