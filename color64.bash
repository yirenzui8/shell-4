#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

tmp_pgm=onepix.pgm
tmp_ppm=onepix.ppm

for image in $@; do
	convert -resize 1x1 $image $tmp_pgm &
	convert -resize 1x1 $image $tmp_ppm &
	wait
	pixel_pgm=$(tail -n1 $tmp_pgm | hexdump -v -e '/1 "%02X"')
	pixel_ppm=$(tail -n1 $tmp_ppm | hexdump -v -e '/1 "%02X"')
	echo $pixel_pgm $pixel_ppm $image
done

rm $tmp_pgm
rm $tmp_ppm
