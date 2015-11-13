#!/bin/sh
############################################################################
#
# num-mean-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# mean
#
##

x=$(echo "1 2 4" | "$num" mean) &&
    assert_eq 2.33333 "$x" "mean, with row"

x=$(echo "1\n2\n4" | "$num" mean) &&
    assert_eq 2.33333 "$x" "mean, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" mean records) &&
    assert_eq "2.33333"$'\n'"6.66667" "$x" "mean, with records"
