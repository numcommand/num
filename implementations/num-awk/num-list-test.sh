#!/bin/sh
############################################################################
#
# num-list-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# n
#
###

x=$(echo "1 2 4" | "$num" n) &&
    assert_eq 3 "$x" "n, with row"

x=$(echo "1\n2\n4\n" | "$num" n) &&
    assert_eq 3 "$x" "n, with col"

###
#
# first
#
###

x=$(echo "1 2 4" | "$num" first) &&
    assert_eq 1 "$x" "first, with row"

x=$(echo "1\n2\n4\n" | "$num" first) &&
    assert_eq 1 "$x" "first, with col"

###
#
# last
#
###

x=$(echo "1 2 4" | "$num" last) &&
    assert_eq 4 "$x" "last, with row"

x=$(echo "1\n2\n4\n" | "$num" last) &&
    assert_eq 4 "$x" "last, with col"

###
#
# all
#
###

x=$(echo "1 2 4" | "$num" all) &&
    assert_eq "1 2 4" "$x" "all, with row"

x=$(echo "1\n2\n4\n" | "$num" all) &&
    assert_eq "1 2 4" "$x" "all, with col"

###
#
# minimum
#
###

x=$(echo "1 2 4" | "$num" minimum) &&
    assert_eq 1 "$x" "minimum, with row"

x=$(echo "1\n2\n4\n" | "$num" minimum) &&
    assert_eq 1 "$x" "minimum, with col"

###
#
# maximum
#
###

x=$(echo "1 2 4" | "$num" maximum) &&
    assert_eq 4 "$x" "maximum, wih row"

x=$(echo "1\n2\n4\n" | "$num" maximum) &&
    assert_eq 4 "$x" "maximum, wih col"

###
#
# range
#
###

x=$(echo "1 2 4" | "$num" range) &&
    assert_eq 3 "$x" "range, with row"

x=$(echo "1 2 4" | "$num" range) &&
    assert_eq 3 "$x" "range, with col"
