#!/bin/sh
############################################################################
#
# num-list-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# n
#
##

x=$(echo "1 2 4" | "$num" n) &&
    assert_eq 3 "$x" "n, with row"

x=$(echo "1\n2\n4" | "$num" n) &&
    assert_eq 3 "$x" "n, with col"

x=$(echo "1 2 4\n5 6 9 9" | "$num" n records) &&
    assert_eq "3"$'\n'"4" "$x" "n, with records"

##
#
# first
#
##

x=$(echo "1 2 4" | "$num" first) &&
    assert_eq 1 "$x" "first, with row"

x=$(echo "1\n2\n4" | "$num" first) &&
    assert_eq 1 "$x" "first, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" first records) &&
    assert_eq "1"$'\n'"5" "$x" "first, with records"

##
#
# last
#
##

x=$(echo "1 2 4" | "$num" last) &&
    assert_eq 4 "$x" "last, with row"

x=$(echo "1\n2\n4" | "$num" last) &&
    assert_eq 4 "$x" "last, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" last records) &&
    assert_eq "4"$'\n'"9" "$x" "last, with records"

##
#
# all
#
##

x=$(echo "1 2 4" | "$num") &&
    assert_eq "1 2 4" "$x" "all, with row"

x=$(echo "1\n2\n4" | "$num") &&
    assert_eq "1 2 4" "$x" "all, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" records) &&
    assert_eq "1 2 4"$'\n'"5 6 9" "$x" "all, with records"

##
#
# minimum
#
##

x=$(echo "1 2 4" | "$num" minimum) &&
    assert_eq 1 "$x" "minimum, with row"

x=$(echo "1\n2\n4" | "$num" minimum) &&
    assert_eq 1 "$x" "minimum, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" minimum records) &&
    assert_eq "1"$'\n'"5" "$x" "minimum, with records"

##
#
# maximum
#
##

x=$(echo "1 2 4" | "$num" maximum) &&
    assert_eq 4 "$x" "maximum, wih row"

x=$(echo "1\n2\n4" | "$num" maximum) &&
    assert_eq 4 "$x" "maximum, wih col"

x=$(echo "1 2 4\n5 6 9" | "$num" maximum records) &&
    assert_eq "4"$'\n'"9" "$x" "maximum, wih records"

##
#
# range
#
##

x=$(echo "1 2 4" | "$num" range) &&
    assert_eq 3 "$x" "range, with row"

x=$(echo "1 2 4" | "$num" range) &&
    assert_eq 3 "$x" "range, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" range records) &&
    assert_eq "3"$'\n'"4" "$x" "range, with records"
