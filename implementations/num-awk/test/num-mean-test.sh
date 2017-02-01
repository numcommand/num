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

f="mean"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2.33333"$'\n'"6.66667" "$x" "$f with records"
