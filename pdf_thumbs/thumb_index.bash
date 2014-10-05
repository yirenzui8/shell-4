#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

echo "<html><body>" > index.html

\ls --color=never -1 *.pdf | while read pdf; do
	echo "<a href=$pdf>$pdf</a><br><br>" >> index.html

	\ls --color=never -1 "thumbs/${pdf%.pdf}"*jpg | while read thumb; do
		echo -e "\t<img src=$thumb border=1px> " >> index.html
	done

	echo "<br><hr>" >> index.html
done

echo "</html></body>" >> index.html
