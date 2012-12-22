#!/bin/bash

# Copyright 2011 Bartosz Szczesny <bszcz@bszcz.eu> {bszcz.eu/license/MIT}

com="qiv -m"

for i in $(ls)
do
  hasz=${i%_*}"_"
  old_tags=${i#*_}
  echo "OLD : $hasz$old_tags"

  $com $i &
  pid=$!

  echo -n "TAG : "
  read new_tags

  if [ ${new_tags:0:1} == "_" ]
  then
    new_tags=$new_tags$old_tags
  fi

  new_tags=$(echo $new_tags  | awk "{print toupper(\$0)}" | grep -o . | sort | uniq | tr -d "\n _" )

  echo "NEW : $hasz$new_tags"

  mv $i $hasz$new_tags
  kill -9 $pid 2> /dev/null
done
