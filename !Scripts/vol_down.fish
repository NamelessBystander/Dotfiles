#!/usr/bin/fish
function vol_down
    # 1. Increase volume by 5% (capped at 100%)
    # Using wpctl (PipeWire)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

    # 2. Get the current volume level to display it
    # This extracts the decimal (e.g., 0.45) and converts it to a percentage (45)
    set vol_raw (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')

    # 3. Send/Update notification
    # We use a stack tag so it overwrites the previous volume bubble
    dunstify -h string:x-dunst-stack-tag:volume \
             -h int:value:$vol_raw \
             -u low \
			 -t 2000 \
             "Volume $vol_raw%"
end
vol_down
