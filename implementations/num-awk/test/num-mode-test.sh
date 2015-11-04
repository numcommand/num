#!/bin/sh
############################################################################
#
# num-mode-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# mode
#
##

x=$(echo "1 2 2 3" | "$num" mode) &&
    assert_eq_todo "2" "$x" "mode, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode) &&
    assert_eq_todo "2" "$x" "mode, with col, with unimodal"

x=$(echo "1 1 2 3 3" | "$num" mode) &&
    assert_eq_todo "1 3" "$x" "mode, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3\n" | "$num" mode) &&
    assert_eq_todo "1 3" "$x" "mode, with col, with bimodal"

x=$(echo "1 2 3" | "$num" mode) &&
    assert_eq_todo "UNDEF" "$x" "mode, with row, with nonmodal"

x=$(echo "1\n2\n3\n" | "$num" mode) &&
    assert_eq_todo "UNDEF" "$x" "mode, with col, with nonmodal"

###
#
# mode-low
#
###

x=$(echo "1 2 2 3" | "$num" mode-low) &&
    assert_eq_todo 2 "$x" "mode-low, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode-low) &&
    assert_eq_todo 2 "$x" "mode-low, with col, with unimodal"

x=$(echo "1 1 2 3 3" | "$num" mode-low) &&
    assert_eq_todo 1 "$x" "mode-low, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3\n" | "$num" mode-low) &&
    assert_eq_todo 1 "$x" "mode-low, with col, with bimodal"

x=$(echo "1 2 3" | "$num" mode-low) &&
    assert_eq_todo "UNDEF" "$x" "mode-low, with row, with nonmodal"

x=$(echo "1\n2\n3\n" | "$num" mode-low) &&
    assert_eq_todo "UNDEF" "$x" "mode-low, with col, with nonmodal"

###
#
# mode-high
#
###

x=$(echo "1 2 2 3" | "$num" mode-high) &&
    assert_eq_todo 2 "$x" "mode-high, with row, with unimodal"

x=$(echo "1\n2\n2\n3\n" | "$num" mode-high) &&
    assert_eq_todo 2 "$x" "mode-high, with col, with unimodal"

x=$(echo "1 1 2 3 3" | "$num" mode-high) &&
    assert_eq_todo 3 "$x" "mode-high, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3\n" | "$num" mode-high) &&
    assert_eq_todo 3 "$x" "mode-high, with col, with bimodal"

x=$(echo "1 2 3" | "$num" mode-high) &&
    assert_eq_todo "UNDEF" "$x" "mode-high, with row, with nonmodal"

x=$(echo "1\n2\n3\n" | "$num" mode-high) &&
    assert_eq_todo "UNDEF" "$x" "mode-high, with col, with nonmodal"
