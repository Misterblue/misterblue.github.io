#! /bin/bash
# Script to build all the separate HTML files for viewing the categories

rm -f *.html

cat _categories | while read cat ; do
    cat _template.html.master | sed -e "s/CATEGORYNAME/$cat/" > "${cat// /}.html"
done

cp _index.html.master index.html

