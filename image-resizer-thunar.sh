#!/bin/bash
# author: Tomas Dohnalek, dohnto (at) gmail.com
# description: This is a simple script that allows you to resize multiple
#              images with the same ration
# edited by: T200proX7 (on Github)
# changes: Script wasnt able to process files with spaces
#          now it works fine
# usage: bash image-resizer-thunar.sh /path/to/image1 /path/to/image2/ ...
# licence: WTFPL

size=`zenity --entry --text="Percentage size ratio of new images"`
if [ "$size" -gt 0 -a "$size" -lt 100 ]; then
    for image in "$@"; do
        dn=`dirname  "$image"`
        bn=`basename "$image"`
        name=`echo "$bn" | awk -F. '{print $1}'`
        extension=`echo "$bn" | awk -F. '{print $2}'`
        convert "$image" -resize ${size}% "${dn}/${name}_${size}.${extension}"
    done
fi
