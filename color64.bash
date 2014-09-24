#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

tmp1x1pgm=tmp1x1.pgm
tmp1x1ppm=tmp1x1.ppm

for image in $@; do
	convert -resize 1x1 $image $tmp1x1pgm &
	convert -resize 1x1 $image $tmp1x1ppm &
	wait
	hex1x1pgm=$(tail -n1 $tmp1x1pgm | hexdump -v -e '/1 "%02X"')
	hex1x1ppm=$(tail -n1 $tmp1x1ppm | hexdump -v -e '/1 "%02X"')
	echo $hex1x1pgm $hex1x1ppm $image
done

rm $tmp1x1pgm
rm $tmp1x1ppm
