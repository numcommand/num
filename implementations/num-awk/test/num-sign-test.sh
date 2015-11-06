#!/bin/sh
############################################################################
#
# num-sign-test.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# sign
#
###

x=$(echo "-8 0 8" | "$num" sign all) &&
    assert_eq "-1 0 1" "$x" "sign, with row"

x=$(echo "-8\n0\n8\n" | "$num" sign all) &&
    assert_eq "-1 0 1" "$x" "sign, with col"
