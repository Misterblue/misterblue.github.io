#! /bin/bash
# Scan all JPG's in current or specified directory and resize all images that are not already
#    SIZE pixels in on if its dimensions.

DIR=$1
if [[ ! -z "$DIR" ]] ; then
    cd $DIR
fi

SIZE=1024

TEMPFILE=xx.jpg
TEMPFILE2=xx2.ppm
EXIFFILE=exif.exif
SEDFILE=xxsed.sed

rm -f $TEMPFILE $TEMPFILE2 $EXIFFILE $SEDFILE

cat > $SEDFILE << EOFFFF
s/^.* \([0-9]*\) by \([0-9]*\).*$/\1 \2/
EOFFFF

ls *.JPG *.jpg *.JPEG *.jpeg | while read file ; do
    if [[ -e "$file" ]] ; then
        echo checking $file
        cat "$file" | jpegtopnm --exif=$EXIFFILE --quiet > $TEMPFILE2
        set $(pamfile $TEMPFILE2 | sed -f $SEDFILE)
        if [[ ($1 -gt $SIZE) || ($2 -gt $SIZE) ]] ; then
            echo "Resizing $file"
            cat $TEMPFILE2 | pamscale --xyfit $SIZE $SIZE | ppmtojpeg --exif=$EXIFFILE --comment "Copyright 2015, Robert Adams" --quality=75 > $TEMPFILE
            rm "$file"
            mv $TEMPFILE "$file"
        else
            echo "Image already resized"
        fi
    fi
done

rm -f $TEMPFILE $TEMPFILE2 $EXIFFILE $SEDFILE
