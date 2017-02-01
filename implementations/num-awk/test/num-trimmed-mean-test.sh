#!/bin/sh
############################################################################
#
# num-trimmed-mean-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# trimmed-mean
#
#   * q1 == 1.75
#   * q3 == 4.25
##

f="trimmed-mean"

x=$(echo "1 2 3 4 5" | "$num" $f) &&
    assert_eq $TODO "$x" "$f with row"

x=$(echo "1\n2\n3\n4\n5" | "$num" $f) &&
    assert_eq $TODO "$x" "$f with col"

x=$(echo "1 2 3 5\n1 2 3 4 5" | "$num" $f records) &&
    assert_eq $TODO$'\n'$TODO "$x" "$f with records"
