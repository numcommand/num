#!/bin/sh
############################################################################
#
# num-trimean-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# trimean
#
###

x=$(echo "1 2 3 4 99" | "$num" trimean) &&
    assert_eq 8.875 "$x" "trimean, with row"

x=$(echo "1\n2\n3\n4\n99" | "$num" trimean) &&
    assert_eq 8.875 "$x" "trimean, with col"
