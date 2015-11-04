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

x=$(echo "1\n2\n4\n" | "$num" sum) &&
    assert_eq 7 "$x" "sum, with col"
