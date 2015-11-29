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

## unimodal

#x=$(echo "1 2 2 3" | "$num" modes) &&
#    assert_eq 2 "$x" "modes, with row, with unimodal"

#x=$(echo "1\n2\n2\n3" | "$num" modes) &&
#    assert_eq 2 "$x" "modes, with col, with unimodal"

#x=$(echo "1 2 2 3\n5 6 6 7" | "$num" modes records) &&
#    assert_eq "2"$'\n'"6" "$x" "modes, with records, with unimodal"

## bimodal

#x=$(echo "1 1 2 3 3" | "$num" modes) &&
#    assert_eq "1 3" "$x" "modes, with row, with bimodal"

#x=$(echo "1\n1\n2\n3\n3" | "$num" modes) &&
#    assert_eq "1 3" "$x" "modes, with col, with bimodal"

#x=$(echo "1 1 2 3 3\n5 5 6 7 7" | "$num" modes records) &&
#    assert_eq "1 3"$'\n'"5 7" "$x" "modes, with records, with unimodal"

## nonmodal

#x=$(echo "1 2 3" | "$num" modes) &&
#    assert_eq $UNDEF "$x" "modes, with row, with nonmodal"

#x=$(echo "1\n2\n3" | "$num" modes) &&
#    assert_eq $UNDEF "$x" "modes, with col, with nonmodal"

#x=$(echo "1 2 3\n5 6 7" | "$num" modes records) &&
#    assert_eq $UNDEF$'\n'$UNDEF "$x" "modes, with records, with unimodal"
