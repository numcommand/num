#!/bin/sh
############################################################################
#
# num-increment-test.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# increment
#
###

x=$(echo "-8 0 8" | "$num" increment) &&
    assert_eq "-7 1 9" "$x" "increment, with row"

x=$(echo "-8\n0\n8" | "$num" increment) &&
    assert_eq "-7 1 9" "$x" "increment, with col"

x=$(echo "-8 0 8\n-9 0 9" | "$num" increment all records) &&
    assert_eq "-7 1 9"$'\n'"-8 1 10" "$x" "increment, with records"
