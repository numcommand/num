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

x=$(echo "3 1 4 1 5 9 2 6" | "$num" sort) &&
    assert_eq "1 1 2 3 4 5 6 9" "$x" "quicksort, with row"

x=$(echo "3\n1\n4\n1\n5\n9\n2\n6" | "$num" sort) &&
    assert_eq "1 1 2 3 4 5 6 9" "$x" "quicksort, with col"

x=$(echo "3 1 4 1 5 9 2 6\n2 7 1 8 2 8 1 8" | "$num" sort all records) &&
    assert_eq "1 1 2 3 4 5 6 9"$'\n'"1 1 2 2 7 8 8 8" "$x" "quicksort, with records"
