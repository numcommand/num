#!/bin/sh
############################################################################
#
# num-mean-absolute-deviation-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
#  mean absolute deviation
#
###

x=$(echo "1 2 4" | "$num" mean-absolute-deviation) &&
    assert_eq 1.11111 "$x" "mean-absolute-deviation, with row"

x=$(echo "1\n2\n4\n" | "$num" mean-absolute-deviation) &&
    assert_eq 1.11111 "$x" "mean-absolute-deviation, with col"
