#!/bin/sh
############################################################################
#
# num-sum-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# sum
#
##

f="sum"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 7 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 7 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "7"$'\n'"20" "$x" "$f with records"
