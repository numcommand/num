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

## with all positive

x=$(echo "1 2 3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with row, with all positive"

x=$(echo "1\n2\n3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with col, with all positive"

x=$(echo "1 2 3\n5 6 9" | "$num" absolute-value all records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "absolute-value, with records, with all positive"

## with all negative

x=$(echo "-1 -2 -3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with row, with all negative"

x=$(echo "-1\n-2\n-3" | "$num" absolute-value all) &&
    assert_eq "1 2 3" "$x" "absolute-value, with col, with all negative"

x=$(echo "-1 -2 -3\n-5 -6 -9" | "$num" absolute-value all records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "absolute-value, with records, with all negative"
