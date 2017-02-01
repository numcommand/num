#!/bin/sh
############################################################################
#
# num-median-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# median
#
##

f="median"

## with exact median

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with row, with exact median"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2"$'\n'"6" "$x" "$f with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" $f) &&
    assert_eq 2.5 "$x" "$f with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" $f) &&
    assert_eq 2.5 "$x" "$f with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" $f records) &&
    assert_eq "2.5"$'\n'"6.5" "$x" "$f with records, with split median"

##
#
# median-low
#
##

f="median-low"

## with exact median

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with row, with exact median"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2"$'\n'"6" "$x" "$f with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" $f records) &&
    assert_eq "2"$'\n'"6" "$x" "$f with records, with split median"

##
#
# median-high
#
##

f="median-high"

## with exact median

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with row, with exact median"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2 "$x" "$f with col, with exact median"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2"$'\n'"6" "$x" "$f with records, with exact median"

## with split median

x=$(echo "1 2 3 4" | "$num" $f) &&
    assert_eq 3 "$x" "$f with row, with split median"

x=$(echo "1\n2\n3\n4" | "$num" $f) &&
    assert_eq 3 "$x" "$f with col, with split median"

x=$(echo "1 2 3 4\n5 6 7 8" | "$num" $f records) &&
    assert_eq "3"$'\n'"7" "$x" "$f with records, with split median"
