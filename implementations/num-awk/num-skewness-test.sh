#!/bin/sh
############################################################################
#
# num-skewness-test.awk
#
###

. minitest
num=${NUM:-num}

###
#
# skewness
#
###

x=$(echo "1 2 4" | "$num" skewness) &&
    assert_eq 1.11111 "$x" "skewness, with row"

x=$(echo "1\n2\n4\n" | "$num" skewness) &&
    assert_eq 1.11111 "$x" "skewness, with col"

###
#
# sample skewness
#
###

x=$(echo "1 2 4" | "$num" sample-skewness) &&
    assert_eq 1.11111 "$x" "sample-skewness, with row"

x=$(echo "1\n2\n4\n" | "$num" sample-skewness) &&
    assert_eq 1.11111 "$x" "sample-skewness, with col"

###
#
# population skewness
#
###

x=$(echo "1 2 4" | "$num" population-skewness) &&
    assert_eq 0.740741 "$x" "population-skewness, with row"

x=$(echo "1\n2\n4\n" | "$num" population-skewness) &&
    assert_eq 0.740741 "$x" "population-skewness, with col"
