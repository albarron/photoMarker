#!/bin/bash


if [ $# -ne 2 ]; then
	echo
	echo "This simple sctipt performs two operations on a (set of) picture(s):"
	echo "(i) Reduces the size of the image(s) by 50%."
	echo "(ii) Writes a discrete watermark at the bottom of the image(s)."
	echo 
    echo usage: $0 [path_to_pictures] [label] 
    echo
    echo "- Every file in [path_to_pictures] is assumed to be an image and the script will try to process it accordingly"
    echo "- [label] is a one-word label to be added as watermark"
    echo ""
    echo "CAUTION: this script overwrites the input file(s). Be sure to keep a copy of the original file(s) in a different, safe, place"
    echo ""
    echo "Happy watermarking!"
    exit 1
fi

path=$1
lab=$2
#SilBan
current=`pwd`
cd $1
echo "Working on folder $current"
for image in $(ls) ; do 
  echo "converting $image"; 
  convert $image -resize 50% -font Palatino-Italic -pointsize 20 -draw \
          "gravity south fill black text 0,12 '$lab' fill grey text 1,11 '$lab' " $image.2;
  mv $image.2 $image

done

cd $current
