#!/bin/sh
############################################################################
#
# num-median-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# median
#
###

x=$(echo "1 2 4" | "$num" median) &&
    assert_eq 2 "$x" "median, with row, with exact median"

x=$(echo "1\n2\n4\n" | "$num" median) &&
    assert_eq 2 "$x" "median, with col, with exact median"

x=$(echo "1 2 3 4" | "$num" median) &&
    assert_eq 2.5 "$x" "median, with row, with split median"

x=$(echo "1\n2\n3\n4\n" | "$num" median) &&
    assert_eq 2.5 "$x" "median, with col, with split median"

###
#
# median-low
#
###

x=$(echo "1 2 4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with row, with exact median"

x=$(echo "1\n2\n4\n" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with col, with exact median"

x=$(echo "1 2 3 4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with row, with split median"

x=$(echo "1\n2\n3\n4\n" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with col, with split median"

###
#
# median-high
#
###

x=$(echo "1 2 4" | "$num" median-high) &&
    assert_eq 2 "$x" "median-high, with row, with exact median"

x=$(echo "1\n2\n4\n" | "$num" median-high) &&
    assert_eq 2 "$x" "median-high, with col, with exact median"

x=$(echo "1 2 3 4" | "$num" median-high) &&
    assert_eq 3 "$x" "median-high, with row, with split median"

x=$(echo "1\n2\n3\n4\n" | "$num" median-high) &&
    assert_eq 3 "$x" "median-high, with col, with split median"
