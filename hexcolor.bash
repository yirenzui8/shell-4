#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

tmp1x1pgm=tmp1x1.pgm
tmp1x2pgm=tmp1x2.pgm
tmp1x1ppm=tmp1x1.ppm
tmp1x2ppm=tmp1x2.ppm

for image in $@; do
	# \! = force resize, ignore aspect ratio
	convert -resize 1x1\! $image $tmp1x1pgm &
	convert -resize 1x2\! $image $tmp1x2pgm &
	convert -resize 1x1\! $image $tmp1x1ppm &
	convert -resize 1x2\! $image $tmp1x2ppm &
	wait
	hex1x1pgm=$(tail -n+4 $tmp1x1pgm | hexdump -v -e '/1 "%02X"')
	hex1x2pgm=$(tail -n+4 $tmp1x2pgm | hexdump -v -e '/1 "%02X"')
	hex1x1ppm=$(tail -n+4 $tmp1x1ppm | hexdump -v -e '/1 "%02X"')
	hex1x2ppm=$(tail -n+4 $tmp1x2ppm | hexdump -v -e '/1 "%02X"')
	echo $hex1x1pgm $hex1x2pgm $hex1x1ppm $hex1x2ppm $image
	rm $tmp1x1pgm
	rm $tmp1x2pgm
	rm $tmp1x1ppm
	rm $tmp1x2ppm
done

