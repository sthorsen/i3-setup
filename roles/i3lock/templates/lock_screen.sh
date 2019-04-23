#!/bin/bash

# Take a screenshot
#scrot /tmp/screen_locked.png

# Pixellate it 10x
#mogrify -scale 10% -scale 1000% /usr/share/backgrounds/yamasaki.png

# Lock screen displaying this image.
#i3lock -i /usr/share/backgrounds/yamasaki.png


# set the icon and a temporary location for the screenshot to be stored
#icon='/usr/share/backgrounds/yamasaki.png'
#tmpbg='/usr/share/backgrounds/yamasaki.png'


# lock the screen with the blurred screenshot
#i3lock -i /usr/share/backgrounds/yamasaki.png
resolution=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
convert -resize ${resolution} {{ background_dir}}/{{ background }} /tmp/background.png
# overlay the icon onto the screenshot
#convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

~/i3_scripts/manage_conky.sh &
i3lock -e -f -i /tmp/background.png -a {{ src_dir }}/emojis/ -n; ~/i3_scripts/manage_conky.sh
