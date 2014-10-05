#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

if [[ ! -d thumbs ]]; then
	mkdir thumbs
fi

\ls -1 *.pdf | while read pdf; do
	echo "$pdf"
	convert -background white -alpha remove -resize 210x300 -quality 50 "$pdf" "thumbs/${pdf%.pdf}"__%03d.jpg
done
