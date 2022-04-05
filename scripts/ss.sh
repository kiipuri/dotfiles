#!/bin/bash

cd /home/kiipuri/scripts
#maim -B -u -s -n 2 | xclip -selection c -t image/png
maim -B -u -s -n 2 image.png && copyq write image/png - < image.png && copyq select 0
