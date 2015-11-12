#!/bin/sh
############################################################################
#
# num-round-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# round
#
###

x=$(echo "-1.9 1.9" | "$num" round) &&
    assert_eq "-2 2" "$x" "round, with row"

x=$(echo "-1.9\n1.9" | "$num" round) &&
    assert_eq "-2 2" "$x" "round, with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" round records) &&
    assert_eq "-2 2"$'\n'"-4 4" "$x" "round, with records"

###
#
# round-off
#
###

x=$(echo "-1.9 1.9" | "$num" round-off) &&
    assert_eq "-1 1" "$x" "round-off, with row"

x=$(echo "-1.9\n1.9" | "$num" round-off) &&
    assert_eq "-1 1" "$x" "round-off, with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" round-off records) &&
    assert_eq "-1 1"$'\n'"-3 3" "$x" "round-off, with records"

###
#
# round-up
#
###

x=$(echo "-1.9 1.9" | "$num" round-up) &&
    assert_eq "-1 2" "$x" "round-up, with row"

x=$(echo "-1.9\n1.9" | "$num" round-up) &&
    assert_eq "-1 2" "$x" "round-up, with col"

x=$(echo "-1.9 1.9\n -3.9 3.9" | "$num" round-up records) &&
    assert_eq "-1 2"$'\n'"-3 4" "$x" "round-up, with records"

###
#
# round-down
#
###

x=$(echo "-1.9 1.9" | "$num" round-down) &&
    assert_eq "-2 1" "$x" "round-down, with row"

x=$(echo "-1.9\n1.9" | "$num" round-down) &&
    assert_eq "-2 1" "$x" "round-down, with col"

x=$(echo "-1.9 1.9\n-3.9 3.9" | "$num" round-down records) &&
    assert_eq "-2 1"$'\n'"-4 3" "$x" "round-down, with records"
