#!/bin/sh
############################################################################
#
# num-normalize-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# normalize
#
###

x=$(echo "1 2 4" | "$num" normalize all) &&
    assert_eq "0 0.333333 1" "$x" "normalize, with row"

x=$(echo "1\n2\n4\n" | "$num" normalize all) &&
    assert_eq "0 0.333333 1" "$x" "normalize, with col"
