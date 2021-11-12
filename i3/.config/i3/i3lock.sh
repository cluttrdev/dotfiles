#!/bin/bash

OVERLAY_TEST="Type password to unlock"

BACKGROUND_IMAGE=/tmp/i3lock_bg.png
OVERLAY_IMAGE=/tmp/i3lock_overlay.png
LOCK_IMAGE=/tmp/i3lock.png

# capture snapshot of current workspace
scrot --overwrite $BACKGROUND_IMAGE

# add blur
convert $BACKGROUND_IMAGE -scale 25% -blur 0x2 -scale 400% -fill black -colorize 50% $BACKGROUND_IMAGE

[[ -f $1  ]] && convert $BACKGROUND_IMAGE $1 -gravity center -composite -matte $BACKGROUND_IMAGE

# add overlay image with text prompt
[ -f $OVERLAY_IMAGE  ] || {
    convert -size 1920x60 xc:black -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+0 'Type password to unlock' $OVERLAY_IMAGE;
}

# combine images
convert $BACKGROUND_IMAGE $OVERLAY_IMAGE -gravity center -geometry +0+200 -composite $LOCK_IMAGE

# run lock command
i3lock -i $LOCK_IMAGE
