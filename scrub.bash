#!/bin/bash

# Copyright (c) 2014 Bartosz Szczesny <bszcz@bszcz.org>
# This program is free software under the MIT license.

URL=http://
LAST=66

curl $URL | grep -E "Views|class=\"title\"" > scrub.txt

for i in {2..$LAST}; do
	echo $i; curl $URL/$i/ | grep -E "Views|class=\"title\"" >> scrub.txt
done
