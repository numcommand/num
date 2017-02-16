#!/bin/sh
############################################################################
#
# num-skewness-test.awk
#
##

. minitest.sh
num=${NUM:-num}

##
#
# skewness
#
##

f="skewness"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.11111"$'\n'"3.88889" "$x" "$f with records"

##
#
# sample skewness
#
##

f="sample-skewness"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.11111 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.11111"$'\n'"3.88889" "$x" "$f with records"

##
#
# population skewness
#
##

f="population-skewness"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 0.740741 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 0.740741 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "0.740741"$'\n'"2.59259" "$x" "$f with records"
