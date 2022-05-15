#!/bin/sh

testxml() 
{
        xmllint --xinclude --path $XPATH --noout --schema media-schema.xsd $1 --noout >/dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo " ERROR -- Validation error found in $1"
		((ERRORS = $ERRORS +1))
	fi

}

testquotes()
{
	grep -q '"' $1
	if [ $? -eq 0 ]; then
		echo "   ERROR --  Double quote found in $1"
		((ERRORS = $ERRORS +1))
		((IC = $IC + 1))
	fi
}

testinstances()
{
	xmllint --xpath "//*[local-name()='instances']" --noout $1 >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "   ERROR -- Instances element found in $1"
		((ERRORS = $ERRORS +1))
	fi
}

testcomments()
{
	grep -q '<!--' $1
	if [ $? -eq 0 ]; then
		echo " WARNING -- Comment found in $1"
		((WARNINGS = $WARNINGS +1))
	fi
}

testkeywords()
{
	xmllint --xpath $XPATH --noout $1 >/dev/null 2>&1
	KWCOUNT=`xmllint --xinclude --xpath "count(//*[local-name()='keywords']//*)" $1`
	if (( KWCOUNT < 4)); then
		echo " WARNING -- Less than 4 keywords in $1 ($KWCOUNT)"
		((WARNINGS = $WARNINGS +1))
		((IC = $IC + 1))
	fi
}
