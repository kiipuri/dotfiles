#!/bin/bash

#maim -B -u -s -n 2 | xclip -sel clip -t image/png
maim -B -u -s -n 2 image.png && copyq write image/png - < image.png && copyq select 0
