#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

tmp=onepix.ppm

for image in $@; do
    convert -resize 1x1 $image $tmp
    pixel=$(tail -n1 $tmp | base64)
    echo $pixel $image
done

rm $tmp
