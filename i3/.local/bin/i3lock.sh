#!/bin/sh

set -eu

command -v scrot > /dev/null 2>&1 || echo "Reuires scrot to grab screenshot for lockscreen image."
command -v convert > /dev/null 2>&1 || echo "Requires imagemagick to generate lockscreen image."

IMAGE=/tmp/i3lock.png

# capture snapshot and add blur
scrot - | convert - -scale 25% -blur 0x2 -scale 400% -fill black -colorize 50% ${IMAGE}

# run lock command
i3lock -i $IMAGE $@

# cleanup temporary files
rm ${IMAGE}
