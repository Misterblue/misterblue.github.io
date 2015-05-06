#! /bin/bash

SEDSCRIPT=/tmp/ss$$
TEMPFILE=/tmp/tempfile$$

cat > $SEDSCRIPT << EOFFF
s/<wpg2>\([0-9]*\)<\/wpg2>/<a href="\/images\/oldimages\/\1"><img src="\/images\/oldimages\/thumb\/\1" class="oldImageThumb"\/><\/a>/
EOFFF

for file in $(grep -l wpg2 *) ; do
    sed -i -f $SEDSCRIPT "$file"
done

rm -f "$SEDSCRIPT"
rm -f "$TEMPFILE"

