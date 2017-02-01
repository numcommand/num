#!/bin/sh
############################################################################
#
# num-meanest-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# meanest
#
##

f="meanest"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2"$'\n'"6" "$x" "$f with records"
