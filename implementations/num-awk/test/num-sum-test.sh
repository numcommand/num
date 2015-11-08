#!/bin/sh
############################################################################
#
# num-sum-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# sum
#
###

x=$(echo "1 2 4" | "$num" sum) &&
    assert_eq 7 "$x" "sum, with row"

x=$(echo "1\n2\n4" | "$num" sum) &&
    assert_eq 7 "$x" "sum, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sum records) &&
    assert_eq "7"$'\n'"20" "$x" "sum, with records"
