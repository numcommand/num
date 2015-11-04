#!/bin/sh
############################################################################
#
# num-meanest-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# meanest
#
###

x=$(echo "1 2 4" | "$num" meanest) &&
    assert_eq 2 "$x" "meanest, with row"

x=$(echo "1\n2\n4\n" | "$num" meanest) &&
    assert_eq 2 "$x" "meanest, with col"
