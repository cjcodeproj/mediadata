#!/bin/sh

CPATH=`dirname $0`

. $CPATH/test_include.sh

FILELIST=`find . -type f -name "*-bluray*.xml" -o -name "*-dvd.xml" -o -name "*-ultrahd.xml"  -o -name "*-vhs.xml"`
# XSDPATH

COUNT=0
ERRORS=0
WARNINGS=0
CC=0
CLEAN=()

#
# Main Block
#

if [ -z $XSDPATH ]; then
	echo "Define XSDPATH if you want to do schema validation"
fi

for FI in $FILELIST
do
	IC=0
	((COUNT = $COUNT +1))
	if [ $DEBUG ]; then
		echo $FI
	fi
	if [ ! -z $XSDPATH ]; then
		testxml $FI
	fi
	testquotes $FI
	# testtrailingws $FI
	if [ -z $SKIPIT ]; then
		testinstances $FI
	fi
	testcomments $FI
	testkeywords $FI
	if [ IC -eq 0 ]; then
		CLEAN+=($FI)
		((CC = $CC +1))
	fi
done

echo "Files scanned: $COUNT"

if [ $ERRORS -eq 0 ]; then
        echo "Zero errors."
else
        echo "Errors: $ERRORS"
fi

if [ $WARNINGS -eq 0 ]; then
        echo "Zero warnings."
else
        echo "Warnings: $WARNINGS"
fi

echo "Clean count: $CC"

exit
