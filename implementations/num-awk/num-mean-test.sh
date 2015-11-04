#!/bin/sh
############################################################################
#
# num-mean-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# mean
#
###

x=$(echo "1 2 4" | "$num" mean) &&
    assert_eq 2.33333 "$x" "mean, with row"

x=$(echo "1\n2\n4\n" | "$num" mean) &&
    assert_eq 2.33333 "$x" "mean, with col"
