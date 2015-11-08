#!/bin/sh
############################################################################
#
# num-skewness-test.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# skewness
#
###

x=$(echo "1 2 4" | "$num" skewness) &&
    assert_eq 1.11111 "$x" "skewness, with row"

x=$(echo "1\n2\n4" | "$num" skewness) &&
    assert_eq 1.11111 "$x" "skewness, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" skewness records) &&
    assert_eq "1.11111"$'\n'"3.88889" "$x" "skewness, with records"

###
#
# sample skewness
#
###

x=$(echo "1 2 4" | "$num" sample-skewness) &&
    assert_eq 1.11111 "$x" "sample-skewness, with row"

x=$(echo "1\n2\n4" | "$num" sample-skewness) &&
    assert_eq 1.11111 "$x" "sample-skewness, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sample-skewness records) &&
    assert_eq "1.11111"$'\n'"3.88889" "$x" "sample-skewness, with records"

###
#
# population skewness
#
###

x=$(echo "1 2 4" | "$num" population-skewness) &&
    assert_eq 0.740741 "$x" "population-skewness, with row"

x=$(echo "1\n2\n4" | "$num" population-skewness) &&
    assert_eq 0.740741 "$x" "population-skewness, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" population-skewness records) &&
    assert_eq "0.740741"$'\n'"2.59259" "$x" "population-skewness, with records"
