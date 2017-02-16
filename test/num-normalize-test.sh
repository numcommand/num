#!/bin/sh
############################################################################
#
# num-normalize-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# normalize
#
##

f="normalize"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq "0 0.333333 1" "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq "0 0.333333 1" "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "0 0.333333 1"$'\n'"0 0.25 1" "$x" "$f with records"
