#!/bin/bash

# Copyright (c) 2011 Bartosz Szczesny
# LICENSE: The MIT License (MIT)

NOBK="/home/nobackup/"$USER
ls -ld $NOBK

zenity --info --title "bsync: Hello!" --text "1. Choose source directory\n2. Choose target directory\n3. Directories are 'rsynced'"

src=$(zenity --file-selection --directory --save --filename=$HOME/ --title "bsync: Choose source directory")"/" # adding "/" at the end
if [ "$src" == "/" ]
then
  zenity --warning --title "bsync: Warning" --text "bsync: Source directory not chosen, please start again."
  exit
fi

trg=$(zenity --file-selection --directory --save --filename=$NOBK/ --title "bsync: Choose target directory")"/" # adding "/" at the end
if [ "$trg" == "/" ]
then
  zenity --warning --title "bsync: Warning" --text "Target directory not chosen, please start again."
  exit
fi

rsync -varz $src $trg | zenity --progress --pulsate --title "bsync: 'Rsyncing'..." --text "You can press OK when 'rsyncing' is finished."


