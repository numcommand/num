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

## with exact median

x=$(echo "1 2 4" | "$num" median) &&
    assert_eq 2 "$x" "median, with row, with exact median"

x=$(echo "1\n2\n4" | "$num" median) &&
    assert_eq 2 "$x" "median, with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" median records) &&
    assert_eq "2"$'\n'"6" "$x" "median, with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" median) &&
    assert_eq 2.5 "$x" "median, with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" median) &&
    assert_eq 2.5 "$x" "median, with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" median records) &&
    assert_eq "2.5"$'\n'"6.5" "$x" "median, with records, with split median"

###
#
# median-low
#
###

## with exact median

x=$(echo "1 2 4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with row, with exact median"

x=$(echo "1\n2\n4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" median-low records) &&
    assert_eq "2"$'\n'"6" "$x" "median-low, with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" median-low) &&
    assert_eq 2 "$x" "median-low, with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" median-low records) &&
    assert_eq "2"$'\n'"6" "$x" "median-low, with records, with split median"

###
#
# median-high
#
###

## with exact median

x=$(echo "1 2 4" | "$num" median-high) &&
    assert_eq 2 "$x" "median-high, with row, with exact median"

x=$(echo "1\n2\n4" | "$num" median-high) &&
    assert_eq 2 "$x" "median-high, with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" median-high records) &&
    assert_eq "2"$'\n'"6" "$x" "median-high, with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" median-high) &&
    assert_eq 3 "$x" "median-high, with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" median-high) &&
    assert_eq 3 "$x" "median-high, with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" median-high records) &&
    assert_eq "3"$'\n'"7" "$x" "median-high, with records, with split median"
