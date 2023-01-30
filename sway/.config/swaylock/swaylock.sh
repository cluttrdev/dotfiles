#!/bin/sh

set -eu

command -v grim > /dev/null 2>&1 || echo "Requires grim to grab screenshot for lockscreen image"
command -v convert > /dev/null 2>&1 || echo "Requires ImageMagick to generate lockscreen image"

# swaylock does not natively support displaying an image accross multiple screens,
# so we iterate over all active outputs, take a screenshot of each of them and
# invoke swaylock with a separate image for each output
args=""
images=""
for output in $(swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name')
do
	image=/tmp/${output}-swaylock.png

	# grab screenshot and add blur
	grim -o ${output} - | convert - -scale 25% -blur 0x2 -scale 400%  -fill black -colorize 50% ${image}

	args="${args} --image ${output}:${image}"
	images="${images} ${image}"
done

# run swaylock
swaylock $args $@

# cleanup temporary files
rm ${images}
