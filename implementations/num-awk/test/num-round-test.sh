#!/bin/sh
############################################################################
#
# num-round-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# round
#
##

f="round"

x=$(echo "-1.9 1.9" | "$num" $f) &&
    assert_eq "-2 2" "$x" "$f with row"

x=$(echo "-1.9\n1.9" | "$num" $f) &&
    assert_eq "-2 2" "$x" "$f with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" $f records) &&
    assert_eq "-2 2"$'\n'"-4 4" "$x" "$f with records"

##
#
# round-off
#
##

f="round-off"

x=$(echo "-1.9 1.9" | "$num" $f) &&
    assert_eq "-1 1" "$x" "$f with row"

x=$(echo "-1.9\n1.9" | "$num" $f) &&
    assert_eq "-1 1" "$x" "$f with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" $f records) &&
    assert_eq "-1 1"$'\n'"-3 3" "$x" "$f with records"

##
#
# round-up
#
##

f="round-up"

x=$(echo "-1.9 1.9" | "$num" $f) &&
    assert_eq "-1 2" "$x" "$f with row"

x=$(echo "-1.9\n1.9" | "$num" $f) &&
    assert_eq "-1 2" "$x" "$f with col"

x=$(echo "-1.9 1.9\n -3.9 3.9" | "$num" $f records) &&
    assert_eq "-1 2"$'\n'"-3 4" "$x" "$f with records"

##
#
# round-down
#
##

f="round-down"

x=$(echo "-1.9 1.9" | "$num" $f) &&
    assert_eq "-2 1" "$x" "$f with row"

x=$(echo "-1.9\n1.9" | "$num" $f) &&
    assert_eq "-2 1" "$x" "$f with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" $f records) &&
    assert_eq "-2 1"$'\n'"-4 3" "$x" "$f with records"
