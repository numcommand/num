#!/bin/sh
############################################################################
#
# num-coefficient-of-variance-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# coefficient of variance
#
##

f="coefficient-of-variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 0.654654 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 0.654654 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "0.654654"$'\n'"0.31225" "$x" "$f with records"

##
#
# sample coefficient of variance
#
##

f="sample-coefficient-of-variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 0.654654 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 0.654654 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "0.654654"$'\n'"0.31225" "$x" "$f with records"

##
#
# population coefficient of variance
#
##

f="population-coefficient-of-variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 0.534522 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 0.534522 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "0.534522"$'\n'"0.254951" "$x" "$f with records"
