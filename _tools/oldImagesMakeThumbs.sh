#! /bin/bash
# Scan all jpg's in the old images dir and create the thumbs.

OLDIMAGESDIR=/home/Robert/dev/misterblue.github.io/images/oldimages
THUMBSDIR=$OLDIMAGESDIR/thumb

SIZE=150

TEMPFILE=xx.jpg
TEMPFILE2=xx2.ppm
EXIFFILE=exif.exif
SEDFILE=xxsed.sed

rm -f $TEMPFILE $TEMPFILE2 $EXIFFILE $SEDFILE

cd "$OLDIMAGESDIR"
ls *.jpg | while read file ; do
    if [[ -e "$file" ]] ; then
        cat "$file" | jpegtopnm --exif=$EXIFFILE --quiet > $TEMPFILE2
        cat $TEMPFILE2 | pamscale --xyfit $SIZE $SIZE | ppmtojpeg --exif=$EXIFFILE --comment "Copyright 2014, Christina Adams" --quality=75 > $TEMPFILE
        mv $TEMPFILE "$THUMBSDIR/$file"
    fi
done

rm -f $TEMPFILE $TEMPFILE2 $EXIFFILE $SEDFILE
