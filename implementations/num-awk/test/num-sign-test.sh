#!/bin/sh
############################################################################
#
# num-sign-test.awk
#
##

. minitest.sh
num=${NUM:-num}

##
#
# sign
#
##

x=$(echo "-8 0 8" | "$num" sign) &&
    assert_eq "-1 0 1" "$x" "sign, with row"

x=$(echo "-8\n0\n8" | "$num" sign) &&
    assert_eq "-1 0 1" "$x" "sign, with col"

x=$(echo "-8 0 8\n-9 0 9" | "$num" sign records) &&
    assert_eq "-1 0 1"$'\n'"-1 0 1" "$x" "sign, with records"
