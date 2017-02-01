#!/bin/sh
############################################################################
#
# num-mean-absolute-deviation-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
#  mean absolute deviation
#
##

f="mean-absolute-deviation"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.11111"$'\n'"1.55556" "$x" "$f with records"
