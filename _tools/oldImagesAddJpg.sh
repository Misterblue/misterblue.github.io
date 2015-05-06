#! /bin/bash

SEDSCRIPT=/tmp/ss$$
TEMPFILE=/tmp/tempfile$$

cat > $SEDSCRIPT << EOFFF
s/\(oldimages\/[0-9]*\)/\1.jpg/
s/\(oldimages\/thumb\/[0-9]*\)/\1.jpg/
EOFFF

for file in $(grep -l oldimages *) ; do
    sed -i -f $SEDSCRIPT "$file"
done

rm -f "$SEDSCRIPT"
rm -f "$TEMPFILE"

