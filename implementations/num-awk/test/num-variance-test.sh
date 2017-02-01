#!/bin/sh
############################################################################
#
# num-variance-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# variance
#
##

f="variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2.33333"$'\n'"4.33333" "$x" "$f with records"

##
#
# sample variance
#
##

f="sample-variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2.33333 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2.33333"$'\n'"4.33333" "$x" "$f with records"

##
#
# population variance
#
##

f="population-variance"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.55556 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.55556 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.55556"$'\n'"2.88889" "$x" "$f with records"
