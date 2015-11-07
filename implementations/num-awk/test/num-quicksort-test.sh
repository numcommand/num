#!/bin/sh
############################################################################
#
# num-quicksort-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# quicksort
#
###

x=$(echo "3 1 4 1 5 9 2 6" | "$num" sort all) &&
    assert_eq "1 1 2 3 4 5 6 9" "$x" "quicksort, with row"

x=$(echo "3\n1\n4\n1\n5\n9\n2\n6" | "$num" sort) &&
    assert_eq "1 1 2 3 4 5 6 9" "$x" "quicksort, with col"
