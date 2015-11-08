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

x=$(echo "1\n2\n4" | "$num" normalize all) &&
    assert_eq "0 0.333333 1" "$x" "normalize, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" normalize all records) &&
    assert_eq "0 0.333333 1"$'\n'"0 0.25 1" "$x" "normalize, with records"
