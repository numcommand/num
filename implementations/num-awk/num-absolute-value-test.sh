#!/bin/sh
############################################################################
#
# num-absolute-value.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# absolute value
#
###

x=$(echo "1 2 3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with row, with all positive"

x=$(echo "1\n2\n3\n" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with col, with all positive"

x=$(echo "-1 -2 -3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with row, with all negative"

x=$(echo "-1\n-2\n-3\n" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with col, with all negative"
