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
###

## unimodal

x=$(echo "1 2 2 3" | "$num" mode) &&
    assert_eq_todo "2" "$x" "mode, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode) &&
    assert_eq_todo "2" "$x" "mode, with col, with unimodal"

x=$(echo "1 2 2 3\n5 6 6 9" | "$num" mode records) &&
    true
    #assert_eq "2"$'\n'"6" "$x" "mode, with records, with unimodal"

## bimodal

x=$(echo "1 1 2 3 3" | "$num" mode) &&
    assert_eq_todo "1 3" "$x" "mode, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3" | "$num" mode) &&
    assert_eq_todo "1 3" "$x" "mode, with col, with bimodal"

x=$(echo "1 1 2 3 3\n5 5 6 9 9" | "$num" mode records) &&
    true
    #assert_eq "1 3"$'\n'" 9" "$x" "mode, with records, with bimodal"

## nonmodal

x=$(echo "1 2 3" | "$num" mode) &&
    assert_eq_todo "UNDEF" "$x" "mode, with row, with nonmodal"

x=$(echo "1\n2\n3" | "$num" mode) &&
    assert_eq_todo "UNDEF" "$x" "mode, with col, with nonmodal"

x=$(echo "1 2 3\n5 6 9" | "$num" mode records) &&
    true
    #assert_eq "$UNDEF"$'\n'"$UNDEF" "$x" "mode, with records, with nonmodal"

###
#
# mode-low
#
###

## unimodal

x=$(echo "1 2 2 3" | "$num" mode-low) &&
    assert_eq_todo 2 "$x" "mode-low, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode-low) &&
    assert_eq_todo 2 "$x" "mode-low, with col, with unimodal"

x=$(echo "1 2 2 3\n5 6 6 9" | "$num" mode-low records) &&
    true
    #assert_eq "2"$'\n'"6" "$x" "mode-low, with records, with unimodal"

## bimodal

x=$(echo "1 1 2 3 3" | "$num" mode-low) &&
    assert_eq_todo 1 "$x" "mode-low, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3" | "$num" mode-low) &&
    assert_eq_todo 1 "$x" "mode-low, with col, with bimodal"

x=$(echo "1 1 2 3 3\n5 5 6 9 9" | "$num" mode-low records) &&
    true
    #assert_eq "1"$'\n'"5" "$x" "mode-low, with records, with bimodal"

## nonmodal

x=$(echo "1 2 3" | "$num" mode-low) &&
    assert_eq_todo "UNDEF" "$x" "mode-low, with row, with nonmodal"

x=$(echo "1\n2\n3" | "$num" mode-low) &&
    assert_eq_todo "UNDEF" "$x" "mode-low, with col, with nonmodal"

x=$(echo "1 2 3\n5 6 9" | "$num" mode-low records) &&
    true
    #assert_eq_todo "$UNDEF"$'\n'"$UNDEF" "$x" "mode-low, with records, with nonmodal"

###
#
# mode-high
#
###

## unimodal

x=$(echo "1 2 2 3" | "$num" mode-high) &&
    assert_eq_todo 2 "$x" "mode-high, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode-high) &&
    assert_eq_todo 2 "$x" "mode-high, with col, with unimodal"

x=$(echo "1 2 2 3\n5 6 6 9" | "$num" mode-high records) &&
    true
    #assert_eq "2"$'\n'"6 "$x" "mode-high, with records, with unimodal"

## bimodal

x=$(echo "1 1 2 3 3" | "$num" mode-high) &&
    assert_eq_todo 3 "$x" "mode-high, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3" | "$num" mode-high) &&
    assert_eq_todo 3 "$x" "mode-high, with col, with bimodal"

x=$(echo "1 1 2 3 3\n5 5 6 9 9" | "$num" mode-high records) &&
    true
    #assert_eq "3"$'\n'"9" "$x" "mode-high, with records, with bimodal"

## nonmodal

x=$(echo "1 2 3" | "$num" mode-high) &&
    assert_eq_todo "UNDEF" "$x" "mode-high, with row, with nonmodal"

x=$(echo "1\n2\n3" | "$num" mode-high) &&
    assert_eq_todo "UNDEF" "$x" "mode-high, with col, with nonmodal"

x=$(echo "1 2 3\n5 6 9" | "$num" mode-high records) &&
    true
    #assert_eq "$UNDEF"$'\n'"$UNDEF" "$x" "mode-high, with records, with nonmodal"
