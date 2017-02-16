#!/bin/sh
############################################################################
#
# num-sign-test.awk
#
##

. minitest.sh
num=${NUM:-num}

##
#
# sign
#
##

f="sign"

x=$(echo "-8 0 8" | "$num" $f) &&
    assert_eq "-1 0 1" "$x" "$f with row"

x=$(echo "-8\n0\n8" | "$num" $f) &&
    assert_eq "-1 0 1" "$x" "$f with col"

x=$(echo "-8 0 8\n-9 0 9" | "$num" $f records) &&
    assert_eq "-1 0 1"$'\n'"-1 0 1" "$x" "$f with records"
