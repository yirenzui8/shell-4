#!/bin/bash

# Copyright (c) 2013 Bartosz Szczesny
# LICENSE: The MIT License (MIT)

times=$(seq -w 300 300 3600) # times in seconds
for ss in $times; do
        pngfile="${1}_ss${ss}.png"
        avconv -v quiet -ss ${ss} -frames 1 -i ${1} ${pngfile}
        echo "${pngfile}"
done

jpgfile="${1}.jpg"
montage -tile 3 -geometry +0+0 -quality 70 ${1}_ss*.png ${jpgfile}
echo "${jpgfile}"

rm *_ss*.png
