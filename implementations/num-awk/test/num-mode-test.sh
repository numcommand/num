#!/bin/sh
############################################################################
#
# num-mean-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# mode
#
#     1 2 2 3 => 2
#     1 1 2 3 3 => 1 3
#     1 2 3 => UNDEF
#
##

## unimodal

x=$(echo "1 2 2 3" | "$num" mode) &&
    assert_eq 2 "$x" "mode, with row, with unimodal"

x=$(echo "1\n2\n2\n3" | "$num" mode) &&
    assert_eq 2 "$x" "mode, with col, with unimodal"

x=$(echo "1 2 2 3\n5 6 6 7" | "$num" mode records) &&
    assert_eq "2"$'\n'"6" "$x" "mode, with records, with unimodal"

## bimodal

x=$(echo "1 1 2 3 3" | "$num" mode) &&
    assert_eq "1 3" "$x" "mode, with row, with bimodal"

x=$(echo "1\n1\n2\n3\n3" | "$num" mode) &&
    assert_eq "1 3" "$x" "mode, with col, with bimodal"

x=$(echo "1 1 2 3 3\n5 5 6 7 7" | "$num" mode records) &&
    assert_eq "1 3"$'\n'"5 7" "$x" "mode, with records, with unimodal"

## nonmodal

x=$(echo "1 2 3" | "$num" mode) &&
    assert_eq $UNDEF "$x" "mode, with row, with nonmodal"

x=$(echo "1\n2\n3" | "$num" mode) &&
    assert_eq $UNDEF "$x" "mode, with col, with nonmodal"

x=$(echo "1 2 3\n5 6 7" | "$num" mode records) &&
    assert_eq $UNDEF$'\n'$UNDEF "$x" "mode, with records, with unimodal"
