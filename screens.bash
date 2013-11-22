#!/bin/bash

# Copyright (c) 2013 Bartosz Szczesny
# LICENSE: The MIT License (MIT)

times="0300 0600 0900 1200 1500 1800 2100 2400 2700 3000 3300 3600" # times in seconds
for ss in $times; do
        pngfile="${1}_ss${ss}.png"
        avconv -v quiet -ss ${ss} -frames 1 -i ${1} ${pngfile}
        echo "${pngfile}"
done

jpgfile="${1}.jpg"
montage -tile 3 -geometry +0+0 -quality 70 ${1}_ss*.png ${jpgfile}
echo "${jpgfile}"

rm *_ss*.png
