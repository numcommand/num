#!/bin/sh
############################################################################
#
# num-mode-test.sh
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
# #TODO implement
#
##

f="modes"

## unimodal

#x=$(echo "1 2 2 3" | "$num" $f) &&
#    assert_eq 2 "$x" "$f with row, with unimodal"

#x=$(echo "1\n2\n2\n3" | "$num" $f) &&
#    assert_eq 2 "$x" "$f with col, with unimodal"

#x=$(echo "1 2 2 3\n5 6 6 7" | "$num" $f records) &&
#    assert_eq "2"$'\n'"6" "$x" "$f with records, with unimodal"

## bimodal

#x=$(echo "1 1 2 3 3" | "$num" $f) &&
#    assert_eq "1 3" "$x" "$f with row, with bimodal"

#x=$(echo "1\n1\n2\n3\n3" | "$num" $f) &&
#    assert_eq "1 3" "$x" "$f with col, with bimodal"

#x=$(echo "1 1 2 3 3\n5 5 6 7 7" | "$num" $f records) &&
#    assert_eq "1 3"$'\n'"5 7" "$x" "$f with records, with unimodal"

## nonmodal

#x=$(echo "1 2 3" | "$num" $f) &&
#    assert_eq $UNDEF "$x" "$f with row, with nonmodal"

#x=$(echo "1\n2\n3" | "$num" $f) &&
#    assert_eq $UNDEF "$x" "$f with col, with nonmodal"

#x=$(echo "1 2 3\n5 6 7" | "$num" $f records) &&
#    assert_eq $UNDEF$'\n'$UNDEF "$x" "$f with records, with unimodal"
