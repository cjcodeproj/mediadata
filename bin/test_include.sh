#!/bin/sh


#
# Test XML for validity
testxml() 
{
        xmllint --xinclude --path $XSDPATH --noout --schema media-schema.xsd $1 --noout >/dev/null 2>&1
	if [ $? -ne 0 ]; then
		echo " ERROR -- Validation error found in $1"
		((ERRORS = $ERRORS +1))
		xmllint --xinclude --path $XSDPATH --noout --schema media-schema.xsd $1
	fi

}


#
# Tests for presence of double quotes vs. single quotes
# (They're not bad, it's more of just a style issue)
testquotes()
{
	grep -q '"' $1
	if [ $? -eq 0 ]; then
		echo "   WARNING --  Double quote found in $1"
		((WARNINGS = $WARNINGS +1))
		((IC = $IC + 1))
	fi
}


#
# Test for trailing whitespace
# (not bad, but technically increases the size of the file needlessly)
testtrailingws()
{
	egrep -q " +$" $1
	if [ $? -eq 0 ]; then
		echo "  WARNING -- Trailing whitespace found in $1"
		((WARNINGS = $WARNINGS +1))
	fi
}


#
# Test for instance element in the XML
# (prevents user from accidentally saving possible personal data)
testinstances()
{
	xmllint --xpath "//*[local-name()='instances']" --noout $1 >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "   ERROR -- Instances element found in $1"
		((WARNINGS = $WARNINGS +1))
	fi
}


#
# Test for comments
# (Comments aren't bad, but you may not want to commit them)
testcomments()
{
	grep -q '<!--' $1
	if [ $? -eq 0 ]; then
		echo " WARNING -- Comment found in $1"
		((WARNINGS = $WARNINGS +1))
	fi
}


#
# Test for keywords (experimental)
# See how many keywords the movie had
testkeywords()
{
	xmllint --xpath $XSDPATH --noout $1 >/dev/null 2>&1
	KWCOUNT=`xmllint --xinclude --xpath "count(//*[local-name()='keywords']//*)" $1`
	if (( KWCOUNT < 4)); then
		echo " WARNING -- Less than 4 keywords in $1 ($KWCOUNT)"
		((WARNINGS = $WARNINGS +1))
		((IC = $IC + 1))
	fi
}
