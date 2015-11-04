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

x=$(echo "-1.9 1.9" | "$num" round all) &&
    assert_eq "-2 2" "$x" "round, with row"

x=$(echo "-1.9\n1.9\n" | "$num" round all) &&
    assert_eq "-2 2" "$x" "round, with col"

###
#
# round-off
#
###

x=$(echo "-1.9 1.9" | "$num" round-off all) &&
    assert_eq "-1 1" "$x" "round-off, with row"

x=$(echo "-1.9\n1.9\n" | "$num" round-off all) &&
    assert_eq "-1 1" "$x" "round-off, with col"

###
#
# round-up
#
###

x=$(echo "-1.9 1.9" | "$num" round-up all) &&
    assert_eq "-1 2" "$x" "round-up, with row"

x=$(echo "-1.9\n1.9\n" | "$num" round-up all) &&
    assert_eq "-1 2" "$x" "round-up, with col"

###
#
# round-down
#
###

x=$(echo "-1.9 1.9" | "$num" round-down all) &&
    assert_eq "-2 1" "$x" "round-down, with row"

x=$(echo "-1.9\n1.9\n" | "$num" round-down all) &&
    assert_eq "-2 1" "$x" "round-down, with col"
